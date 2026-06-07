'use client'

import { useEffect, useState } from 'react'

/**
 * Toggle untuk mengaktifkan / menonaktifkan semua animasi situs.
 * Menambah/menghapus class `no-anim` di <html> (lihat globals.css) dan
 * menyimpan preferensi di localStorage('koto-anim'). Dipasang di samping
 * ThemeToggle. Status awal dibaca dari class yang sudah di-set ThemeScript
 * agar tidak ada flash / hydration mismatch.
 */
export default function AnimationToggle() {
  // null = belum hydrate
  const [enabled, setEnabled] = useState<boolean | null>(null)

  useEffect(() => {
    const off = document.documentElement.classList.contains('no-anim')
    // eslint-disable-next-line react-hooks/set-state-in-effect
    setEnabled(!off)
  }, [])

  function toggle() {
    const next = !enabled
    document.documentElement.classList.toggle('no-anim', !next)
    try {
      localStorage.setItem('koto-anim', next ? 'on' : 'off')
    } catch {
      // localStorage bisa gagal di mode privat
    }
    setEnabled(next)
  }

  // Placeholder selama hydrate supaya layout tidak shift
  if (enabled === null) {
    return (
      <div
        aria-hidden
        className="w-9 h-9 rounded-lg"
        style={{ border: '0.5px solid var(--border)' }}
      />
    )
  }

  return (
    <button
      onClick={toggle}
      aria-label={enabled ? 'Matikan animasi' : 'Nyalakan animasi'}
      aria-pressed={enabled}
      title={enabled ? 'Matikan animasi' : 'Nyalakan animasi'}
      className="w-9 h-9 rounded-lg flex items-center justify-center cursor-pointer hover:opacity-80"
      style={{
        background: 'var(--surface)',
        border: '0.5px solid var(--border)',
        color: 'var(--ink)',
      }}
    >
      {enabled ? (
        // Sparkles — animasi aktif
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M9.937 15.5A2 2 0 0 0 8.5 14.063l-6.135-1.582a.5.5 0 0 1 0-.962L8.5 9.936A2 2 0 0 0 9.937 8.5l1.582-6.135a.5.5 0 0 1 .963 0L14.063 8.5A2 2 0 0 0 15.5 9.937l6.135 1.581a.5.5 0 0 1 0 .964L15.5 14.063a2 2 0 0 0-1.437 1.437l-1.582 6.135a.5.5 0 0 1-.963 0z" />
          <path d="M20 3v4M22 5h-4M4 17v2M5 18H3" />
        </svg>
      ) : (
        // Sparkles dicoret — animasi nonaktif
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M9.937 15.5A2 2 0 0 0 8.5 14.063l-6.135-1.582a.5.5 0 0 1 0-.962L8.5 9.936A2 2 0 0 0 9.937 8.5l1.582-6.135a.5.5 0 0 1 .963 0L14.063 8.5A2 2 0 0 0 15.5 9.937l6.135 1.581a.5.5 0 0 1 0 .964L15.5 14.063a2 2 0 0 0-1.437 1.437l-1.582 6.135a.5.5 0 0 1-.963 0z" opacity="0.4" />
          <path d="m2 2 20 20" />
        </svg>
      )}
    </button>
  )
}
