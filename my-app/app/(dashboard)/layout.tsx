import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import { logout } from '@/app/actions/auth'
import ThemeToggle from '@/components/theme/ThemeToggle'
import AnimationToggle from '@/components/theme/AnimationToggle'

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
        className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between gap-2 px-4 md:px-8 h-[60px]"
        style={{
          background: 'color-mix(in srgb, var(--paper) 92%, transparent)',
          backdropFilter: 'blur(14px)',
          WebkitBackdropFilter: 'blur(14px)',
          borderBottom: '0.5px solid var(--border)',
        }}
      >
        <Link href="/" className="flex items-center gap-2 no-underline shrink-0">
          <span className="font-serif text-xl font-semibold" style={{ color: 'var(--ink)' }}>言の葉</span>
          <span className="text-[10px] tracking-widest uppercase hidden sm:inline" style={{ color: 'var(--muted)' }}>Koto no Ha</span>
        </Link>

        <nav className="flex items-center gap-2.5 md:gap-5 overflow-x-auto">
          <Link
            href="/dashboard"
            className="text-[13px] transition-colors no-underline hidden sm:inline"
            style={{ color: 'var(--muted)' }}
          >
            Dashboard
          </Link>
          <Link
            href="/progress"
            className="text-[13px] transition-colors no-underline hidden sm:inline"
            style={{ color: 'var(--muted)' }}
          >
            Progres
          </Link>
          <Link
            href="/dokkai"
            className="text-[13px] transition-colors no-underline hidden sm:inline"
            style={{ color: 'var(--muted)' }}
          >
            Dokkai
          </Link>
          <div className="flex items-center gap-0.5 md:gap-1 shrink-0">
            {[
              { label: 'N5', href: '/learn/n5' },
              { label: 'N4', href: '/learn/n4' },
              { label: 'N3', href: '/learn/n3' },
              { label: 'N2', href: '/learn/n2' },
              { label: 'N1', href: '/learn/n1' },
              { label: 'SSW', href: '/ssw' },
            ].map(({ label, href }) => (
              <Link
                key={label}
                href={href}
                className="text-[12px] px-2.5 py-1 rounded-lg transition-all no-underline hover:opacity-100"
                style={{ color: 'var(--muted)' }}
              >
                {label}
              </Link>
            ))}
          </div>
          <ThemeToggle />
          <AnimationToggle />
          <span className="text-[12px] hidden md:inline" style={{ color: 'var(--muted)' }}>{user.email}</span>
          <form action={logout}>
            <button
              type="submit"
              className="text-[12px] px-3 py-1.5 rounded-lg transition-colors cursor-pointer"
              style={{
                border: '0.5px solid var(--border)',
                color: 'var(--muted)',
                background: 'var(--surface)',
              }}
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
