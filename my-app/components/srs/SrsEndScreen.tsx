'use client'

import { animate, motion } from 'framer-motion'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import confetti from 'canvas-confetti'
import { Icon } from '@/components/ui/Icon'

interface SrsEndScreenProps {
  known: number
  total: number
  xpGained: number
  isLoggedIn: boolean
  saved: boolean
  savedTotalXp?: number
  savedStreak?: number
  reduced?: boolean
  onRetry: () => void
  onExit: () => void
}

const CONFETTI_COLORS = ['#c9963c', '#2f7d4f', '#c8102e', '#d4a957']
const R = 52
const CIRC = 2 * Math.PI * R

export default function SrsEndScreen({
  known,
  total,
  xpGained,
  isLoggedIn,
  saved,
  savedTotalXp,
  savedStreak,
  reduced,
  onRetry,
  onExit,
}: SrsEndScreenProps) {
  const pct = total > 0 ? Math.round((known / total) * 100) : 0
  const [shownXp, setShownXp] = useState(reduced ? xpGained : 0)

  useEffect(() => {
    if (reduced) {
      setShownXp(xpGained)
      return
    }
    const controls = animate(0, xpGained, {
      duration: 1.1,
      ease: 'easeOut',
      onUpdate: (v) => setShownXp(Math.round(v)),
    })
    return () => controls.stop()
  }, [xpGained, reduced])

  useEffect(() => {
    if (pct < 80 || reduced) return
    const t = setTimeout(() => {
      confetti({
        particleCount: 150,
        spread: 95,
        startVelocity: 42,
        origin: { x: 0.5, y: 0.4 },
        colors: CONFETTI_COLORS,
        disableForReducedMotion: true,
      })
    }, 300)
    return () => clearTimeout(t)
  }, [pct, reduced])

  return (
    <motion.div
      initial={reduced ? false : { y: 40, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ type: 'spring', stiffness: 260, damping: 26 }}
      className="w-full max-w-[480px] mx-auto rounded-2xl p-7 text-center"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <p className="text-[11px] tracking-[0.14em] uppercase mb-1" style={{ color: 'var(--gold)' }}>
        Sesi Selesai
      </p>
      <h2 className="font-serif text-[24px] font-semibold text-ink mb-5">よく頑張りました！</h2>

      <div className="relative w-[130px] h-[130px] mx-auto mb-5">
        <svg width="130" height="130" viewBox="0 0 130 130" className="-rotate-90">
          <circle cx="65" cy="65" r={R} fill="none" stroke="var(--paper-dark)" strokeWidth="10" />
          <motion.circle
            cx="65"
            cy="65"
            r={R}
            fill="none"
            stroke="var(--green)"
            strokeWidth="10"
            strokeLinecap="round"
            strokeDasharray={CIRC}
            initial={reduced ? false : { strokeDashoffset: CIRC }}
            animate={{ strokeDashoffset: CIRC * (1 - pct / 100) }}
            transition={{ duration: 1.1, ease: 'easeOut' }}
          />
        </svg>
        <div className="absolute inset-0 flex flex-col items-center justify-center">
          <span className="font-serif text-[30px] font-semibold text-ink tabular-nums">{pct}%</span>
          <span className="text-[11px] text-muted">hafal</span>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-2 mb-6">
        {[
          { label: 'Sudah hafal', value: `${known}/${total}`, color: 'var(--green)' },
          { label: 'XP didapat', value: `+${shownXp}`, color: 'var(--gold)' },
        ].map((s) => (
          <div key={s.label} className="rounded-xl py-3" style={{ background: 'var(--paper-dark)' }}>
            <div className="font-serif text-[18px] font-semibold tabular-nums" style={{ color: s.color }}>
              {s.value}
            </div>
            <div className="text-[10.5px] text-muted mt-0.5">{s.label}</div>
          </div>
        ))}
      </div>

      <div className="mb-5 text-[12px]">
        {saved ? (
          <span className="inline-flex items-center gap-1.5" style={{ color: 'var(--green)' }}>
            <Icon name="sparkles" className="w-3.5 h-3.5" />
            Progres tersimpan
            {typeof savedTotalXp === 'number' && (
              <span className="text-muted">· total {savedTotalXp} XP{typeof savedStreak === 'number' ? ` · streak ${savedStreak}` : ''}</span>
            )}
          </span>
        ) : isLoggedIn ? (
          <span className="text-muted">Progres belum tersimpan. Coba lagi nanti.</span>
        ) : (
          <span className="text-muted">
            <Link href="/login" className="underline" style={{ color: 'var(--gold)' }}>Masuk</Link>{' '}
            untuk menyimpan jadwal ulang &amp; XP ke akunmu.
          </span>
        )}
      </div>

      <div className="flex items-center justify-center gap-2.5">
        <button
          type="button"
          onClick={onRetry}
          className="inline-flex items-center gap-1.5 text-[14px] px-5 py-2.5 rounded-xl cursor-pointer text-paper hover:opacity-90 transition-opacity"
          style={{ background: 'var(--ink)' }}
        >
          <Icon name="cards" className="w-4 h-4" /> Sesi Baru
        </button>
        <button
          type="button"
          onClick={onExit}
          className="text-[14px] px-5 py-2.5 rounded-xl cursor-pointer text-ink hover:bg-paper-dark transition-colors"
          style={{ border: '0.5px solid var(--border)' }}
        >
          Ganti Level
        </button>
      </div>
      <div className="mt-3">
        <Link href="/dashboard" className="text-[12px] text-muted no-underline hover:text-koto-text transition-colors">
          Ke Dashboard
        </Link>
      </div>
    </motion.div>
  )
}
