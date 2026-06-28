import { createClient } from '@/lib/supabase/server'
import type { Vocab, Kanji, KanjiExampleJson, Grammar, GrammarExampleJson, NewsArticle, KaiwaStory, DokkaPassage } from '@/lib/types/database.types'
import type { VocabEntry, KanjiEntry, GrammarEntry, JLPTLevel } from './types'
import type { QuizItem, QuizMode } from './quiz'

const PAGE_SIZE = 50
const NEWS_PAGE_SIZE = 12
const DOKKAI_PAGE_SIZE = 12

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

/** level_id untuk track SSW (Tokutei Ginou). Vocab-nya dibedakan per `field` (bidang). */
const SSW_LEVEL_ID = 6

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
    id: row.id,
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

/**
 * Kosakata satu bidang SSW (mis. 'kaigo'). Disimpan di tabel vocab dengan
 * level_id = SSW (6) dan kolom `field` sebagai pembeda bidang.
 */
export async function getVocabByField(
  field: string,
  page = 1,
): Promise<PagedResult<VocabEntry>> {
  const supabase = await createClient()
  const from = (page - 1) * PAGE_SIZE
  const to = from + PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('vocab')
    .select('*', { count: 'exact' })
    .eq('level_id', SSW_LEVEL_ID)
    .eq('field', field)
    .order('order_index')
    .range(from, to)

  if (error) {
    console.error('getVocabByField error', error)
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

/** Hitung total vocab "dikenal" untuk satu bidang SSW (ringkasan "X/Y"). */
export async function getKnownVocabCountByField(field: string): Promise<number> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return 0

  const { data: itemRows, error: itemErr } = await supabase
    .from('vocab')
    .select('id')
    .eq('level_id', SSW_LEVEL_ID)
    .eq('field', field)
  if (itemErr || !itemRows) return 0
  const ids = (itemRows as { id: string }[]).map((r) => r.id)
  if (ids.length === 0) return 0

  const { count, error } = await supabase
    .from('user_item_progress')
    .select('item_id', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .eq('item_type', 'vocab')
    .in('item_id', ids)

  if (error) {
    console.error('getKnownVocabCountByField error', error)
    return 0
  }
  return count ?? 0
}

/**
 * Ambil "kolam" item untuk kuis (kanji/kosakata) dari level tertentu.
 * Mengambil jendela acak (random offset) agar tiap sesi bervariasi, lalu
 * komponen kuis mengacak & memilih 10 soal + distraktor dari kolam ini.
 */
export async function getQuizPool(
  mode: QuizMode,
  level: JLPTLevel,
  size = 60,
): Promise<QuizItem[]> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const table = mode === 'kanji' ? 'kanji' : 'vocab'

  const { count } = await supabase
    .from(table)
    .select('id', { count: 'exact', head: true })
    .eq('level_id', levelId)

  const total = count ?? 0
  if (total === 0) return []
  const max = Math.max(0, total - size)
  const offset = max > 0 ? Math.floor(Math.random() * (max + 1)) : 0

  if (mode === 'kanji') {
    const { data, error } = await supabase
      .from('kanji')
      .select('id, kanji, hiragana, romaji, meaning')
      .eq('level_id', levelId)
      .order('order_index')
      .range(offset, offset + size - 1)
    if (error || !data) {
      console.error('getQuizPool kanji error', error)
      return []
    }
    const rows = data as unknown as {
      id: string; kanji: string; hiragana: string; romaji: string; meaning: string
    }[]
    return rows.map((r) => ({
      id: r.id,
      prompt: r.kanji,
      reading: r.hiragana,
      romaji: r.romaji,
      meaning: r.meaning,
      level,
    }))
  }

  const { data, error } = await supabase
    .from('vocab')
    .select('id, word, hiragana, romaji, meaning, part_of_speech')
    .eq('level_id', levelId)
    .order('order_index')
    .range(offset, offset + size - 1)
  if (error || !data) {
    console.error('getQuizPool vocab error', error)
    return []
  }
  const rows = data as unknown as {
    id: string; word: string; hiragana: string; romaji: string; meaning: string; part_of_speech: string
  }[]
  return rows.map((r) => ({
    id: r.id,
    prompt: r.word,
    reading: r.hiragana,
    romaji: r.romaji,
    meaning: r.meaning,
    level,
    pos: r.part_of_speech,
  }))
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

// ── Berita / News ──────────────────────────────────────────────

/** Kode level JLPT dari level_tag_id (1=N5 … 5=N1). null bila tidak ditandai. */
export function levelCodeById(levelId: number | null): JLPTLevel | null {
  if (levelId == null) return null
  const entry = Object.entries(levelIdByCode).find(([, id]) => id === levelId)
  return (entry?.[0] as JLPTLevel) ?? null
}

export async function getNewsList(page = 1): Promise<PagedResult<NewsArticle>> {
  const supabase = await createClient()
  const from = (page - 1) * NEWS_PAGE_SIZE
  const to = from + NEWS_PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('news_articles')
    .select('*', { count: 'exact' })
    .order('published_at', { ascending: false })
    .range(from, to)

  if (error) {
    console.error('getNewsList error', error)
    return { items: [], total: 0, page, pageSize: NEWS_PAGE_SIZE, totalPages: 0 }
  }

  const total = count ?? 0
  return {
    items: (data ?? []) as NewsArticle[],
    total,
    page,
    pageSize: NEWS_PAGE_SIZE,
    totalPages: Math.max(1, Math.ceil(total / NEWS_PAGE_SIZE)),
  }
}

// ── Kaiwa / Percakapan ─────────────────────────────────────────

/** Semua kaiwa untuk satu level JLPT (tanpa paginasi — biasanya 5 per level). */
export async function getKaiwaByLevel(level: JLPTLevel): Promise<KaiwaStory[]> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]

  const { data, error } = await supabase
    .from('kaiwa_stories')
    .select('*')
    .eq('level_id', levelId)
    .order('title')

  if (error) {
    console.error('getKaiwaByLevel error', error)
    return []
  }
  return (data ?? []) as KaiwaStory[]
}

// ── Dokkai / Latihan Membaca ───────────────────────────────────

/** Daftar bacaan dokkai untuk satu level JLPT, dengan paginasi. */
export async function getDokkaiByLevel(
  level: JLPTLevel,
  page = 1,
): Promise<PagedResult<DokkaPassage>> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const from = (page - 1) * DOKKAI_PAGE_SIZE
  const to = from + DOKKAI_PAGE_SIZE - 1

  const { data, count, error } = await supabase
    .from('dokkai_passages')
    .select('*', { count: 'exact' })
    .eq('level_id', levelId)
    .order('order_index')
    .range(from, to)

  if (error) {
    console.error('getDokkaiByLevel error', error)
    return { items: [], total: 0, page, pageSize: DOKKAI_PAGE_SIZE, totalPages: 0 }
  }

  const total = count ?? 0
  return {
    items: (data ?? []) as DokkaPassage[],
    total,
    page,
    pageSize: DOKKAI_PAGE_SIZE,
    totalPages: Math.max(1, Math.ceil(total / DOKKAI_PAGE_SIZE)),
  }
}

/** Satu bacaan dokkai berdasarkan id. Null bila tidak ditemukan. */
export async function getDokkaiById(id: string): Promise<DokkaPassage | null> {
  const supabase = await createClient()
  const { data, error } = await supabase
    .from('dokkai_passages')
    .select('*')
    .eq('id', id)
    .single()

  if (error) {
    if (error.code !== 'PGRST116') console.error('getDokkaiById error', error)
    return null
  }
  return data as DokkaPassage
}

// ── Progres item (checklist "sudah dikenal") ───────────────────

/**
 * Ambil himpunan id item (vocab/kanji) yang sudah ditandai "dikenal"
 * oleh user saat ini, dibatasi pada daftar id yang diberikan (1 halaman).
 * Mengembalikan Set kosong bila belum login.
 */
export async function getKnownItemIds(
  itemType: 'vocab' | 'kanji',
  ids: string[],
): Promise<Set<string>> {
  if (ids.length === 0) return new Set()
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return new Set()

  const { data, error } = await supabase
    .from('user_item_progress')
    .select('item_id')
    .eq('user_id', user.id)
    .eq('item_type', itemType)
    .in('item_id', ids)

  if (error) {
    console.error('getKnownItemIds error', error)
    return new Set()
  }
  const rows = (data ?? []) as { item_id: string }[]
  return new Set(rows.map((r) => r.item_id))
}

/** Hitung total item dikenal untuk satu level (untuk ringkasan "X/Y"). */
export async function getKnownCountByLevel(
  itemType: 'vocab' | 'kanji',
  level: JLPTLevel,
): Promise<number> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return 0

  const table = itemType === 'vocab' ? 'vocab' : 'kanji'
  const levelId = levelIdByCode[level]

  // Ambil id item pada level ini, lalu hitung yang dikenal.
  const { data: itemRows, error: itemErr } = await supabase
    .from(table)
    .select('id')
    .eq('level_id', levelId)
  if (itemErr || !itemRows) return 0
  const ids = (itemRows as { id: string }[]).map((r) => r.id)
  if (ids.length === 0) return 0

  const { count, error } = await supabase
    .from('user_item_progress')
    .select('item_id', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .eq('item_type', itemType)
    .in('item_id', ids)

  if (error) {
    console.error('getKnownCountByLevel error', error)
    return 0
  }
  return count ?? 0
}

export async function getNewsById(id: string): Promise<NewsArticle | null> {
  const supabase = await createClient()
  const { data, error } = await supabase
    .from('news_articles')
    .select('*')
    .eq('id', id)
    .single()

  if (error) {
    if (error.code !== 'PGRST116') console.error('getNewsById error', error)
    return null
  }
  return data as NewsArticle
}
