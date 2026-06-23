'use client'

import { motion } from 'framer-motion'
import { useMemo } from 'react'
import type { ActivityDay } from '@/lib/data/progress'

interface ActivityHeatmapProps {
  activity: ActivityDay[]
  reduced: boolean
}

const DAY = 86400000
const WEEKS = 17

function isoUTC(ts: number): string {
  const d = new Date(ts)
  const m = String(d.getUTCMonth() + 1).padStart(2, '0')
  const day = String(d.getUTCDate()).padStart(2, '0')
  return `${d.getUTCFullYear()}-${m}-${day}`
}

/** Warna sel berdasarkan jumlah aktivitas (skala hijau). */
function cellColor(n: number): string {
  if (n <= 0) return 'var(--paper-dark)'
  if (n <= 2) return 'color-mix(in srgb, var(--green) 30%, var(--paper-dark))'
  if (n <= 5) return 'color-mix(in srgb, var(--green) 55%, transparent)'
  if (n <= 9) return 'color-mix(in srgb, var(--green) 78%, transparent)'
  return 'var(--green)'
}

const DATE_FMT = new Intl.DateTimeFormat('id-ID', { day: 'numeric', month: 'short', year: 'numeric' })

export default function ActivityHeatmap({ activity, reduced }: ActivityHeatmapProps) {
  const { columns, totalDays, totalActs } = useMemo(() => {
    const counts = new Map<string, number>()
    let acts = 0
    for (const a of activity) {
      counts.set(a.d, a.n)
      acts += a.n
    }

    const now = new Date()
    const todayUTC = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
    const dow = new Date(todayUTC).getUTCDay() // 0=Min … 6=Sab
    const firstSunday = todayUTC - dow * DAY - (WEEKS - 1) * 7 * DAY

    const cols: { ts: number; iso: string; n: number; future: boolean }[][] = []
    for (let w = 0; w < WEEKS; w++) {
      const col: { ts: number; iso: string; n: number; future: boolean }[] = []
      for (let r = 0; r < 7; r++) {
        const ts = firstSunday + (w * 7 + r) * DAY
        const iso = isoUTC(ts)
        col.push({ ts, iso, n: counts.get(iso) ?? 0, future: ts > todayUTC })
      }
      cols.push(col)
    }
    return { columns: cols, totalDays: counts.size, totalActs: acts }
  }, [activity])

  return (
    <div
      className="rounded-2xl p-6"
      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}
    >
      <div className="flex items-baseline justify-between mb-4 gap-3">
        <h2 className="font-serif text-lg font-semibold text-ink">Aktivitas Belajar</h2>
        <span className="text-[12px] text-muted">
          {totalActs} aktivitas · {totalDays} hari aktif (17 minggu)
        </span>
      </div>

      <motion.div
        initial={reduced ? false : { opacity: 0 }}
        whileInView={{ opacity: 1 }}
        viewport={{ once: true }}
        transition={{ duration: 0.5 }}
        className="flex gap-[3px] overflow-x-auto pb-1"
      >
        {columns.map((col, ci) => (
          <div key={ci} className="flex flex-col gap-[3px]">
            {col.map((cell) =>
              cell.future ? (
                <div key={cell.iso} className="w-3 h-3" />
              ) : (
                <div
                  key={cell.iso}
                  className="w-3 h-3 rounded-[3px]"
                  style={{ background: cellColor(cell.n) }}
                  title={`${cell.n} aktivitas · ${DATE_FMT.format(cell.ts)}`}
                />
              ),
            )}
          </div>
        ))}
      </motion.div>

      {/* Legenda */}
      <div className="flex items-center justify-end gap-1.5 mt-3 text-[11px] text-muted">
        <span>Sedikit</span>
        {[0, 2, 5, 9, 10].map((n) => (
          <span key={n} className="w-3 h-3 rounded-[3px]" style={{ background: cellColor(n) }} />
        ))}
        <span>Banyak</span>
      </div>
    </div>
  )
}
