'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { adminRpc } from '@/lib/admin'

// Validasi di sini hanya untuk pesan yang ramah; pengaman sebenarnya ada di RPC 062
// (admin + 2 langkah, dicek di database).

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
const STATUSES = ['belum', 'ok', 'revisi', 'buang']

function str(form: FormData, key: string): string {
  const v = form.get(key)
  return typeof v === 'string' ? v.trim() : ''
}

/** Kembali ke halaman dengan pesan (?msg=…). */
function back(path: string, msg: string): never {
  redirect(`${path}${path.includes('?') ? '&' : '?'}msg=${encodeURIComponent(msg)}`)
}

export async function updateSoal(form: FormData) {
  const id = str(form, 'id')
  const code = str(form, 'code')
  const path = `/admin/soal/${encodeURIComponent(code)}`
  const question = str(form, 'question')
  const options = ['a', 'b', 'c', 'd'].map((k) => str(form, `option_${k}`))
  const answerIndex = 'ABCD'.indexOf(str(form, 'answer'))
  const status = str(form, 'review_status')

  if (!UUID_RE.test(id)) back(path, 'Soal tidak valid.')
  if (!question) back(path, 'Teks soal tidak boleh kosong.')
  if (options.some((o) => !o)) back(path, 'Keempat opsi wajib diisi.')
  if (new Set(options).size !== 4) back(path, 'Ada opsi yang sama persis.')
  if (answerIndex < 0) back(path, 'Pilih kunci jawaban A–D.')
  if (!STATUSES.includes(status)) back(path, 'Status tidak valid.')

  const { error } = await adminRpc('admin_update_soal', {
    p_id: id,
    p_question: question,
    p_options: options,
    p_answer_index: answerIndex,
    p_explanation: str(form, 'explanation'),
    p_review_status: status,
  })
  if (error) back(path, `Gagal menyimpan: ${error}`)
  revalidatePath('/bank-soal', 'layout')
  revalidatePath('/admin/soal')
  back(path, 'Tersimpan.')
}

export async function resolveReport(form: FormData) {
  const id = Number(str(form, 'id'))
  if (!Number.isInteger(id)) back('/admin/laporan', 'Laporan tidak valid.')
  const { error } = await adminRpc('admin_resolve_report', { p_id: id })
  revalidatePath('/admin/laporan')
  back('/admin/laporan', error ? `Gagal: ${error}` : 'Laporan ditandai selesai.')
}

export async function setRole(form: FormData) {
  const email = str(form, 'email').toLowerCase()
  const role = str(form, 'role')
  if (!EMAIL_RE.test(email) || !['user', 'admin'].includes(role)) back('/admin/pengelola', 'Email tidak valid.')
  const { data, error } = await adminRpc<string>('admin_set_role', { p_email: email, p_role: role })
  revalidatePath('/admin/pengelola')
  if (error) back('/admin/pengelola', `Gagal: ${error}`)
  back('/admin/pengelola', data === 'ok' ? (role === 'admin' ? `${email} sekarang admin.` : `Admin ${email} dicabut.`) : data ?? 'Gagal.')
}

export async function grantAccess(form: FormData) {
  const email = str(form, 'email').toLowerCase()
  const product = str(form, 'product_id')
  const daysRaw = str(form, 'days')
  const days = daysRaw === '' ? null : Number(daysRaw)
  if (!EMAIL_RE.test(email)) back('/admin/akses', 'Email tidak valid.')
  if (days !== null && (!Number.isInteger(days) || days < 1 || days > 3650)) back('/admin/akses', 'Jumlah hari 1–3650, atau kosongkan untuk selamanya.')
  const { data, error } = await adminRpc<string>('admin_grant_access', { p_email: email, p_product_id: product, p_days: days })
  revalidatePath('/admin/akses')
  if (error) back('/admin/akses', `Gagal: ${error}`)
  back('/admin/akses', data === 'ok' ? `Akses dibuka untuk ${email}.` : data ?? 'Gagal.')
}

export async function revokeAccess(form: FormData) {
  const id = str(form, 'id')
  if (!UUID_RE.test(id)) back('/admin/akses', 'Data tidak valid.')
  const { error } = await adminRpc('admin_revoke_access', { p_id: id })
  revalidatePath('/admin/akses')
  back('/admin/akses', error ? `Gagal: ${error}` : 'Akses dicabut.')
}
