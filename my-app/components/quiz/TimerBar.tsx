// KotonoHa Quiz Component
'use client'

import { motion } from 'framer-motion'

interface TimerBarProps {
  /** Sisa waktu 1 (penuh) → 0 (habis). */
  fraction: number
  reduced?: boolean
}

export default function TimerBar({ fraction, reduced }: TimerBarProps) {
  const f = Math.max(0, Math.min(1, fraction))
  // gold → orange → red seiring waktu menipis
  const color = f > 0.5 ? 'var(--gold)' : f > 0.25 ? '#e8821e' : 'var(--red)'
  const danger = f <= 0.3 // < 3 detik dari 10

  return (
    <div
      className="w-full h-2 rounded-full overflow-hidden"
      style={{ background: 'var(--paper-dark)' }}
      role="progressbar"
      aria-label="Sisa waktu"
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={Math.round(f * 100)}
    >
      <motion.div
        className="h-full rounded-full"
        style={{ width: `${f * 100}%`, background: color, transition: 'width 0.1s linear' }}
        animate={!reduced && danger ? { opacity: [1, 0.4, 1] } : { opacity: 1 }}
        transition={!reduced && danger ? { duration: 0.7, repeat: Infinity } : { duration: 0.2 }}
      />
    </div>
  )
}
