import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { resolveReport } from '@/app/actions/admin'
import { Flash, btnCls, btnGhostStyle, fmtDate } from '@/components/admin/ui'

export default async function AdminLaporanPage({ searchParams }: { searchParams: Promise<{ msg?: string; semua?: string }> }) {
  const { msg, semua } = await searchParams
  const supabase = await createClient()
  let query = supabase.from('bank_soal_reports').select('id, note, created_at, resolved_at, bank_soal(code, question)')
  if (!semua) query = query.is('resolved_at', null)
  const { data } = await query.order('created_at', { ascending: false }).limit(200)
  const rows = (data ?? []) as unknown as Array<{
    id: number; note: string | null; created_at: string; resolved_at: string | null
    bank_soal: { code: string; question: string } | null
  }>

  return (
    <>
      <h1 className="font-serif text-[24px] font-semibold mb-1" style={{ color: 'var(--text)' }}>Laporan soal</h1>
      <p className="text-[13px] mb-6" style={{ color: 'var(--muted)' }}>
        {semua ? 'Semua laporan.' : 'Laporan yang belum ditangani.'}{' '}
        <Link href={semua ? '/admin/laporan' : '/admin/laporan?semua=1'}>{semua ? 'Hanya yang belum' : 'Tampilkan semua'}</Link>
      </p>
      <Flash msg={msg} />
      {rows.length === 0 && <p className="text-[14px]" style={{ color: 'var(--muted)' }}>Tidak ada laporan.</p>}
      <ul className="flex flex-col gap-3">
        {rows.map((r) => (
          <li key={r.id} className="rounded-xl p-4" style={{ border: '1px solid var(--brand-line)', background: 'var(--surface)' }}>
            <div className="flex flex-wrap items-baseline justify-between gap-2 mb-1">
              {r.bank_soal ? (
                <Link href={`/admin/soal/${encodeURIComponent(r.bank_soal.code)}`} className="text-[14px] font-semibold" style={{ color: 'var(--crimson)' }}>
                  {r.bank_soal.code} → perbaiki
                </Link>
              ) : (
                <span>Soal sudah dihapus</span>
              )}
              <span className="text-[12px]" style={{ color: 'var(--muted)' }}>{fmtDate(r.created_at)}</span>
            </div>
            {r.bank_soal && (
              <p lang="ja" className="text-[13px] mb-1" style={{ color: 'var(--muted)' }}>{r.bank_soal.question.replace(/\n/g, ' · ')}</p>
            )}
            <p className="text-[14px] mb-3" style={{ color: 'var(--text)' }}>{r.note || <i>(tanpa catatan)</i>}</p>
            {r.resolved_at ? (
              <p className="text-[12.5px]" style={{ color: 'var(--green)' }}>Selesai {fmtDate(r.resolved_at)}</p>
            ) : (
              <form action={resolveReport}>
                <input type="hidden" name="id" value={r.id} />
                <button className={btnCls} style={btnGhostStyle}>Tandai selesai</button>
              </form>
            )}
          </li>
        ))}
      </ul>
    </>
  )
}
