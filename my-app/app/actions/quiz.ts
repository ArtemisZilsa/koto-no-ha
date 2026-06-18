// KotonoHa Quiz Component
'use server'

import { createClient } from '@/lib/supabase/server'
import { getQuizPool } from '@/lib/data/queries'
import type { QuizItem, QuizMode } from '@/lib/data/quiz'
import type { JLPTLevel } from '@/lib/data/types'

/** Ambil kolam item kuis (kanji/kosakata) dari DB sesuai mode & level. */
export async function loadQuizPool(mode: QuizMode, level: JLPTLevel): Promise<QuizItem[]> {
  return getQuizPool(mode, level)
}

export interface AwardXpResult {
  /** true bila XP berhasil disimpan ke akun (user login). */
  saved: boolean
  /** Total XP terbaru di akun (hanya saat saved). */
  totalXp?: number
  /** Streak harian terbaru (hanya saat saved). */
  streakDays?: number
  error?: string
}

/**
 * Tambah XP hasil kuis ke akun user saat ini + update streak harian.
 * Bila belum login, kuis tetap valid tapi XP tidak disimpan (saved:false).
 * Nilai XP divalidasi & di-clamp di dalam RPC `award_quiz_xp` (0..1000).
 */
export async function awardQuizXp(xp: number): Promise<AwardXpResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    return { saved: false }
  }

  // Clamp di sisi klien juga (pertahanan berlapis; RPC tetap clamp).
  const safeXp = Math.max(0, Math.min(1000, Math.round(Number.isFinite(xp) ? xp : 0)))

  // Cast pada CLIENT (bukan metode rpc) agar `this` tetap terikat ke client.
  // Tipe Database hand-maintained belum punya generic Functions untuk inferensi rpc.
  type AwardXpRow = { total_xp: number; streak_days: number }
  const db = supabase as unknown as {
    rpc: (
      fn: 'award_quiz_xp',
      args: { p_xp: number },
    ) => Promise<{ data: AwardXpRow[] | null; error: { message: string } | null }>
  }

  const { data, error } = await db.rpc('award_quiz_xp', { p_xp: safeXp })
  if (error) {
    console.error('award_quiz_xp error', error)
    return { saved: false, error: 'Gagal menyimpan XP. Coba lagi.' }
  }
  const row = Array.isArray(data) ? data[0] : data
  return {
    saved: true,
    totalXp: row?.total_xp ?? undefined,
    streakDays: row?.streak_days ?? undefined,
  }
}
