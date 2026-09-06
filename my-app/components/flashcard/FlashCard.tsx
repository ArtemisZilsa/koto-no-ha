'use client'

import { useState, useCallback } from 'react'
import type { KanjiEntry, VocabEntry } from '@/lib/data/types'

/* ─── Tipe data kartu ─────────────────────────────────────────────────────────
 * FlashCard menerima bentuk data generik agar bisa dipakai untuk vocab
 * maupun kanji. Gunakan helper vocabToCard / kanjiToCard di bawah.
 */
export interface FlashCardExample {
  sentence: string   // ご飯を食べる
  hiragana: string   // ごはんをたべる
  meaning: string    // Makan nasi
}

export interface FlashCardData {
  id?: string
  /** Sisi depan: kanji atau kosakata (mis. 食べる) */
  front: string
  /** Cara baca (hiragana/katakana) */
  reading: string
  /** Romaji (opsional, ditampilkan kecil di bawah reading) */
  romaji?: string
  /** Arti dalam Bahasa Indonesia */
  meaning: string
  /** Label kecil, mis. jenis kata atau "Kanji · 10 goresan" */
  label?: string
  /** Contoh kalimat (maksimal satu ditampilkan) */
  example?: FlashCardExample
}

export function vocabToCard(v: VocabEntry): FlashCardData {
  return {
    id: v.id,
    front: v.word,
    reading: v.hiragana,
    romaji: v.romaji,
    meaning: v.meaning,
    label: v.partOfSpeech,
    example: v.examples[0],
  }
}

export function kanjiToCard(k: KanjiEntry): FlashCardData {
  const ex = k.examples[0]
  return {
    id: k.id,
    front: k.kanji,
    reading: k.hiragana,
    romaji: k.romaji,
    meaning: k.meaning,
    label: `Kanji · ${k.strokeCount} goresan`,
    example: ex
      ? { sentence: ex.kanji, hiragana: ex.hiragana, meaning: ex.meaning }
      : undefined,
  }
}

interface FlashCardProps {
  card: FlashCardData
  /** Warna aksen level (mis. var(--red)). */
  accentColor?: string
  /** Mulai dalam keadaan terbuka (sisi belakang). */
  defaultFlipped?: boolean
  /** Callback tiap kali kartu dibalik. */
  onFlip?: (flipped: boolean) => void
}

/**
 * Kartu flashcard dengan animasi flip 3D.
 * Depan : kanji/kosakata besar.
 * Belakang: cara baca + arti + satu contoh kalimat.
 * Bisa dibalik dengan klik, Enter, atau Spasi.
 */
export default function FlashCard({
  card,
  accentColor = 'var(--red)',
  defaultFlipped = false,
  onFlip,
}: FlashCardProps) {
  const [flipped, setFlipped] = useState(defaultFlipped)

  const toggle = useCallback(() => {
    setFlipped((prev) => {
      const next = !prev
      onFlip?.(next)
      return next
    })
  }, [onFlip])

  const faceStyle: React.CSSProperties = {
    position: 'absolute',
    inset: 0,
    backfaceVisibility: 'hidden',
    WebkitBackfaceVisibility: 'hidden',
    borderRadius: '1.25rem',
    background: 'var(--surface)',
    border: '0.5px solid var(--border)',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    padding: '1.5rem',
  }

  return (
    <button
      type="button"
      onClick={toggle}
      aria-pressed={flipped}
      aria-label={flipped ? 'Kartu terbuka — klik untuk kembali ke depan' : 'Klik untuk melihat arti'}
      className="block w-full max-w-md mx-auto cursor-pointer select-none focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2"
      style={{ perspective: '1200px', background: 'transparent', border: 'none', padding: 0 }}
    >
      <div
        className="relative w-full transition-transform duration-500"
        style={{
          minHeight: '18rem',
          transformStyle: 'preserve-3d',
          transform: flipped ? 'rotateY(180deg)' : 'rotateY(0deg)',
        }}
      >
        {/* ─── Depan: kanji / kosakata ───────────────────────── */}
        <div style={faceStyle} className="shadow-sm hover:shadow-md transition-shadow">
          {card.label && (
            <span
              className="text-[11px] font-medium rounded-full px-2.5 py-1 mb-4"
              style={{ background: 'var(--paper)', color: 'var(--muted)' }}
            >
              {card.label}
            </span>
          )}
          <span className="font-serif font-semibold text-ink leading-none text-6xl">
            {card.front}
          </span>
          <span className="mt-6 text-xs" style={{ color: 'var(--muted)' }}>
            Klik untuk melihat arti
          </span>
        </div>

        {/* ─── Belakang: reading + arti + contoh ─────────────── */}
        <div
          style={{ ...faceStyle, transform: 'rotateY(180deg)', borderTop: `3px solid ${accentColor}` }}
          className="shadow-sm"
        >
          <span className="font-serif text-2xl text-ink leading-tight">{card.reading}</span>
          {card.romaji && (
            <span className="mt-1 text-xs italic" style={{ color: 'var(--muted)' }}>
              {card.romaji}
            </span>
          )}
          <span className="mt-3 text-lg font-semibold" style={{ color: accentColor }}>
            {card.meaning}
          </span>

          {card.example && (
            <div
              className="mt-5 w-full rounded-xl px-4 py-3 text-left"
              style={{ background: 'var(--paper)', border: '0.5px solid var(--border)' }}
            >
              <p className="font-serif text-base text-ink">{card.example.sentence}</p>
              <p className="text-xs mt-1" style={{ color: 'var(--muted)' }}>
                {card.example.hiragana}
              </p>
              <p className="text-sm mt-1 text-ink">{card.example.meaning}</p>
            </div>
          )}
        </div>
      </div>
    </button>
  )
}
