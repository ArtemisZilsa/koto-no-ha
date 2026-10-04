// Potongan UI kecil yang dipakai bersama halaman /admin.

export function Flash({ msg }: { msg?: string }) {
  if (!msg) return null
  const bad = /gagal|tidak|belum|salah/i.test(msg)
  return (
    <p
      role="status"
      className="text-[13.5px] rounded-lg px-4 py-2.5 mb-6"
      style={{ background: bad ? 'var(--red-bg)' : 'var(--green-bg)', color: bad ? 'var(--crimson)' : 'var(--green)' }}
    >
      {msg}
    </p>
  )
}

export const inputCls = 'rounded-lg px-3 py-2 text-[14px] w-full'
export const inputStyle: React.CSSProperties = { border: '1px solid var(--brand-line)', background: 'var(--surface)', color: 'var(--text)' }
export const btnCls = 'rounded-lg px-4 py-2 text-[13.5px] font-medium cursor-pointer hover:opacity-90'
export const btnStyle: React.CSSProperties = { background: 'var(--crimson)', color: '#FAFAFA' }
export const btnGhostStyle: React.CSSProperties = { border: '1px solid var(--brand-line)', color: 'var(--text)', background: 'transparent' }

export function fmtDate(iso: string | null): string {
  if (!iso) return '—'
  return new Date(iso).toLocaleString('id-ID', { dateStyle: 'medium', timeStyle: 'short', timeZone: 'Asia/Jakarta' })
}
