'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'
import {
  KANA_GROUPS,
  SCRIPT_META,
  type KanaCell,
  type KanaScript,
} from '@/lib/data/kana'
import { Icon } from '@/components/ui/Icon'

function isReducedMotion(): boolean {
  if (typeof window === 'undefined') return false
  return (
    window.matchMedia('(prefers-reduced-motion: reduce)').matches ||
    document.documentElement.classList.contains('no-anim')
  )
}

interface CellProps {
  cell: KanaCell
  script: KanaScript
  /** Mode latihan: romaji disembunyikan sampai kartu di-flip. */
  practice: boolean
  reduced: boolean
}

function KanaTile({ cell, script, practice, reduced }: CellProps) {
  const [flipped, setFlipped] = useState(false)

  // Sel rumpang (mis. baris ya/wa) — jaga grid tetap rapi tanpa kotak.
  if (!cell.romaji) return <div aria-hidden className="aspect-square" />

  const glyph = script === 'hiragana' ? cell.hira : cell.kata
  const other = script === 'hiragana' ? cell.kata : cell.hira
  // Saat tidak latihan, romaji selalu tampil. Saat latihan, perlu flip.
  const revealed = !practice || flipped

  return (
    <button
      type="button"
      onClick={() => practice && setFlipped((f) => !f)}
      aria-label={`${glyph} dibaca ${cell.romaji}`}
      className="group relative aspect-square w-full rounded-xl cursor-pointer focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 transition-colors"
      style={{
        background: 'var(--surface)',
        border: '0.5px solid var(--border)',
        boxShadow: 'var(--shadow-soft)',
      }}
    >
      <motion.div
        className="absolute inset-0 flex flex-col items-center justify-center gap-0.5"
        whileHover={reduced ? undefined : { y: -3 }}
        transition={{ type: 'spring', stiffness: 400, damping: 22 }}
      >
        <span className="font-serif font-medium text-ink leading-none" style={{ fontSize: 'clamp(20px, 5vw, 30px)' }}>
          {glyph}
        </span>
        {/* Romaji + skrip lain (muncul/teredam sesuai mode latihan) */}
        <span
          className="text-[10.5px] tracking-wide tabular-nums transition-opacity duration-200"
          style={{ color: 'var(--gold)', opacity: revealed ? 1 : 0 }}
        >
          {cell.romaji}
        </span>
        <span
          className="text-[11px] leading-none transition-opacity duration-200"
          style={{ color: 'var(--muted)', opacity: revealed ? 0.8 : 0 }}
        >
          {other}
        </span>
      </motion.div>

      {/* Petunjuk ketuk saat mode latihan & belum dibuka */}
      {practice && !flipped && (
        <span
          className="absolute bottom-1.5 left-1/2 -translate-x-1/2 text-[9px] opacity-0 group-hover:opacity-100 transition-opacity"
          style={{ color: 'var(--muted)' }}
        >
          ketuk
        </span>
      )}
    </button>
  )
}

export default function KanaBoard() {
  const [script, setScript] = useState<KanaScript>('hiragana')
  const [practice, setPractice] = useState(false)
  const [reduced] = useState(isReducedMotion)
  const meta = SCRIPT_META[script]

  return (
    <div className="w-full max-w-4xl mx-auto">
      {/* Kontrol: skrip + mode latihan */}
      <div className="flex flex-wrap items-center justify-between gap-3 mb-7">
        <div
          className="inline-flex rounded-xl p-1"
          style={{ background: 'var(--paper-dark)', border: '0.5px solid var(--border)' }}
        >
          {(['hiragana', 'katakana'] as KanaScript[]).map((s) => {
            const active = script === s
            return (
              <button
                key={s}
                type="button"
                onClick={() => setScript(s)}
                className="px-4 py-2 rounded-lg text-[13px] font-medium cursor-pointer transition-colors"
                style={{
                  background: active ? 'var(--ink)' : 'transparent',
                  color: active ? 'var(--paper)' : 'var(--muted)',
                }}
              >
                <span className="font-serif mr-1.5">{SCRIPT_META[s].jp}</span>
                {SCRIPT_META[s].label}
              </button>
            )
          })}
        </div>

        <button
          type="button"
          onClick={() => setPractice((p) => !p)}
          aria-pressed={practice}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-[13px] font-medium cursor-pointer transition-colors"
          style={{
            background: practice ? 'var(--gold-bg)' : 'var(--surface)',
            color: practice ? 'var(--gold)' : 'var(--muted)',
            border: `1px solid ${practice ? 'var(--gold)' : 'var(--border)'}`,
          }}
        >
          <Icon name={practice ? 'sparkles' : 'reading'} className="w-4 h-4" />
          {practice ? 'Mode latihan: aktif' : 'Mode latihan'}
        </button>
      </div>

      <p className="text-[13px] text-muted mb-8 leading-relaxed">
        {meta.desc}{' '}
        {practice
          ? 'Romaji disembunyikan — ketuk tiap kartu untuk memeriksa bacaanmu.'
          : 'Ketuk kartu di mode latihan untuk menguji ingatanmu.'}
      </p>

      {/* Bagian per grup */}
      <div className="flex flex-col gap-12">
        {KANA_GROUPS.map((g, gi) => (
          <section key={g.id}>
            <div className="flex items-baseline gap-3 mb-4">
              <h2 className="font-serif text-xl font-semibold text-ink">
                <span className="mr-2">{g.jp}</span>
                <span className="text-[13px] font-sans font-normal text-muted">{g.label}</span>
              </h2>
              <p className="text-[12px] text-muted hidden sm:block">{g.desc}</p>
            </div>

            <div className="flex flex-col gap-2">
              {g.rows.map((row, ri) => (
                <motion.div
                  key={`${g.id}-${ri}`}
                  initial={reduced ? false : { opacity: 0, y: 12 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true, margin: '0px 0px -8% 0px' }}
                  transition={{ duration: 0.4, ease: 'easeOut', delay: reduced ? 0 : Math.min(ri * 0.03 + gi * 0.02, 0.3) }}
                  className="grid gap-2"
                  style={{ gridTemplateColumns: `repeat(${g.cols}, minmax(0, 1fr))` }}
                >
                  {row.cells.map((cell, ci) => (
                    <KanaTile
                      key={`${g.id}-${ri}-${ci}`}
                      cell={cell}
                      script={script}
                      practice={practice}
                      reduced={reduced}
                    />
                  ))}
                </motion.div>
              ))}
            </div>
          </section>
        ))}
      </div>
    </div>
  )
}
