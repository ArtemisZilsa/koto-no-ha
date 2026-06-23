'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'
import { SRS_LEVELS, SRS_TYPE_LABEL, type SrsType, type SrsLevelChoice } from '@/lib/data/srs'
import { Icon, type IconName } from '@/components/ui/Icon'

interface SrsStartProps {
  loading: boolean
  error?: string | null
  isLoggedIn: boolean
  dueCount?: number
  onStart: (type: SrsType, level: SrsLevelChoice) => void
}

const TYPES: { type: SrsType; icon: IconName; desc: string }[] = [
  { type: 'all', icon: 'layers', desc: 'Kanji + kosakata' },
  { type: 'kanji', icon: 'reading', desc: 'Hanya kanji' },
  { type: 'vocab', icon: 'book', desc: 'Hanya kosakata' },
]

export default function SrsStart({ loading, error, isLoggedIn, dueCount, onStart }: SrsStartProps) {
  const [type, setType] = useState<SrsType>('all')
  const [level, setLevel] = useState<SrsLevelChoice>('N5')

  return (
    <motion.div
      initial={{ y: 20, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ duration: 0.35, ease: 'easeOut' }}
      className="w-full max-w-[480px] mx-auto rounded-2xl p-6"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      {isLoggedIn && typeof dueCount === 'number' && dueCount > 0 && (
        <div
          className="flex items-center gap-2 text-[12.5px] mb-5 px-3.5 py-2.5 rounded-xl"
          style={{ background: 'var(--gold-bg)', color: 'var(--gold)' }}
        >
          <Icon name="flame" className="w-4 h-4" />
          <span><span className="font-semibold">{dueCount} kartu</span> jatuh tempo untuk diulang hari ini.</span>
        </div>
      )}

      {/* Jenis */}
      <div className="text-[11px] tracking-[0.1em] uppercase mb-2" style={{ color: 'var(--muted)' }}>
        Jenis Kartu
      </div>
      <div className="grid grid-cols-3 gap-2.5 mb-6">
        {TYPES.map(({ type: t, icon, desc }) => {
          const active = type === t
          return (
            <button
              key={t}
              type="button"
              onClick={() => setType(t)}
              className="rounded-xl p-3 text-left cursor-pointer transition-colors"
              style={{
                background: active ? 'var(--gold-bg)' : 'var(--paper-dark)',
                border: `1px solid ${active ? 'var(--gold)' : 'var(--border)'}`,
              }}
            >
              <span
                className="inline-flex items-center justify-center w-8 h-8 rounded-lg mb-2"
                style={{ background: active ? 'var(--gold)' : 'var(--surface)', color: active ? 'var(--on-ink)' : 'var(--muted)' }}
              >
                <Icon name={icon} className="w-4 h-4" />
              </span>
              <div className="font-serif text-[14px] font-semibold text-ink leading-tight">
                {SRS_TYPE_LABEL[t].id}
              </div>
              <div className="text-[10.5px] text-muted leading-tight mt-0.5">{desc}</div>
            </button>
          )
        })}
      </div>

      {/* Level */}
      <div className="text-[11px] tracking-[0.1em] uppercase mb-2" style={{ color: 'var(--muted)' }}>
        Pilih Level
      </div>
      <div className="flex flex-wrap gap-2 mb-6">
        {[...SRS_LEVELS, 'random' as const].map((lv) => {
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

      {error && <p className="text-[12px] mb-3" style={{ color: 'var(--red)' }}>{error}</p>}

      <button
        type="button"
        disabled={loading}
        onClick={() => onStart(type, level)}
        className="w-full inline-flex items-center justify-center gap-1.5 text-[15px] font-medium px-5 py-3 rounded-xl cursor-pointer text-paper hover:opacity-90 transition-opacity disabled:opacity-60 disabled:cursor-default"
        style={{ background: 'var(--ink)' }}
      >
        {loading ? 'Menyiapkan kartu…' : (<><Icon name="cards" className="w-4 h-4" /> Mulai Review</>)}
      </button>
      <p className="text-[11px] text-center text-muted mt-3">
        {isLoggedIn
          ? 'Tandai "sudah hafal" untuk +XP & jaga streak. Kartu dijadwalkan ulang otomatis.'
          : 'Latihan jalan tanpa login. Masuk untuk menyimpan jadwal & XP.'}
      </p>
    </motion.div>
  )
}
