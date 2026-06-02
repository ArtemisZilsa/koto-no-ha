'use client'

import { useState } from 'react'
import Link from 'next/link'
import { logout } from '@/app/actions/auth'
import type { User } from '@supabase/supabase-js'

interface NavClientProps {
  user: User | null
}

export function NavClient({ user }: NavClientProps) {
  const [menuOpen, setMenuOpen] = useState(false)

  return (
    <nav
      className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-5 md:px-12 h-[60px]"
      style={{
        background: 'var(--nav-bg)',
        backdropFilter: 'blur(14px)',
        borderBottom: '0.5px solid var(--border)',
      }}
    >
      {/* Logo */}
      <Link href="/" className="flex items-center gap-2.5 no-underline">
        <span className="font-serif text-[22px] font-semibold text-ink tracking-tight">言の葉</span>
        <div className="w-px h-[22px]" style={{ background: 'var(--border)' }} />
        <span className="text-[11px] text-muted tracking-[0.12em] uppercase">Koto no Ha</span>
      </Link>

      {/* Desktop nav links */}
      <ul className="hidden md:flex items-center gap-7 list-none">
        {[
          { href: '/#fitur', label: 'Belajar' },
          { href: '/#level', label: 'Level' },
          { href: '/#kaiwa', label: 'Kaiwa' },
          { href: '/#visa', label: 'SSW / TG' },
          { href: '/berita', label: 'Berita' },
        ].map(({ href, label }) => (
          <li key={href}>
            <Link
              href={href}
              className="text-[13px] text-muted no-underline hover:text-koto-text transition-colors"
            >
              {label}
            </Link>
          </li>
        ))}
      </ul>

      {/* Auth buttons */}
      <div className="hidden md:flex items-center gap-2">
        {user ? (
          <>
            <Link
              href="/dashboard"
              className="text-[13px] px-4 py-[7px] rounded-lg border text-ink hover:bg-paper-dark transition-colors"
              style={{ borderColor: 'var(--border)' }}
            >
              Dashboard
            </Link>
            <form action={logout}>
              <button
                type="submit"
                className="text-[13px] px-[18px] py-[7px] rounded-lg bg-ink text-paper hover:opacity-85 transition-opacity"
              >
                Keluar
              </button>
            </form>
          </>
        ) : (
          <>
            <Link
              href="/login"
              className="text-[13px] px-4 py-[7px] rounded-lg border text-ink hover:bg-paper-dark transition-colors"
              style={{ borderColor: 'var(--border)' }}
            >
              Masuk
            </Link>
            <Link
              href="/register"
              className="text-[13px] px-[18px] py-[7px] rounded-lg bg-ink text-paper hover:opacity-85 transition-opacity"
            >
              Daftar Gratis
            </Link>
          </>
        )}
      </div>

      {/* Mobile hamburger */}
      <button
        className="md:hidden flex flex-col gap-1.5 p-1"
        onClick={() => setMenuOpen(!menuOpen)}
        aria-label="Toggle menu"
      >
        <span className={`block w-5 h-0.5 bg-ink transition-transform ${menuOpen ? 'rotate-45 translate-y-2' : ''}`} />
        <span className={`block w-5 h-0.5 bg-ink transition-opacity ${menuOpen ? 'opacity-0' : ''}`} />
        <span className={`block w-5 h-0.5 bg-ink transition-transform ${menuOpen ? '-rotate-45 -translate-y-2' : ''}`} />
      </button>

      {/* Mobile menu */}
      {menuOpen && (
        <div
          className="absolute top-[60px] left-0 right-0 bg-paper border-b px-5 py-4 flex flex-col gap-3 md:hidden"
          style={{ borderColor: 'var(--border)' }}
        >
          {[
            { href: '/#fitur', label: 'Belajar' },
            { href: '/#level', label: 'Level' },
            { href: '/#kaiwa', label: 'Kaiwa' },
            { href: '/#visa', label: 'SSW / TG' },
            { href: '/berita', label: 'Berita' },
          ].map(({ href, label }) => (
            <Link
              key={label}
              href={href}
              className="text-sm text-muted py-1"
              onClick={() => setMenuOpen(false)}
            >
              {label}
            </Link>
          ))}
          <div className="flex gap-2 pt-2 border-t" style={{ borderColor: 'var(--border)' }}>
            <Link href="/login" className="flex-1 text-center text-sm py-2 rounded-lg border text-ink" style={{ borderColor: 'var(--border)' }}>
              Masuk
            </Link>
            <Link href="/register" className="flex-1 text-center text-sm py-2 rounded-lg bg-ink text-paper">
              Daftar
            </Link>
          </div>
        </div>
      )}
    </nav>
  )
}
