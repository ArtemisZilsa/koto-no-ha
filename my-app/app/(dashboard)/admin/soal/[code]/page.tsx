import Link from 'next/link'
import { notFound } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { updateSoal } from '@/app/actions/admin'
import { Flash, btnCls, btnStyle, fmtDate, inputCls, inputStyle } from '@/components/admin/ui'

export default async function AdminSoalEdit({
  params,
  searchParams,
}: {
  params: Promise<{ code: string }>
  searchParams: Promise<{ msg?: string }>
}) {
  const [{ code }, { msg }] = await Promise.all([params, searchParams])
  const supabase = await createClient()
  const { data } = await supabase.from('bank_soal').select('*').eq('code', decodeURIComponent(code)).maybeSingle()
  if (!data) notFound()
  const s = data as unknown as {
    id: string; code: string; category: string; qtype: string; group_label: string; mode: string
    question: string; options: string[]; answer_index: number; explanation: string | null
    distractor_basis: string | null; review_status: string; edited_at: string | null
  }

  return (
    <>
      <Link href="/admin/soal" className="text-[12.5px] no-underline" style={{ color: 'var(--muted)' }}>← Daftar soal</Link>
      <h1 className="font-serif text-[24px] font-semibold mt-2 mb-1" style={{ color: 'var(--text)' }}>{s.code}</h1>
      <p lang="ja" className="text-[13px] mb-6" style={{ color: 'var(--muted)' }}>
        {s.category === 'kanji' ? 'Kanji' : 'Tata Bahasa'} · {s.qtype} · {s.group_label} · mode {s.mode}
        {s.edited_at && ` · terakhir diedit ${fmtDate(s.edited_at)}`}
      </p>
      <Flash msg={msg} />

      <form action={updateSoal} className="flex flex-col gap-4 max-w-2xl">
        <input type="hidden" name="id" value={s.id} />
        <input type="hidden" name="code" value={s.code} />
        <label className="text-[13px] font-medium" style={{ color: 'var(--text)' }}>
          Soal
          <textarea name="question" defaultValue={s.question} rows={3} lang="ja" className={`${inputCls} mt-1`} style={inputStyle} required />
        </label>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          {s.options.map((o, i) => (
            <label key={i} className="text-[13px] font-medium" style={{ color: 'var(--text)' }}>
              Opsi {'ABCD'[i]}
              <input name={`option_${'abcd'[i]}`} defaultValue={o} lang="ja" className={`${inputCls} mt-1`} style={inputStyle} required />
            </label>
          ))}
        </div>
        <div className="grid grid-cols-2 gap-3">
          <label className="text-[13px] font-medium" style={{ color: 'var(--text)' }}>
            Kunci jawaban
            <select name="answer" defaultValue={'ABCD'[s.answer_index]} className={`${inputCls} mt-1`} style={inputStyle}>
              {['A', 'B', 'C', 'D'].map((k) => <option key={k}>{k}</option>)}
            </select>
          </label>
          <label className="text-[13px] font-medium" style={{ color: 'var(--text)' }}>
            Status review
            <select name="review_status" defaultValue={s.review_status} className={`${inputCls} mt-1`} style={inputStyle}>
              <option value="belum">Belum</option>
              <option value="ok">OK</option>
              <option value="revisi">Revisi</option>
              <option value="buang">Buang (sembunyikan dari pelanggan)</option>
            </select>
          </label>
        </div>
        <label className="text-[13px] font-medium" style={{ color: 'var(--text)' }}>
          Penjelasan
          <textarea name="explanation" defaultValue={s.explanation ?? ''} rows={4} className={`${inputCls} mt-1`} style={inputStyle} />
        </label>
        {s.distractor_basis && (
          <p className="text-[12.5px]" style={{ color: 'var(--muted)' }}>Basis distraktor: {s.distractor_basis}</p>
        )}
        <div>
          <button className={btnCls} style={btnStyle}>Simpan</button>
        </div>
        <p className="text-[12px]" style={{ color: 'var(--muted)' }}>
          Soal yang sudah diedit di sini tidak akan ditimpa saat import ulang dari Excel.
        </p>
      </form>
    </>
  )
}
