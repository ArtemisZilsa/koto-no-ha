'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'
import { PRACTICE_CATEGORIES, type PracticeAnswer } from '@/lib/data/practice'

const LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1']
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
/** Set terbesar 30 soal; beri ruang untuk set campuran (tes penempatan). */
const MAX_ANSWERS = 60

export interface RecordAnswersResult {
  saved: boolean
  error?: string
}

/**
 * Catat jawaban satu set soal latihan ke user_practice_answers.
 * Tanpa login: tidak disimpan (saved:false), drill tetap bisa dipakai.
 */
export async function recordPracticeAnswers(answers: PracticeAnswer[]): Promise<RecordAnswersResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return { saved: false }

  const rows = (Array.isArray(answers) ? answers : [])
    .slice(0, MAX_ANSWERS)
    .filter(
      (a) =>
        a &&
        PRACTICE_CATEGORIES.includes(a.category) &&
        LEVELS.includes(a.level) &&
        typeof a.itemId === 'string' &&
        UUID_RE.test(a.itemId) &&
        typeof a.isCorrect === 'boolean',
    )
    .map((a) => ({
      user_id: user.id,
      category: a.category,
      level: a.level,
      item_id: a.itemId,
      is_correct: a.isCorrect,
    }))

  if (rows.length === 0) return { saved: false, error: 'Tidak ada jawaban yang valid.' }

  // Cast sempit (pola yang sama dengan flashcard.ts): tipe Database
  // hand-maintained tanpa Relationships membuat inferensi insert jadi `never[]`.
  const db = supabase as unknown as {
    from(table: 'user_practice_answers'): {
      insert(values: Record<string, unknown>[]): PromiseLike<{ error: { message: string } | null }>
    }
  }
  const { error } = await db.from('user_practice_answers').insert(rows)
  if (error) {
    console.error('recordPracticeAnswers error', error)
    return { saved: false, error: 'Gagal menyimpan progres. Coba lagi.' }
  }

  // Progress bar di dashboard & daftar set langsung ikut terbarui.
  revalidatePath('/dashboard')
  revalidatePath('/latihan', 'layout')
  return { saved: true }
}
