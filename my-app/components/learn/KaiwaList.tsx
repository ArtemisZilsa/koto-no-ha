import type { KaiwaStory, KaiwaLine } from '@/lib/types/database.types'
import { getCategoryInfo } from '@/lib/data/kaiwaCategories'
import { Icon } from '@/components/ui/Icon'

interface VocabHi {
  word: string
  reading?: string
  meaning: string
}

function VocabHighlights({ vocab }: { vocab: VocabHi[] }) {
  if (!vocab || vocab.length === 0) return null
  return (
    <div className="flex flex-wrap gap-2 px-5 py-3.5" style={{ borderTop: '0.5px solid var(--border)' }}>
      {vocab.map((v, i) => (
        <span
          key={i}
          className="text-[11px] px-2.5 py-1 rounded-lg"
          style={{ background: 'var(--paper-dark)', color: 'var(--ink)' }}
        >
          <span className="font-serif font-medium">{v.word}</span>
          {v.reading && <span className="opacity-60"> ({v.reading})</span>}
          <span style={{ color: 'var(--muted)' }}> — {v.meaning}</span>
        </span>
      ))}
    </div>
  )
}

function DialogueLine({ line, side, accentColor }: { line: KaiwaLine; side: 'a' | 'b'; accentColor: string }) {
  const isA = side === 'a'
  return (
    <div className={`flex gap-2.5 items-start ${isA ? '' : 'flex-row-reverse'}`}>
      <div
        className="w-[34px] h-[34px] rounded-full shrink-0 flex items-center justify-center text-[11px] font-medium"
        style={
          isA
            ? { background: 'var(--ink)', color: 'var(--paper)' }
            : { background: `${accentColor}1f`, color: accentColor }
        }
      >
        {line.speaker}
      </div>
      <div
        className="max-w-[80%] rounded-[12px] px-3.5 py-2.5"
        style={
          isA
            ? { background: 'var(--paper-dark)', borderBottomLeftRadius: '3px' }
            : { background: accentColor, borderBottomRightRadius: '3px' }
        }
      >
        {/* Teks Jepang */}
        <div className="font-serif text-[15px] leading-snug" style={{ color: isA ? 'var(--ink)' : 'var(--on-ink)' }}>
          {line.text}
        </div>
        {/* Cara baca: hiragana */}
        {line.reading && (
          <div className="text-[12px] mt-1" style={{ color: isA ? 'var(--muted)' : 'var(--on-ink-muted)' }}>
            {line.reading}
          </div>
        )}
        {/* Cara baca: romaji */}
        {line.romaji && (
          <div className="text-[11px] italic mt-0.5" style={{ color: isA ? 'var(--muted)' : 'var(--on-ink-muted)' }}>
            {line.romaji}
          </div>
        )}
        {/* Terjemahan Indonesia */}
        <div
          className="text-[12.5px] mt-1.5 pt-1.5"
          style={{
            color: isA ? 'var(--ink)' : 'var(--on-ink)',
            borderTop: `0.5px solid ${isA ? 'var(--border)' : 'var(--on-ink-line)'}`,
            opacity: 0.9,
          }}
        >
          {line.trans}
        </div>
      </div>
    </div>
  )
}

export default function KaiwaList({ kaiwa, accentColor }: { kaiwa: KaiwaStory[]; accentColor: string }) {
  if (!kaiwa || kaiwa.length === 0) {
    return (
      <p className="text-[14px]" style={{ color: 'var(--muted)' }}>
        Belum ada percakapan untuk level ini. Segera hadir.
      </p>
    )
  }

  return (
    <div className="flex flex-col gap-6">
      {kaiwa.map((story) => {
        const cat = getCategoryInfo(story.category)
        // Tentukan sisi tiap baris: pembicara pertama = kiri (a), lainnya = kanan (b)
        const firstSpeaker = story.lines[0]?.speaker
        const vocab = (story.vocab_highlight as unknown as VocabHi[] | null) ?? []

        return (
          <div
            key={story.id}
            className="rounded-2xl overflow-hidden"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            {/* Header: tema + kategori */}
            <div
              className="flex items-center justify-between px-5 py-3.5"
              style={{ borderBottom: '0.5px solid var(--border)' }}
            >
              <span className="inline-flex items-center gap-2 font-serif text-[15px] font-medium" style={{ color: 'var(--ink)' }}>
                <Icon name={cat.icon} className="w-4 h-4 shrink-0" style={{ color: accentColor }} /> {story.title}
              </span>
              <span
                className="text-[10px] px-2.5 py-1 rounded-full whitespace-nowrap"
                style={{ background: `${accentColor}18`, color: accentColor }}
              >
                {cat.jp} · {cat.id}
              </span>
            </div>

            {/* Dialog */}
            <div className="p-5 flex flex-col gap-4">
              {story.lines.map((line, i) => (
                <DialogueLine
                  key={i}
                  line={line}
                  side={line.speaker === firstSpeaker ? 'a' : 'b'}
                  accentColor={accentColor}
                />
              ))}
            </div>

            {/* Kosakata penting */}
            <VocabHighlights vocab={vocab} />
          </div>
        )
      })}
    </div>
  )
}
