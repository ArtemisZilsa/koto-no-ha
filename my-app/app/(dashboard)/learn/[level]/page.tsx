import { redirect } from 'next/navigation'
import { n5Data } from '@/lib/data/n5'
import { n4Data } from '@/lib/data/n4'
import { n3Data } from '@/lib/data/n3'
import type { LevelData } from '@/lib/data/types'
import LevelTabs from '@/components/learn/LevelTabs'

type Params = { level: string }

const levelMap: Record<string, LevelData> = {
  n5: n5Data,
  n4: n4Data,
  n3: n3Data,
}

export async function generateMetadata({ params }: { params: Promise<Params> }) {
  const { level } = await params
  const data = levelMap[level.toLowerCase()]
  if (!data) return { title: 'Koto no Ha' }
  return { title: `${data.level} — ${data.name} | Koto no Ha` }
}

export default async function LevelPage({ params }: { params: Promise<Params> }) {
  const { level } = await params
  const data = levelMap[level.toLowerCase()]

  if (!data) {
    redirect('/dashboard')
  }

  return (
    <main>
      {/* ── Hero Section ────────────────────────────────────────────── */}
      <section
        className="relative overflow-hidden px-8 py-14"
        style={{
          background: `linear-gradient(135deg, ${data.accentBg} 0%, var(--paper) 60%)`,
          borderBottom: '0.5px solid rgba(13,13,18,0.1)',
        }}
      >
        {/* Giant background kanji watermark */}
        <span
          className="absolute right-0 top-1/2 -translate-y-1/2 font-serif select-none pointer-events-none"
          style={{
            fontSize: 'clamp(160px, 25vw, 280px)',
            lineHeight: 1,
            color: 'rgba(13,13,18,0.04)',
            right: '-2%',
          }}
          aria-hidden
        >
          {data.bgKanji}
        </span>

        {/* Floating secondary kanji decorations */}
        <span
          className="absolute left-[10%] top-4 font-serif select-none pointer-events-none"
          style={{ fontSize: '40px', color: 'rgba(13,13,18,0.04)', transform: 'rotate(-15deg)' }}
          aria-hidden
        >
          語
        </span>
        <span
          className="absolute left-[20%] bottom-4 font-serif select-none pointer-events-none"
          style={{ fontSize: '28px', color: 'rgba(13,13,18,0.04)', transform: 'rotate(10deg)' }}
          aria-hidden
        >
          文
        </span>

        <div className="relative max-w-5xl mx-auto">
          {/* Level badge */}
          <div className="flex items-center gap-3 mb-4">
            <span
              className="font-serif text-4xl font-semibold"
              style={{ color: data.accentColor }}
            >
              {data.level}
            </span>
            <div
              className="w-px h-8 self-center"
              style={{ background: `${data.accentColor}40` }}
            />
            <div>
              <div className="font-serif text-xl font-semibold text-ink">{data.name}</div>
              <div className="text-[12px] text-muted">{data.subtitle}</div>
            </div>
          </div>

          {/* Stats chips */}
          <div className="flex items-center gap-3 flex-wrap">
            {[
              { label: '漢字', count: data.kanji.length, suffix: 'kanji' },
              { label: '語彙', count: data.vocab.length, suffix: 'kosakata' },
              { label: '文法', count: data.grammar.length, suffix: 'pola' },
            ].map(({ label, count, suffix }) => (
              <span
                key={label}
                className="flex items-center gap-1.5 text-[12px] px-3 py-1.5 rounded-full"
                style={{
                  background: `${data.accentColor}18`,
                  color: data.accentColor,
                  border: `0.5px solid ${data.accentColor}40`,
                }}
              >
                <span className="font-serif font-medium">{label}</span>
                <span className="font-sans">
                  {count} {suffix}
                </span>
              </span>
            ))}
          </div>
        </div>
      </section>

      {/* ── Content ─────────────────────────────────────────────────── */}
      <section className="px-8 py-10 max-w-5xl mx-auto">
        <LevelTabs data={data} />
      </section>
    </main>
  )
}
