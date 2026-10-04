'use server'

import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
/** Sesi terbesar: checkpoint 45 soal; beri ruang. */
const MAX_ANSWERS = 100

export interface BankAnswer {
  soalId: string
  isCorrect: boolean
}

export interface ActionResult {
  saved: boolean
  error?: string
}

// Cast sempit (pola sama dengan practice.ts): tipe Database hand-maintained.
type InsertDb = {
  from(table: 'user_bank_answers' | 'bank_soal_reports'): {
    insert(values: Record<string, unknown>[] | Record<string, unknown>): PromiseLike<{ error: { message: string } | null }>
  }
}

/** Catat jawaban satu sesi bank soal. RLS memastikan user hanya menulis miliknya. */
export async function recordBankAnswers(answers: BankAnswer[]): Promise<ActionResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return { saved: false, error: 'Masuk dulu untuk menyimpan progres.' }

  const rows = (Array.isArray(answers) ? answers : [])
    .slice(0, MAX_ANSWERS)
    .filter((a) => a && typeof a.soalId === 'string' && UUID_RE.test(a.soalId) && typeof a.isCorrect === 'boolean')
    .map((a) => ({ user_id: user.id, soal_id: a.soalId, is_correct: a.isCorrect }))
  if (rows.length === 0) return { saved: false, error: 'Tidak ada jawaban yang valid.' }

  const { error } = await (supabase as unknown as InsertDb).from('user_bank_answers').insert(rows)
  if (error) {
    console.error('recordBankAnswers error', error)
    return { saved: false, error: 'Gagal menyimpan progres. Coba lagi.' }
  }
  revalidatePath('/bank-soal')
  return { saved: true }
}

/** Tombol "Laporkan soal" (fase Beta). RLS: hanya pelanggan aktif. */
export async function reportBankSoal(soalId: string, note: string): Promise<ActionResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user || typeof soalId !== 'string' || !UUID_RE.test(soalId)) return { saved: false, error: 'Laporan tidak valid.' }

  const clean = typeof note === 'string' ? note.trim().slice(0, 500) : ''
  const { error } = await (supabase as unknown as InsertDb)
    .from('bank_soal_reports')
    .insert({ user_id: user.id, soal_id: soalId, note: clean || null })
  if (error) {
    console.error('reportBankSoal error', error)
    return { saved: false, error: 'Gagal mengirim laporan. Coba lagi.' }
  }
  return { saved: true }
}
