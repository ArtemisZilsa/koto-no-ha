import type { GrammarEntry } from '@/lib/data/types'

interface GrammarListProps {
  grammar: GrammarEntry[]
  accentColor: string
}

export default function GrammarList({ grammar, accentColor }: GrammarListProps) {
  return (
    <div className="space-y-5">
      {grammar.map((entry) => (
        <div
          key={entry.pattern}
          className="rounded-2xl overflow-hidden hover:shadow-md transition-all duration-200"
          style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
        >
          {/* Header row */}
          <div
            className="px-6 py-5 flex items-start gap-4"
            style={{ borderLeft: `4px solid ${accentColor}` }}
          >
            {/* Pattern */}
            <div className="flex-1 min-w-0">
              <div className="flex items-baseline gap-3 flex-wrap">
                <span className="font-serif text-2xl font-semibold text-ink leading-none">
                  {entry.pattern}
                </span>
                <span className="text-[12px] text-muted font-sans">{entry.reading}</span>
              </div>
              <div
                className="mt-1 text-[15px] font-medium"
                style={{ color: accentColor }}
              >
                {entry.meaning}
              </div>

              {/* Tags */}
              <div className="flex flex-wrap gap-1.5 mt-3">
                {entry.tags.map((tag) => (
                  <span
                    key={tag}
                    className="text-[10px] px-2 py-0.5 rounded-full"
                    style={{
                      background: `${accentColor}18`,
                      color: accentColor,
                      border: `0.5px solid ${accentColor}40`,
                    }}
                  >
                    {tag}
                  </span>
                ))}
              </div>
            </div>
          </div>

          {/* Explanation */}
          <div
            className="px-6 py-4"
            style={{ background: 'var(--paper)', borderTop: '0.5px solid var(--border)' }}
          >
            <p className="text-[13px] leading-relaxed text-ink">{entry.explanation}</p>
          </div>

          {/* Example sentences */}
          <div className="px-6 py-4 space-y-4" style={{ background: 'var(--surface)', borderTop: '0.5px solid var(--border)' }}>
            <div className="text-[10px] tracking-widest uppercase text-muted mb-3">
              Contoh Penggunaan
            </div>
            {entry.examples.map((ex, i) => (
              <div
                key={i}
                className="pl-4 space-y-0.5"
                style={{ borderLeft: `2px solid ${accentColor}40` }}
              >
                <div className="font-serif text-[14px] font-semibold text-ink">{ex.sentence}</div>
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
