// KotonoHa Quiz Component
'use client'

import { motion } from 'framer-motion'
import { useEffect, useRef } from 'react'
import confetti from 'canvas-confetti'
import type { QuizItem } from '@/lib/data/quiz'

export type OptionState = 'idle' | 'correct' | 'wrong' | 'revealCorrect'

interface QuizOptionProps {
  option: QuizItem
  state: OptionState
  disabled: boolean
  reduced?: boolean
  onSelect: () => void
}

// canvas tidak membaca CSS var → pakai hex brand konkret.
const CONFETTI_COLORS = ['#c9963c', '#2f7d4f', '#c8102e', '#d4a957']

export default function QuizOption({ option, state, disabled, reduced, onSelect }: QuizOptionProps) {
  const ref = useRef<HTMLButtonElement>(null)

  useEffect(() => {
    if (state !== 'correct' || reduced || !ref.current) return
    const r = ref.current.getBoundingClientRect()
    confetti({
      particleCount: 70,
      spread: 60,
      startVelocity: 34,
      gravity: 1.1,
      origin: {
        x: (r.left + r.width / 2) / window.innerWidth,
        y: (r.top + r.height / 2) / window.innerHeight,
      },
      colors: CONFETTI_COLORS,
      disableForReducedMotion: true,
    })
  }, [state, reduced])

  const isGreen = state === 'correct' || state === 'revealCorrect'
  const isRed = state === 'wrong'
  const bg = isGreen ? 'var(--green-bg)' : isRed ? 'var(--red-bg)' : 'var(--surface)'
  const borderColor = isGreen ? 'var(--green)' : isRed ? 'var(--red)' : 'var(--border)'
  const color = isGreen ? 'var(--green)' : isRed ? 'var(--red)' : 'var(--ink)'

  return (
    <motion.button
      ref={ref}
      type="button"
      disabled={disabled}
      onClick={onSelect}
      aria-label={option.meaning}
      className="w-full text-left rounded-xl px-4 py-3.5 text-[16px] font-medium cursor-pointer disabled:cursor-default focus-visible:outline-none focus-visible:ring-2"
      style={{ background: bg, border: `1px solid ${borderColor}`, color }}
      whileHover={!disabled && !reduced ? { scale: 1.03, boxShadow: '0 0 0 2px var(--gold)' } : undefined}
      whileTap={!disabled ? { scale: 0.98 } : undefined}
      animate={
        reduced
          ? undefined
          : state === 'correct'
            ? { y: [0, -4, 0] }
            : state === 'wrong'
              ? { x: [0, -8, 8, -8, 8, 0] }
              : { x: 0, y: 0 }
      }
      transition={{ duration: state === 'wrong' ? 0.4 : 0.3 }}
    >
      {option.meaning}
    </motion.button>
  )
}
