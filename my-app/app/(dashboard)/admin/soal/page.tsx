import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Flash, btnCls, btnStyle, inputCls, inputStyle } from '@/components/admin/ui'

const PAGE = 50
const STATUS_LABEL: Record<string, string> = { belum: 'Belum', ok: 'OK', revisi: 'Revisi', buang: 'Buang' }

type SP = { q?: string; kategori?: string; status?: string; hal?: string; msg?: string }

export default async function AdminSoalPage({ searchParams }: { searchParams: Promise<SP> }) {
  const sp = await searchParams
  // Karakter khusus filter PostgREST dibuang agar pencarian tidak bisa membentuk filter lain.
  const q = (sp.q ?? '').replace(/[,()%*\\]/g, ' ').trim().slice(0, 80)
  const page = Math.max(1, Number(sp.hal) || 1)

  const supabase = await createClient()
  let query = supabase
    .from('bank_soal')
    .select('id, code, category, qtype, group_label, mode, question, review_status, edited_at', { count: 'exact' })
  if (q) query = query.or(`code.ilike.%${q}%,question.ilike.%${q}%,group_label.ilike.%${q}%`)
  if (sp.kategori === 'tata_bahasa' || sp.kategori === 'kanji') query = query.eq('category', sp.kategori)
  if (sp.status && STATUS_LABEL[sp.status]) query = query.eq('review_status', sp.status)
  const { data, count } = await query.order('code').range((page - 1) * PAGE, page * PAGE - 1)
  const rows = (data ?? []) as unknown as Array<{
    id: string; code: string; category: string; qtype: string; group_label: string; mode: string
    question: string; review_status: string; edited_at: string | null
  }>
  const pages = Math.max(1, Math.ceil((count ?? 0) / PAGE))
  const link = (p: number) => {
    const params = new URLSearchParams({ hal: String(p) })
    if (q) params.set('q', q)
    if (sp.kategori) params.set('kategori', sp.kategori)
    if (sp.status) params.set('status', sp.status)
    return `/admin/soal?${params}`
  }

  return (
    <>
      <h1 className="font-serif text-[24px] font-semibold mb-4" style={{ color: 'var(--text)' }}>Edit soal</h1>
      <Flash msg={sp.msg} />
      <form className="grid grid-cols-1 sm:grid-cols-[1fr_auto_auto_auto] gap-2 mb-6">
        <input name="q" defaultValue={q} placeholder="Cari kode (G5-001-01), teks soal, atau pola…" className={inputCls} style={inputStyle} />
        <select name="kategori" defaultValue={sp.kategori ?? ''} className={inputCls} style={inputStyle}>
          <option value="">Semua kategori</option>
          <option value="tata_bahasa">Tata Bahasa</option>
          <option value="kanji">Kanji</option>
        </select>
        <select name="status" defaultValue={sp.status ?? ''} className={inputCls} style={inputStyle}>
          <option value="">Semua status</option>
          {Object.entries(STATUS_LABEL).map(([v, l]) => <option key={v} value={v}>{l}</option>)}
        </select>
        <button className={btnCls} style={btnStyle}>Cari</button>
      </form>

      <p className="text-[12.5px] mb-3" style={{ color: 'var(--muted)' }}>{count ?? 0} soal · halaman {page}/{pages}</p>
      <div className="overflow-x-auto">
        <table className="w-full text-[13px]">
          <thead>
            <tr className="text-left" style={{ color: 'var(--muted)', borderBottom: '1px solid var(--brand-line)' }}>
              <th className="py-2 pr-3">Kode</th>
              <th className="py-2 pr-3">Soal</th>
              <th className="py-2 pr-3">Pola / tema</th>
              <th className="py-2 pr-3">Status</th>
            </tr>
          </thead>
          <tbody>
            {rows.map((r) => (
              <tr key={r.id} style={{ borderBottom: '1px solid var(--brand-line)' }}>
                <td className="py-2 pr-3 whitespace-nowrap">
                  <Link href={`/admin/soal/${encodeURIComponent(r.code)}`} style={{ color: 'var(--crimson)' }}>{r.code}</Link>
                </td>
                <td lang="ja" className="py-2 pr-3" style={{ color: 'var(--text)' }}>{r.question.replace(/\n/g, ' · ').slice(0, 70)}</td>
                <td lang="ja" className="py-2 pr-3" style={{ color: 'var(--muted)' }}>{r.group_label}</td>
                <td className="py-2 pr-3 whitespace-nowrap" style={{ color: r.review_status === 'buang' ? 'var(--crimson)' : 'var(--muted)' }}>
                  {STATUS_LABEL[r.review_status]}{r.edited_at ? ' · diedit' : ''}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <div className="flex gap-3 mt-5 text-[13px]">
        {page > 1 && <Link href={link(page - 1)}>← Sebelumnya</Link>}
        {page < pages && <Link href={link(page + 1)}>Berikutnya →</Link>}
      </div>
    </>
  )
}
