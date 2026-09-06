'use server'

import { createClient } from '@/lib/supabase/server'
import {
  INITIAL_SRS_STATE,
  scheduleReview,
  type ReviewGrade,
  type SrsState,
} from '@/lib/data/srs'
import type { FlashcardItemType } from '@/lib/data/queries'
import type { UserSrsProgress } from '@/lib/types/database.types'

export type { ReviewGrade }

export interface ReviewFlashcardResult {
  ok: boolean
  /** Interval baru dalam hari (0 = diulang dalam sesi/±10 menit). */
  intervalDays?: number
  /** Jadwal review berikutnya (ISO). */
  nextReviewAt?: string
  reviewCount?: number
  error?: string
}

/**
 * Simpan hasil review satu kartu ("tahu" / "ulangi") untuk user saat ini.
 * Penjadwalan memakai SM-2 sederhana di `lib/data/srs.ts`; baris progres
 * di-upsert ke `user_srs_progress` (RLS membatasi ke milik user sendiri).
 */
export async function reviewFlashcard(
  itemType: FlashcardItemType,
  itemId: string,
  grade: ReviewGrade,
): Promise<ReviewFlashcardResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    return { ok: false, error: 'Silakan masuk untuk menyimpan progres belajar.' }
  }

  // Ambil state SRS saat ini (kalau ada).
  const { data: existing, error: readError } = await supabase
    .from('user_srs_progress')
    .select('*')
    .eq('user_id', user.id)
    .eq('item_type', itemType)
    .eq('item_id', itemId)
    .maybeSingle()

  if (readError) {
    console.error('reviewFlashcard read error', readError)
    return { ok: false, error: 'Gagal membaca progres. Coba lagi.' }
  }

  const row = existing as UserSrsProgress | null
  const state: SrsState = row
    ? {
        intervalDays: row.interval_days,
        easeFactor: row.ease_factor,
        reviewCount: row.review_count,
        lapseCount: row.lapse_count,
      }
    : INITIAL_SRS_STATE

  const now = new Date()
  const next = scheduleReview(state, grade, now)

  // Cast sempit (pola yang sama dengan progress.ts): tipe Database
  // hand-maintained tanpa metadata Relationships membuat inferensi
  // upsert supabase-js jatuh ke `never[]`.
  const db = supabase as unknown as {
    from(table: 'user_srs_progress'): {
      upsert(
        values: Record<string, unknown>,
        opts: { onConflict: string },
      ): PromiseLike<{ error: { message: string } | null }>
    }
  }

  const { error: writeError } = await db
    .from('user_srs_progress')
    .upsert(
      {
        user_id: user.id,
        item_type: itemType,
        item_id: itemId,
        interval_days: next.intervalDays,
        ease_factor: next.easeFactor,
        next_review_at: next.nextReviewAt.toISOString(),
        review_count: next.reviewCount,
        lapse_count: next.lapseCount,
        last_reviewed_at: now.toISOString(),
      },
      { onConflict: 'user_id,item_type,item_id' },
    )

  if (writeError) {
    console.error('reviewFlashcard write error', writeError)
    return { ok: false, error: 'Gagal menyimpan progres. Coba lagi.' }
  }

  return {
    ok: true,
    intervalDays: next.intervalDays,
    nextReviewAt: next.nextReviewAt.toISOString(),
    reviewCount: next.reviewCount,
  }
}
