import type { KanjiEntry } from '@/lib/data/types'
import { Icon } from '@/components/ui/Icon'
import { KnownToggle } from './KnownToggle'

interface KanjiGridProps {
  kanji: KanjiEntry[]
  accentColor: string
  knownIds?: Set<string>
}

export default function KanjiGrid({ kanji, accentColor, knownIds }: KanjiGridProps) {
  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {kanji.map((entry, idx) => (
        <div
          key={entry.id ?? entry.kanji}
          className="rounded-2xl overflow-hidden shadow-sm hover-lift"
          style={{ border: '0.5px solid var(--border)' }}
        >
          {/* Top – panel kanji bergradien (hijau/biru bergantian), teks kontras tinggi */}
          <div
            className={`kanji-panel ${idx % 2 === 0 ? 'kanji-panel-green' : 'kanji-panel-blue'} relative flex flex-col items-center justify-center py-7 px-4`}
          >
            {/* Stroke count badge — kaca tipis agar terbaca di atas gradien */}
            <span
              className="absolute top-3 right-3 z-10 text-[10px] px-2 py-0.5 rounded-full font-sans font-medium"
              style={{
                background: 'rgba(255,255,255,0.18)',
                color: '#ffffff',
                border: '0.5px solid rgba(255,255,255,0.35)',
                backdropFilter: 'blur(4px)',
              }}
            >
              {entry.strokeCount} goresan
            </span>

            {/* Big kanji — selalu putih + bayangan agar jelas */}
            <span className="kanji-glyph font-serif leading-none select-none relative z-10" style={{ fontSize: '72px' }}>
              {entry.kanji}
            </span>

            {/* JLPT badge */}
            <span
              className="relative z-10 mt-2 text-[10px] tracking-widest uppercase font-medium"
              style={{ color: 'rgba(255,255,255,0.85)' }}
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
            <span className="mt-0.5 shrink-0" style={{ color: 'var(--gold)' }}><Icon name="sparkles" className="w-4 h-4" /></span>
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

          {/* Footer – checklist "sudah dikenal" */}
          <div
            className="px-5 py-3 flex justify-end"
            style={{ background: 'var(--surface)', borderTop: '0.5px solid var(--border)' }}
          >
            <KnownToggle
              itemType="kanji"
              itemId={entry.id}
              initialKnown={entry.id ? (knownIds?.has(entry.id) ?? false) : false}
              accentColor={accentColor}
            />
          </div>
        </div>
      ))}
    </div>
  )
}
