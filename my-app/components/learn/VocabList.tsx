import type { VocabEntry } from '@/lib/data/types'

interface VocabListProps {
  vocab: VocabEntry[]
  accentColor: string
}

const posColors: Record<string, { bg: string; text: string }> = {
  'Kata kerja': { bg: 'var(--teal-bg)', text: 'var(--teal)' },
  'Kata benda': { bg: 'var(--red-bg)', text: 'var(--red)' },
  'Kata sifat': { bg: 'var(--gold-bg)', text: 'var(--gold)' },
  'Kata keterangan': { bg: '#e8f4e8', text: '#2d7d3a' },
  default: { bg: 'var(--paper)', text: 'var(--ink)' },
}

function getPosStyle(pos: string) {
  for (const [key, val] of Object.entries(posColors)) {
    if (pos.startsWith(key)) return val
  }
  return posColors.default
}

export default function VocabList({ vocab, accentColor }: VocabListProps) {
  return (
    <div className="space-y-4">
      {vocab.map((entry) => {
        const pos = getPosStyle(entry.partOfSpeech)
        return (
          <div
            key={entry.word}
            className="rounded-2xl overflow-hidden bg-white hover:shadow-md hover:-translate-y-0.5 transition-all duration-200"
            style={{ border: '0.5px solid rgba(13,13,18,0.1)' }}
          >
            {/* Card header */}
            <div className="flex items-start gap-5 px-6 py-5">
              {/* Left – word display */}
              <div className="flex-shrink-0 text-center min-w-[80px]">
                <div className="font-serif text-3xl font-semibold text-ink leading-none">
                  {entry.word}
                </div>
                <div className="text-[11px] text-muted mt-1">{entry.hiragana}</div>
                <div className="text-[10px] tracking-wide mt-0.5" style={{ color: accentColor }}>
                  {entry.romaji}
                </div>
              </div>

              {/* Divider */}
              <div
                className="w-px self-stretch flex-shrink-0"
                style={{ background: 'rgba(13,13,18,0.08)' }}
              />

              {/* Right – meaning & part of speech */}
              <div className="flex-1 min-w-0">
                <div className="flex items-start gap-2 flex-wrap">
                  <span
                    className="text-[11px] px-2 py-0.5 rounded-full font-medium whitespace-nowrap"
                    style={{ background: pos.bg, color: pos.text }}
                  >
                    {entry.partOfSpeech}
                  </span>
                </div>
                <div className="mt-2 font-serif text-[17px] font-semibold text-ink">
                  {entry.meaning}
                </div>
              </div>
            </div>

            {/* Examples */}
            <div
              className="px-6 py-4 space-y-3"
              style={{ background: 'var(--paper)', borderTop: '0.5px solid rgba(13,13,18,0.07)' }}
            >
              {entry.examples.map((ex, i) => (
                <div key={i} className="flex flex-col gap-0.5">
                  <div className="font-serif text-[14px] font-semibold text-ink">{ex.sentence}</div>
                  <div className="text-[11px] text-muted">{ex.hiragana}</div>
                  <div className="text-[12px]" style={{ color: 'var(--ink)' }}>
                    {ex.meaning}
                  </div>
                </div>
              ))}
            </div>
          </div>
        )
      })}
    </div>
  )
}
