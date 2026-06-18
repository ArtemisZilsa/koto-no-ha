// KotonoHa Quiz Component
'use client'

import { useCallback, useEffect, useRef, useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { pickQuizSet, buildOptions, type QuizKanji } from '@/lib/data/quizKanji'
import type { AwardXpResult } from '@/app/actions/quiz'
import TimerBar from './TimerBar'
import StreakCounter from './StreakCounter'
import QuizOption, { type OptionState } from './QuizOption'
import QuizEndScreen from './QuizEndScreen'

const TOTAL_Q = 10
const TIME_PER_Q = 10 // detik
const BONUS_UNDER = 3 // detik untuk bonus kecepatan
const BASE_XP = 10
const BONUS_XP = 5
const STREAK_MULT_AT = 3
const STREAK_MULT = 1.5
const FEEDBACK_MS = 1500

interface Round {
  kanji: QuizKanji
  options: QuizKanji[]
}

interface KanjiQuizProps {
  isLoggedIn: boolean
  awardAction: (xp: number) => Promise<AwardXpResult>
}

function isReducedMotion(): boolean {
  if (typeof window === 'undefined') return false
  return (
    window.matchMedia('(prefers-reduced-motion: reduce)').matches ||
    document.documentElement.classList.contains('no-anim')
  )
}

function makeRounds(): Round[] {
  return pickQuizSet(TOTAL_Q).map((k) => ({ kanji: k, options: buildOptions(k) }))
}

export default function KanjiQuiz({ isLoggedIn, awardAction }: KanjiQuizProps) {
  const [reduced, setReduced] = useState(false)
  const [rounds, setRounds] = useState<Round[]>([])
  const [index, setIndex] = useState(0)
  const [selected, setSelected] = useState<string | null>(null)
  const [answered, setAnswered] = useState(false)
  const [correctCount, setCorrectCount] = useState(0)
  const [xp, setXp] = useState(0)
  const [streak, setStreak] = useState(0)
  const [bestStreak, setBestStreak] = useState(0)
  const [done, setDone] = useState(false)
  const [fraction, setFraction] = useState(1)
  const [award, setAward] = useState<AwardXpResult | null>(null)

  const startRef = useRef(0)
  const rafRef = useRef<number | null>(null)
  const advanceRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const answerRef = useRef<(id: string | null) => void>(() => {})

  // Inisialisasi di klien (random → hindari mismatch hydration).
  useEffect(() => {
    setReduced(isReducedMotion())
    setRounds(makeRounds())
  }, [])

  const round = rounds[index]

  const finish = useCallback(
    async (finalXp: number) => {
      setDone(true)
      if (!isLoggedIn) {
        setAward({ saved: false })
        return
      }
      try {
        setAward(await awardAction(finalXp))
      } catch {
        setAward({ saved: false })
      }
    },
    [isLoggedIn, awardAction],
  )

  const handleAnswer = useCallback(
    (pickedId: string | null) => {
      if (answered || !round) return
      if (rafRef.current) cancelAnimationFrame(rafRef.current)
      setAnswered(true)
      setSelected(pickedId)

      const elapsed = (performance.now() - startRef.current) / 1000
      const isCorrect = pickedId === round.kanji.id

      let gained = 0
      if (isCorrect) {
        const newStreak = streak + 1
        setStreak(newStreak)
        setBestStreak((b) => Math.max(b, newStreak))
        setCorrectCount((c) => c + 1)
        gained = BASE_XP + (elapsed <= BONUS_UNDER ? BONUS_XP : 0)
        if (newStreak >= STREAK_MULT_AT) gained = Math.round(gained * STREAK_MULT)
      } else {
        setStreak(0)
      }
      const newXp = xp + gained
      setXp(newXp)

      advanceRef.current = setTimeout(() => {
        if (index + 1 >= rounds.length) {
          void finish(newXp)
        } else {
          setIndex((i) => i + 1)
          setSelected(null)
          setAnswered(false)
        }
      }, FEEDBACK_MS)
    },
    [answered, round, streak, xp, index, rounds.length, finish],
  )

  // Selalu pegang versi terbaru untuk dipanggil dari rAF.
  useEffect(() => {
    answerRef.current = handleAnswer
  }, [handleAnswer])

  // Timer per soal (requestAnimationFrame).
  useEffect(() => {
    if (!round || done || answered) return
    startRef.current = performance.now()
    setFraction(1)
    const tick = (now: number) => {
      const elapsed = (now - startRef.current) / 1000
      const f = Math.max(0, 1 - elapsed / TIME_PER_Q)
      setFraction(f)
      if (f <= 0) {
        answerRef.current(null) // waktu habis = salah
        return
      }
      rafRef.current = requestAnimationFrame(tick)
    }
    rafRef.current = requestAnimationFrame(tick)
    return () => {
      if (rafRef.current) cancelAnimationFrame(rafRef.current)
    }
  }, [index, round, done, answered])

  // Bersih-bersih timeout saat unmount.
  useEffect(() => () => {
    if (advanceRef.current) clearTimeout(advanceRef.current)
  }, [])

  const retry = useCallback(() => {
    if (advanceRef.current) clearTimeout(advanceRef.current)
    setRounds(makeRounds())
    setIndex(0)
    setSelected(null)
    setAnswered(false)
    setCorrectCount(0)
    setXp(0)
    setStreak(0)
    setBestStreak(0)
    setDone(false)
    setAward(null)
    setFraction(1)
  }, [])

  // Loading (sebelum rounds siap di klien)
  if (rounds.length === 0) {
    return (
      <div className="w-full max-w-[480px] mx-auto h-[420px] rounded-2xl animate-pulse" style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }} />
    )
  }

  if (done) {
    return (
      <QuizEndScreen
        totalXp={xp}
        correct={correctCount}
        total={rounds.length}
        bestStreak={bestStreak}
        isLoggedIn={isLoggedIn}
        saved={award?.saved ?? false}
        savedTotalXp={award?.totalXp}
        savedStreak={award?.streakDays}
        reduced={reduced}
        onRetry={retry}
      />
    )
  }

  const optionState = (o: QuizKanji): OptionState => {
    if (!answered || !round) return 'idle'
    if (o.id === round.kanji.id) return selected === o.id ? 'correct' : 'revealCorrect'
    if (o.id === selected) return 'wrong'
    return 'idle'
  }

  return (
    <div className="w-full max-w-[480px] mx-auto">
      {/* Header: progress + XP */}
      <div className="flex items-center justify-between mb-2.5">
        <span className="text-[12px] text-muted">
          Soal <span className="font-semibold text-ink tabular-nums">{index + 1}</span> dari {rounds.length}
        </span>
        <div className="flex items-center gap-3">
          <StreakCounter streak={streak} reduced={reduced} />
          <div className="inline-flex items-center gap-1 text-[12px]" style={{ color: 'var(--gold)' }}>
            <span>XP</span>
            <motion.span
              key={xp}
              initial={reduced ? false : { scale: 1.5 }}
              animate={{ scale: 1 }}
              transition={{ type: 'spring', stiffness: 520, damping: 16 }}
              className="font-semibold tabular-nums"
            >
              {xp}
            </motion.span>
          </div>
        </div>
      </div>

      <div className="mb-4">
        <TimerBar fraction={fraction} reduced={reduced} />
      </div>

      {/* Kartu soal */}
      <AnimatePresence mode="wait">
        <motion.div
          key={index}
          initial={reduced ? false : { x: 80, opacity: 0 }}
          animate={{ x: 0, opacity: 1 }}
          exit={reduced ? undefined : { x: -80, opacity: 0 }}
          transition={{ duration: 0.3, ease: 'easeOut' }}
          className="relative rounded-2xl p-7 mb-4"
          style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
        >
          {/* Level badge */}
          <span
            className="absolute top-3.5 right-3.5 text-[10px] font-medium px-2.5 py-0.5 rounded-full"
            style={{ background: 'var(--gold-bg)', color: 'var(--gold)' }}
          >
            {round.kanji.level}
          </span>

          {/* Kanji + furigana + romaji */}
          <div className="text-center py-3 select-none">
            <div className="text-[13px] mb-1" style={{ color: 'var(--muted)' }}>
              {round.kanji.furigana}
            </div>
            <div className="font-serif font-semibold text-ink leading-none" style={{ fontSize: '84px' }}>
              {round.kanji.kanji}
            </div>
            <div className="text-[12px] tracking-wide mt-2" style={{ color: 'var(--gold)' }}>
              {round.kanji.romaji}
            </div>
          </div>
          <p className="text-center text-[12.5px] mt-1" style={{ color: 'var(--muted)' }}>
            Apa arti kanji ini?
          </p>
        </motion.div>
      </AnimatePresence>

      {/* Opsi jawaban */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
        {round.options.map((o) => (
          <QuizOption
            key={o.id}
            option={o}
            state={optionState(o)}
            disabled={answered}
            reduced={reduced}
            onSelect={() => handleAnswer(o.id)}
          />
        ))}
      </div>
    </div>
  )
}
