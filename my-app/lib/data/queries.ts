import { createClient } from '@/lib/supabase/server'
import type { Vocab, Kanji, KanjiExampleJson, Grammar, GrammarExampleJson } from '@/lib/types/database.types'
import type { VocabEntry, KanjiEntry, GrammarEntry, JLPTLevel } from './types'

const PAGE_SIZE = 50

export interface PagedResult<T> {
  items: T[]
  total: number
  page: number
  pageSize: number
  totalPages: number
}

const levelIdByCode: Record<JLPTLevel, number> = {
  N5: 1,
  N4: 2,
  N3: 3,
  N2: 4,
  N1: 5,
}

function rowToVocabEntry(row: Vocab): VocabEntry {
  return {
    id: row.id,
    word: row.word,
    hiragana: row.hiragana,
    romaji: row.romaji,
    meaning: row.meaning,
    partOfSpeech: row.part_of_speech,
    usage: row.usage_id,
    usageJp: row.usage_jp ?? undefined,
    fullMeaning: row.full_meaning,
    examples: [
      {
        sentence: row.example_sentence,
        hiragana: row.example_hiragana,
        meaning: row.example_meaning,
      },
    ],
  }
}

function rowToKanjiEntry(row: Kanji): KanjiEntry {
  const examples = (row.examples as KanjiExampleJson[]) ?? []
  return {
    kanji: row.kanji,
    hiragana: row.hiragana,
    romaji: row.romaji,
    meaning: row.meaning,
    hint: row.hint,
    strokeCount: row.stroke_count,
    examples,
    jlptLevel: (Object.entries(levelIdByCode).find(([, id]) => id === row.level_id)?.[0] ?? 'N5') as JLPTLevel,
  }
}

function rowToGrammarEntry(row: Grammar): GrammarEntry {
  const examples = (row.examples as GrammarExampleJson[]) ?? []
  return {
    pattern: row.pattern,
    reading: row.reading,
    meaning: row.meaning,
    explanation: row.explanation,
    examples,
    tags: row.tags ?? [],
    level: (Object.entries(levelIdByCode).find(([, id]) => id === row.level_id)?.[0] ?? 'N5') as JLPTLevel,
  }
}

export async function getVocabByLevel(
  level: JLPTLevel,
  page = 1,
): Promise<PagedResult<VocabEntry>> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const from = (page - 1) * PAGE_SIZE
  const to = from + PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('vocab')
    .select('*', { count: 'exact' })
    .eq('level_id', levelId)
    .order('order_index')
    .range(from, to)

  if (error) {
    console.error('getVocabByLevel error', error)
    return { items: [], total: 0, page, pageSize: PAGE_SIZE, totalPages: 0 }
  }

  const total = count ?? 0
  return {
    items: (data ?? []).map(rowToVocabEntry),
    total,
    page,
    pageSize: PAGE_SIZE,
    totalPages: Math.max(1, Math.ceil(total / PAGE_SIZE)),
  }
}

export async function getKanjiByLevel(
  level: JLPTLevel,
  page = 1,
): Promise<PagedResult<KanjiEntry>> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const from = (page - 1) * PAGE_SIZE
  const to = from + PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('kanji')
    .select('*', { count: 'exact' })
    .eq('level_id', levelId)
    .order('order_index')
    .range(from, to)

  if (error) {
    console.error('getKanjiByLevel error', error)
    return { items: [], total: 0, page, pageSize: PAGE_SIZE, totalPages: 0 }
  }

  const total = count ?? 0
  return {
    items: (data ?? []).map(rowToKanjiEntry),
    total,
    page,
    pageSize: PAGE_SIZE,
    totalPages: Math.max(1, Math.ceil(total / PAGE_SIZE)),
  }
}

export async function getGrammarByLevel(
  level: JLPTLevel,
  page = 1,
): Promise<PagedResult<GrammarEntry>> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const from = (page - 1) * PAGE_SIZE
  const to = from + PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('grammar')
    .select('*', { count: 'exact' })
    .eq('level_id', levelId)
    .order('order_index')
    .range(from, to)

  if (error) {
    console.error('getGrammarByLevel error', error)
    return { items: [], total: 0, page, pageSize: PAGE_SIZE, totalPages: 0 }
  }

  const total = count ?? 0
  return {
    items: (data ?? []).map(rowToGrammarEntry),
    total,
    page,
    pageSize: PAGE_SIZE,
    totalPages: Math.max(1, Math.ceil(total / PAGE_SIZE)),
  }
}
