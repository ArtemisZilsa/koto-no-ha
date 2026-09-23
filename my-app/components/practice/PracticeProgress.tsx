import {
  CATEGORY_META,
  PRACTICE_CATEGORIES,
  PRACTICE_LEVELS,
  percent,
  type PracticeProgressRow,
} from '@/lib/data/practice'

interface PracticeProgressProps {
  rows: PracticeProgressRow[]
}

/**
 * Progress bar per kategori per level (N5–N3). Fill = soal yang pernah
 * dijawab benar; teks menyebut jumlah soal yang tersedia.
 */
export default function PracticeProgress({ rows }: PracticeProgressProps) {
  const find = (category: string, level: string) =>
    rows.find((r) => r.category === category && r.level === level)

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-x-10 gap-y-8">
      {PRACTICE_LEVELS.map((level) => (
        <div key={level}>
          <div className="font-serif text-[20px] font-semibold mb-4" style={{ color: 'var(--text)' }}>
            {level}
          </div>
          <div className="flex flex-col gap-4">
            {PRACTICE_CATEGORIES.map((category) => {
              const row = find(category, level)
              const mastered = row?.mastered ?? 0
              const total = row?.total ?? 0
              const pct = percent(mastered, total)
              const label = `${CATEGORY_META[category].label} ${level}`
              return (
                <div key={category}>
                  <div className="flex items-baseline justify-between gap-3 mb-1.5 text-[12.5px]">
                    <span style={{ color: 'var(--text)' }}>{CATEGORY_META[category].label}</span>
                    <span className="tabular-nums" style={{ color: 'var(--muted)' }}>
                      {pct}% dari {total.toLocaleString('id-ID')} soal
                    </span>
                  </div>
                  <div
                    className="h-[6px] w-full rounded-full overflow-hidden"
                    style={{ background: 'var(--brand-line)' }}
                    role="progressbar"
                    aria-label={label}
                    aria-valuemin={0}
                    aria-valuemax={100}
                    aria-valuenow={pct}
                  >
                    <div className="h-full rounded-full" style={{ width: `${pct}%`, background: 'var(--crimson)' }} />
                  </div>
                </div>
              )
            })}
          </div>
        </div>
      ))}
    </div>
  )
}
