// KotonoHa Quiz Component
'use client'

import { motion, AnimatePresence } from 'framer-motion'
import { useEffect, useRef, useState } from 'react'
import { Icon } from '@/components/ui/Icon'

interface StreakCounterProps {
  streak: number
  reduced?: boolean
}

export default function StreakCounter({ streak, reduced }: StreakCounterProps) {
  const prev = useRef(streak)
  const [shake, setShake] = useState(false)

  useEffect(() => {
    if (prev.current > 0 && streak === 0 && !reduced) {
      setShake(true)
      const t = setTimeout(() => setShake(false), 420)
      prev.current = streak
      return () => clearTimeout(t)
    }
    prev.current = streak
  }, [streak, reduced])

  const hot = streak >= 3

  return (
    <motion.div
      className="inline-flex items-center gap-1.5 text-[12px]"
      animate={shake ? { x: [0, -4, 4, -4, 4, 0] } : { x: 0 }}
      transition={{ duration: 0.42 }}
      style={{ color: hot ? 'var(--red)' : 'var(--muted)' }}
    >
      <AnimatePresence>
        {hot && (
          <motion.span
            key="flame"
            initial={reduced ? false : { scale: 0, rotate: -25 }}
            animate={{ scale: 1, rotate: 0 }}
            exit={reduced ? undefined : { scale: 0 }}
            transition={{ type: 'spring', stiffness: 500, damping: 14 }}
            aria-hidden
          >
            <Icon name="flame" className="w-4 h-4" />
          </motion.span>
        )}
      </AnimatePresence>
      <span>Streak</span>
      <motion.span
        key={streak}
        initial={reduced ? false : { scale: 1.6 }}
        animate={{ scale: 1 }}
        transition={{ type: 'spring', stiffness: 520, damping: 16 }}
        className="tabular-nums font-semibold"
        style={{ color: hot ? 'var(--red)' : 'var(--ink)' }}
      >
        {streak}
      </motion.span>
    </motion.div>
  )
}
