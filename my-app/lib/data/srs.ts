/* ─── Penjadwal SRS (SM-2 sederhana) ─────────────────────────────────────────
 * Logika murni tanpa dependensi Supabase, sehingga mudah diuji.
 * Dua grade sesuai UI flashcard: "tahu" (ingat) dan "ulangi" (lupa).
 */

export type ReviewGrade = 'tahu' | 'ulangi'

export interface SrsState {
  intervalDays: number
  easeFactor: number
  reviewCount: number
  lapseCount: number
}

export interface SrsSchedule extends SrsState {
  nextReviewAt: Date
}

export const INITIAL_SRS_STATE: SrsState = {
  intervalDays: 0,
  easeFactor: 2.5,
  reviewCount: 0,
  lapseCount: 0,
}

const MIN_EASE = 1.3
const MAX_INTERVAL_DAYS = 365
const RELEARN_MINUTES = 10

/**
 * Hitung jadwal berikutnya dari state saat ini + grade jawaban.
 * - "ulangi": interval reset ke 0, kartu muncul lagi ±10 menit, ease turun 0.2.
 * - "tahu"  : interval 0 → 1 hari → 3 hari → interval × ease (maks 365 hari).
 */
export function scheduleReview(
  state: SrsState,
  grade: ReviewGrade,
  now: Date = new Date(),
): SrsSchedule {
  if (grade === 'ulangi') {
    return {
      intervalDays: 0,
      easeFactor: Math.max(MIN_EASE, state.easeFactor - 0.2),
      reviewCount: state.reviewCount + 1,
      lapseCount: state.lapseCount + 1,
      nextReviewAt: new Date(now.getTime() + RELEARN_MINUTES * 60_000),
    }
  }

  let intervalDays: number
  if (state.intervalDays <= 0) intervalDays = 1
  else if (state.intervalDays === 1) intervalDays = 3
  else intervalDays = Math.round(state.intervalDays * state.easeFactor)
  intervalDays = Math.min(intervalDays, MAX_INTERVAL_DAYS)

  return {
    intervalDays,
    easeFactor: state.easeFactor,
    reviewCount: state.reviewCount + 1,
    lapseCount: state.lapseCount,
    nextReviewAt: new Date(now.getTime() + intervalDays * 86_400_000),
  }
}
