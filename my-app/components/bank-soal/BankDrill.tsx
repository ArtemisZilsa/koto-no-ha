'use client'

import Link from 'next/link'
import { useCallback, useEffect, useRef, useState } from 'react'
import type { BankQuestion, SessionKind } from '@/lib/data/bankSoal'
import type { ActionResult, BankAnswer } from '@/app/actions/bankSoal'
import { percent, shuffle } from '@/lib/data/practice'

interface BankDrillProps {
  questions: BankQuestion[]
  title: string
  /** latihan: koreksi + penjelasan per soal. checkpoint: diskor, pembahasan di akhir. */
  kind: SessionKind
  recordAction: (answers: BankAnswer[]) => Promise<ActionResult>
  reportAction: (soalId: string, note: string) => Promise<ActionResult>
  nextHref?: string
  backHref: string
}

/** Instruksi per tipe soal tata bahasa (Excel tidak menyimpannya di kolom Soal). */
const INSTRUCTION: Record<string, string> = {
  'Pilih bentuk': 'Pilih jawaban yang tepat.',
  'Susun ★': 'Susun kalimat. Potongan mana yang masuk ke kotak ★?',
}

/** Kanji: "Apa arti kata berikut?\n一つ（ひとつ）" → instruksi + teks besar. */
function splitQuestion(q: BankQuestion): { instruction?: string; body: string } {
  const [first, ...rest] = q.question.split('\n')
  if (rest.length > 0) return { instruction: first, body: rest.join('\n') }
  return { instruction: INSTRUCTION[q.qtype], body: first }
}

function bodySize(text: string): string {
  if (text.length <= 6) return 'text-[40px] md:text-[48px]'
  if (text.length <= 14) return 'text-[26px] md:text-[30px]'
  return 'text-[18px] md:text-[21px]'
}

function reshuffle(qs: BankQuestion[]): BankQuestion[] {
  return shuffle(qs).map((q) => {
    const correct = q.options[q.answerIndex]
    const options = shuffle(q.options)
    return { ...q, options, answerIndex: options.indexOf(correct) }
  })
}

interface Picked {
  q: BankQuestion
  choice: number
}

export default function BankDrill({ questions: initial, title, kind, recordAction, reportAction, nextHref, backHref }: BankDrillProps) {
  const [questions, setQuestions] = useState(initial)
  const [index, setIndex] = useState(0)
  const [picked, setPicked] = useState<number | null>(null)
  const [log, setLog] = useState<Picked[]>([])
  const [done, setDone] = useState(false)
  const [record, setRecord] = useState<ActionResult | null>(null)
  const nextBtnRef = useRef<HTMLButtonElement>(null)

  const q = questions[index]
  const answered = picked !== null
  const reveal = answered && kind === 'latihan'

  const answer = useCallback(
    (choice: number) => {
      if (answered || !q) return
      setPicked(choice)
      setLog((l) => [...l, { q, choice }])
    },
    [answered, q],
  )

  const next = useCallback(async () => {
    if (!answered) return
    if (index + 1 < questions.length) {
      setIndex((i) => i + 1)
      setPicked(null)
      return
    }
    setDone(true)
    try {
      setRecord(await recordAction(log.map((p) => ({ soalId: p.q.id, isCorrect: p.choice === p.q.answerIndex }))))
    } catch {
      setRecord({ saved: false, error: 'Gagal menyimpan progres. Coba lagi.' })
    }
  }, [answered, index, questions.length, recordAction, log])

  // Checkpoint: langsung lanjut setelah memilih (tanpa koreksi), seperti ujian.
  useEffect(() => {
    if (kind !== 'checkpoint' || !answered) return
    const id = setTimeout(() => void next(), 250)
    return () => clearTimeout(id)
  }, [kind, answered, next])

  useEffect(() => {
    if (reveal) nextBtnRef.current?.focus()
  }, [reveal])

  // Keyboard: 1–4 memilih opsi.
  useEffect(() => {
    if (done) return
    const onKey = (e: KeyboardEvent) => {
      if (e.target instanceof HTMLElement && ['INPUT', 'TEXTAREA'].includes(e.target.tagName)) return
      const n = Number(e.key)
      if (!answered && n >= 1 && n <= 4) answer(n - 1)
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [done, answered, answer])

  const restart = (qs: BankQuestion[]) => {
    setQuestions(reshuffle(qs))
    setIndex(0)
    setPicked(null)
    setLog([])
    setRecord(null)
    setDone(false)
  }

  if (done) {
    return (
      <Summary
        log={log}
        kind={kind}
        record={record}
        reportAction={reportAction}
        onRetryAll={() => restart(initial)}
        onRetryMissed={(missed) => restart(missed)}
        nextHref={nextHref}
        backHref={backHref}
      />
    )
  }

  const { instruction, body } = splitQuestion(q)
  const isCorrect = answered && picked === q.answerIndex

  const optionStyle = (i: number): React.CSSProperties => {
    const base: React.CSSProperties = { border: '1px solid var(--brand-line)', background: 'var(--surface)', color: 'var(--text)' }
    if (!answered) return base
    if (!reveal) return i === picked ? { ...base, border: '1px solid var(--crimson)' } : { ...base, opacity: 0.55 }
    if (i === q.answerIndex) return { ...base, border: '1px solid var(--green)', background: 'var(--green-bg)', color: 'var(--green)' }
    if (i === picked) return { ...base, border: '1px solid var(--crimson)', background: 'var(--red-bg)', color: 'var(--crimson)' }
    return { ...base, opacity: 0.55 }
  }

  return (
    <div className="w-full max-w-[600px] mx-auto">
      <div className="flex items-center justify-between gap-3 mb-3 text-[12px]">
        <Link href={backHref} className="no-underline hover:opacity-70" style={{ color: 'var(--muted)' }}>
          ← {title}
        </Link>
        <span className="px-2 py-0.5 rounded-md" style={{ border: '1px solid var(--brand-line)', color: 'var(--muted)' }}>
          {kind === 'checkpoint' ? 'Checkpoint · diskor' : 'Latihan'}
        </span>
      </div>

      <div className="flex items-baseline justify-between mb-2 text-[12px]" style={{ color: 'var(--muted)' }}>
        <span>
          Soal <span className="font-semibold tabular-nums" style={{ color: 'var(--text)' }}>{index + 1}</span>/{questions.length}
        </span>
        <span className="tabular-nums">{q.code}</span>
      </div>
      <div className="h-[3px] w-full rounded-full mb-8 overflow-hidden" style={{ background: 'var(--brand-line)' }}>
        <div
          className="h-full transition-[width] duration-300"
          style={{ width: `${((index + (answered ? 1 : 0)) / questions.length) * 100}%`, background: 'var(--crimson)' }}
        />
      </div>

      <div className="text-center mb-8">
        {instruction && <p className="text-[13px] mb-3" style={{ color: 'var(--muted)' }}>{instruction}</p>}
        <div lang="ja" className={`font-serif font-semibold leading-snug break-words whitespace-pre-line ${bodySize(body)}`} style={{ color: 'var(--text)' }}>
          {body}
        </div>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5" role="group" aria-label="Pilihan jawaban">
        {q.options.map((opt, i) => (
          <button
            key={`${index}-${i}`}
            type="button"
            disabled={answered}
            onClick={() => answer(i)}
            className="flex items-center gap-3 w-full text-left rounded-xl px-4 py-3.5 text-[15px] leading-snug transition-colors enabled:cursor-pointer enabled:hover:border-[var(--crimson)]"
            style={optionStyle(i)}
          >
            <span className="text-[11px] tabular-nums shrink-0 w-4" style={{ color: 'var(--muted)' }}>{'ABCD'[i]}</span>
            <span lang="ja" className="flex-1">{opt}</span>
          </button>
        ))}
      </div>

      <div className="min-h-[120px] mt-5" aria-live="polite">
        {reveal && (
          <div className="rounded-xl p-4" style={{ background: 'var(--surface)', border: '1px solid var(--brand-line)' }}>
            <p className="text-[14px] font-medium mb-1.5" style={{ color: isCorrect ? 'var(--green)' : 'var(--crimson)' }}>
              {isCorrect ? 'Benar!' : `Belum tepat. Jawaban: ${'ABCD'[q.answerIndex]}. ${q.options[q.answerIndex]}`}
            </p>
            {q.explanation && (
              <p className="text-[13.5px] leading-[1.7]" style={{ color: 'var(--text)' }}>{q.explanation}</p>
            )}
            <div className="flex items-center justify-between gap-3 mt-4">
              <ReportButton soalId={q.id} reportAction={reportAction} key={q.id} />
              <button
                ref={nextBtnRef}
                type="button"
                onClick={() => void next()}
                className="shrink-0 rounded-xl px-5 py-2.5 text-[13.5px] font-medium cursor-pointer hover:opacity-90"
                style={{ background: 'var(--crimson)', color: '#fafafa' }}
              >
                {index + 1 >= questions.length ? 'Lihat hasil' : 'Berikutnya'}
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

function ReportButton({ soalId, reportAction }: { soalId: string; reportAction: BankDrillProps['reportAction'] }) {
  const [open, setOpen] = useState(false)
  const [note, setNote] = useState('')
  const [state, setState] = useState<'idle' | 'sending' | 'sent' | 'error'>('idle')

  if (state === 'sent') return <span className="text-[12px]" style={{ color: 'var(--muted)' }}>Terima kasih, laporan terkirim.</span>
  if (!open) {
    return (
      <button type="button" onClick={() => setOpen(true)} className="text-[12px] underline cursor-pointer hover:opacity-70" style={{ color: 'var(--muted)' }}>
        Laporkan soal
      </button>
    )
  }
  return (
    <form
      className="flex flex-1 items-center gap-2"
      onSubmit={async (e) => {
        e.preventDefault()
        setState('sending')
        const r = await reportAction(soalId, note).catch(() => ({ saved: false }))
        setState(r.saved ? 'sent' : 'error')
      }}
    >
      <input
        value={note}
        onChange={(e) => setNote(e.target.value)}
        maxLength={500}
        placeholder={state === 'error' ? 'Gagal, coba lagi' : 'Apa yang salah? (opsional)'}
        aria-label="Catatan laporan"
        className="flex-1 min-w-0 rounded-lg px-2.5 py-1.5 text-[12.5px]"
        style={{ border: '1px solid var(--brand-line)', background: 'var(--paper)', color: 'var(--text)' }}
      />
      <button type="submit" disabled={state === 'sending'} className="text-[12px] cursor-pointer" style={{ color: 'var(--crimson)' }}>
        Kirim
      </button>
    </form>
  )
}

interface SummaryProps {
  log: Picked[]
  kind: SessionKind
  record: ActionResult | null
  reportAction: BankDrillProps['reportAction']
  onRetryAll: () => void
  onRetryMissed: (missed: BankQuestion[]) => void
  nextHref?: string
  backHref: string
}

function Summary({ log, kind, record, reportAction, onRetryAll, onRetryMissed, nextHref, backHref }: SummaryProps) {
  const wrong = log.filter((p) => p.choice !== p.q.answerIndex)
  const correct = log.length - wrong.length
  const pct = percent(correct, log.length)

  return (
    <div className="w-full max-w-[600px] mx-auto">
      <p className="text-[11px] tracking-[0.14em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
        結果 · Hasil{kind === 'checkpoint' ? ' Checkpoint' : ''}
      </p>
      <div className="flex items-baseline gap-3 mb-1">
        <span className="font-serif text-[56px] font-semibold leading-none tabular-nums" style={{ color: 'var(--text)' }}>{correct}</span>
        <span className="text-[16px]" style={{ color: 'var(--muted)' }}>/ {log.length} benar · {pct}%</span>
      </div>
      <p className="text-[13px] mb-8" style={{ color: 'var(--muted)' }}>
        {pct >= 80 ? 'Mantap, lanjutkan!' : pct >= 60 ? 'Lumayan. Ulangi yang salah supaya makin kuat.' : 'Tonton lagi videonya, lalu ulangi set ini.'}{' '}
        {record === null ? 'Menyimpan progres…' : record.saved ? 'Progres tersimpan.' : record.error ?? 'Progres tidak tersimpan.'}
      </p>

      {wrong.length > 0 && (
        <div className="mb-10">
          <h2 className="text-[13px] font-semibold mb-3" style={{ color: 'var(--text)' }}>Pembahasan soal yang salah ({wrong.length})</h2>
          <ul className="flex flex-col gap-3">
            {wrong.map(({ q, choice }) => (
              <li key={q.id} className="rounded-xl p-4" style={{ border: '1px solid var(--brand-line)', background: 'var(--surface)' }}>
                <p lang="ja" className="font-serif text-[15px] whitespace-pre-line mb-2" style={{ color: 'var(--text)' }}>{q.question}</p>
                <p className="text-[13px]" style={{ color: 'var(--crimson)' }}>
                  Jawabanmu: {choice >= 0 ? q.options[choice] : '-'}
                </p>
                <p className="text-[13px] mb-1.5" style={{ color: 'var(--green)' }}>Benar: {q.options[q.answerIndex]}</p>
                {q.explanation && <p className="text-[13px] leading-[1.7] mb-2" style={{ color: 'var(--muted)' }}>{q.explanation}</p>}
                <ReportButton soalId={q.id} reportAction={reportAction} />
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="flex flex-wrap items-center gap-3">
        {wrong.length > 0 && (
          <button
            type="button"
            onClick={() => onRetryMissed(wrong.map((p) => p.q))}
            className="rounded-xl px-5 py-2.5 text-[13.5px] font-medium cursor-pointer hover:opacity-90"
            style={{ background: 'var(--crimson)', color: '#fafafa' }}
          >
            Ulangi yang salah
          </button>
        )}
        <button
          type="button"
          onClick={onRetryAll}
          className="rounded-xl px-5 py-2.5 text-[13.5px] font-medium cursor-pointer hover:opacity-80"
          style={{ border: '1px solid var(--crimson)', color: 'var(--crimson)', background: 'transparent' }}
        >
          Ulangi semua
        </button>
        {nextHref && (
          <Link href={nextHref} className="rounded-xl px-5 py-2.5 text-[13.5px] font-medium no-underline hover:opacity-80" style={{ border: '1px solid var(--brand-line)', color: 'var(--text)' }}>
            Set berikutnya →
          </Link>
        )}
        <Link href={backHref} className="text-[13px] no-underline ml-auto hover:opacity-70" style={{ color: 'var(--muted)' }}>
          Kembali ke Bank Soal
        </Link>
      </div>
    </div>
  )
}
