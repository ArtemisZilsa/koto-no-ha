'use client'

import Link from 'next/link'
import { useCallback, useEffect, useMemo, useRef, useState, useSyncExternalStore } from 'react'
import {
  CATEGORY_META,
  percent,
  shuffle,
  type PracticeAnswer,
  type PracticeCategory,
  type PracticeQuestion,
} from '@/lib/data/practice'
import type { RecordAnswersResult } from '@/app/actions/practice'

const TIMER_SECONDS = 15
const TIMER_PREF_KEY = 'koto-drill-timer'

// Preferensi timer diingat per perangkat; default OFF (juga saat SSR/storage diblokir).
const noopSubscribe = () => () => {}
function readTimerPref(): boolean {
  try {
    return localStorage.getItem(TIMER_PREF_KEY) === '1'
  } catch {
    return false
  }
}

interface PracticeDrillProps {
  questions: PracticeQuestion[]
  /** Judul kecil di atas soal, mis. "Kosakata N4 · Set 3". */
  title: string
  isLoggedIn: boolean
  recordAction: (answers: PracticeAnswer[]) => Promise<RecordAnswersResult>
  /** Tujuan tombol "Lanjut ke set berikutnya"; kosong = set terakhir. */
  nextHref?: string
  /** Tujuan tombol kembali (daftar set). */
  backHref: string
}

type Status = 'playing' | 'done'

/** Acak ulang urutan soal dan opsi untuk tombol "Ulangi". */
function reshuffle(qs: PracticeQuestion[]): PracticeQuestion[] {
  return shuffle(qs).map((q) => {
    const correct = q.options[q.answerIndex]
    const options = shuffle(q.options)
    return { ...q, options, answerIndex: options.indexOf(correct) }
  })
}

function promptSize(text: string): string {
  if (text.length <= 2) return 'text-[64px] md:text-[76px]'
  if (text.length <= 5) return 'text-[44px] md:text-[52px]'
  if (text.length <= 10) return 'text-[30px] md:text-[36px]'
  return 'text-[22px] md:text-[26px]'
}

export default function PracticeDrill({
  questions: initial,
  title,
  isLoggedIn,
  recordAction,
  nextHref,
  backHref,
}: PracticeDrillProps) {
  const [questions, setQuestions] = useState(initial)
  const [index, setIndex] = useState(0)
  /** Opsi yang dipilih; -1 = waktu habis; null = belum menjawab. */
  const [picked, setPicked] = useState<number | null>(null)
  const [answers, setAnswers] = useState<PracticeAnswer[]>([])
  const [missed, setMissed] = useState<PracticeQuestion[]>([])
  const [status, setStatus] = useState<Status>('playing')
  const [record, setRecord] = useState<RecordAnswersResult | null>(null)
  const storedTimer = useSyncExternalStore(noopSubscribe, readTimerPref, () => false)
  const [timerOverride, setTimerOverride] = useState<boolean | null>(null)
  const timerOn = timerOverride ?? storedTimer
  const [remaining, setRemaining] = useState(TIMER_SECONDS)
  const nextBtnRef = useRef<HTMLButtonElement>(null)

  const q = questions[index]
  const answered = picked !== null

  const toggleTimer = () => {
    const next = !timerOn
    setTimerOverride(next)
    setRemaining(TIMER_SECONDS)
    try {
      localStorage.setItem(TIMER_PREF_KEY, next ? '1' : '0')
    } catch {
      /* abaikan */
    }
  }

  const answer = useCallback(
    (choice: number) => {
      if (answered || !q) return
      const isCorrect = choice === q.answerIndex
      setPicked(choice)
      setAnswers((a) => [...a, { itemId: q.itemId, category: q.category, level: q.level, isCorrect }])
      if (!isCorrect) setMissed((m) => [...m, q])
    },
    [answered, q],
  )

  // Hitung mundur hanya saat timer ON dan soal belum dijawab.
  useEffect(() => {
    if (!timerOn || answered || status !== 'playing') return
    const started = Date.now()
    const id = setInterval(() => {
      const left = TIMER_SECONDS - Math.floor((Date.now() - started) / 1000)
      setRemaining(Math.max(0, left))
      if (left <= 0) {
        clearInterval(id)
        answer(-1)
      }
    }, 250)
    return () => clearInterval(id)
  }, [timerOn, answered, status, index, answer])

  useEffect(() => {
    if (answered) nextBtnRef.current?.focus()
  }, [answered])

  const finish = useCallback(async (all: PracticeAnswer[]) => {
    setStatus('done')
    if (!isLoggedIn) return
    try {
      setRecord(await recordAction(all))
    } catch {
      setRecord({ saved: false, error: 'Gagal menyimpan progres. Coba lagi.' })
    }
  }, [isLoggedIn, recordAction])

  const next = () => {
    if (!answered) return
    if (index + 1 >= questions.length) {
      void finish(answers)
      return
    }
    setIndex((i) => i + 1)
    setPicked(null)
    setRemaining(TIMER_SECONDS)
  }

  // Keyboard: 1–4 memilih opsi, Enter lanjut.
  useEffect(() => {
    if (status !== 'playing') return
    const onKey = (e: KeyboardEvent) => {
      if (e.target instanceof HTMLElement && ['INPUT', 'TEXTAREA'].includes(e.target.tagName)) return
      const n = Number(e.key)
      if (!answered && n >= 1 && n <= 4) answer(n - 1)
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [status, answered, answer])

  const retry = () => {
    setQuestions(reshuffle(initial))
    setIndex(0)
    setPicked(null)
    setAnswers([])
    setMissed([])
    setRecord(null)
    setRemaining(TIMER_SECONDS)
    setStatus('playing')
  }

  if (questions.length === 0) {
    return (
      <p className="text-center text-[14px]" style={{ color: 'var(--muted)' }}>
        Soal untuk set ini belum tersedia.
      </p>
    )
  }

  if (status === 'done') {
    return (
      <DrillSummary
        answers={answers}
        missed={missed}
        isLoggedIn={isLoggedIn}
        record={record}
        onRetry={retry}
        nextHref={nextHref}
        backHref={backHref}
      />
    )
  }

  const optionStyle = (i: number): React.CSSProperties => {
    const base: React.CSSProperties = { border: '1px solid var(--brand-line)', background: 'var(--surface)', color: 'var(--text)' }
    if (!answered) return base
    if (i === q.answerIndex) return { ...base, border: '1px solid var(--green)', background: 'var(--green-bg)', color: 'var(--green)' }
    if (i === picked) return { ...base, border: '1px solid var(--crimson)', background: 'var(--red-bg)', color: 'var(--crimson)' }
    return { ...base, opacity: 0.55 }
  }

  const isCorrect = answered && picked === q.answerIndex

  return (
    <div className="w-full max-w-[560px] mx-auto">
      {/* Header: judul set + toggle timer */}
      <div className="flex items-center justify-between gap-3 mb-3">
        <Link href={backHref} className="text-[12px] no-underline hover:opacity-70" style={{ color: 'var(--muted)' }}>
          ← {title}
        </Link>
        <button
          type="button"
          role="switch"
          aria-checked={timerOn}
          onClick={toggleTimer}
          className="inline-flex items-center gap-2 text-[12px] cursor-pointer"
          style={{ color: 'var(--muted)' }}
        >
          Timer
          <span
            className="relative inline-block w-8 h-[18px] rounded-full transition-colors"
            style={{ background: timerOn ? 'var(--crimson)' : 'var(--brand-line)' }}
          >
            <span
              className="absolute top-[2px] w-[14px] h-[14px] rounded-full transition-all"
              style={{ left: timerOn ? '16px' : '2px', background: 'var(--brand-bg)' }}
            />
          </span>
        </button>
      </div>

      {/* Indikator progres dalam set */}
      <div className="flex items-baseline justify-between mb-2 text-[12px]" style={{ color: 'var(--muted)' }}>
        <span>
          Soal <span className="font-semibold tabular-nums" style={{ color: 'var(--text)' }}>{index + 1}</span>/{questions.length}
        </span>
        {timerOn && !answered && (
          <span className="tabular-nums" style={{ color: remaining <= 5 ? 'var(--crimson)' : 'var(--muted)' }}>
            {remaining} dtk
          </span>
        )}
      </div>
      <div className="h-[3px] w-full rounded-full mb-8 overflow-hidden" style={{ background: 'var(--brand-line)' }}>
        <div
          className="h-full transition-[width] duration-300"
          style={{ width: `${((index + (answered ? 1 : 0)) / questions.length) * 100}%`, background: 'var(--crimson)' }}
        />
      </div>

      {/* Soal */}
      <div className="text-center mb-8">
        {q.reading && q.reading !== q.prompt && (
          <div lang="ja" className="font-serif text-[14px] mb-2" style={{ color: 'var(--muted)' }}>
            {q.reading}
          </div>
        )}
        <div lang="ja" className={`font-serif font-semibold leading-tight break-words ${promptSize(q.prompt)}`} style={{ color: 'var(--text)' }}>
          {q.prompt}
        </div>
        <p className="text-[13px] mt-4" style={{ color: 'var(--muted)' }}>{q.question}</p>
      </div>

      {/* Opsi */}
      <div className="grid grid-cols-1 gap-2.5" role="group" aria-label="Pilihan jawaban">
        {q.options.map((opt, i) => (
          <button
            key={`${index}-${i}`}
            type="button"
            disabled={answered}
            onClick={() => answer(i)}
            className="flex items-center gap-3 w-full text-left rounded-xl px-4 py-3.5 text-[14.5px] leading-snug transition-colors enabled:cursor-pointer enabled:hover:border-[var(--crimson)]"
            style={optionStyle(i)}
          >
            <span className="text-[11px] tabular-nums shrink-0 w-4" style={{ color: 'var(--muted)' }}>{i + 1}</span>
            <span className="flex-1">{opt}</span>
          </button>
        ))}
      </div>

      {/* Feedback inline + tombol Berikutnya */}
      <div className="min-h-[88px] mt-5" aria-live="polite">
        {answered && (
          <div className="flex items-center justify-between gap-4">
            <p className="text-[13.5px]" style={{ color: isCorrect ? 'var(--green)' : 'var(--crimson)' }}>
              {isCorrect ? 'Benar.' : picked === -1 ? 'Waktu habis.' : 'Belum tepat.'}
              {!isCorrect && (
                <span style={{ color: 'var(--muted)' }}> Jawaban: {q.options[q.answerIndex]}</span>
              )}
            </p>
            <button
              ref={nextBtnRef}
              type="button"
              onClick={next}
              className="shrink-0 rounded-xl px-5 py-2.5 text-[13.5px] font-medium cursor-pointer hover:opacity-90"
              style={{ background: 'var(--crimson)', color: '#fafafa' }}
            >
              {index + 1 >= questions.length ? 'Lihat hasil' : 'Berikutnya'}
            </button>
          </div>
        )}
      </div>
    </div>
  )
}

interface DrillSummaryProps {
  answers: PracticeAnswer[]
  missed: PracticeQuestion[]
  isLoggedIn: boolean
  record: RecordAnswersResult | null
  onRetry: () => void
  nextHref?: string
  backHref: string
}

function DrillSummary({ answers, missed, isLoggedIn, record, onRetry, nextHref, backHref }: DrillSummaryProps) {
  const correct = answers.filter((a) => a.isCorrect).length

  // Akurasi per kategori; kategori < 70% dianggap lemah.
  const byCategory = useMemo(() => {
    const m = new Map<PracticeCategory, { right: number; all: number }>()
    for (const a of answers) {
      const cur = m.get(a.category) ?? { right: 0, all: 0 }
      cur.all += 1
      if (a.isCorrect) cur.right += 1
      m.set(a.category, cur)
    }
    return [...m.entries()].map(([category, v]) => ({ category, ...v, pct: percent(v.right, v.all) }))
  }, [answers])
  const weak = byCategory.filter((c) => c.pct < 70)

  return (
    <div className="w-full max-w-[560px] mx-auto">
      <p className="text-[11px] tracking-[0.14em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
        結果 · Hasil
      </p>
      <div className="flex items-baseline gap-3 mb-1">
        <span className="font-serif text-[56px] font-semibold leading-none tabular-nums" style={{ color: 'var(--text)' }}>
          {correct}
        </span>
        <span className="text-[16px]" style={{ color: 'var(--muted)' }}>/ {answers.length} benar</span>
      </div>
      <p className="text-[13px] mb-8" style={{ color: 'var(--muted)' }}>
        Akurasi {percent(correct, answers.length)}%.{' '}
        {!isLoggedIn
          ? 'Masuk untuk menyimpan progres ke akunmu.'
          : record === null
            ? 'Menyimpan progres…'
            : record.saved
              ? 'Progres tersimpan.'
              : record.error ?? 'Progres tidak tersimpan.'}
      </p>

      <div className="mb-8" style={{ borderTop: '1px solid var(--brand-line)' }}>
        {byCategory.map((c) => (
          <div
            key={c.category}
            className="flex items-center justify-between py-3 text-[13.5px]"
            style={{ borderBottom: '1px solid var(--brand-line)' }}
          >
            <span style={{ color: 'var(--text)' }}>{CATEGORY_META[c.category].label}</span>
            <span className="tabular-nums" style={{ color: c.pct < 70 ? 'var(--crimson)' : 'var(--muted)' }}>
              {c.right}/{c.all} · {c.pct}%
            </span>
          </div>
        ))}
        {weak.length > 0 && (
          <p className="text-[12.5px] mt-3" style={{ color: 'var(--crimson)' }}>
            Perlu diulang: {weak.map((w) => CATEGORY_META[w.category].label).join(', ')}.
          </p>
        )}
      </div>

      {missed.length > 0 && (
        <div className="mb-10">
          <h2 className="text-[13px] font-semibold mb-3" style={{ color: 'var(--text)' }}>
            Soal yang terlewat ({missed.length})
          </h2>
          <ul className="grid grid-cols-1 sm:grid-cols-2 gap-x-6">
            {missed.map((m) => (
              <li
                key={m.itemId}
                className="flex items-baseline justify-between gap-3 py-2 text-[13px]"
                style={{ borderBottom: '1px solid var(--brand-line)' }}
              >
                <span lang="ja" className="font-serif" style={{ color: 'var(--text)' }}>{m.prompt}</span>
                <span className="text-right" style={{ color: 'var(--muted)' }}>{m.options[m.answerIndex]}</span>
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="flex flex-wrap items-center gap-3">
        <button
          type="button"
          onClick={onRetry}
          className="rounded-xl px-5 py-2.5 text-[13.5px] font-medium cursor-pointer hover:opacity-80"
          style={{ border: '1px solid var(--crimson)', color: 'var(--crimson)', background: 'transparent' }}
        >
          Ulangi set ini
        </button>
        {nextHref ? (
          <Link
            href={nextHref}
            className="rounded-xl px-5 py-2.5 text-[13.5px] font-medium no-underline hover:opacity-90"
            style={{ background: 'var(--crimson)', color: '#fafafa' }}
          >
            Lanjut ke set berikutnya
          </Link>
        ) : null}
        <Link href={backHref} className="text-[13px] no-underline ml-auto hover:opacity-70" style={{ color: 'var(--muted)' }}>
          Kembali ke daftar set
        </Link>
      </div>
    </div>
  )
}
