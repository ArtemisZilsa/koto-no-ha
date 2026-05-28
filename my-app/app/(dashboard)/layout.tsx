import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import { logout } from '@/app/actions/auth'

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    redirect('/login')
  }

  return (
    <div className="min-h-screen" style={{ background: 'var(--paper)' }}>
      {/* Dashboard Nav */}
      <header
        className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-8 h-[60px]"
        style={{
          background: 'rgba(247,242,234,0.95)',
          backdropFilter: 'blur(14px)',
          borderBottom: '0.5px solid rgba(13,13,18,0.1)',
        }}
      >
        <Link href="/" className="flex items-center gap-2 no-underline">
          <span className="font-serif text-xl font-semibold text-ink">言の葉</span>
          <span className="text-[10px] text-muted tracking-widest uppercase">Koto no Ha</span>
        </Link>

        <nav className="flex items-center gap-6">
          <Link href="/dashboard" className="text-[13px] text-muted hover:text-ink transition-colors no-underline">
            Dashboard
          </Link>
          <div className="flex items-center gap-1">
            {[
              { label: 'N5', href: '/learn/n5' },
              { label: 'N4', href: '/learn/n4' },
              { label: 'N3', href: '/learn/n3' },
            ].map(({ label, href }) => (
              <Link
                key={label}
                href={href}
                className="text-[12px] px-2.5 py-1 rounded-lg text-muted hover:text-ink hover:bg-paper-dark transition-all no-underline"
              >
                {label}
              </Link>
            ))}
          </div>
          <span className="text-[12px] text-muted">{user.email}</span>
          <form action={logout}>
            <button
              type="submit"
              className="text-[12px] px-3 py-1.5 rounded-lg border text-muted hover:bg-paper-dark transition-colors"
              style={{ borderColor: 'rgba(13,13,18,0.1)' }}
            >
              Keluar
            </button>
          </form>
        </nav>
      </header>

      {/* Content */}
      <div className="pt-[60px]">{children}</div>
    </div>
  )
}
