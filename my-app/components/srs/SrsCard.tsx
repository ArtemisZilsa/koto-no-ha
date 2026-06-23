'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'
import type { SrsCard as SrsCardType } from '@/lib/data/srs'
import { SRS_TYPE_LABEL } from '@/lib/data/srs'
import { Icon } from '@/components/ui/Icon'

interface SrsCardProps {
  card: SrsCardType
  reduced: boolean
  onReview: (known: boolean) => void
}

function frontFontSize(len: number): number {
  if (len <= 1) return 88
  if (len <= 2) return 72
  if (len <= 4) return 52
  if (len <= 7) return 38
  return 30
}

export default function SrsCard({ card, reduced, onReview }: SrsCardProps) {
  // Komponen ini di-remount tiap kartu berganti (parent memberi key=card.id),
  // sehingga state flip otomatis kembali ke sisi depan.
  const [flipped, setFlipped] = useState(false)

  return (
    <div className="w-full max-w-[480px] mx-auto">
      {/* Kartu flip */}
      <div style={{ perspective: 1200 }}>
        <motion.button
          type="button"
          onClick={() => setFlipped((f) => !f)}
          aria-label={flipped ? 'Lihat sisi depan' : 'Lihat arti'}
          className="relative w-full cursor-pointer rounded-2xl"
          style={{ transformStyle: 'preserve-3d', minHeight: 280 }}
          animate={reduced ? undefined : { rotateY: flipped ? 180 : 0 }}
          transition={{ type: 'spring', stiffness: 260, damping: 26 }}
        >
          {/* Sisi depan */}
          <div
            className="absolute inset-0 flex flex-col items-center justify-center rounded-2xl p-7 text-center"
            style={{
              background: 'var(--surface)',
              border: '0.5px solid var(--border)',
              boxShadow: 'var(--shadow-card)',
              backfaceVisibility: 'hidden',
              WebkitBackfaceVisibility: 'hidden',
              // Saat reduced (tanpa rotateY), pakai opacity untuk pindah sisi.
              opacity: reduced && flipped ? 0 : 1,
              pointerEvents: reduced && flipped ? 'none' : 'auto',
            }}
          >
            <span
              className="absolute top-3.5 left-3.5 text-[10px] font-medium px-2.5 py-0.5 rounded-full"
              style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
            >
              {SRS_TYPE_LABEL[card.type].jp} {SRS_TYPE_LABEL[card.type].id}
            </span>
            <span
              className="absolute top-3.5 right-3.5 text-[10px] font-medium px-2.5 py-0.5 rounded-full"
              style={{ background: 'var(--gold-bg)', color: 'var(--gold)' }}
            >
              {card.level}
            </span>
            <div
              className="font-serif font-semibold text-ink leading-none break-all"
              style={{ fontSize: `${frontFontSize(card.front.length)}px` }}
            >
              {card.front}
            </div>
            <div className="mt-5 inline-flex items-center gap-1.5 text-[12px]" style={{ color: 'var(--muted)' }}>
              <Icon name="sparkles" className="w-3.5 h-3.5" /> ketuk untuk lihat arti
            </div>
          </div>

          {/* Sisi belakang */}
          <div
            className="absolute inset-0 flex flex-col items-center justify-center rounded-2xl p-7 text-center"
            style={{
              background: 'var(--surface)',
              border: '0.5px solid var(--border)',
              boxShadow: 'var(--shadow-card)',
              backfaceVisibility: 'hidden',
              WebkitBackfaceVisibility: 'hidden',
              transform: reduced ? 'none' : 'rotateY(180deg)',
              opacity: reduced ? (flipped ? 1 : 0) : 1,
              pointerEvents: reduced && !flipped ? 'none' : 'auto',
            }}
          >
            {card.reading && (
              <div className="text-[15px] mb-1.5" style={{ color: 'var(--muted)' }}>{card.reading}</div>
            )}
            <div className="font-serif text-[26px] font-semibold text-ink leading-tight">{card.back}</div>
            {card.example && (
              <div
                className="mt-4 text-[13px] px-4 py-2.5 rounded-xl leading-relaxed"
                style={{ background: 'var(--paper-dark)', color: 'var(--koto-text)' }}
              >
                {card.example}
              </div>
            )}
          </div>
        </motion.button>
      </div>

      {/* Tombol penilaian — tampil setelah dibalik */}
      <div
        className="grid grid-cols-2 gap-3 mt-4 transition-opacity duration-200"
        style={{ opacity: flipped ? 1 : 0, pointerEvents: flipped ? 'auto' : 'none' }}
      >
        <button
          type="button"
          onClick={() => onReview(false)}
          className="inline-flex items-center justify-center gap-1.5 text-[14px] font-medium px-5 py-3.5 rounded-xl cursor-pointer transition-colors"
          style={{ background: 'var(--red-bg)', color: 'var(--red)', border: '1px solid var(--red)' }}
        >
          <Icon name="reading" className="w-4 h-4" /> Belum hafal
        </button>
        <button
          type="button"
          onClick={() => onReview(true)}
          className="inline-flex items-center justify-center gap-1.5 text-[14px] font-medium px-5 py-3.5 rounded-xl cursor-pointer transition-colors"
          style={{ background: 'var(--green-bg)', color: 'var(--green)', border: '1px solid var(--green)' }}
        >
          <Icon name="sparkles" className="w-4 h-4" /> Sudah hafal
        </button>
      </div>
      {!flipped && (
        <p className="text-center text-[11.5px] text-muted mt-4">Balik kartu dulu untuk menilai ingatanmu.</p>
      )}
    </div>
  )
}
