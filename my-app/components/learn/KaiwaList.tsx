import type { KaiwaStory } from '@/lib/types/database.types'
import { getCategoryInfo } from '@/lib/data/kaiwaCategories'
import { Icon } from '@/components/ui/Icon'
import KaiwaDialogue from '@/components/kaiwa/KaiwaDialogue'

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

            {/* Dialog + pemutar shadowing (client component) */}
            <KaiwaDialogue lines={story.lines} accentColor={accentColor} title={story.title} />

            {/* Kosakata penting */}
            <VocabHighlights vocab={vocab} />
          </div>
        )
      })}
    </div>
  )
}
