import { createClient } from '@/lib/supabase/server'

// ─── Bank soal berbayar (migrasi 060/061) ────────────────────────────────────
// Semua query di sini tunduk RLS: non-pelanggan selalu dapat data kosong.

export const KANJI_SET_SIZE = 20

export interface BankQuestion {
  id: string
  code: string
  qtype: string
  question: string
  options: string[]
  answerIndex: number
  explanation: string | null
}

/** Satu sesi yang bisa dikerjakan, mis. Tata Bahasa batch 2 atau Kanji tema 3 set 1. */
export interface BankUnit {
  href: string
  title: string
  subtitle: string
  total: number
  mastered: number
}

export interface BankMenu {
  grammar: BankUnit[]
  checkpoints: BankUnit[]
  kanji: BankUnit[]
}

interface ProgressRow {
  category: 'tata_bahasa' | 'kanji'
  mode: 'latihan' | 'checkpoint'
  unit: number
  checkpoint: string | null
  group_code: string
  group_label: string
  total: number
  mastered: number
}

/** Kelompokkan baris progres (per pola/tema) menjadi kartu menu. */
function addTo(map: Map<string, BankUnit & { sort: number; labels: string[] }>, key: string, sort: number, href: string, title: string, r: ProgressRow) {
  const u = map.get(key) ?? { href, title, subtitle: '', total: 0, mastered: 0, sort, labels: [] }
  u.total += r.total
  u.mastered += r.mastered
  if (!u.labels.includes(r.group_label)) u.labels.push(r.group_label)
  map.set(key, u)
}

function finish(map: Map<string, BankUnit & { sort: number; labels: string[] }>): BankUnit[] {
  return [...map.values()]
    .sort((a, b) => a.sort - b.sort)
    .map(({ href, title, total, mastered, labels }) => ({ href, title, subtitle: labels.join('  ｜  '), total, mastered }))
}

export async function getBankMenu(): Promise<BankMenu> {
  const supabase = await createClient()
  const db = supabase as unknown as {
    rpc: (fn: 'get_bank_progress') => Promise<{ data: ProgressRow[] | null; error: { message: string } | null }>
  }
  const { data, error } = await db.rpc('get_bank_progress')
  if (error) console.error('get_bank_progress error', error)

  const grammar = new Map(), checkpoints = new Map(), kanji = new Map()
  for (const r of data ?? []) {
    if (r.category === 'tata_bahasa' && r.mode === 'latihan') {
      addTo(grammar, `b${r.unit}`, r.unit, `/bank-soal/tata-bahasa/b${r.unit}`, `Batch ${r.unit}`, r)
    } else if (r.category === 'tata_bahasa' && r.checkpoint) {
      const n = Number(r.checkpoint.replace(/\D/g, ''))
      addTo(checkpoints, r.checkpoint, n, `/bank-soal/tata-bahasa/cp${n}`, `Checkpoint ${n}`, r)
    } else if (r.category === 'kanji') {
      addTo(kanji, `t${r.unit}`, r.unit, `/bank-soal/kanji/t${r.unit}-1`, `Tema ${r.unit}`, r)
    }
  }
  const cps = finish(checkpoints)
  // Subjudul checkpoint: cukup rentang batch, daftar polanya terlalu panjang.
  for (const c of cps) c.subtitle = `${c.total} soal diskor`
  return { grammar: finish(grammar), checkpoints: cps, kanji: finish(kanji) }
}

export type SessionKind = 'latihan' | 'checkpoint'

export interface BankSession {
  kind: SessionKind
  title: string
  questions: BankQuestion[]
  /** Kanji: link set berikutnya dalam tema yang sama. */
  nextHref?: string
}

/**
 * Parse URL sesi:  tata-bahasa/b{batch} · tata-bahasa/cp{n} · kanji/t{tema}-{set}
 * null = URL tidak valid atau soal tidak ada (termasuk karena belum berlangganan).
 */
export async function getBankSession(kategori: string, unit: string): Promise<BankSession | null> {
  const supabase = await createClient()
  const cols = 'id, code, qtype, question, options, answer_index, explanation, group_label'
  // ponytail: hanya N5 (data yang ada). Saat N4 masuk, tambahkan level ke URL dan ke get_bank_progress.
  let q = supabase.from('bank_soal').select(cols).eq('level', 'N5').neq('mode', 'cadangan')
  let kind: SessionKind = 'latihan'
  let title: string
  let set = 0, tema = 0

  const b = kategori === 'tata-bahasa' && /^b(\d{1,3})$/.exec(unit)
  const cp = kategori === 'tata-bahasa' && /^cp(\d{1,3})$/.exec(unit)
  const k = kategori === 'kanji' && /^t(\d{1,2})-(\d{1,3})$/.exec(unit)
  if (b) {
    q = q.eq('category', 'tata_bahasa').eq('mode', 'latihan').eq('unit', Number(b[1]))
    title = `Tata Bahasa · Batch ${b[1]}`
  } else if (cp) {
    q = q.eq('category', 'tata_bahasa').eq('mode', 'checkpoint').eq('checkpoint', `CP${cp[1]}`)
    kind = 'checkpoint'
    title = `Tata Bahasa · Checkpoint ${cp[1]}`
  } else if (k) {
    tema = Number(k[1])
    set = Number(k[2])
    if (set < 1) return null
    q = q.eq('category', 'kanji').eq('unit', tema).range((set - 1) * KANJI_SET_SIZE, set * KANJI_SET_SIZE - 1)
    title = `Kanji · Tema ${tema} · Set ${set}`
  } else {
    return null
  }

  const { data, error } = await q.order('order_index')
  if (error) console.error('getBankSession error', error)
  const rows = (data ?? []) as unknown as Array<{
    id: string; code: string; qtype: string; question: string; options: string[]
    answer_index: number; explanation: string | null; group_label: string
  }>
  if (rows.length === 0) return null

  let nextHref: string | undefined
  if (k) {
    const { count } = await supabase
      .from('bank_soal').select('id', { count: 'exact', head: true })
      .eq('level', 'N5').eq('category', 'kanji').eq('unit', tema)
    if ((count ?? 0) > set * KANJI_SET_SIZE) nextHref = `/bank-soal/kanji/t${tema}-${set + 1}`
    title = `${title} · ${rows[0].group_label}`
  }

  return {
    kind,
    title,
    nextHref,
    questions: rows.map((r) => ({
      id: r.id,
      code: r.code,
      qtype: r.qtype,
      question: r.question,
      options: r.options,
      answerIndex: r.answer_index,
      explanation: r.explanation,
    })),
  }
}
