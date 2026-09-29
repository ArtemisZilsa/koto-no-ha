/**
 * Validator konten kaiwa — `npm run validate:kaiwa`, juga dijalankan di CI.
 *
 * Membaca migrasi seed `kaiwa_stories` di `supabase/migrations/*.sql` (BUKAN
 * Supabase langsung — validator tidak pernah menghubungi database produksi,
 * apalagi menulis ke sana). Migrasi adalah satu-satunya sumber yang bisa
 * dicek untuk PR konten baru: itulah yang direview sebelum Zilsa menjalankan
 * `npm run seed:kaiwa`.
 *
 * Batasan yang disengaja: dialog lama yang disetorkan langsung ke Supabase
 * sebelum alur migrasi-file ini ada (lihat AUDIT.md) tidak muncul di sini
 * sama sekali — validator hanya melihat apa yang ada di repo.
 *
 * Cek yang dijalankan:
 *   1. field wajib per baris dialog & entri glosarium
 *   4. bentuk glosarium (transisi menuju format standar Fase D)
 *   5. panjang minimal dialog per level (dihitung dari jumlah baris)
 *   6. judul ganda dalam level x tema yang sama
 *
 * BELUM diimplementasikan (dijadwalkan Day 2–3, lihat scheduler/kaiwa-30d/STATE.md):
 *   2. kecocokan hiragana ↔ teks Jepang lewat tokenizer
 *   3. romaji dihasilkan skrip dari hiragana, bukan diketik manual
 *   Keduanya butuh tokenizer morfologis (mis. kuromoji): partikel は/へ/を
 *   dibaca "wa/e/o", bukan "ha/he/wo", dan itu tidak bisa ditentukan dari
 *   pemetaan karakter per karakter saja.
 *
 * Pelanggaran pada file yang sudah ada di base branch = warning (data lama).
 * Pelanggaran pada file baru/berubah dibanding base = error, exit code 1.
 */

import { readFileSync, readdirSync } from 'node:fs'
import { execSync } from 'node:child_process'
import path from 'node:path'

const REPO_ROOT = process.cwd()
const MIGRATIONS_DIR = path.join(REPO_ROOT, 'supabase/migrations')

/** Sinkron dengan tabel `levels` di 001_initial_schema.sql. */
const LEVEL_CODE: Record<number, string> = { 1: 'N5', 2: 'N4', 3: 'N3', 4: 'N2', 5: 'N1' }

/** Cek (5): ambang panjang dialog, dihitung dari jumlah baris `lines`. */
const MIN_LINES: Record<string, number> = { N5: 6, N4: 8, N3: 10, N2: 10, N1: 10 }

type Row = {
  level_id: number
  title?: string
  category?: string
  lines: unknown[]
  vocab_highlight: unknown[]
  job_slug?: string | null
  lesson_no?: number
}

type Finding = { level: 'error' | 'warning'; check: string; where: string; message: string }

// ── Parser SQL (sengaja mandiri dari tools/seed-kaiwa-lessons.mts: validator
//    hanya membaca-dan-melaporkan, seed script membaca-dan-menulis — menjaga
//    keduanya independen mencegah perubahan salah satu diam-diam mematahkan
//    yang lain). ────────────────────────────────────────────────────────────

function unquote(raw: string): string {
  const t = raw.trim()
  if (t.toLowerCase() === 'null') return ''
  if (t.startsWith("'") ) {
    // buang quote pembuka, quote penutup + cast opsional (mis. ::jsonb)
    const end = t.lastIndexOf("'")
    return t.slice(1, end).replace(/''/g, "'")
  }
  return t
}

function splitTuples(insertBody: string): string[] {
  const tuples: string[] = []
  let buf = ''
  let depth = 0
  let inStr = false

  for (let i = 0; i < insertBody.length; i++) {
    const c = insertBody[i]!

    if (inStr) {
      buf += c
      if (c === "'") {
        if (insertBody[i + 1] === "'") {
          buf += insertBody[++i]
          continue
        }
        inStr = false
      }
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
    if (depth === 0) {
      // Berhenti di penanda akhir statement level-atas: baik `;` polos maupun
      // `ON CONFLICT ...;`. Memangkas di `;` pertama TANPA syarat depth===0
      // salah — trans/terjemahan dialog kerap memuat tanda titik koma biasa
      // (mis. "...; fondasi hidup..."), dan itu berada di dalam string
      // (inStr=true), jadi tidak pernah sampai ke titik ini.
      if (c === ';') break
      if (/^ON\s+CONFLICT/i.test(insertBody.slice(i).trimStart())) break
    }
    if (depth > 0) buf += c
  }

  return tuples
}

function splitTupleValues(tuple: string): string[] {
  const parts: string[] = []
  let buf = ''
  let depth = 0
  let inStr = false

  for (let i = 0; i < tuple.length; i++) {
    const c = tuple[i]!
    if (inStr) {
      buf += c
      if (c === "'") {
        if (tuple[i + 1] === "'") {
          buf += tuple[++i]
          continue
        }
        inStr = false
      }
      continue
    }
    if (c === "'") {
      inStr = true
      buf += c
      continue
    }
    if (c === '[' || c === '{') depth++
    if (c === ']' || c === '}') depth--
    if (c === ',' && depth === 0) {
      parts.push(buf)
      buf = ''
      continue
    }
    buf += c
  }
  if (buf.trim()) parts.push(buf)
  return parts
}

const JSON_COLUMNS = new Set(['lines', 'vocab_highlight'])
const NUMBER_COLUMNS = new Set(['level_id', 'lesson_no'])

function parseKaiwaInserts(sql: string): Row[] {
  const rows: Row[] = []
  // Ditangkap sampai akhir berkas, bukan `;` pertama — teks dialog/terjemahan
  // bisa memuat titik koma biasa. `splitTuples` di bawah yang menentukan akhir
  // statement sesungguhnya (quote- dan depth-aware).
  const insertRe = /INSERT\s+INTO\s+public\.kaiwa_stories\s*\(([^)]+)\)\s*VALUES([\s\S]*)/gi
  let m: RegExpExecArray | null
  while ((m = insertRe.exec(sql))) {
    const columns = m[1]!.split(',').map((c) => c.trim())
    const tuples = splitTuples(m[2]!)
    for (const tuple of tuples) {
      const values = splitTupleValues(tuple)
      if (values.length !== columns.length) continue // baris rusak ditangkap sebagai finding lain di bawah
      const row: Record<string, unknown> = {}
      columns.forEach((col, i) => {
        const raw = values[i]!
        if (JSON_COLUMNS.has(col)) {
          try {
            row[col] = JSON.parse(unquote(raw)) as unknown[]
          } catch {
            row[col] = []
          }
        } else if (NUMBER_COLUMNS.has(col)) {
          row[col] = Number(unquote(raw) || raw.trim())
        } else if (/^(true|false)$/i.test(raw.trim())) {
          row[col] = raw.trim().toLowerCase() === 'true'
        } else {
          row[col] = unquote(raw)
        }
      })
      rows.push(row as Row)
    }
  }
  return rows
}

// ── File discovery + status lama/baru ───────────────────────────────────────

function kaiwaMigrationFiles(): string[] {
  return readdirSync(MIGRATIONS_DIR)
    .filter((f) => f.endsWith('.sql'))
    .filter((f) => /INSERT\s+INTO\s+public\.kaiwa_stories/i.test(readFileSync(path.join(MIGRATIONS_DIR, f), 'utf8')))
    .sort()
}

function baseRef(): string {
  const fromArg = process.argv.find((a) => a.startsWith('--base='))
  if (fromArg) return fromArg.split('=')[1]!
  return process.env.VALIDATE_KAIWA_BASE || 'origin/master'
}

/**
 * File yang berbeda dari base branch = "baru/berubah"; sisanya = "lama".
 *
 * Gabungan dua sumber: commit yang sudah masuk HEAD dibanding base (kasus
 * CI atas PR), DAN perubahan yang belum di-commit termasuk file baru yang
 * belum di-`git add` (kasus dijalankan lokal sebelum commit).
 */
function changedFiles(base: string): Set<string> | null {
  try {
    execSync(`git rev-parse --verify ${base}`, { stdio: 'ignore' })
  } catch {
    return null
  }
  try {
    const committed = execSync(`git diff --name-only ${base}...HEAD -- supabase/migrations`, {
      encoding: 'utf8',
    })
    const uncommitted = execSync(`git status --porcelain --untracked-files=normal -- supabase/migrations`, {
      encoding: 'utf8',
    })
      .split('\n')
      .map((l) => l.slice(3).trim())
      .filter(Boolean)
      .join('\n')
    return new Set(
      `${committed}\n${uncommitted}`
        .split('\n')
        .map((l) => l.trim())
        .filter(Boolean)
        .map((p) => path.basename(p)),
    )
  } catch {
    return null
  }
}

// ── Cek ──────────────────────────────────────────────────────────────────────

function whereOf(row: Row): string {
  if (row.job_slug) return `${row.job_slug} #${row.lesson_no}`
  return `L${row.level_id} "${row.title ?? '(tanpa judul)'}"`
}

/** Cek (1): field wajib per baris dialog & entri glosarium. */
function checkRequiredFields(row: Row): string[] {
  const problems: string[] = []
  if (!row.title?.trim() && !row.job_slug) problems.push('title kosong')
  if (!Array.isArray(row.lines) || row.lines.length === 0) problems.push('tidak ada baris dialog')

  ;(row.lines ?? []).forEach((raw, i) => {
    const line = raw as Record<string, unknown>
    for (const key of ['speaker', 'text', 'reading', 'romaji', 'trans']) {
      if (typeof line[key] !== 'string' || !(line[key] as string).trim()) {
        problems.push(`baris ${i + 1}: bidang "${key}" kosong`)
      }
    }
  })

  ;(row.vocab_highlight ?? []).forEach((raw, i) => {
    const v = raw as Record<string, unknown>
    for (const key of ['word', 'meaning', 'reading']) {
      if (typeof v[key] !== 'string' || !(v[key] as string).trim()) {
        problems.push(`kosakata ${i + 1}: bidang "${key}" kosong`)
      }
    }
  })

  return problems
}

const KANA_ONLY_WORD = /^[぀-ゟ゠-ヿー・〜~\s]+$/
const BARE_ROMAJI = /^[a-zA-Z][a-zA-Z\s'-]*$/
const KANJI_READING = /^[^()]+ · [a-zA-Z][a-zA-Z\s'-]*$/

/**
 * Cek (4): bentuk field `reading` pada glosarium.
 *
 * Standar Fase D (keputusan Day 4, lihat catatan di 040/048_seed_kaiwa*.sql):
 * komponen render (`KaiwaList.tsx`, `app/kaiwa/kerja/[job]/[lesson]/page.tsx`)
 * SUDAH membungkus `reading` dalam kurungnya sendiri — "word (reading) —
 * meaning". Jadi `reading` yang tersimpan TIDAK boleh punya kurung sendiri
 * (itu akan jadi kurung ganda saat dirender):
 *   - kata berkanji: "よみ · romaji" (titik tengah, tanpa kurung)
 *   - kata kana-saja (word tidak punya kanji): cukup "romaji" telanjang
 * Yang DITOLAK: kurung apa pun di dalam `reading`, hiragana polos tanpa
 * romaji, atau romaji telanjang untuk kata yang justru punya kanji (butuh
 * yomi juga).
 */
function checkGlossaryFormat(row: Row): string[] {
  const problems: string[] = []
  ;(row.vocab_highlight ?? []).forEach((raw, i) => {
    const v = raw as Record<string, unknown>
    const word = typeof v.word === 'string' ? v.word.trim() : ''
    const reading = typeof v.reading === 'string' ? v.reading.trim() : ''
    if (!reading) return // sudah ditangkap checkRequiredFields
    if (reading.includes('(') || reading.includes(')')) {
      problems.push(
        `kosakata ${i + 1} "${v.word}": reading masih pakai kurung sendiri, jadi kurung ganda saat dirender ("${reading}")`
      )
      return
    }
    const isKanaOnlyWord = KANA_ONLY_WORD.test(word)
    if (isKanaOnlyWord) {
      if (!BARE_ROMAJI.test(reading)) {
        problems.push(`kosakata ${i + 1} "${v.word}": kata kana-saja seharusnya reading = romaji saja ("${reading}")`)
      }
    } else if (!KANJI_READING.test(reading)) {
      problems.push(`kosakata ${i + 1} "${v.word}": kata berkanji seharusnya reading = "yomi · romaji" ("${reading}")`)
    }
  })
  return problems
}

/** Cek (5): panjang minimal dialog per level (dilewati untuk pelajaran profesi). */
function checkMinLength(row: Row): string[] {
  if (row.job_slug) return []
  const code = LEVEL_CODE[row.level_id]
  if (!code) return [`level_id ${row.level_id} tidak dikenal`]
  const min = MIN_LINES[code]!
  const n = Array.isArray(row.lines) ? row.lines.length : 0
  if (n < min) return [`hanya ${n} baris, minimal ${min} untuk ${code}`]
  return []
}

/** Cek (6): judul ganda dalam level x tema yang sama (antar file migrasi yang dicek). */
function checkDuplicateTitles(rows: Row[]): Finding[] {
  const seen = new Map<string, { row: Row; file: string }[]>()
  for (const { row, file } of rows.map((row) => ({ row, file: (row as Row & { __file: string }).__file }))) {
    if (row.job_slug || !row.title) continue
    const key = `${row.level_id}::${row.category ?? ''}::${row.title.trim()}`
    const list = seen.get(key) ?? []
    list.push({ row, file })
    seen.set(key, list)
  }
  const findings: Finding[] = []
  for (const [key, list] of seen) {
    if (list.length <= 1) continue
    const [, , title] = key.split('::')
    const files = [...new Set(list.map((l) => l.file))]
    findings.push({
      level: 'error',
      check: '6-judul-ganda',
      where: `L${list[0]!.row.level_id} "${title}"`,
      message: `judul dipakai ${list.length}x di file: ${files.join(', ')}`,
    })
  }
  return findings
}

// ── Main ─────────────────────────────────────────────────────────────────────

const files = kaiwaMigrationFiles()
const base = baseRef()
const changed = changedFiles(base)
if (changed === null) {
  console.warn(`[validate:kaiwa] tidak bisa diff terhadap "${base}" — semua file diperlakukan sebagai BARU (ketat).`)
}

const allRows: (Row & { __file: string })[] = []
for (const file of files) {
  const sql = readFileSync(path.join(MIGRATIONS_DIR, file), 'utf8')
  for (const row of parseKaiwaInserts(sql)) allRows.push({ ...row, __file: file })
}

const findings: Finding[] = []
for (const row of allRows) {
  const isNew = changed === null || changed.has(row.__file)
  const level: Finding['level'] = isNew ? 'error' : 'warning'
  for (const p of checkRequiredFields(row)) findings.push({ level, check: '1-field-wajib', where: `${row.__file} ${whereOf(row)}`, message: p })
  for (const p of checkGlossaryFormat(row)) findings.push({ level, check: '4-format-glosarium', where: `${row.__file} ${whereOf(row)}`, message: p })
  for (const p of checkMinLength(row)) findings.push({ level, check: '5-panjang-minimal', where: `${row.__file} ${whereOf(row)}`, message: p })
}
findings.push(...checkDuplicateTitles(allRows))

const errors = findings.filter((f) => f.level === 'error')
const warnings = findings.filter((f) => f.level === 'warning')

console.log(`[validate:kaiwa] ${files.length} file migrasi kaiwa, ${allRows.length} baris data diperiksa.`)
console.log(`[validate:kaiwa] base perbandingan: ${base}${changed === null ? ' (tidak tersedia)' : ''}`)
console.log('[validate:kaiwa] CATATAN: cek (2) hiragana-vs-kanji dan (3) romaji-dari-skrip belum diimplementasikan (butuh tokenizer, lihat komentar berkas ini).')

if (warnings.length > 0) {
  console.log(`\n${warnings.length} warning (data lama, tidak menggagalkan build):`)
  for (const w of warnings) console.log(`  [${w.check}] ${w.where}: ${w.message}`)
}

if (errors.length > 0) {
  console.error(`\n${errors.length} error (data baru/berubah):`)
  for (const e of errors) console.error(`  [${e.check}] ${e.where}: ${e.message}`)
  process.exit(1)
}

console.log('\nValidasi lolos.')
