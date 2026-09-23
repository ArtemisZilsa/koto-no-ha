import type { JLPTLevel } from './types'

// ─── Soal latihan (Fase 9) ────────────────────────────────────────────────────
// Satu set = potongan berurutan dari tabel konten (order_index), jadi set N
// selalu berisi item yang sama. Itu yang membuat progress per set bisa dihitung.

export type PracticeCategory = 'kosakata' | 'tata_bahasa' | 'kanji'

export const PRACTICE_CATEGORIES: PracticeCategory[] = ['kosakata', 'tata_bahasa', 'kanji']

/** Level yang punya soal latihan. Fokus Fase 9: N5–N3. */
export const PRACTICE_LEVELS: JLPTLevel[] = ['N5', 'N4', 'N3']

export const CATEGORY_META: Record<
  PracticeCategory,
  { jp: string; label: string; slug: string; setSize: number; promptLabel: string }
> = {
  kosakata: { jp: '語彙', label: 'Kosakata', slug: 'kosakata', setSize: 30, promptLabel: 'Apa arti kata ini?' },
  tata_bahasa: { jp: '文法', label: 'Tata Bahasa', slug: 'tata-bahasa', setSize: 10, promptLabel: 'Apa arti pola ini?' },
  kanji: { jp: '漢字', label: 'Kanji', slug: 'kanji', setSize: 20, promptLabel: 'Apa arti kanji ini?' },
}

export function categoryFromSlug(slug: string): PracticeCategory | null {
  const hit = PRACTICE_CATEGORIES.find((c) => CATEGORY_META[c].slug === slug)
  return hit ?? null
}

export function setCount(category: PracticeCategory, totalItems: number): number {
  return Math.ceil(totalItems / CATEGORY_META[category].setSize)
}

export interface PracticeQuestion {
  /** id item di tabel sumber (vocab/grammar/kanji). */
  itemId: string
  category: PracticeCategory
  level: JLPTLevel
  /** Teks Jepang yang ditanyakan. */
  prompt: string
  /** Cara baca (hiragana/romaji), tampil kecil di atas prompt. */
  reading?: string
  question: string
  /** Tepat 4 opsi. */
  options: string[]
  answerIndex: number
}

export interface PracticeAnswer {
  itemId: string
  category: PracticeCategory
  level: JLPTLevel
  isCorrect: boolean
}

export interface PracticeProgressRow {
  category: PracticeCategory
  level: JLPTLevel
  mastered: number
  attempted: number
  total: number
}

export function percent(part: number, whole: number): number {
  if (whole <= 0) return 0
  return Math.round((part / whole) * 100)
}

export function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

export interface SourceItem {
  id: string
  prompt: string
  reading?: string
  meaning: string
  /** Pengelompok distraktor (mis. jenis kata), opsional. */
  group?: string
}

/**
 * Bangun soal pilihan ganda: target + 3 distraktor dari pool selevel.
 * Distraktor diutamakan dari `group` yang sama, dan arti yang sama persis
 * dengan jawaban dilewati agar tidak ada dua opsi benar.
 */
export function buildQuestions(
  targets: SourceItem[],
  pool: SourceItem[],
  category: PracticeCategory,
  level: JLPTLevel,
): PracticeQuestion[] {
  return targets.flatMap((t) => {
    const seen = new Set<string>([t.meaning])
    const distractors: string[] = []
    const others = pool.filter((p) => p.id !== t.id)
    const candidates = [
      ...shuffle(t.group ? others.filter((o) => o.group === t.group) : []),
      ...shuffle(others),
    ]
    for (const o of candidates) {
      if (distractors.length >= 3) break
      if (seen.has(o.meaning)) continue
      seen.add(o.meaning)
      distractors.push(o.meaning)
    }
    if (distractors.length < 3) return []
    const options = shuffle([t.meaning, ...distractors])
    return [
      {
        itemId: t.id,
        category,
        level,
        prompt: t.prompt,
        reading: t.reading,
        question: CATEGORY_META[category].promptLabel,
        options,
        answerIndex: options.indexOf(t.meaning),
      },
    ]
  })
}
