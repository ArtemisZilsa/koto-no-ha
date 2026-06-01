'use client'

import { useEffect, useState } from 'react'

type Theme = 'light' | 'dark'

export default function ThemeToggle() {
  // Mulai dengan undefined supaya tidak mismatch hydrate
  const [theme, setTheme] = useState<Theme | null>(null)

  useEffect(() => {
    const initial: Theme = document.documentElement.classList.contains('dark') ? 'dark' : 'light'
    // eslint-disable-next-line react-hooks/set-state-in-effect
    setTheme(initial)
  }, [])

  function toggle() {
    const next: Theme = theme === 'dark' ? 'light' : 'dark'
    document.documentElement.classList.toggle('dark', next === 'dark')
    try {
      localStorage.setItem('koto-theme', next)
    } catch {
      // localStorage may fail in private mode
    }
    setTheme(next)
  }

  // Render placeholder selama hydrate supaya layout tidak shift
  if (theme === null) {
    return (
      <div
        aria-hidden
        className="w-9 h-9 rounded-lg"
        style={{ border: '0.5px solid var(--border)' }}
      />
    )
  }

  const isDark = theme === 'dark'

  return (
    <button
      onClick={toggle}
      aria-label={isDark ? 'Mode siang' : 'Mode malam'}
      title={isDark ? 'Ganti ke mode siang' : 'Ganti ke mode malam'}
      className="w-9 h-9 rounded-lg flex items-center justify-center cursor-pointer hover:opacity-80"
      style={{
        background: 'var(--surface)',
        border: '0.5px solid var(--border)',
        color: 'var(--ink)',
      }}
    >
      {isDark ? (
        // Sun icon — light mode
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <circle cx="12" cy="12" r="4" />
          <path d="M12 2v2" />
          <path d="M12 20v2" />
          <path d="m4.93 4.93 1.41 1.41" />
          <path d="m17.66 17.66 1.41 1.41" />
          <path d="M2 12h2" />
          <path d="M20 12h2" />
          <path d="m6.34 17.66-1.41 1.41" />
          <path d="m19.07 4.93-1.41 1.41" />
        </svg>
      ) : (
        // Moon icon — dark mode
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" />
        </svg>
      )}
    </button>
  )
}
