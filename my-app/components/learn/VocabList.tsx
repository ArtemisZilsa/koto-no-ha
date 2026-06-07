import type { VocabEntry } from '@/lib/data/types'
import { Icon } from '@/components/ui/Icon'
import { KnownToggle } from './KnownToggle'

interface VocabListProps {
  vocab: VocabEntry[]
  accentColor: string
  knownIds?: Set<string>
}

const posColors: Record<string, { bg: string; text: string }> = {
  'Kata kerja': { bg: 'var(--teal-bg)', text: 'var(--teal)' },
  'Kata benda': { bg: 'var(--red-bg)', text: 'var(--red)' },
  'Kata sifat': { bg: 'var(--gold-bg)', text: 'var(--gold)' },
  'Kata keterangan': { bg: '#e8f4e8', text: '#2d7d3a' },
  'Kata ganti': { bg: '#eef0f5', text: '#4a5277' },
  'Kata tanya': { bg: '#fbeef5', text: '#a23b76' },
  'Kata tunjuk': { bg: '#eef5fb', text: '#3b6da2' },
  'Kata bilangan': { bg: '#f5eefb', text: '#763ba2' },
  'Kata sambung': { bg: '#f0f5ee', text: '#5a7d3a' },
  'Partikel': { bg: '#fbf5ee', text: '#a26e3b' },
  'Ungkapan': { bg: '#f5f0ee', text: '#7d5a3a' },
  default: { bg: 'var(--paper)', text: 'var(--ink)' },
}

function getPosStyle(pos: string) {
  for (const [key, val] of Object.entries(posColors)) {
    if (pos.startsWith(key)) return val
  }
  return posColors.default
}

export default function VocabList({ vocab, accentColor, knownIds }: VocabListProps) {
  if (vocab.length === 0) {
    return (
      <div className="rounded-2xl p-12 text-center" style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}>
        <div className="flex justify-center mb-3" style={{ color: 'var(--muted)' }}>
          <Icon name="book" className="w-9 h-9" />
        </div>
        <p className="text-muted text-sm">Belum ada kosakata untuk level ini.</p>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      {vocab.map((entry) => {
        const pos = getPosStyle(entry.partOfSpeech)
        return (
          <div
            key={entry.id ?? entry.word}
            className="rounded-2xl overflow-hidden hover:shadow-md hover:-translate-y-0.5 transition-all duration-200"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            {/* ─── Header: word + meaning ───────────────────────── */}
            <div className="flex items-start gap-5 px-6 py-5">
              {/* Left – word display */}
              <div className="flex-shrink-0 text-center min-w-[90px]">
                <div className="font-serif text-3xl font-semibold text-ink leading-none">
                  {entry.word}
                </div>
                <div className="text-[12px] text-muted mt-1.5">{entry.hiragana}</div>
                <div className="text-[10px] tracking-wide mt-0.5" style={{ color: accentColor }}>
                  {entry.romaji}
                </div>
              </div>

              {/* Divider */}
              <div
                className="w-px self-stretch flex-shrink-0"
                style={{ background: 'var(--border)' }}
              />

              {/* Right – meaning & POS */}
              <div className="flex-1 min-w-0">
                <div className="flex items-start justify-between gap-2">
                  <span
                    className="text-[11px] px-2 py-0.5 rounded-full font-medium whitespace-nowrap inline-block"
                    style={{ background: pos.bg, color: pos.text }}
                  >
                    {entry.partOfSpeech}
                  </span>
                  <KnownToggle
                    itemType="vocab"
                    itemId={entry.id}
                    initialKnown={entry.id ? (knownIds?.has(entry.id) ?? false) : false}
                    accentColor={accentColor}
                  />
                </div>
                <div className="mt-2 font-serif text-[17px] font-semibold text-ink">
                  {entry.meaning}
                </div>
              </div>
            </div>

            {/* ─── Usage section (Indonesia + Jepang) ───────────── */}
            {entry.usage && (
              <div
                className="px-6 py-3"
                style={{
                  background: 'var(--gold-bg)',
                  borderTop: '0.5px solid var(--border)',
                }}
              >
                <div className="flex items-start gap-2">
                  <span className="inline-flex items-center gap-1 text-[10px] tracking-widest uppercase font-medium mt-0.5" style={{ color: 'var(--gold)' }}>
                    <Icon name="sparkles" className="w-3 h-3" /> Penggunaan
                  </span>
                </div>
                <p className="text-[13px] leading-relaxed text-ink mt-1">{entry.usage}</p>
                {entry.usageJp && (
                  <p className="text-[12px] font-serif text-muted mt-1 italic">
                    {entry.usageJp}
                  </p>
                )}
              </div>
            )}

            {/* ─── Full meaning section ───────────────────────────── */}
            {entry.fullMeaning && (
              <div
                className="px-6 py-3"
                style={{
                  background: 'var(--paper-dark)',
                  borderTop: '0.5px solid var(--border)',
                }}
              >
                <div className="inline-flex items-center gap-1 text-[10px] tracking-widest uppercase font-medium text-muted mb-1">
                  <Icon name="reading" className="w-3 h-3" /> Makna Lengkap
                </div>
                <p className="text-[13px] leading-relaxed text-ink">{entry.fullMeaning}</p>
              </div>
            )}

            {/* ─── Examples ────────────────────────────────────── */}
            <div
              className="px-6 py-4 space-y-3"
              style={{ background: 'var(--paper)', borderTop: '0.5px solid var(--border)' }}
            >
              <div className="text-[10px] tracking-widest uppercase text-muted">
                Contoh Penggunaan
              </div>
              {entry.examples.map((ex, i) => (
                <div
                  key={i}
                  className="pl-3 space-y-0.5"
                  style={{ borderLeft: `2px solid ${accentColor}60` }}
                >
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
