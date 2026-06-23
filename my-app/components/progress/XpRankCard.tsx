'use client'

import { animate, motion } from 'framer-motion'
import { useEffect, useState } from 'react'
import { Icon } from '@/components/ui/Icon'
import type { RankProgress } from '@/lib/data/progress'

interface XpRankCardProps {
  totalXp: number
  streakDays: number
  levelCode: string | null
  levelName: string | null
  rank: RankProgress
  reduced: boolean
}

const R = 58
const CIRC = 2 * Math.PI * R

function useCountUp(target: number, reduced: boolean) {
  const [shown, setShown] = useState(reduced ? target : 0)
  useEffect(() => {
    if (reduced) {
      setShown(target)
      return
    }
    const controls = animate(0, target, {
      duration: 1.1,
      ease: 'easeOut',
      onUpdate: (v) => setShown(Math.round(v)),
    })
    return () => controls.stop()
  }, [target, reduced])
  return shown
}

export default function XpRankCard({
  totalXp,
  streakDays,
  levelCode,
  levelName,
  rank,
  reduced,
}: XpRankCardProps) {
  const shownXp = useCountUp(totalXp, reduced)
  const shownStreak = useCountUp(streakDays, reduced)

  return (
    <div
      className="rounded-2xl p-6 md:p-7"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <div className="flex flex-col sm:flex-row items-center gap-6">
        {/* Ring rank */}
        <div className="relative w-[150px] h-[150px] shrink-0">
          <svg width="150" height="150" viewBox="0 0 150 150" className="-rotate-90">
            <circle cx="75" cy="75" r={R} fill="none" stroke="var(--paper-dark)" strokeWidth="11" />
            <motion.circle
              cx="75"
              cy="75"
              r={R}
              fill="none"
              stroke="var(--gold)"
              strokeWidth="11"
              strokeLinecap="round"
              strokeDasharray={CIRC}
              initial={reduced ? false : { strokeDashoffset: CIRC }}
              animate={{ strokeDashoffset: CIRC * (1 - rank.pct / 100) }}
              transition={{ duration: 1.1, ease: 'easeOut' }}
            />
          </svg>
          <div className="absolute inset-0 flex flex-col items-center justify-center">
            <span className="font-serif text-[34px] leading-none font-semibold" style={{ color: 'var(--gold)' }}>
              {rank.rank.jp}
            </span>
            <span className="text-[11px] text-muted mt-1">{rank.rank.name}</span>
          </div>
        </div>

        {/* Detail */}
        <div className="flex-1 min-w-0 text-center sm:text-left">
          <p className="text-[11px] tracking-[0.14em] uppercase mb-1" style={{ color: 'var(--gold)' }}>
            経験値 · Total XP
          </p>
          <div className="font-serif text-[40px] leading-none font-semibold text-ink tabular-nums mb-2">
            {shownXp.toLocaleString('id-ID')}
          </div>
          <p className="text-[12.5px] text-muted mb-4">
            {rank.next ? (
              <>
                <span className="font-medium text-ink tabular-nums">{rank.span - rank.intoRank}</span> XP lagi menuju{' '}
                <span className="font-serif" style={{ color: 'var(--gold)' }}>{rank.next.jp}</span> {rank.next.name}
              </>
            ) : (
              'Rank tertinggi tercapai — luar biasa!'
            )}
          </p>

          <div className="flex items-center justify-center sm:justify-start gap-3">
            <span
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-[13px] font-medium"
              style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
            >
              <Icon name="flame" className="w-4 h-4" />
              <span className="tabular-nums">{shownStreak}</span> hari
            </span>
            <span
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-[13px] font-medium"
              style={{ background: 'var(--teal-bg)', color: 'var(--teal)' }}
            >
              <Icon name="book" className="w-4 h-4" />
              {levelCode ?? 'N5'}{levelName ? ` · ${levelName}` : ''}
            </span>
          </div>
        </div>
      </div>
    </div>
  )
}
