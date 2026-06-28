'use client'

import { useState } from 'react'
import type { DokkaiSentence } from '@/lib/types/database.types'

/**
 * Penampil bacaan dokkai kalimat-per-kalimat. Furigana selalu tampil; romaji &
 * terjemahan bisa di-toggle agar bisa dipakai untuk latihan baca mandiri.
 */
export default function DokkaiReader({
  sentences,
  fallbackText,
  accentColor,
}: {
  sentences: DokkaiSentence[] | null
  fallbackText: string
  accentColor: string
}) {
  const [showRomaji, setShowRomaji] = useState(false)
  const [showTrans, setShowTrans] = useState(true)

  // Fallback: bila belum ada content_json, tampilkan teks polos.
  if (!sentences || sentences.length === 0) {
    return (
      <p className="font-serif text-[17px] leading-[2.1] text-ink whitespace-pre-line">
        {fallbackText}
      </p>
    )
  }

  const toggleStyle = (on: boolean) => ({
    background: on ? accentColor : 'var(--surface)',
    color: on ? 'var(--on-ink)' : 'var(--muted)',
    border: `0.5px solid ${on ? accentColor : 'var(--border)'}`,
  })

  return (
    <div>
      {/* Kontrol tampilan */}
      <div className="flex items-center gap-2 mb-5">
        <button
          type="button"
          onClick={() => setShowRomaji((v) => !v)}
          aria-pressed={showRomaji}
          className="text-[11.5px] font-medium px-3 py-1.5 rounded-lg cursor-pointer transition-colors"
          style={toggleStyle(showRomaji)}
        >
          Romaji
        </button>
        <button
          type="button"
          onClick={() => setShowTrans((v) => !v)}
          aria-pressed={showTrans}
          className="text-[11.5px] font-medium px-3 py-1.5 rounded-lg cursor-pointer transition-colors"
          style={toggleStyle(showTrans)}
        >
          Terjemahan
        </button>
      </div>

      {/* Kalimat */}
      <div className="flex flex-col gap-5">
        {sentences.map((s, i) => (
          <div
            key={i}
            className="pb-4"
            style={{ borderBottom: i < sentences.length - 1 ? '0.5px solid var(--border)' : 'none' }}
          >
            {/* Furigana di atas teks Jepang */}
            <div className="text-[12px] leading-tight mb-1" style={{ color: 'var(--muted)' }}>
              {s.furigana}
            </div>
            <p className="font-serif text-[18px] md:text-[19px] leading-[1.7] text-ink">{s.jp}</p>
            {showRomaji && (
              <p className="text-[12.5px] italic mt-1" style={{ color: 'var(--muted)' }}>
                {s.romaji}
              </p>
            )}
            {showTrans && (
              <p className="text-[13.5px] mt-1.5 leading-relaxed" style={{ color: 'var(--ink)', opacity: 0.85 }}>
                {s.id}
              </p>
            )}
          </div>
        ))}
      </div>
    </div>
  )
}
