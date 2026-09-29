// KotonoHa Quiz Component
'use client'

import { motion } from 'framer-motion'
import { useRef } from 'react'
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
export default function QuizOption({ option, state, disabled, reduced, onSelect }: QuizOptionProps) {
  const ref = useRef<HTMLButtonElement>(null)

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
