'use client'

import { useState, useTransition } from 'react'
import { toggleItemKnown, type ItemType } from '@/app/actions/progress'

interface KnownToggleProps {
  itemType: ItemType
  itemId?: string
  initialKnown: boolean
  /** Warna aksen saat aktif (mengikuti aksen level). */
  accentColor?: string
}

/**
 * Checklist "sudah dikenal" untuk satu kosakata/kanji.
 * Optimistic: langsung berubah saat diklik, lalu konfirmasi ke server.
 * Bila item tak punya id (data lama) atau user belum login, tombol dinonaktifkan.
 */
export function KnownToggle({ itemType, itemId, initialKnown, accentColor = 'var(--green)' }: KnownToggleProps) {
  const [known, setKnown] = useState(initialKnown)
  const [pending, startTransition] = useTransition()
  const [err, setErr] = useState(false)

  const disabled = !itemId

  function onClick() {
    if (!itemId || pending) return
    const next = !known
    setKnown(next) // optimistik
    setErr(false)
    startTransition(async () => {
      const res = await toggleItemKnown(itemType, itemId, next)
      if (!res.ok) {
        setKnown(!next) // rollback
        setErr(true)
      }
    })
  }

  const label = known ? 'Sudah dikenal — klik untuk batalkan' : 'Tandai sudah dikenal'

  return (
    <button
      type="button"
      onClick={onClick}
      disabled={disabled}
      aria-pressed={known}
      aria-label={label}
      title={disabled ? 'Masuk untuk menyimpan progres' : err ? 'Gagal — coba lagi' : label}
      className="inline-flex items-center gap-1.5 text-[11px] font-medium rounded-full px-2.5 py-1 transition-all cursor-pointer disabled:cursor-not-allowed disabled:opacity-40"
      style={
        known
          ? { background: accentColor, color: 'var(--on-ink)', border: `1px solid ${accentColor}` }
          : { background: 'transparent', color: 'var(--muted)', border: '1px solid var(--border)' }
      }
    >
      {/* Ikon centang dalam lingkaran */}
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
        {known ? (
          <>
            <circle cx="12" cy="12" r="10" fill="currentColor" stroke="none" opacity="0.0" />
            <path d="M20 6 9 17l-5-5" />
          </>
        ) : (
          <circle cx="12" cy="12" r="9" strokeWidth="1.5" />
        )}
      </svg>
      {known ? 'Dikenal' : 'Tandai'}
    </button>
  )
}
