import { adminRpc } from '@/lib/admin'
import { grantAccess, revokeAccess } from '@/app/actions/admin'
import { Flash, btnCls, btnGhostStyle, btnStyle, fmtDate, inputCls, inputStyle } from '@/components/admin/ui'

interface AccessRow {
  id: string; email: string; product_id: string; source: string
  starts_at: string; expires_at: string | null; revoked_at: string | null; active: boolean
}

// ponytail: satu produk (video-bulanan, membuka bank soal). Tambah pilihan produk saat PDF (T6) aktif.
const PRODUCTS = [{ id: 'video-bulanan', title: 'Video Kelas + Bank Soal' }]

export default async function AdminAksesPage({ searchParams }: { searchParams: Promise<{ msg?: string }> }) {
  const { msg } = await searchParams
  const { data: rows } = await adminRpc<AccessRow[]>('admin_list_access')

  return (
    <>
      <h1 className="font-serif text-[24px] font-semibold mb-1" style={{ color: 'var(--text)' }}>Akses pelanggan</h1>
      <p className="text-[13px] mb-6" style={{ color: 'var(--muted)' }}>
        Buka akses manual (misalnya bayar transfer atau tester). Orangnya harus sudah daftar di website.
      </p>
      <Flash msg={msg} />

      <form action={grantAccess} className="grid grid-cols-1 sm:grid-cols-[2fr_1.5fr_1fr_auto] gap-2 mb-10 items-end">
        <label className="text-[12.5px]" style={{ color: 'var(--muted)' }}>
          Email
          <input name="email" type="email" required placeholder="nama@gmail.com" className={`${inputCls} mt-1`} style={inputStyle} />
        </label>
        <label className="text-[12.5px]" style={{ color: 'var(--muted)' }}>
          Produk
          <select name="product_id" className={`${inputCls} mt-1`} style={inputStyle}>
            {PRODUCTS.map((p) => <option key={p.id} value={p.id}>{p.title}</option>)}
          </select>
        </label>
        <label className="text-[12.5px]" style={{ color: 'var(--muted)' }}>
          Lama (hari)
          <input name="days" type="number" min={1} max={3650} defaultValue={30} placeholder="kosong = selamanya" className={`${inputCls} mt-1`} style={inputStyle} />
        </label>
        <button className={btnCls} style={btnStyle}>Buka akses</button>
      </form>

      <div className="overflow-x-auto">
        <table className="w-full text-[13px]">
          <thead>
            <tr className="text-left" style={{ color: 'var(--muted)', borderBottom: '1px solid var(--brand-line)' }}>
              <th className="py-2 pr-3">Email</th>
              <th className="py-2 pr-3">Produk</th>
              <th className="py-2 pr-3">Sumber</th>
              <th className="py-2 pr-3">Berlaku sampai</th>
              <th className="py-2 pr-3">Status</th>
              <th />
            </tr>
          </thead>
          <tbody>
            {(rows ?? []).map((r) => (
              <tr key={r.id} style={{ borderBottom: '1px solid var(--brand-line)' }}>
                <td className="py-2 pr-3" style={{ color: 'var(--text)' }}>{r.email}</td>
                <td className="py-2 pr-3">{r.product_id}</td>
                <td className="py-2 pr-3">{r.source === 'admin' ? 'Manual' : 'Pembelian'}</td>
                <td className="py-2 pr-3 whitespace-nowrap">{r.expires_at ? fmtDate(r.expires_at) : 'Selamanya'}</td>
                <td className="py-2 pr-3" style={{ color: r.active ? 'var(--green)' : 'var(--muted)' }}>
                  {r.revoked_at ? 'Dicabut' : r.active ? 'Aktif' : 'Habis'}
                </td>
                <td className="py-2">
                  {r.active && (
                    <form action={revokeAccess}>
                      <input type="hidden" name="id" value={r.id} />
                      <button className={btnCls} style={btnGhostStyle}>Cabut</button>
                    </form>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {(rows ?? []).length === 0 && <p className="text-[14px] mt-4" style={{ color: 'var(--muted)' }}>Belum ada akses.</p>}
      </div>
    </>
  )
}
