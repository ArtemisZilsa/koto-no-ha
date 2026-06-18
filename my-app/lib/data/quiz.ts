// KotonoHa Quiz Component
import type { JLPTLevel } from './types'

export type QuizMode = 'kanji' | 'vocab'

export interface QuizItem {
  id: string
  prompt: string // karakter kanji atau kata kosakata yang ditanyakan
  reading: string // furigana (hiragana)
  romaji: string
  meaning: string // arti dalam Bahasa Indonesia
  level: JLPTLevel
  pos?: string // part_of_speech (untuk distraktor kosakata yang lebih nyambung)
}

export interface QuizRound {
  item: QuizItem
  options: QuizItem[]
}

export const QUIZ_LEVELS: JLPTLevel[] = ['N5', 'N4', 'N3', 'N2', 'N1']

export const MODE_LABEL: Record<QuizMode, { jp: string; id: string }> = {
  kanji: { jp: '漢字', id: 'Kanji' },
  vocab: { jp: '語彙', id: 'Kosakata' },
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/**
 * Pilih `count` distraktor dari pool selevel.
 * Untuk kosakata: utamakan jenis kata (part_of_speech) sama agar menantang.
 * Hindari arti yang sama persis dengan jawaban agar opsi tidak ambigu.
 */
export function pickDistractors(target: QuizItem, pool: QuizItem[], count = 3): QuizItem[] {
  const out: QuizItem[] = []
  const seenMeaning = new Set<string>([target.meaning])
  const others = pool.filter((p) => p.id !== target.id)

  const add = (o: QuizItem) => {
    if (out.length >= count || seenMeaning.has(o.meaning)) return
    out.push(o)
    seenMeaning.add(o.meaning)
  }

  // 1) jenis kata sama (khusus kosakata)
  if (target.pos) for (const o of shuffle(others.filter((o) => o.pos === target.pos))) add(o)
  // 2) sisanya selevel
  for (const o of shuffle(others)) add(o)

  return out.slice(0, count)
}

/** Bangun N soal dari pool: tiap soal = target + 3 distraktor, opsi diacak. */
export function buildRounds(pool: QuizItem[], n = 10): QuizRound[] {
  const targets = shuffle(pool).slice(0, Math.min(n, pool.length))
  return targets.map((t) => ({ item: t, options: shuffle([t, ...pickDistractors(t, pool)]) }))
}
