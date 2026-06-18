// KotonoHa Quiz Component
'use client'

import { animate, motion } from 'framer-motion'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import confetti from 'canvas-confetti'
import { Icon } from '@/components/ui/Icon'

interface QuizEndScreenProps {
  totalXp: number
  correct: number
  total: number
  bestStreak: number
  isLoggedIn: boolean
  saved: boolean
  savedTotalXp?: number
  savedStreak?: number
  reduced?: boolean
  onRetry: () => void
  onExit?: () => void
}

const CONFETTI_COLORS = ['#c9963c', '#2f7d4f', '#c8102e', '#d4a957']
const R = 52
const CIRC = 2 * Math.PI * R

export default function QuizEndScreen({
  totalXp,
  correct,
  total,
  bestStreak,
  isLoggedIn,
  saved,
  savedTotalXp,
  savedStreak,
  reduced,
  onRetry,
  onExit,
}: QuizEndScreenProps) {
  const accuracy = total > 0 ? Math.round((correct / total) * 100) : 0
  const [shownXp, setShownXp] = useState(reduced ? totalXp : 0)

  // XP count-up 0 → total
  useEffect(() => {
    if (reduced) {
      setShownXp(totalXp)
      return
    }
    const controls = animate(0, totalXp, {
      duration: 1.2,
      ease: 'easeOut',
      onUpdate: (v) => setShownXp(Math.round(v)),
    })
    return () => controls.stop()
  }, [totalXp, reduced])

  // Confetti besar bila akurasi > 80%
  useEffect(() => {
    if (accuracy <= 80 || reduced) return
    const t = setTimeout(() => {
      confetti({
        particleCount: 160,
        spread: 100,
        startVelocity: 45,
        origin: { x: 0.5, y: 0.4 },
        colors: CONFETTI_COLORS,
        disableForReducedMotion: true,
      })
    }, 350)
    return () => clearTimeout(t)
  }, [accuracy, reduced])

  return (
    <motion.div
      initial={reduced ? false : { y: 48, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ type: 'spring', stiffness: 260, damping: 26 }}
      className="w-full max-w-[480px] mx-auto rounded-2xl p-7 text-center"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <p className="text-[11px] tracking-[0.14em] uppercase mb-1" style={{ color: 'var(--gold)' }}>
        Hasil Kuis
      </p>
      <h2 className="font-serif text-[24px] font-semibold text-ink mb-5">お疲れさま！</h2>

      {/* Gauge akurasi */}
      <div className="relative w-[130px] h-[130px] mx-auto mb-5">
        <svg width="130" height="130" viewBox="0 0 130 130" className="-rotate-90">
          <circle cx="65" cy="65" r={R} fill="none" stroke="var(--paper-dark)" strokeWidth="10" />
          <motion.circle
            cx="65"
            cy="65"
            r={R}
            fill="none"
            stroke="var(--gold)"
            strokeWidth="10"
            strokeLinecap="round"
            strokeDasharray={CIRC}
            initial={reduced ? false : { strokeDashoffset: CIRC }}
            animate={{ strokeDashoffset: CIRC * (1 - accuracy / 100) }}
            transition={{ duration: 1.1, ease: 'easeOut' }}
          />
        </svg>
        <div className="absolute inset-0 flex flex-col items-center justify-center">
          <span className="font-serif text-[30px] font-semibold text-ink tabular-nums">{accuracy}%</span>
          <span className="text-[11px] text-muted">akurasi</span>
        </div>
      </div>

      {/* Statistik */}
      <div className="grid grid-cols-3 gap-2 mb-6">
        {[
          { label: 'Benar', value: `${correct}/${total}`, color: 'var(--green)' },
          { label: 'XP', value: `+${shownXp}`, color: 'var(--gold)' },
          { label: 'Streak Tertinggi', value: `${bestStreak}`, color: 'var(--red)' },
        ].map((s) => (
          <div key={s.label} className="rounded-xl py-3" style={{ background: 'var(--paper-dark)' }}>
            <div className="font-serif text-[18px] font-semibold tabular-nums" style={{ color: s.color }}>
              {s.value}
            </div>
            <div className="text-[10.5px] text-muted mt-0.5">{s.label}</div>
          </div>
        ))}
      </div>

      {/* Status simpan XP */}
      <div className="mb-5 text-[12px]">
        {saved ? (
          <span className="inline-flex items-center gap-1.5" style={{ color: 'var(--green)' }}>
            <Icon name="sparkles" className="w-3.5 h-3.5" />
            XP ditambahkan ke akunmu
            {typeof savedTotalXp === 'number' && (
              <span className="text-muted">· total {savedTotalXp} XP{typeof savedStreak === 'number' ? ` · streak ${savedStreak}` : ''}</span>
            )}
          </span>
        ) : isLoggedIn ? (
          <span className="text-muted">XP belum tersimpan. Coba lagi nanti.</span>
        ) : (
          <span className="text-muted">
            <Link href="/login" className="underline" style={{ color: 'var(--gold)' }}>Masuk</Link>{' '}
            untuk menyimpan XP &amp; streak ke akunmu.
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
          <Icon name="play" className="w-4 h-4" /> Coba Lagi
        </button>
        {onExit && (
          <button
            type="button"
            onClick={onExit}
            className="text-[14px] px-5 py-2.5 rounded-xl cursor-pointer text-ink hover:bg-paper-dark transition-colors"
            style={{ border: '0.5px solid var(--border)' }}
          >
            Ganti Level
          </button>
        )}
      </div>
      <div className="mt-3">
        <Link href="/dashboard" className="text-[12px] text-muted no-underline hover:text-koto-text transition-colors">
          Ke Dashboard
        </Link>
      </div>
    </motion.div>
  )
}
