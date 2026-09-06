/**
 * Pemuat seed pelajaran kaiwa — file migrasi SQL → Supabase.
 *
 * Skrip authoring, dijalankan manual. BUKAN bagian dari `next build`.
 *
 * Kenapa ada: satu batch pelajaran berukuran puluhan kilobyte. Menempelkannya
 * lewat klien SQL setiap kali menambah batch itu boros dan gampang salah
 * potong. Skrip ini membaca file migrasi yang SAMA yang masuk ke repo, jadi
 * tidak ada dua sumber kebenaran — yang dijalankan persis yang tersimpan.
 *
 * Cara pakai:
 *
 *   # 1. Selalu mulai dari sini: parsing + validasi, tidak menulis apa pun.
 *   npm run seed:kaiwa -- --file supabase/migrations/046_seed_kaiwa_kaigo_shokuin_1.sql --dry-run
 *
 *   # 2. Baru tulis ke database.
 *   npm run seed:kaiwa -- --file supabase/migrations/046_seed_kaiwa_kaigo_shokuin_1.sql
 *
 * Idempoten: memakai upsert pada (job_slug, lesson_no), jadi menjalankan ulang
 * batch yang sama tidak menggandakan baris — dan memperbaiki isi pelajaran
 * cukup dengan mengedit file migrasinya lalu menjalankan ulang.
 *
 * Batasannya disengaja: skrip ini HANYA memahami bentuk INSERT yang dipakai
 * seed pelajaran kaiwa (sembilan kolom, urutan tetap, seperti pada 046). Ia
 * bukan parser SQL umum; kalau bentuknya berubah, ia berhenti dengan galat,
 * bukan menebak.
 */

import { readFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

// ── Bentuk baris yang dituju ─────────────────────────────────────────────────

const COLUMNS = [
  'level_id',
  'job_slug',
  'lesson_no',
  'title',
  'goal',
  'category',
  'lines',
  'vocab_highlight',
  'is_premium',
] as const

type Row = {
  level_id: number
  job_slug: string
  lesson_no: number
  title: string
  goal: string
  category: string
  lines: unknown[]
  vocab_highlight: unknown[]
  is_premium: boolean
}

// ── Parsing ──────────────────────────────────────────────────────────────────

/**
 * Pisahkan satu tuple VALUES menjadi daftar literal mentah.
 *
 * Ditulis sebagai pemindai karakter, bukan regex: isi dialog mengandung koma
 * dan kurung dalam bahasa Jepang, dan regex apa pun akan salah memotongnya.
 * Di dalam string SQL, tanda kutip tunggal di-escape dengan menggandakannya
 * ('') — itu satu-satunya escape yang perlu dipahami di sini.
 */
function splitTuple(src: string): string[] {
  const out: string[] = []
  let buf = ''
  let depth = 0
  let inStr = false

  for (let i = 0; i < src.length; i++) {
    const c = src[i]!

    if (inStr) {
      if (c === "'") {
        if (src[i + 1] === "'") {
          buf += "''"
          i++
          continue
        }
        inStr = false
      }
      buf += c
      continue
    }

    if (c === "'") {
      inStr = true
      buf += c
    } else if (c === '(') {
      depth++
      buf += c
    } else if (c === ')') {
      depth--
      buf += c
    } else if (c === ',' && depth === 0) {
      out.push(buf.trim())
      buf = ''
    } else {
      buf += c
    }
  }
  if (buf.trim()) out.push(buf.trim())
  return out
}

/** Buang pembungkus kutip tunggal dan kembalikan '' menjadi '. */
function unquote(literal: string): string {
  const v = literal.replace(/::jsonb$/i, '').trim()
  if (!v.startsWith("'") || !v.endsWith("'")) {
    throw new Error(`bukan literal string SQL: ${v.slice(0, 60)}`)
  }
  return v.slice(1, -1).replace(/''/g, "'")
}

/** Ambil daftar tuple dari sebuah pernyataan INSERT ... VALUES (...), (...); */
function parseTuples(sql: string): string[] {
  // Buang komentar baris supaya kurung di dalamnya tidak ikut terhitung.
  const clean = sql
    .split('\n')
    .map((line) => {
      let inStr = false
      for (let i = 0; i < line.length; i++) {
        if (line[i] === "'") inStr = !inStr
        else if (!inStr && line[i] === '-' && line[i + 1] === '-') return line.slice(0, i)
      }
      return line
    })
    .join('\n')

  const start = clean.search(/\bVALUES\b/i)
  if (start === -1) throw new Error('tidak menemukan kata kunci VALUES')

  const tuples: string[] = []
  let depth = 0
  let inStr = false
  let buf = ''

  for (let i = start + 6; i < clean.length; i++) {
    const c = clean[i]!

    if (inStr) {
      if (c === "'" && clean[i + 1] === "'") {
        buf += "''"
        i++
        continue
      }
      if (c === "'") inStr = false
      buf += c
      continue
    }

    if (c === "'") {
      inStr = true
      buf += c
      continue
    }
    if (c === '(') {
      depth++
      if (depth === 1) {
        buf = ''
        continue
      }
    }
    if (c === ')') {
      depth--
      if (depth === 0) {
        tuples.push(buf)
        buf = ''
        continue
      }
    }
    // Berhenti begitu keluar dari daftar VALUES (mis. klausa ON CONFLICT).
    if (depth === 0 && /[a-z]/i.test(c) && tuples.length > 0) {
      const tail = clean.slice(i).trimStart()
      if (/^ON\s+CONFLICT/i.test(tail)) break
    }
    if (depth > 0) buf += c
  }

  if (depth !== 0) throw new Error('kurung tidak seimbang di daftar VALUES')
  return tuples
}

function toRow(tuple: string, index: number): Row {
  const parts = splitTuple(tuple)
  if (parts.length !== COLUMNS.length) {
    throw new Error(
      `tuple #${index + 1}: ada ${parts.length} kolom, seharusnya ${COLUMNS.length} (${COLUMNS.join(', ')})`,
    )
  }
  const [levelId, jobSlug, lessonNo, title, goal, category, lines, vocab, premium] = parts as [
    string, string, string, string, string, string, string, string, string,
  ]

  return {
    level_id: Number(levelId),
    job_slug: unquote(jobSlug),
    lesson_no: Number(lessonNo),
    title: unquote(title),
    goal: unquote(goal),
    category: unquote(category),
    lines: JSON.parse(unquote(lines)) as unknown[],
    vocab_highlight: JSON.parse(unquote(vocab)) as unknown[],
    is_premium: premium.trim().toLowerCase() === 'true',
  }
}

// ── Validasi ─────────────────────────────────────────────────────────────────

/**
 * Aturan konten Koto no Ha: setiap baris dialog wajib punya kelima bidangnya.
 * Baris tanpa `reading` atau `romaji` akan tampil pincang di pemutar, dan itu
 * baru ketahuan setelah data masuk — jadi ditolak di sini.
 */
function validate(row: Row): string[] {
  const errs: string[] = []
  const where = `${row.job_slug} #${row.lesson_no}`

  if (!Number.isInteger(row.level_id) || row.level_id < 1) errs.push(`${where}: level_id tidak sah`)
  if (!Number.isInteger(row.lesson_no)) errs.push(`${where}: lesson_no tidak sah`)
  if (!row.title) errs.push(`${where}: title kosong`)
  if (row.lines.length === 0) errs.push(`${where}: tidak ada baris dialog`)

  row.lines.forEach((raw, i) => {
    const line = raw as Record<string, unknown>
    for (const key of ['speaker', 'text', 'reading', 'romaji', 'trans']) {
      if (typeof line[key] !== 'string' || !(line[key] as string).trim()) {
        errs.push(`${where} baris ${i + 1}: bidang "${key}" kosong`)
      }
    }
  })

  row.vocab_highlight.forEach((raw, i) => {
    const v = raw as Record<string, unknown>
    for (const key of ['word', 'meaning']) {
      if (typeof v[key] !== 'string' || !(v[key] as string).trim()) {
        errs.push(`${where} kosakata ${i + 1}: bidang "${key}" kosong`)
      }
    }
  })

  return errs
}

// ── Main ─────────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)
const fileArg = args[args.indexOf('--file') + 1]
const dryRun = args.includes('--dry-run')

if (!args.includes('--file') || !fileArg) {
  console.error('Wajib: --file <path ke migrasi .sql>')
  process.exit(1)
}

const rows = parseTuples(readFileSync(fileArg, 'utf8')).map(toRow)
const problems = rows.flatMap(validate)

console.log(`Berkas   : ${fileArg}`)
console.log(`Pelajaran: ${rows.length}`)
console.log(`Baris    : ${rows.reduce((n, r) => n + r.lines.length, 0)}`)
console.log(`Kosakata : ${rows.reduce((n, r) => n + r.vocab_highlight.length, 0)}`)
for (const r of rows) {
  console.log(`  #${String(r.lesson_no).padStart(2)} · L${r.level_id} · ${r.lines.length} baris · ${r.title}`)
}

if (problems.length > 0) {
  console.error(`\n${problems.length} masalah ditemukan:`)
  for (const p of problems) console.error(`  - ${p}`)
  process.exit(1)
}
console.log('\nValidasi lolos.')

if (dryRun) {
  console.log('--dry-run: tidak ada yang ditulis.')
  process.exit(0)
}

const url = process.env.NEXT_PUBLIC_SUPABASE_URL
const key = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('Butuh NEXT_PUBLIC_SUPABASE_URL dan SUPABASE_SERVICE_ROLE_KEY di .env.local')
  process.exit(1)
}

const supabase = createClient(url, key, { auth: { persistSession: false } })
const { error } = await supabase
  .from('kaiwa_stories')
  .upsert(rows, { onConflict: 'job_slug,lesson_no' })

if (error) {
  console.error('Gagal menulis:', error.message)
  process.exit(1)
}
console.log(`Selesai: ${rows.length} pelajaran tersimpan.`)
