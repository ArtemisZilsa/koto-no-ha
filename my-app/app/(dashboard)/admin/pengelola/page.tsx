import { adminRpc } from '@/lib/admin'
import { setRole } from '@/app/actions/admin'
import { Flash, btnCls, btnGhostStyle, btnStyle, inputCls, inputStyle } from '@/components/admin/ui'

export default async function AdminPengelolaPage({ searchParams }: { searchParams: Promise<{ msg?: string }> }) {
  const { msg } = await searchParams
  const { data: admins } = await adminRpc<{ user_id: string; email: string }[]>('admin_list_admins')

  return (
    <>
      <h1 className="font-serif text-[24px] font-semibold mb-1" style={{ color: 'var(--text)' }}>Admin</h1>
      <p className="text-[13px] mb-6" style={{ color: 'var(--muted)' }}>
        Admin bisa mengedit soal, membuka akses, dan menambah admin lain. Setiap admin wajib memasang verifikasi 2 langkah saat pertama masuk.
      </p>
      <Flash msg={msg} />

      <form action={setRole} className="flex flex-wrap gap-2 mb-10 max-w-xl">
        <input type="hidden" name="role" value="admin" />
        <input name="email" type="email" required placeholder="email yang sudah terdaftar" className={`${inputCls} flex-1 min-w-[220px]`} style={inputStyle} />
        <button className={btnCls} style={btnStyle}>Jadikan admin</button>
      </form>

      <ul className="flex flex-col gap-2 max-w-xl">
        {(admins ?? []).map((a) => (
          <li key={a.user_id} className="flex items-center justify-between gap-3 rounded-lg px-4 py-2.5" style={{ border: '1px solid var(--brand-line)' }}>
            <span className="text-[14px]" style={{ color: 'var(--text)' }}>{a.email}</span>
            <form action={setRole}>
              <input type="hidden" name="role" value="user" />
              <input type="hidden" name="email" value={a.email} />
              <button className={btnCls} style={btnGhostStyle}>Cabut admin</button>
            </form>
          </li>
        ))}
      </ul>
    </>
  )
}
