// Tipe & konstanta untuk fitur SRS (kartu hafalan).
import type { JLPTLevel } from './types'

export type SrsType = 'kanji' | 'vocab' | 'all'
export type SrsLevelChoice = JLPTLevel | 'random'

/** Satu kartu hafalan untuk sesi review (subset Flashcard yang dipakai UI). */
export interface SrsCard {
  id: string
  type: 'kanji' | 'vocab'
  front: string
  back: string
  reading: string | null
  example: string | null
  level: JLPTLevel
}

/** Hasil review satu kartu (dari RPC review_srs_card). */
export interface ReviewResult {
  /** true bila tersimpan ke akun (user login). */
  saved: boolean
  nextReviewAt?: string
  intervalDays?: number
  totalXp?: number
  streakDays?: number
  error?: string
}

export const SRS_LEVELS: JLPTLevel[] = ['N5', 'N4', 'N3', 'N2', 'N1']

export const SRS_TYPE_LABEL: Record<SrsType, { jp: string; id: string }> = {
  kanji: { jp: '漢字', id: 'Kanji' },
  vocab: { jp: '語彙', id: 'Kosakata' },
  all: { jp: '全部', id: 'Semua' },
}

/** Jumlah kartu per sesi review. */
export const SRS_SESSION_SIZE = 20
