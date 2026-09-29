import Link from 'next/link'
import { redirect } from 'next/navigation'
import type { Metadata } from 'next'
import { getFlashcardSession, type FlashcardItemType } from '@/lib/data/queries'
import type { JLPTLevel } from '@/lib/data/types'
import FlashcardSession from '@/components/flashcard/FlashcardSession'

type Params = { level: string }
type SearchParams = { tipe?: string }

const LEVELS: Record<JLPTLevel, { name: string; accent: string }> = {
  N5: { name: 'Dasar', accent: 'var(--red)' },
  N4: { name: 'Pemula', accent: 'var(--gold)' },
  N3: { name: 'Menengah', accent: 'var(--teal)' },
  N2: { name: 'Lanjutan', accent: 'var(--green)' },
  N1: { name: 'Mahir', accent: 'var(--gold)' },
}

function parseLevel(raw: string): JLPTLevel | null {
  const upper = raw.toUpperCase() as JLPTLevel
  return upper in LEVELS ? upper : null
}

export async function generateMetadata({
  params,
}: {
  params: Promise<Params>
}): Promise<Metadata> {
  const { level } = await params
  const parsed = parseLevel(level)
  if (!parsed) return { title: 'Flashcard | Koto no Ha' }
  return {
    alternates: { canonical: `/flashcard/${parsed.toLowerCase()}` },
    title: `Flashcard ${parsed} — ${LEVELS[parsed].name} | Koto no Ha`,
    description: `Belajar kosakata dan kanji ${parsed} dengan flashcard SRS: kartu jatuh tempo diulang otomatis, tandai "Tahu" atau "Ulangi".`,
  }
}

export default async function FlashcardLevelPage({
  params,
  searchParams,
}: {
  params: Promise<Params>
  searchParams: Promise<SearchParams>
}) {
  const { level } = await params
  const { tipe } = await searchParams

  const parsed = parseLevel(level)
  if (!parsed) {
    redirect('/flashcard/n5')
  }

  const itemType: FlashcardItemType = tipe === 'kanji' ? 'kanji' : 'vocab'
  const meta = LEVELS[parsed]
  const slug = parsed.toLowerCase()

  const session = await getFlashcardSession(parsed, itemType)

  return (
    <>
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16">
          {/* Judul */}
          <div className="max-w-[480px] mx-auto mb-8 text-center">
            <p
              className="text-[11px] tracking-[0.14em] uppercase mb-2"
              style={{ color: meta.accent }}
            >
              暗記カード · Flashcard {parsed}
            </p>
            <h1 className="font-serif text-[26px] md:text-[32px] font-semibold text-ink leading-tight mb-2 tracking-tight">
              Flashcard {itemType === 'kanji' ? 'Kanji' : 'Kosakata'} {parsed}
            </h1>
            <p className="text-[13.5px] text-muted leading-[1.7]">
              {session.dueCount > 0
                ? `${session.dueCount} kartu jatuh tempo + ${session.newCount} kartu baru.`
                : `${session.newCount} kartu baru untuk sesi ini.`}{' '}
              Klik kartu untuk membaliknya, lalu jawab jujur: sudah tahu, atau perlu diulang?
            </p>
          </div>

          {/* Pemilih tipe & level */}
          <div className="max-w-[480px] mx-auto mb-8">
            <div className="flex justify-center gap-2 mb-3">
              {(['vocab', 'kanji'] as const).map((t) => (
                <Link
                  key={t}
                  href={`/flashcard/${slug}${t === 'kanji' ? '?tipe=kanji' : ''}`}
                  className="rounded-full px-4 py-1.5 text-[12.5px] font-medium no-underline"
                  style={
                    itemType === t
                      ? { background: meta.accent, color: '#fff' }
                      : {
                          background: 'var(--surface)',
                          color: 'var(--muted)',
                          border: '0.5px solid var(--border)',
                        }
                  }
                >
                  {t === 'vocab' ? '語彙 Kosakata' : '漢字 Kanji'}
                </Link>
              ))}
            </div>
            <div className="flex justify-center gap-1.5 flex-wrap">
              {(Object.keys(LEVELS) as JLPTLevel[]).map((code) => (
                <Link
                  key={code}
                  href={`/flashcard/${code.toLowerCase()}${itemType === 'kanji' ? '?tipe=kanji' : ''}`}
                  className="rounded-full px-3 py-1 text-[12px] font-medium no-underline"
                  style={
                    code === parsed
                      ? {
                          background: `${LEVELS[code].accent}18`,
                          color: LEVELS[code].accent,
                          border: `0.5px solid ${LEVELS[code].accent}60`,
                        }
                      : {
                          background: 'transparent',
                          color: 'var(--muted)',
                          border: '0.5px solid var(--border)',
                        }
                  }
                >
                  {code}
                </Link>
              ))}
            </div>
          </div>

          {/* Sesi */}
          <FlashcardSession
            key={`${parsed}-${itemType}`}
            items={session.items}
            signedIn={session.signedIn}
            accentColor={meta.accent}
            levelSlug={slug}
          />
        </section>
      </main>
    </>
  )
}
