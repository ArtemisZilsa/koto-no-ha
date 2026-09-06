/**
 * Generator audio kaiwa — Text-to-Speech ElevenLabs → Supabase Storage.
 *
 * Skrip authoring, dijalankan manual. BUKAN bagian dari `next build`.
 *
 * Cara pakai — lewat npm script (paling gampang):
 *
 *   # 1. Selalu mulai dari sini: hitung biaya, tidak membuat apa pun.
 *   npm run audio:dry
 *
 *   # 2. Coba satu dialog dulu, lalu DENGARKAN hasilnya sebelum borongan.
 *   npm run audio -- --story <uuid>
 *
 *   # 3. Baru semuanya.
 *   npm run audio
 *
 * Di balik layar: `node --env-file=.env.local tools/generate-kaiwa-audio.mts`.
 * Flag `--disable-warning` hanya mematikan peringatan "TYPELESS_PACKAGE_JSON"
 * dari Node saat membaca file .ts — jangan tambahkan "type":"module" ke
 * package.json untuk mematikannya, itu akan merusak build Next.
 *
 * Flag lain:
 *   --force   buat ulang walau baris itu sudah punya audio
 *   --limit N proses maksimal N dialog
 *
 * Idempoten: baris yang sudah punya `audio` dilewati, jadi menjalankan ulang
 * setelah gagal di tengah tidak menambah biaya.
 */

import { createClient } from '@supabase/supabase-js'
import { ElevenLabsClient } from '@elevenlabs/elevenlabs-js'
import { KAIWA_AUDIO_BUCKET, kaiwaAudioPath } from '../lib/data/kaiwaAudio.ts'

// ── Konstanta ────────────────────────────────────────────────────────────────

/**
 * eleven_multilingual_v2 mendukung bahasa Jepang dan harganya sama dengan
 * eleven_v3. Jangan pakai eleven_flash_v2_5 — lebih murah, tapi TIDAK
 * mendukung bahasa Jepang.
 */
const MODEL_ID = 'eleven_multilingual_v2'
const OUTPUT_FORMAT = 'mp3_44100_128'

/** Tarif ElevenLabs: $0,10 per 1.000 karakter untuk multilingual_v2. */
const USD_PER_1K_CHARS = 0.1

/** Jeda antar permintaan, supaya tidak menabrak batas konkurensi paket. */
const REQUEST_SPACING_MS = 250

// ── Tipe minimal (skrip ini tidak ikut alias path Next) ──────────────────────

type Line = {
  speaker: string
  text: string
  reading?: string
  romaji?: string
  trans: string
  audio?: string
}

type Story = {
  id: string
  title: string
  level_id: number
  lines: Line[]
}

// ── Argumen ──────────────────────────────────────────────────────────────────

const args = process.argv.slice(2)
const isDryRun = args.includes('--dry-run')
const force = args.includes('--force')
const storyId = argValue('--story')
const limit = Number(argValue('--limit') ?? '0') || 0

function argValue(flag: string): string | undefined {
  const i = args.indexOf(flag)
  return i === -1 ? undefined : args[i + 1]
}

function requireEnv(name: string): string {
  const value = process.env[name]
  if (!value) {
    console.error(`✗ ${name} belum diisi. Lihat .env.local`)
    process.exit(1)
  }
  return value
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms))

// ── Suara ────────────────────────────────────────────────────────────────────

/**
 * Pembicara pertama dapat suara A, kedua dapat suara B, sisanya bergantian —
 * supaya dialog terdengar seperti percakapan, bukan satu orang baca naskah.
 */
function voiceForSpeaker(speaker: string, order: string[], voices: string[]): string {
  const index = order.indexOf(speaker)
  return voices[(index === -1 ? 0 : index) % voices.length]!
}

function speakerOrder(lines: Line[]): string[] {
  const seen: string[] = []
  for (const line of lines) {
    if (!seen.includes(line.speaker)) seen.push(line.speaker)
  }
  return seen
}

// ── Utama ────────────────────────────────────────────────────────────────────

async function main() {
  const supabaseUrl = requireEnv('NEXT_PUBLIC_SUPABASE_URL')
  const serviceKey = requireEnv('SUPABASE_SERVICE_ROLE_KEY')

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { persistSession: false },
  })

  // Ambil dialog.
  let query = supabase.from('kaiwa_stories').select('id, title, level_id, lines').order('title')
  if (storyId) query = query.eq('id', storyId)

  const { data, error } = await query
  if (error) {
    console.error('✗ Gagal membaca kaiwa_stories:', error.message)
    process.exit(1)
  }

  let stories = (data ?? []) as Story[]
  if (limit > 0) stories = stories.slice(0, limit)

  if (stories.length === 0) {
    console.error('✗ Tidak ada dialog yang cocok.')
    process.exit(1)
  }

  // Susun daftar kerja.
  type Job = { story: Story; lineIndex: number; line: Line }
  const jobs: Job[] = []
  for (const story of stories) {
    story.lines.forEach((line, lineIndex) => {
      if (!force && line.audio) return
      if (!line.text?.trim()) return
      jobs.push({ story, lineIndex, line })
    })
  }

  const totalChars = jobs.reduce((sum, j) => sum + j.line.text.length, 0)
  const estimatedUsd = (totalChars / 1000) * USD_PER_1K_CHARS

  console.log('─'.repeat(62))
  console.log(`Dialog          : ${stories.length}`)
  console.log(`Baris to-do     : ${jobs.length}${force ? ' (--force: buat ulang semua)' : ''}`)
  console.log(`Total karakter  : ${totalChars.toLocaleString('id-ID')}`)
  console.log(`Perkiraan biaya : $${estimatedUsd.toFixed(2)}  (${MODEL_ID}, $${USD_PER_1K_CHARS}/1k char)`)
  console.log('─'.repeat(62))

  if (jobs.length === 0) {
    console.log('✓ Semua baris sudah punya audio. Tidak ada yang dikerjakan.')
    return
  }

  if (isDryRun) {
    console.log('DRY RUN — tidak ada yang dibuat, tidak ada biaya.')
    return
  }

  const elevenlabs = new ElevenLabsClient({ apiKey: requireEnv('ELEVENLABS_API_KEY') })
  const voices = [requireEnv('ELEVENLABS_VOICE_A'), requireEnv('ELEVENLABS_VOICE_B')]

  let done = 0
  let failed = 0

  // Satu dialog sekaligus: hasilnya ditulis balik sekali per dialog,
  // jadi kalau berhenti di tengah, dialog yang sudah kelar tetap tersimpan.
  for (const story of stories) {
    const storyJobs = jobs.filter((j) => j.story.id === story.id)
    if (storyJobs.length === 0) continue

    const order = speakerOrder(story.lines)
    const updatedLines = [...story.lines]
    let storyChanged = false

    for (const job of storyJobs) {
      const label = `[${story.title}] baris ${job.lineIndex + 1}/${story.lines.length}`
      try {
        const voiceId = voiceForSpeaker(job.line.speaker, order, voices)

        const stream = await elevenlabs.textToSpeech.convert(voiceId, {
          text: job.line.text,
          modelId: MODEL_ID,
          outputFormat: OUTPUT_FORMAT,
        })

        const audioBuffer = await streamToBuffer(stream)
        const path = kaiwaAudioPath(story.id, job.lineIndex)

        const { error: uploadError } = await supabase.storage
          .from(KAIWA_AUDIO_BUCKET)
          .upload(path, audioBuffer, { contentType: 'audio/mpeg', upsert: true })

        if (uploadError) throw new Error(`upload gagal: ${uploadError.message}`)

        // Simpan PATH, bukan URL penuh — biar data tidak terikat project ref.
        updatedLines[job.lineIndex] = { ...job.line, audio: path }
        storyChanged = true
        done++
        console.log(`  ✓ ${label}  (${job.line.text.length} char, ${(audioBuffer.length / 1024).toFixed(0)} KB)`)
      } catch (err) {
        failed++
        console.error(`  ✗ ${label}: ${err instanceof Error ? err.message : String(err)}`)
      }

      await sleep(REQUEST_SPACING_MS)
    }

    if (storyChanged) {
      const { error: updateError } = await supabase
        .from('kaiwa_stories')
        .update({ lines: updatedLines })
        .eq('id', story.id)

      if (updateError) {
        console.error(`  ✗ Gagal menyimpan lines untuk "${story.title}": ${updateError.message}`)
        failed += storyJobs.length
      }
    }
  }

  console.log('─'.repeat(62))
  console.log(`Selesai. Berhasil: ${done}, gagal: ${failed}.`)
  if (failed > 0) {
    console.log('Jalankan ulang untuk mencoba lagi yang gagal — yang sudah jadi akan dilewati.')
    process.exitCode = 1
  }
}

async function streamToBuffer(stream: ReadableStream<Uint8Array>): Promise<Buffer> {
  const reader = stream.getReader()
  const chunks: Uint8Array[] = []
  for (;;) {
    const { done, value } = await reader.read()
    if (done) break
    if (value) chunks.push(value)
  }
  return Buffer.concat(chunks)
}

main().catch((err) => {
  console.error('✗ Gagal:', err instanceof Error ? err.message : err)
  process.exit(1)
})
