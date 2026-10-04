import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import MfaGate from '@/components/admin/MfaGate'
import { getAdminState } from '@/lib/admin'

export const metadata: Metadata = {
  title: 'Admin | Koto no Ha',
  robots: { index: false, follow: false },
}

const TABS = [
  { href: '/admin/soal', label: 'Soal' },
  { href: '/admin/laporan', label: 'Laporan' },
  { href: '/admin/akses', label: 'Akses pelanggan' },
  { href: '/admin/pengelola', label: 'Admin' },
]

// Login dicek (dashboard)/layout.tsx. Bukan admin → 404 (halaman ini tidak "ada" bagi user biasa).
// Admin tanpa 2 langkah → layar verifikasi; database juga menolak tulisan tanpa aal2 (062).
export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const state = await getAdminState()
  if (!state.isAdmin) notFound()
  if (!state.aal2) return <MfaGate hasFactor={state.hasFactor} />

  return (
    <div className="px-5 md:px-12 py-10 max-w-5xl mx-auto">
      <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--crimson)' }}>管理 · Admin</p>
      <nav className="flex flex-wrap gap-2 mb-8">
        {TABS.map((t) => (
          <Link
            key={t.href}
            href={t.href}
            className="rounded-lg px-3.5 py-1.5 text-[13px] no-underline hover:border-[var(--crimson)]"
            style={{ border: '1px solid var(--brand-line)', color: 'var(--text)' }}
          >
            {t.label}
          </Link>
        ))}
      </nav>
      {children}
    </div>
  )
}
