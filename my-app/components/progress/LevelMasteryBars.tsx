'use client'

import { motion } from 'framer-motion'
import { LEVEL_CODE_BY_ID, pct, type ProgressLevel } from '@/lib/data/progress'

interface LevelMasteryBarsProps {
  levels: ProgressLevel[]
  reduced: boolean
}

// Aksen per level (cermin kartu level di dashboard).
const ACCENT_BY_ID: Record<number, string> = {
  1: 'var(--red)',
  2: 'var(--green)',
  3: 'var(--teal)',
  4: 'var(--gold)',
  5: 'var(--red)',
}

function Bar({ known, total, accent, reduced }: { known: number; total: number; accent: string; reduced: boolean }) {
  const p = pct(known, total)
  return (
    <div className="flex-1">
      <div className="flex items-baseline justify-between mb-1">
        <span className="text-[11px] text-muted tabular-nums">
          {known}<span className="opacity-60">/{total}</span>
        </span>
        <span className="text-[11px] tabular-nums" style={{ color: accent }}>{p}%</span>
      </div>
      <div className="h-2 rounded-full overflow-hidden" style={{ background: 'var(--paper-dark)' }}>
        <motion.div
          className="h-full rounded-full"
          style={{ background: accent }}
          initial={reduced ? false : { width: 0 }}
          whileInView={{ width: `${p}%` }}
          viewport={{ once: true }}
          transition={{ duration: 0.9, ease: [0.22, 1, 0.36, 1] }}
        />
      </div>
    </div>
  )
}

export default function LevelMasteryBars({ levels, reduced }: LevelMasteryBarsProps) {
  const rows = [...levels].sort((a, b) => a.level_id - b.level_id)

  return (
    <div
      className="rounded-2xl p-6"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <h2 className="font-serif text-lg font-semibold text-ink mb-5">Penguasaan per Level</h2>
      <div className="flex flex-col gap-5">
        {rows.map((lv) => {
          const accent = ACCENT_BY_ID[lv.level_id] ?? 'var(--gold)'
          return (
            <div key={lv.level_id} className="flex items-center gap-4">
              <span
                className="font-serif text-lg font-semibold w-10 shrink-0 text-center"
                style={{ color: accent }}
              >
                {LEVEL_CODE_BY_ID[lv.level_id] ?? lv.level_id}
              </span>
              <div className="flex-1 grid grid-cols-1 sm:grid-cols-2 gap-x-5 gap-y-2">
                <div className="flex items-center gap-2">
                  <span className="font-serif text-[12px] text-muted w-8 shrink-0">語彙</span>
                  <Bar known={lv.vocab_known} total={lv.vocab_total} accent={accent} reduced={reduced} />
                </div>
                <div className="flex items-center gap-2">
                  <span className="font-serif text-[12px] text-muted w-8 shrink-0">漢字</span>
                  <Bar known={lv.kanji_known} total={lv.kanji_total} accent={accent} reduced={reduced} />
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
