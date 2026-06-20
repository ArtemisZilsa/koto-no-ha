import type { DokkaiVocabNote } from '@/lib/types/database.types'

/** Daftar kosakata penting pada bacaan dokkai. */
export default function VocabNotes({ notes }: { notes: DokkaiVocabNote[] }) {
  if (!notes || notes.length === 0) return null

  return (
    <div className="flex flex-col gap-1.5">
      {notes.map((v, i) => (
        <div
          key={i}
          className="flex flex-wrap items-baseline gap-x-2 gap-y-0.5 rounded-lg px-3.5 py-2.5"
          style={{ background: 'var(--paper-dark)' }}
        >
          <span className="font-serif text-[15px] font-medium text-ink">{v.word}</span>
          <span className="text-[12px]" style={{ color: 'var(--muted)' }}>
            {v.reading}
          </span>
          <span className="text-[11.5px] italic" style={{ color: 'var(--muted)' }}>
            {v.romaji}
          </span>
          <span className="text-[12.5px] text-ink">— {v.meaning}</span>
        </div>
      ))}
    </div>
  )
}
