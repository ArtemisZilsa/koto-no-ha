'use client'

import { useState } from 'react'
import type { DokkaiQuestion } from '@/lib/types/database.types'
import { Icon } from '@/components/ui/Icon'

/** Soal pemahaman pilihan ganda dengan koreksi + penjelasan. */
export default function Questions({
  questions,
  accentColor,
}: {
  questions: DokkaiQuestion[]
  accentColor: string
}) {
  // Jawaban terpilih per soal (index opsi), null = belum dijawab.
  const [picked, setPicked] = useState<(number | null)[]>(() => questions.map(() => null))

  if (!questions || questions.length === 0) return null

  function choose(qi: number, oi: number) {
    setPicked((prev) => {
      if (prev[qi] !== null) return prev // sudah dijawab, kunci
      const next = [...prev]
      next[qi] = oi
      return next
    })
  }

  return (
    <div className="flex flex-col gap-6">
      {questions.map((q, qi) => {
        const answered = picked[qi] !== null
        return (
          <div key={qi}>
            <div className="font-serif text-[15px] font-medium text-ink mb-3">
              <span style={{ color: accentColor }}>{qi + 1}.</span> {q.q}
            </div>
            <div className="flex flex-col gap-2">
              {q.options.map((opt, oi) => {
                const isPicked = picked[qi] === oi
                const isCorrect = oi === q.answer
                let style: React.CSSProperties = {
                  background: 'var(--surface)',
                  border: '0.5px solid var(--border)',
                  color: 'var(--ink)',
                }
                if (answered && isCorrect) {
                  style = { background: 'var(--green-bg)', border: '1px solid var(--green)', color: 'var(--ink)' }
                } else if (answered && isPicked && !isCorrect) {
                  style = { background: 'var(--red-bg)', border: '1px solid var(--red)', color: 'var(--ink)' }
                }
                return (
                  <button
                    key={oi}
                    type="button"
                    onClick={() => choose(qi, oi)}
                    disabled={answered}
                    className="flex items-center justify-between gap-2 text-left text-[13.5px] px-4 py-2.5 rounded-xl transition-colors disabled:cursor-default cursor-pointer"
                    style={style}
                  >
                    <span>{opt}</span>
                    {answered && isCorrect && <Icon name="star" className="w-4 h-4 shrink-0" style={{ color: 'var(--green)' }} />}
                  </button>
                )
              })}
            </div>
            {answered && (
              <p
                className="text-[12.5px] mt-2.5 leading-relaxed rounded-lg px-3.5 py-2.5"
                style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
              >
                {picked[qi] === q.answer ? 'Benar! ' : 'Belum tepat. '}
                {q.explanation}
              </p>
            )}
          </div>
        )
      })}
    </div>
  )
}
