import type { KaiwaLine, KaiwaStory } from '@/lib/types/database.types'

/** Bucket Supabase Storage tempat audio kaiwa disimpan. */
export const KAIWA_AUDIO_BUCKET = 'kaiwa-audio'

/**
 * Path objek audio untuk satu baris dialog.
 * Dipakai bersama oleh skrip generator dan pembaca, supaya susunannya
 * tidak pernah beda antara yang menulis dan yang membaca.
 */
export function kaiwaAudioPath(storyId: string, lineIndex: number): string {
  return `kaiwa/${storyId}/${String(lineIndex).padStart(3, '0')}.mp3`
}

/**
 * Ubah path storage menjadi URL publik.
 *
 * Yang disimpan di `lines[].audio` adalah path, bukan URL penuh — supaya data
 * di Supabase tidak terikat ke satu project ref. URL-nya dirakit di sini saat
 * dibaca. Kalau nilainya sudah berupa URL penuh (data lama), biarkan apa adanya.
 */
export function toPublicAudioUrl(path: string | undefined): string | undefined {
  if (!path) return undefined
  if (path.startsWith('http://') || path.startsWith('https://')) return path

  const base = process.env.NEXT_PUBLIC_SUPABASE_URL
  if (!base) return undefined

  return `${base.replace(/\/$/, '')}/storage/v1/object/public/${KAIWA_AUDIO_BUCKET}/${path}`
}

/** Salin story dengan setiap `lines[].audio` sudah jadi URL publik siap putar. */
export function withResolvedAudio(story: KaiwaStory): KaiwaStory {
  const lines: KaiwaLine[] = story.lines.map((line) => ({
    ...line,
    audio: toPublicAudioUrl(line.audio),
  }))
  return { ...story, lines }
}
