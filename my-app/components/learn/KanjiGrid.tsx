import type { KanjiEntry } from '@/lib/data/types'

interface KanjiGridProps {
  kanji: KanjiEntry[]
  accentColor: string
}

export default function KanjiGrid({ kanji, accentColor }: KanjiGridProps) {
  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {kanji.map((entry) => (
        <div
          key={entry.kanji}
          className="rounded-2xl overflow-hidden shadow-sm hover:-translate-y-1 hover:shadow-md transition-all duration-200"
          style={{ border: '0.5px solid var(--border)' }}
        >
          {/* Top – dark kanji display */}
          <div
            className="relative flex flex-col items-center justify-center py-6 px-4"
            style={{ background: 'var(--ink)' }}
          >
            {/* Stroke count badge */}
            <span
              className="absolute top-3 right-3 text-[10px] px-2 py-0.5 rounded-full font-sans"
              style={{
                background: `${accentColor}30`,
                color: accentColor,
                border: `0.5px solid ${accentColor}60`,
              }}
            >
              {entry.strokeCount} goresan
            </span>

            {/* Big kanji */}
            <span
              className="font-serif leading-none select-none"
              style={{ fontSize: '72px', color: 'var(--paper)' }}
            >
              {entry.kanji}
            </span>

            {/* JLPT badge */}
            <span
              className="mt-2 text-[10px] tracking-widest uppercase"
              style={{ color: `${accentColor}cc` }}
            >
              {entry.jlptLevel}
            </span>
          </div>

          {/* Middle – readings & meaning */}
          <div className="px-5 py-4 border-b" style={{ background: 'var(--surface)', borderColor: 'var(--border)' }}>
            <div className="font-serif text-lg font-semibold text-ink leading-tight">
              {entry.hiragana}
            </div>
            <div className="text-[11px] text-muted mt-0.5 tracking-wide">{entry.romaji}</div>
            <div className="mt-2 text-[14px] font-medium" style={{ color: 'var(--ink)' }}>
              {entry.meaning}
            </div>
          </div>

          {/* Hint strip – gold */}
          <div
            className="px-5 py-3 flex items-start gap-2"
            style={{ background: 'var(--gold-bg)', borderBottom: '0.5px solid rgba(201,150,60,0.2)' }}
          >
            <span className="text-sm mt-0.5">💡</span>
            <p className="text-[12px] leading-relaxed" style={{ color: 'var(--ink)' }}>
              {entry.hint}
            </p>
          </div>

          {/* Examples */}
          <div className="bg-paper-dark px-5 py-4 space-y-3">
            {entry.examples.map((ex, i) => (
              <div key={`${entry.kanji}-${i}`} className="space-y-0.5">
                <div className="font-serif text-[15px] font-semibold text-ink">{ex.kanji}</div>
                <div className="text-[11px] text-muted">{ex.hiragana}</div>
                <div className="text-[12px]" style={{ color: 'var(--ink)' }}>{ex.meaning}</div>
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  )
}
