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
 * Idempoten: upsert pada (job_slug, lesson_no) untuk seed silabus, atau pada
 * (level_id, title) untuk seed dialog lepas. Menjalankan ulang batch yang sama
 * tidak menggandakan baris — memperbaiki isi cukup edit file lalu jalankan lagi.
 *
 * Batasannya disengaja: skrip ini HANYA memahami satu pernyataan INSERT INTO
 * kaiwa_stories dengan daftar kolom eksplisit. Kolomnya dibaca dari SQL-nya
 * sendiri, jadi seed silabus (9 kolom) dan seed dialog lepas (6 kolom) sama-sama
 * jalan. Ia bukan parser SQL umum; bentuk lain berhenti dengan galat, bukan
 * ditebak.
 */

import { readFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

// ── Bentuk baris yang dituju ─────────────────────────────────────────────────

/** Kolom yang isinya JSON; sisanya diperlakukan sebagai skalar. */
const JSON_COLUMNS = new Set(['lines', 'vocab_highlight'])
/** Kolom angka. `lesson_no` boleh absen (seed dialog lepas tidak punya silabus). */
const NUMBER_COLUMNS = new Set(['level_id', 'lesson_no'])

type Row = Record<string, unknown> & {
  level_id: number
  title: string
  lines: unknown[]
  vocab_highlight: unknown[]
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

/**
 * Daftar kolom dibaca dari pernyataan INSERT-nya sendiri, bukan dipatok di
 * skrip: seed silabus memakai sembilan kolom (dengan job_slug/lesson_no/goal),
 * seed dialog lepas hanya enam. Satu parser melayani keduanya.
 */
function parseColumns(sql: string): string[] {
  const m = /INSERT\s+INTO\s+[\w.]+\s*\(([^)]+)\)/i.exec(sql)
  if (!m) throw new Error('tidak menemukan daftar kolom di pernyataan INSERT')
  return m[1]!.split(',').map((c) => c.trim())
}

function toRow(columns: string[], tuple: string, index: number): Row {
  const parts = splitTuple(tuple)
  if (parts.length !== columns.length) {
    throw new Error(
      `tuple #${index + 1}: ada ${parts.length} nilai, seharusnya ${columns.length} (${columns.join(', ')})`,
    )
  }

  const row: Record<string, unknown> = {}
  columns.forEach((col, i) => {
    const raw = parts[i]!
    if (JSON_COLUMNS.has(col)) row[col] = JSON.parse(unquote(raw)) as unknown[]
    else if (NUMBER_COLUMNS.has(col)) row[col] = Number(raw)
    else if (/^(true|false)$/i.test(raw.trim())) row[col] = raw.trim().toLowerCase() === 'true'
    else row[col] = unquote(raw)
  })
  return row as Row
}

// ── Validasi ─────────────────────────────────────────────────────────────────

/** Ambang panjang dialog, dihitung dari romaji (Jepang tidak pakai spasi). */
const MIN_WORDS = 50

function countWords(row: Row): number {
  return row.lines.reduce((n, raw) => {
    const romaji = (raw as Record<string, unknown>).romaji
    return n + (typeof romaji === 'string' ? romaji.trim().split(/\s+/).filter(Boolean).length : 0)
  }, 0)
}

/**
 * Aturan konten Koto no Ha: setiap baris dialog wajib punya kelima bidangnya.
 * Baris tanpa `reading` atau `romaji` akan tampil pincang di pemutar, dan itu
 * baru ketahuan setelah data masuk — jadi ditolak di sini.
 */
function validate(row: Row): string[] {
  const errs: string[] = []
  const where = row.job_slug ? `${row.job_slug} #${row.lesson_no}` : `L${row.level_id} "${row.title}"`

  if (!Number.isInteger(row.level_id) || row.level_id < 1) errs.push(`${where}: level_id tidak sah`)
  if (row.job_slug && !Number.isInteger(row.lesson_no)) errs.push(`${where}: lesson_no tidak sah`)
  if (!row.title) errs.push(`${where}: title kosong`)
  if (row.lines.length === 0) errs.push(`${where}: tidak ada baris dialog`)

  // Dialog terlalu pendek tidak memberi konteks yang cukup untuk shadowing.
  const words = countWords(row)
  if (words < MIN_WORDS) errs.push(`${where}: hanya ${words} kata, minimal ${MIN_WORDS}`)

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

const sql = readFileSync(fileArg, 'utf8')
const columns = parseColumns(sql)
const rows = parseTuples(sql).map((t, i) => toRow(columns, t, i))
const problems = rows.flatMap(validate)

console.log(`Berkas   : ${fileArg}`)
console.log(`Pelajaran: ${rows.length}`)
console.log(`Baris    : ${rows.reduce((n, r) => n + r.lines.length, 0)}`)
console.log(`Kosakata : ${rows.reduce((n, r) => n + r.vocab_highlight.length, 0)}`)
console.log(`Kolom    : ${columns.join(', ')}`)
for (const r of rows) {
  const no = r.job_slug ? `#${String(r.lesson_no).padStart(2)} ` : ''
  console.log(`  ${no}L${r.level_id} · ${r.lines.length} baris · ${countWords(r)} kata · ${r.title}`)
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
  .upsert(rows, { onConflict: columns.includes('job_slug') ? 'job_slug,lesson_no' : 'level_id,title' })

if (error) {
  console.error('Gagal menulis:', error.message)
  process.exit(1)
}
console.log(`Selesai: ${rows.length} pelajaran tersimpan.`)
