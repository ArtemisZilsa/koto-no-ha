'use client'

import { useCallback, useState } from 'react'
import { AnimatePresence, motion } from 'framer-motion'
import type { ReviewResult, SrsCard as SrsCardType, SrsLevelChoice, SrsType } from '@/lib/data/srs'
import SrsStart from './SrsStart'
import SrsCard from './SrsCard'
import SrsEndScreen from './SrsEndScreen'

function isReducedMotion(): boolean {
  if (typeof window === 'undefined') return false
  return (
    window.matchMedia('(prefers-reduced-motion: reduce)').matches ||
    document.documentElement.classList.contains('no-anim')
  )
}

interface SrsAppProps {
  isLoggedIn: boolean
  dueCount: number
  loadAction: (level: SrsLevelChoice, type: SrsType) => Promise<SrsCardType[]>
  reviewAction: (cardId: string, known: boolean) => Promise<ReviewResult>
}

export default function SrsApp({ isLoggedIn, dueCount, loadAction, reviewAction }: SrsAppProps) {
  const [phase, setPhase] = useState<'start' | 'review' | 'done'>('start')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [reduced] = useState(isReducedMotion)

  const [pool, setPool] = useState<SrsCardType[]>([])
  const [index, setIndex] = useState(0)
  const [known, setKnown] = useState(0)
  const [lastSaved, setLastSaved] = useState<ReviewResult | null>(null)

  const start = useCallback(
    async (type: SrsType, level: SrsLevelChoice) => {
      setLoading(true)
      setError(null)
      try {
        const cards = await loadAction(level, type)
        if (cards.length === 0) {
          setError('Kartu belum tersedia untuk pilihan ini. Coba jenis atau level lain.')
          return
        }
        setPool(cards)
        setIndex(0)
        setKnown(0)
        setLastSaved(null)
        setPhase('review')
      } catch {
        setError('Gagal memuat kartu. Coba lagi.')
      } finally {
        setLoading(false)
      }
    },
    [loadAction],
  )

  const review = useCallback(
    (isKnown: boolean) => {
      const card = pool[index]
      if (!card) return
      if (isKnown) setKnown((k) => k + 1)

      // Simpan di latar (tak menghambat UI). Hanya berdampak bila login.
      void reviewAction(card.id, isKnown)
        .then((res) => {
          if (res.saved) setLastSaved(res)
        })
        .catch(() => {})

      if (index + 1 >= pool.length) {
        setPhase('done')
      } else {
        setIndex((i) => i + 1)
      }
    },
    [pool, index, reviewAction],
  )

  const retry = useCallback(() => {
    setPhase('start')
    setPool([])
    setIndex(0)
    setKnown(0)
    setLastSaved(null)
  }, [])

  if (phase === 'done') {
    return (
      <SrsEndScreen
        known={known}
        total={pool.length}
        xpGained={known * 2}
        isLoggedIn={isLoggedIn}
        saved={lastSaved?.saved ?? false}
        savedTotalXp={lastSaved?.totalXp}
        savedStreak={lastSaved?.streakDays}
        reduced={reduced}
        onRetry={retry}
        onExit={retry}
      />
    )
  }

  if (phase === 'review') {
    const card = pool[index]
    return (
      <div className="w-full max-w-[480px] mx-auto">
        {/* Header sesi */}
        <div className="flex items-center justify-between mb-2.5">
          <button
            type="button"
            onClick={retry}
            className="text-[12px] text-muted hover:text-koto-text transition-colors cursor-pointer"
          >
            ← Ganti pilihan
          </button>
          <span className="text-[12px] text-muted">
            Kartu <span className="font-semibold text-ink tabular-nums">{index + 1}</span> / {pool.length}
          </span>
        </div>

        {/* Progress bar */}
        <div className="h-1.5 rounded-full mb-5 overflow-hidden" style={{ background: 'var(--paper-dark)' }}>
          <motion.div
            className="h-full rounded-full"
            style={{ background: 'var(--gold)' }}
            initial={false}
            animate={{ width: `${((index) / pool.length) * 100}%` }}
            transition={{ duration: reduced ? 0 : 0.3, ease: 'easeOut' }}
          />
        </div>

        <AnimatePresence mode="wait">
          <motion.div
            key={card.id}
            initial={reduced ? false : { x: 60, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            exit={reduced ? undefined : { x: -60, opacity: 0 }}
            transition={{ duration: 0.28, ease: 'easeOut' }}
          >
            <SrsCard card={card} reduced={reduced} onReview={review} />
          </motion.div>
        </AnimatePresence>
      </div>
    )
  }

  return (
    <SrsStart
      loading={loading}
      error={error}
      isLoggedIn={isLoggedIn}
      dueCount={dueCount}
      onStart={start}
    />
  )
}
