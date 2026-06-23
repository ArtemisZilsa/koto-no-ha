// Tipe & helper untuk halaman Progres Belajar (/progress).
// Bentuk data mencerminkan JSON dari RPC get_progress_overview.

export interface ProgressProfile {
  total_xp: number
  streak_days: number
  level_code: string | null
  level_name: string | null
}

export interface ProgressLevel {
  level_id: number
  vocab_total: number
  vocab_known: number
  kanji_total: number
  kanji_known: number
}

export interface ProgressSrs {
  total: number
  reviewed: number
  mastered: number
  due: number
}

export interface ActivityDay {
  /** Tanggal 'YYYY-MM-DD' (UTC). */
  d: string
  /** Jumlah aktivitas hari itu. */
  n: number
}

export interface ProgressOverview {
  profile: ProgressProfile
  levels: ProgressLevel[]
  srs: ProgressSrs
  activity: ActivityDay[]
}

/** Struktur nol (anon / belum ada data / error). */
export const EMPTY_OVERVIEW: ProgressOverview = {
  profile: { total_xp: 0, streak_days: 0, level_code: null, level_name: null },
  levels: [],
  srs: { total: 0, reviewed: 0, mastered: 0, due: 0 },
  activity: [],
}

/** Kode JLPT per level_id (1=N5 … 5=N1). */
export const LEVEL_CODE_BY_ID: Record<number, string> = {
  1: 'N5',
  2: 'N4',
  3: 'N3',
  4: 'N2',
  5: 'N1',
}

// ── Tangga rank XP (gamifikasi, bergaya jalan latihan sumi-e) ──
export interface XpRank {
  /** Nama rank (Bahasa Indonesia). */
  name: string
  /** Label Jepang (kanji). */
  jp: string
  /** Batas bawah XP rank ini. */
  min: number
}

export const XP_RANKS: XpRank[] = [
  { name: 'Pemula', jp: '入門', min: 0 },
  { name: 'Pelajar', jp: '初心', min: 100 },
  { name: 'Tekun', jp: '修行', min: 300 },
  { name: 'Mahir', jp: '達人', min: 700 },
  { name: 'Ahli', jp: '師範', min: 1500 },
  { name: 'Maestro', jp: '名人', min: 3000 },
]

export interface RankProgress {
  rank: XpRank
  /** Rank berikutnya (null bila sudah tertinggi). */
  next: XpRank | null
  /** XP di dalam rank saat ini. */
  intoRank: number
  /** XP yang dibutuhkan untuk naik (0 bila sudah tertinggi). */
  span: number
  /** Persentase 0..100 menuju rank berikutnya (100 bila tertinggi). */
  pct: number
}

/** Hitung rank & progres menuju rank berikutnya dari total XP. */
export function rankForXp(xp: number): RankProgress {
  const safe = Math.max(0, Math.floor(xp))
  let idx = 0
  for (let i = 0; i < XP_RANKS.length; i++) {
    if (safe >= XP_RANKS[i].min) idx = i
  }
  const rank = XP_RANKS[idx]
  const next = idx < XP_RANKS.length - 1 ? XP_RANKS[idx + 1] : null
  const intoRank = safe - rank.min
  const span = next ? next.min - rank.min : 0
  const pct = next ? Math.min(100, Math.round((intoRank / span) * 100)) : 100
  return { rank, next, intoRank, span, pct }
}

/** Persen aman (0..100). */
export function pct(known: number, total: number): number {
  if (total <= 0) return 0
  return Math.min(100, Math.round((known / total) * 100))
}

/** True bila belum ada aktivitas/progres sama sekali. */
export function isEmptyOverview(o: ProgressOverview): boolean {
  const lvAny = o.levels.some((l) => l.vocab_known > 0 || l.kanji_known > 0)
  return o.profile.total_xp === 0 && !lvAny && o.srs.reviewed === 0 && o.activity.length === 0
}
