import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getDokkaiById } from '@/lib/data/queries'
import type { DokkaiVocabNote, DokkaiQuestion } from '@/lib/types/database.types'
import DokkaiReader from '@/components/dokkai/DokkaiReader'
import VocabNotes from '@/components/dokkai/VocabNotes'
import Questions from '@/components/dokkai/Questions'
import { NeonGridBackground } from '@/components/effects/NeonGridBackground'

type LevelMeta = { code: string; accent: string }
const levelMetaById: Record<number, LevelMeta> = {
  1: { code: 'N5', accent: 'var(--red)' },
  2: { code: 'N4', accent: 'var(--gold)' },
  3: { code: 'N3', accent: 'var(--teal)' },
  4: { code: 'N2', accent: 'var(--green)' },
  5: { code: 'N1', accent: 'var(--gold)' },
}

export async function generateMetadata({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const p = await getDokkaiById(id)
  return { title: p ? `${p.title} — Dokkai | Koto no Ha` : 'Dokkai — Koto no Ha' }
}

export default async function DokkaiDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const passage = await getDokkaiById(id)
  if (!passage) notFound()

  const meta = levelMetaById[passage.level_id] ?? { code: '', accent: 'var(--gold)' }
  const vocab = (passage.vocab_notes as unknown as DokkaiVocabNote[] | null) ?? []
  const questions = (passage.questions as unknown as DokkaiQuestion[] | null) ?? []

  return (
    <main className="relative z-10 px-5 md:px-8 py-10 max-w-2xl mx-auto">
      <NeonGridBackground />

      {/* Kembali */}
      <Link
        href={`/dokkai?level=${meta.code}`}
        className="inline-flex items-center gap-1.5 text-[13px] no-underline mb-6 hover:text-koto-text transition-colors"
        style={{ color: 'var(--muted)' }}
      >
        ← Semua Bacaan
      </Link>

      {/* Judul */}
      <div className="mb-7">
        <span
          className="text-[10px] px-2 py-0.5 rounded-full"
          style={{ background: `${meta.accent}18`, color: meta.accent }}
        >
          {meta.code} · 読解
        </span>
        <h1 className="font-serif text-[24px] md:text-[30px] font-semibold text-ink leading-[1.25] mt-3 tracking-tight">
          {passage.title}
        </h1>
      </div>

      {/* Bacaan */}
      <section
        className="rounded-2xl p-5 md:p-6 mb-8"
        style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
      >
        <DokkaiReader
          sentences={passage.content_json}
          fallbackText={passage.text_content}
          accentColor={meta.accent}
        />
      </section>

      {/* Kosakata penting */}
      {vocab.length > 0 && (
        <section className="mb-8">
          <h2 className="font-serif text-[16px] font-semibold text-ink mb-3">語彙 · Kosakata Penting</h2>
          <VocabNotes notes={vocab} />
        </section>
      )}

      {/* Soal pemahaman */}
      {questions.length > 0 && (
        <section className="mb-4">
          <h2 className="font-serif text-[16px] font-semibold text-ink mb-3">問題 · Soal Pemahaman</h2>
          <Questions questions={questions} accentColor={meta.accent} />
        </section>
      )}

      {passage.source && (
        <p className="text-[11px] mt-6" style={{ color: 'var(--muted)' }}>
          Sumber: {passage.source}
        </p>
      )}
    </main>
  )
}
