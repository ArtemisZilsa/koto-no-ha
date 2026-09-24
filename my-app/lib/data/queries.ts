import { createClient } from '@/lib/supabase/server'
import type { Vocab, Kanji, KanjiExampleJson, Grammar, GrammarExampleJson, NewsArticle, KaiwaStory, KaiwaJob, KaiwaCategory, DokkaPassage, DokkaiHighlightWord, UserSrsProgress } from '@/lib/types/database.types'
import type { VocabEntry, KanjiEntry, GrammarEntry, JLPTLevel } from './types'
import type { QuizItem, QuizMode } from './quiz'
import {
  CATEGORY_META,
  PRACTICE_CATEGORIES,
  PRACTICE_LEVELS,
  buildQuestions,
  setCount,
  type PracticeCategory,
  type PracticeProgressRow,
  type PracticeQuestion,
  type SourceItem,
} from './practice'
import { withResolvedAudio } from './kaiwaAudio'

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

/**
 * Kaiwa lepas untuk satu level JLPT — yang ditelusuri lewat tema.
 *
 * Pelajaran yang bagian dari silabus profesi (`job_slug` terisi) sengaja
 * DIKELUARKAN: urutannya bermakna, dan mencampurnya ke daftar tema akan
 * menampilkan pelajaran 14 sebelum pelajaran 2. Silabus dibaca lewat
 * getKaiwaLessons().
 */
/**
 * Total dialog kaiwa lepas (semua level, `job_slug IS NULL`) — dipakai untuk
 * angka statistik di landing page supaya tidak perlu diperbarui manual tiap
 * kali ada dialog baru.
 */
export async function getKaiwaDialogCount(): Promise<number> {
  const supabase = await createClient()

  const { count, error } = await supabase
    .from('kaiwa_stories')
    .select('id', { count: 'exact', head: true })
    .is('job_slug', null)

  if (error) {
    console.error('getKaiwaDialogCount error', error)
    return 0
  }
  return count ?? 0
}

export async function getKaiwaByLevel(level: JLPTLevel): Promise<KaiwaStory[]> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]

  const { data, error } = await supabase
    .from('kaiwa_stories')
    .select('*')
    .eq('level_id', levelId)
    .is('job_slug', null)
    .order('title')

  if (error) {
    console.error('getKaiwaByLevel error', error)
    return []
  }
  // `lines[].audio` disimpan sebagai path storage; rakit jadi URL publik di sini.
  return ((data ?? []) as KaiwaStory[]).map(withResolvedAudio)
}

// ── Kaiwa per profesi (silabus) ────────────────────────────────

/** Satu profesi beserta jumlah pelajaran yang sudah terisi. */
export interface KaiwaJobWithCount extends KaiwaJob {
  lessonCount: number
}

/**
 * Semua profesi, lengkap dengan jumlah pelajarannya.
 *
 * Jumlah dihitung lewat satu query agregat terpisah, bukan N+1 per profesi:
 * daftar profesi akan tumbuh, dan halaman hub memuat semuanya sekaligus.
 */
export async function getKaiwaJobs(): Promise<KaiwaJobWithCount[]> {
  const supabase = await createClient()

  const [jobsRes, lessonsRes] = await Promise.all([
    supabase.from('kaiwa_jobs').select('*').order('sector_slug').order('sort_order'),
    supabase.from('kaiwa_stories').select('job_slug').not('job_slug', 'is', null),
  ])

  if (jobsRes.error) {
    console.error('getKaiwaJobs error', jobsRes.error)
    return []
  }
  if (lessonsRes.error) console.error('getKaiwaJobs count error', lessonsRes.error)

  const counts = new Map<string, number>()
  for (const row of (lessonsRes.data ?? []) as { job_slug: string | null }[]) {
    if (row.job_slug) counts.set(row.job_slug, (counts.get(row.job_slug) ?? 0) + 1)
  }

  return ((jobsRes.data ?? []) as KaiwaJob[]).map((job) => ({
    ...job,
    lessonCount: counts.get(job.slug) ?? 0,
  }))
}

/** Satu profesi berdasarkan slug. null bila tidak ada. */
export async function getKaiwaJob(slug: string): Promise<KaiwaJob | null> {
  const supabase = await createClient()

  const { data, error } = await supabase.from('kaiwa_jobs').select('*').eq('slug', slug).maybeSingle()

  if (error) {
    console.error('getKaiwaJob error', error)
    return null
  }
  return (data as KaiwaJob | null) ?? null
}

/**
 * Silabus satu profesi, urut nomor pelajaran.
 *
 * `lines` sengaja tidak diambil: daftar silabus hanya butuh judul dan sasaran,
 * sedangkan satu profesi bisa memuat ratusan baris dialog.
 */
export async function getKaiwaLessons(jobSlug: string): Promise<KaiwaLessonSummary[]> {
  const supabase = await createClient()

  const { data, error } = await supabase
    .from('kaiwa_stories')
    .select('id, lesson_no, title, goal, level_id, category')
    .eq('job_slug', jobSlug)
    .order('lesson_no')

  if (error) {
    console.error('getKaiwaLessons error', error)
    return []
  }
  return (data ?? []) as KaiwaLessonSummary[]
}

/** Baris ringkas untuk daftar silabus — tanpa isi dialog. */
export interface KaiwaLessonSummary {
  id: string
  lesson_no: number
  title: string
  goal: string | null
  level_id: number
  category: KaiwaCategory
}

/** Satu pelajaran dalam silabus profesi. null bila nomornya tidak ada. */
export async function getKaiwaLesson(jobSlug: string, lessonNo: number): Promise<KaiwaStory | null> {
  const supabase = await createClient()

  const { data, error } = await supabase
    .from('kaiwa_stories')
    .select('*')
    .eq('job_slug', jobSlug)
    .eq('lesson_no', lessonNo)
    .maybeSingle()

  if (error) {
    console.error('getKaiwaLesson error', error)
    return null
  }
  return data ? withResolvedAudio(data as KaiwaStory) : null
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

/**
 * Kata vocab untuk disorot di reader dokkai, sesuai level user.
 * Level ditentukan dari `profiles.current_level_id` bila user login dan valid
 * (N5–N1); bila tidak (tamu / belum diatur), jatuh kembali ke level bacaan.
 * Mengembalikan juga kode level (mis. "N3") untuk label di UI.
 */
export async function getDokkaiHighlightWords(
  passageLevelId: number,
): Promise<{ words: DokkaiHighlightWord[]; levelCode: JLPTLevel | null }> {
  const supabase = await createClient()

  let levelId = passageLevelId
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('current_level_id')
      .eq('id', user.id)
      .single()
    const userLevel = (profile as { current_level_id: number | null } | null)?.current_level_id
    if (userLevel && userLevel >= 1 && userLevel <= 5) levelId = userLevel
  }

  const levelCode = (Object.entries(levelIdByCode).find(([, id]) => id === levelId)?.[0] ??
    null) as JLPTLevel | null
  if (!levelCode) return { words: [], levelCode: null }

  const { data, error } = await supabase
    .from('vocab')
    .select('word, hiragana, meaning')
    .eq('level_id', levelId)

  if (error) {
    console.error('getDokkaiHighlightWords error', error)
    return { words: [], levelCode }
  }

  const rows = (data ?? []) as { word: string; hiragana: string; meaning: string }[]
  return {
    words: rows
      .filter((r) => r.word && r.word.length >= 2)
      .map((r) => ({ word: r.word, reading: r.hiragana, meaning: r.meaning })),
    levelCode,
  }
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

/* ─── Sesi flashcard SRS ──────────────────────────────────────────────────────
 * Kartu jatuh tempo (due) diambil lebih dulu, lalu sisanya diisi kartu baru
 * (belum pernah direview) urut order_index. Untuk tamu (belum login) semua
 * kartu dianggap baru dan progres tidak disimpan.
 */

export type FlashcardItemType = 'vocab' | 'kanji'

export type FlashcardStudyItem =
  | { itemType: 'vocab'; isNew: boolean; entry: VocabEntry }
  | { itemType: 'kanji'; isNew: boolean; entry: KanjiEntry }

export interface FlashcardSession {
  items: FlashcardStudyItem[]
  /** Jumlah kartu due yang masuk sesi ini. */
  dueCount: number
  /** Jumlah kartu baru yang masuk sesi ini. */
  newCount: number
  /** false = tamu; progres tidak akan tersimpan. */
  signedIn: boolean
}

const SESSION_SIZE = 20
const DUE_FETCH_LIMIT = 200

export async function getFlashcardSession(
  level: JLPTLevel,
  itemType: FlashcardItemType = 'vocab',
  limit = SESSION_SIZE,
): Promise<FlashcardSession> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  const table = itemType === 'vocab' ? 'vocab' : 'kanji'

  const toItem = (row: Vocab | Kanji, isNew: boolean): FlashcardStudyItem =>
    itemType === 'vocab'
      ? { itemType: 'vocab', isNew, entry: rowToVocabEntry(row as Vocab) }
      : { itemType: 'kanji', isNew, entry: rowToKanjiEntry(row as Kanji) }

  const {
    data: { user },
  } = await supabase.auth.getUser()

  const items: FlashcardStudyItem[] = []
  let studiedIds: string[] = []

  if (user) {
    // 1) Kartu jatuh tempo milik user (semua level, difilter level di bawah).
    const { data: dueRows, error: dueError } = await supabase
      .from('user_srs_progress')
      .select('item_id, next_review_at')
      .eq('user_id', user.id)
      .eq('item_type', itemType)
      .lte('next_review_at', new Date().toISOString())
      .order('next_review_at')
      .limit(DUE_FETCH_LIMIT)

    if (dueError) console.error('getFlashcardSession due error', dueError)

    const dueIds = ((dueRows ?? []) as Pick<UserSrsProgress, 'item_id'>[]).map(
      (r) => r.item_id,
    )

    if (dueIds.length > 0) {
      const { data: dueContent, error: contentError } = await supabase
        .from(table)
        .select('*')
        .eq('level_id', levelId)
        .in('id', dueIds)

      if (contentError) console.error('getFlashcardSession content error', contentError)

      // Pertahankan urutan jatuh tempo (paling telat lebih dulu).
      const byId = new Map(((dueContent ?? []) as (Vocab | Kanji)[]).map((r) => [r.id, r]))
      for (const id of dueIds) {
        if (items.length >= limit) break
        const row = byId.get(id)
        if (row) items.push(toItem(row, false))
      }
    }

    // 2) Semua item yang sudah pernah direview → dikecualikan dari kartu baru.
    const { data: studiedRows, error: studiedError } = await supabase
      .from('user_srs_progress')
      .select('item_id')
      .eq('user_id', user.id)
      .eq('item_type', itemType)

    if (studiedError) console.error('getFlashcardSession studied error', studiedError)
    studiedIds = ((studiedRows ?? []) as Pick<UserSrsProgress, 'item_id'>[]).map(
      (r) => r.item_id,
    )
  }

  const dueCount = items.length

  // 3) Isi sisa slot dengan kartu baru urut order_index.
  if (items.length < limit) {
    let query = supabase
      .from(table)
      .select('*')
      .eq('level_id', levelId)
      .order('order_index')
      .limit(limit - items.length)

    if (studiedIds.length > 0) {
      query = query.not('id', 'in', `(${studiedIds.join(',')})`)
    }

    const { data: newRows, error: newError } = await query
    if (newError) console.error('getFlashcardSession new error', newError)

    for (const row of (newRows ?? []) as (Vocab | Kanji)[]) {
      items.push(toItem(row, true))
    }
  }

  return {
    items,
    dueCount,
    newCount: items.length - dueCount,
    signedIn: Boolean(user),
  }
}

// ─── Soal latihan (Fase 9 #2/#3) ─────────────────────────────────────────────

type PracticeSourceRow = { id: string; prompt: string; reading: string | null; meaning: string; group: string | null }

/** Semua item satu kategori+level, urut tetap (order_index, id) supaya set stabil. */
async function getPracticeSource(category: PracticeCategory, level: JLPTLevel): Promise<SourceItem[]> {
  const supabase = await createClient()
  const levelId = levelIdByCode[level]
  let rows: PracticeSourceRow[] = []

  if (category === 'kosakata') {
    const { data, error } = await supabase
      .from('vocab')
      .select('id, word, hiragana, meaning, part_of_speech')
      .eq('level_id', levelId)
      .is('field', null)
      .order('order_index')
      .order('id')
      .limit(2000)
    if (error) console.error('getPracticeSource vocab error', error)
    rows = ((data ?? []) as unknown as { id: string; word: string; hiragana: string; meaning: string; part_of_speech: string }[])
      .map((r) => ({ id: r.id, prompt: r.word, reading: r.hiragana, meaning: r.meaning, group: r.part_of_speech }))
  } else if (category === 'kanji') {
    const { data, error } = await supabase
      .from('kanji')
      .select('id, kanji, hiragana, meaning')
      .eq('level_id', levelId)
      .order('order_index')
      .order('id')
      .limit(2000)
    if (error) console.error('getPracticeSource kanji error', error)
    rows = ((data ?? []) as unknown as { id: string; kanji: string; hiragana: string; meaning: string }[])
      .map((r) => ({ id: r.id, prompt: r.kanji, reading: r.hiragana, meaning: r.meaning, group: null }))
  } else {
    const { data, error } = await supabase
      .from('grammar')
      .select('id, pattern, reading, meaning')
      .eq('level_id', levelId)
      .order('order_index')
      .order('id')
      .limit(2000)
    if (error) console.error('getPracticeSource grammar error', error)
    rows = ((data ?? []) as unknown as { id: string; pattern: string; reading: string; meaning: string }[])
      .map((r) => ({ id: r.id, prompt: r.pattern, reading: r.reading, meaning: r.meaning, group: null }))
  }

  return rows.map((r) => ({ id: r.id, prompt: r.prompt, reading: r.reading ?? undefined, meaning: r.meaning, group: r.group ?? undefined }))
}

export interface PracticeSet {
  category: PracticeCategory
  level: JLPTLevel
  setNo: number
  totalSets: number
  questions: PracticeQuestion[]
}

/** Set ke-`setNo` (mulai 1). null bila set di luar jangkauan. */
export async function getPracticeSet(
  category: PracticeCategory,
  level: JLPTLevel,
  setNo: number,
): Promise<PracticeSet | null> {
  const source = await getPracticeSource(category, level)
  const size = CATEGORY_META[category].setSize
  const totalSets = setCount(category, source.length)
  if (!Number.isInteger(setNo) || setNo < 1 || setNo > totalSets) return null
  const targets = source.slice((setNo - 1) * size, setNo * size)
  return { category, level, setNo, totalSets, questions: buildQuestions(targets, source, category, level) }
}

/** Jumlah item per kategori+level (tanpa login), untuk daftar set. */
export async function getPracticeTotals(): Promise<Record<PracticeCategory, Record<string, number>>> {
  const supabase = await createClient()
  const out = { kosakata: {}, tata_bahasa: {}, kanji: {} } as Record<PracticeCategory, Record<string, number>>
  await Promise.all(
    PRACTICE_LEVELS.flatMap((level) =>
      PRACTICE_CATEGORIES.map(async (category) => {
        const table = category === 'kosakata' ? 'vocab' : category === 'kanji' ? 'kanji' : 'grammar'
        let q = supabase.from(table).select('id', { count: 'exact', head: true }).eq('level_id', levelIdByCode[level])
        if (category === 'kosakata') q = q.is('field', null)
        const { count } = await q
        out[category][level] = count ?? 0
      }),
    ),
  )
  return out
}

/** Progress user login per kategori+level (RPC get_practice_progress). [] bila belum login. */
export async function getPracticeProgress(): Promise<PracticeProgressRow[]> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return []

  const db = supabase as unknown as {
    rpc: (fn: 'get_practice_progress') => Promise<{ data: PracticeProgressRow[] | null; error: { message: string } | null }>
  }
  const { data, error } = await db.rpc('get_practice_progress')
  if (error) {
    console.error('get_practice_progress error', error)
    return []
  }
  return data ?? []
}
