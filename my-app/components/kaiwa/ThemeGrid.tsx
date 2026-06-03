import Link from 'next/link'
import { getCategoryInfo } from '@/lib/data/kaiwaCategories'

export interface ThemeCount {
  category: string
  count: number
}

/** Grid kartu tema untuk satu level. Klik kartu → ?level=&theme=. */
export default function ThemeGrid({
  levelSlug,
  themes,
  accentColor,
}: {
  levelSlug: string
  themes: ThemeCount[]
  accentColor: string
}) {
  if (themes.length === 0) {
    return (
      <p className="text-[14px]" style={{ color: 'var(--muted)' }}>
        Belum ada percakapan untuk level ini. Segera hadir.
      </p>
    )
  }

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
      {themes.map(({ category, count }) => {
        const info = getCategoryInfo(category)
        return (
          <Link
            key={category}
            href={`/kaiwa?level=${levelSlug}&theme=${category}`}
            className="flex items-center gap-4 rounded-xl p-5 no-underline transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_10px_28px_rgba(13,13,18,0.08)]"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            <span
              className="w-12 h-12 rounded-xl shrink-0 flex items-center justify-center text-[22px]"
              style={{ background: `${accentColor}18` }}
            >
              {info.emoji}
            </span>
            <div className="min-w-0">
              <div className="font-serif text-[16px] font-semibold text-ink leading-tight">
                {info.id}
              </div>
              <div className="text-[12px] mt-0.5" style={{ color: 'var(--muted)' }}>
                {info.jp} · {count} dialog
              </div>
            </div>
            <span className="ml-auto text-[18px] shrink-0" style={{ color: accentColor }}>
              →
            </span>
          </Link>
        )
      })}
    </div>
  )
}
