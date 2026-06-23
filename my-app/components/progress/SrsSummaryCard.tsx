'use client'

import { motion } from 'framer-motion'
import Link from 'next/link'
import { Icon } from '@/components/ui/Icon'
import { pct, type ProgressSrs } from '@/lib/data/progress'

interface SrsSummaryCardProps {
  srs: ProgressSrs
  reduced: boolean
}

const R = 46
const CIRC = 2 * Math.PI * R

export default function SrsSummaryCard({ srs, reduced }: SrsSummaryCardProps) {
  const p = pct(srs.mastered, srs.total)

  return (
    <div
      className="rounded-2xl p-6 h-full flex flex-col"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <div className="flex items-center justify-between mb-4">
        <h2 className="font-serif text-lg font-semibold text-ink">Kartu Hafalan</h2>
        <Link
          href="/srs"
          className="inline-flex items-center gap-1 text-[12px] no-underline hover:opacity-80 transition-opacity"
          style={{ color: 'var(--gold)' }}
        >
          Buka <Icon name="chevron-right" className="w-3.5 h-3.5" />
        </Link>
      </div>

      <div className="flex items-center gap-5">
        <div className="relative w-[110px] h-[110px] shrink-0">
          <svg width="110" height="110" viewBox="0 0 110 110" className="-rotate-90">
            <circle cx="55" cy="55" r={R} fill="none" stroke="var(--paper-dark)" strokeWidth="9" />
            <motion.circle
              cx="55"
              cy="55"
              r={R}
              fill="none"
              stroke="var(--green)"
              strokeWidth="9"
              strokeLinecap="round"
              strokeDasharray={CIRC}
              initial={reduced ? false : { strokeDashoffset: CIRC }}
              whileInView={{ strokeDashoffset: CIRC * (1 - p / 100) }}
              viewport={{ once: true }}
              transition={{ duration: 1, ease: 'easeOut' }}
            />
          </svg>
          <div className="absolute inset-0 flex flex-col items-center justify-center">
            <span className="font-serif text-[24px] font-semibold text-ink tabular-nums">{p}%</span>
            <span className="text-[10px] text-muted">dikuasai</span>
          </div>
        </div>

        <div className="flex-1 grid grid-cols-1 gap-2">
          {[
            { label: 'Sudah dikuasai', value: srs.mastered, color: 'var(--green)' },
            { label: 'Pernah direview', value: srs.reviewed, color: 'var(--teal)' },
            { label: 'Jatuh tempo', value: srs.due, color: 'var(--gold)' },
          ].map((s) => (
            <div key={s.label} className="flex items-center justify-between">
              <span className="text-[12.5px] text-muted">{s.label}</span>
              <span className="font-serif text-[16px] font-semibold tabular-nums" style={{ color: s.color }}>
                {s.value}
              </span>
            </div>
          ))}
        </div>
      </div>

      {srs.due > 0 && (
        <Link
          href="/srs"
          className="mt-5 inline-flex items-center justify-center gap-1.5 text-[13px] font-medium px-4 py-2.5 rounded-xl no-underline hover:opacity-90 transition-opacity"
          style={{ background: 'var(--gold-bg)', color: 'var(--gold)' }}
        >
          <Icon name="flame" className="w-4 h-4" />
          Review {srs.due} kartu hari ini
        </Link>
      )}
    </div>
  )
}
