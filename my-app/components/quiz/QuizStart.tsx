// KotonoHa Quiz Component
'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'
import { MODE_LABEL, QUIZ_LEVELS, type QuizMode } from '@/lib/data/quiz'
import type { JLPTLevel } from '@/lib/data/types'
import { Icon, type IconName } from '@/components/ui/Icon'

type LevelChoice = JLPTLevel | 'random'

interface QuizStartProps {
  loading: boolean
  error?: string | null
  onStart: (mode: QuizMode, level: LevelChoice) => void
}

const MODES: { mode: QuizMode; icon: IconName; desc: string }[] = [
  { mode: 'kanji', icon: 'reading', desc: 'Tebak arti kanji' },
  { mode: 'vocab', icon: 'book', desc: 'Tebak arti kosakata' },
]

export default function QuizStart({ loading, error, onStart }: QuizStartProps) {
  const [mode, setMode] = useState<QuizMode>('kanji')
  const [level, setLevel] = useState<LevelChoice>('N5')

  return (
    <motion.div
      initial={{ y: 20, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ duration: 0.35, ease: 'easeOut' }}
      className="w-full max-w-[480px] mx-auto rounded-2xl p-6"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      {/* Mode */}
      <div className="text-[11px] tracking-[0.1em] uppercase mb-2" style={{ color: 'var(--muted)' }}>
        Jenis Kuis
      </div>
      <div className="grid grid-cols-2 gap-2.5 mb-6">
        {MODES.map(({ mode: m, icon, desc }) => {
          const active = mode === m
          return (
            <button
              key={m}
              type="button"
              onClick={() => setMode(m)}
              className="rounded-xl p-4 text-left cursor-pointer transition-colors"
              style={{
                background: active ? 'var(--gold-bg)' : 'var(--paper-dark)',
                border: `1px solid ${active ? 'var(--gold)' : 'var(--border)'}`,
              }}
            >
              <span
                className="inline-flex items-center justify-center w-9 h-9 rounded-lg mb-2"
                style={{ background: active ? 'var(--gold)' : 'var(--surface)', color: active ? 'var(--on-ink)' : 'var(--muted)' }}
              >
                <Icon name={icon} className="w-[18px] h-[18px]" />
              </span>
              <div className="font-serif text-[15px] font-semibold text-ink">
                {MODE_LABEL[m].jp} <span className="text-[12px] font-sans font-normal text-muted">{MODE_LABEL[m].id}</span>
              </div>
              <div className="text-[11.5px] text-muted">{desc}</div>
            </button>
          )
        })}
      </div>

      {/* Level */}
      <div className="text-[11px] tracking-[0.1em] uppercase mb-2" style={{ color: 'var(--muted)' }}>
        Pilih Level
      </div>
      <div className="flex flex-wrap gap-2 mb-6">
        {[...QUIZ_LEVELS, 'random' as const].map((lv) => {
          const active = level === lv
          const label = lv === 'random' ? 'Acak' : lv
          return (
            <button
              key={lv}
              type="button"
              onClick={() => setLevel(lv)}
              className="text-[13px] font-medium px-4 py-2 rounded-lg cursor-pointer transition-colors"
              style={{
                background: active ? 'var(--ink)' : 'var(--paper-dark)',
                color: active ? 'var(--paper)' : 'var(--muted)',
                border: `1px solid ${active ? 'var(--ink)' : 'var(--border)'}`,
              }}
            >
              {lv === 'random' ? <span className="inline-flex items-center gap-1"><Icon name="sparkles" className="w-3.5 h-3.5" />{label}</span> : label}
            </button>
          )
        })}
      </div>

      {error && (
        <p className="text-[12px] mb-3" style={{ color: 'var(--red)' }}>{error}</p>
      )}

      <button
        type="button"
        disabled={loading}
        onClick={() => onStart(mode, level)}
        className="w-full inline-flex items-center justify-center gap-1.5 text-[15px] font-medium px-5 py-3 rounded-xl cursor-pointer text-paper hover:opacity-90 transition-opacity disabled:opacity-60 disabled:cursor-default"
        style={{ background: 'var(--ink)' }}
      >
        {loading ? 'Memuat soal…' : (<><Icon name="play" className="w-4 h-4" /> Mulai Kuis</>)}
      </button>
      <p className="text-[11px] text-center text-muted mt-3">10 soal · timer 10 detik · jawab cepat untuk bonus XP</p>
    </motion.div>
  )
}
