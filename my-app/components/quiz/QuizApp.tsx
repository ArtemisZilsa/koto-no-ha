// KotonoHa Quiz Component
'use client'

import { useCallback, useState } from 'react'
import { QUIZ_LEVELS, type QuizItem, type QuizMode } from '@/lib/data/quiz'
import type { JLPTLevel } from '@/lib/data/types'
import type { AwardXpResult } from '@/app/actions/quiz'
import QuizStart from './QuizStart'
import QuizEngine from './QuizEngine'

type LevelChoice = JLPTLevel | 'random'

interface QuizAppProps {
  isLoggedIn: boolean
  awardAction: (xp: number) => Promise<AwardXpResult>
  loadAction: (mode: QuizMode, level: JLPTLevel) => Promise<QuizItem[]>
}

export default function QuizApp({ isLoggedIn, awardAction, loadAction }: QuizAppProps) {
  const [phase, setPhase] = useState<'start' | 'play'>('start')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [pool, setPool] = useState<QuizItem[]>([])
  const [mode, setMode] = useState<QuizMode>('kanji')
  const [level, setLevel] = useState<JLPTLevel>('N5')

  const start = useCallback(
    async (m: QuizMode, lv: LevelChoice) => {
      setLoading(true)
      setError(null)
      const resolved: JLPTLevel =
        lv === 'random' ? QUIZ_LEVELS[Math.floor(Math.random() * QUIZ_LEVELS.length)] : lv
      try {
        const items = await loadAction(m, resolved)
        if (items.length < 4) {
          setError('Soal belum cukup untuk pilihan ini. Coba level atau jenis lain.')
          return
        }
        setPool(items)
        setMode(m)
        setLevel(resolved)
        setPhase('play')
      } catch {
        setError('Gagal memuat soal. Coba lagi.')
      } finally {
        setLoading(false)
      }
    },
    [loadAction],
  )

  const exit = useCallback(() => {
    setPhase('start')
    setPool([])
  }, [])

  if (phase === 'play') {
    return (
      <QuizEngine
        pool={pool}
        mode={mode}
        level={level}
        isLoggedIn={isLoggedIn}
        awardAction={awardAction}
        onExit={exit}
      />
    )
  }

  return <QuizStart loading={loading} error={error} onStart={start} />
}
