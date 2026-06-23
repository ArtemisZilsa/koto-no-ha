'use server'

import { createClient } from '@/lib/supabase/server'
import { getSrsSession } from '@/lib/data/queries'
import { SRS_LEVELS, type SrsCard, type SrsLevelChoice, type SrsType, type ReviewResult } from '@/lib/data/srs'
import type { JLPTLevel } from '@/lib/data/types'

/** Muat satu sesi kartu hafalan. 'random' di-resolve ke level acak di server. */
export async function loadSrsSession(level: SrsLevelChoice, type: SrsType): Promise<SrsCard[]> {
  const resolved: JLPTLevel =
    level === 'random' ? SRS_LEVELS[Math.floor(Math.random() * SRS_LEVELS.length)] : level
  return getSrsSession(resolved, type)
}

/**
 * Catat hasil review satu kartu (sudah/belum hafal).
 * Bila login: jadwalkan ulang + tambah XP/streak via RPC review_srs_card.
 * Bila anon: tidak menyimpan (saved:false) — latihan tetap jalan.
 */
export async function reviewCard(cardId: string, known: boolean): Promise<ReviewResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) return { saved: false }

  // Cast pada CLIENT agar `this` tetap terikat; tipe Database hand-maintained
  // belum punya generic Functions untuk inferensi rpc (pola sama quiz.ts).
  type ReviewRow = {
    next_review_at: string
    interval_days: number
    total_xp: number
    streak_days: number
  }
  const db = supabase as unknown as {
    rpc: (
      fn: 'review_srs_card',
      args: { p_card_id: string; p_known: boolean },
    ) => Promise<{ data: ReviewRow | null; error: { message: string } | null }>
  }

  const { data, error } = await db.rpc('review_srs_card', { p_card_id: cardId, p_known: known })
  if (error) {
    console.error('review_srs_card error', error)
    return { saved: false, error: 'Gagal menyimpan progres.' }
  }
  return {
    saved: true,
    nextReviewAt: data?.next_review_at,
    intervalDays: data?.interval_days,
    totalXp: data?.total_xp,
    streakDays: data?.streak_days,
  }
}
