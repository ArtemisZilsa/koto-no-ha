import { redirect } from 'next/navigation'
import { n5Data } from '@/lib/data/n5'
import { n4Data } from '@/lib/data/n4'
import { n3Data } from '@/lib/data/n3'
import { n2Data } from '@/lib/data/n2'
import { n1Data } from '@/lib/data/n1'
import type { LevelData, JLPTLevel } from '@/lib/data/types'
import { getVocabByLevel, getKanjiByLevel, getGrammarByLevel, getKaiwaByLevel, getKnownItemIds, getKnownCountByLevel } from '@/lib/data/queries'
import LevelTabs from '@/components/learn/LevelTabs'
import InkDivider from '@/components/ui/InkDivider'
import { HeroBackground } from '@/components/ui/HeroBackground'

type Params = { level: string }
type SearchParams = { tab?: string; page?: string }

const legacyDataMap: Record<string, LevelData> = {
  n5: n5Data,
  n4: n4Data,
  n3: n3Data,
  n2: n2Data,
  n1: n1Data,
}

const vocabDbLevels = new Set<JLPTLevel>(['N5', 'N4', 'N3', 'N2', 'N1'])
const kanjiDbLevels = new Set<JLPTLevel>(['N5', 'N4', 'N3', 'N2', 'N1'])
const grammarDbLevels = new Set<JLPTLevel>(['N5', 'N4', 'N3'])

// Karakter jepang ornamen pojok hero
const levelOrnaments: Record<JLPTLevel, string> = {
  N5: '五級',
  N4: '四級',
  N3: '三級',
  N2: '二級',
  N1: '一級',
}

export async function generateMetadata({ params }: { params: Promise<Params> }) {
  const { level } = await params
  const data = legacyDataMap[level.toLowerCase()]
  if (!data) return { title: 'Koto no Ha' }
  return { title: `${data.level} — ${data.name} | Koto no Ha` }
}

export default async function LevelPage({
  params,
  searchParams,
}: {
  params: Promise<Params>
  searchParams: Promise<SearchParams>
}) {
  const { level } = await params
  const { tab, page } = await searchParams
  const data = legacyDataMap[level.toLowerCase()]

  if (!data) {
    redirect('/dashboard')
  }

  const activeTab = (tab === 'vocab' || tab === 'grammar' || tab === 'kanji' || tab === 'kaiwa') ? tab : 'kanji'
  const pageNum = Math.max(1, parseInt(page ?? '1', 10) || 1)

  const vocabPaged = vocabDbLevels.has(data.level)
    ? await getVocabByLevel(data.level, pageNum)
    : null

  const kanjiPaged = kanjiDbLevels.has(data.level)
    ? await getKanjiByLevel(data.level, pageNum)
    : null

  const grammarPaged = grammarDbLevels.has(data.level)
    ? await getGrammarByLevel(data.level, pageNum)
    : null

  const kaiwaStories = await getKaiwaByLevel(data.level)

  // Status checklist "dikenal" — hanya untuk item di halaman aktif + total per level.
  const vocabPageIds = (vocabPaged?.items ?? []).map((v) => v.id).filter((x): x is string => !!x)
  const kanjiPageIds = (kanjiPaged?.items ?? []).map((k) => k.id).filter((x): x is string => !!x)

  const [knownVocabSet, knownKanjiSet, knownVocabTotal, knownKanjiTotal] = await Promise.all([
    activeTab === 'vocab' ? getKnownItemIds('vocab', vocabPageIds) : Promise.resolve(new Set<string>()),
    activeTab === 'kanji' ? getKnownItemIds('kanji', kanjiPageIds) : Promise.resolve(new Set<string>()),
    vocabDbLevels.has(data.level) ? getKnownCountByLevel('vocab', data.level) : Promise.resolve(0),
    kanjiDbLevels.has(data.level) ? getKnownCountByLevel('kanji', data.level) : Promise.resolve(0),
  ])

  const knownVocabIds = Array.from(knownVocabSet)
  const knownKanjiIds = Array.from(knownKanjiSet)

  const vocabCount = vocabPaged?.total ?? data.vocab.length
  const kanjiCount = kanjiPaged?.total ?? data.kanji.length
  const grammarCount = grammarPaged?.total ?? data.grammar.length
  const kaiwaCount = kaiwaStories.length

  const ornament = levelOrnaments[data.level]

  return (
    <main>
      {/* ── Hero Section ────────────────────────────────────────────── */}
      <section
        className="relative overflow-hidden px-8 py-16"
        style={{ borderBottom: '0.5px solid var(--border)' }}
      >
        {/* Foto latar: panorama Kyoto saat senja */}
        <HeroBackground
          src="/images/hero-learn.jpg"
          alt="Panorama Kyoto saat senja"
          priority
          overlay={0.86}
        />
        {/* Tint aksen per-level di atas foto */}
        <div
          className="absolute inset-0 pointer-events-none -z-10"
          style={{ background: `linear-gradient(135deg, ${data.accentBg} 0%, transparent 70%)`, opacity: 0.6 }}
          aria-hidden
        />

        {/* Watermark kanji raksasa di belakang */}
        <span
          className="absolute right-0 top-1/2 -translate-y-1/2 font-serif select-none pointer-events-none float-soft"
          style={{
            fontSize: 'clamp(180px, 28vw, 320px)',
            lineHeight: 1,
            color: 'var(--ink)',
            opacity: 0.05,
            right: '-3%',
          }}
          aria-hidden
        >
          {data.bgKanji}
        </span>

        {/* Watermark kanji medium */}
        <span
          className="absolute font-serif select-none pointer-events-none"
          style={{
            fontSize: '120px',
            lineHeight: 1,
            color: 'var(--ink)',
            opacity: 0.03,
            top: '15%',
            right: '12%',
            transform: 'rotate(-8deg)',
          }}
          aria-hidden
        >
          {data.bgKanji}
        </span>

        {/* Aksen kanji floating */}
        <span
          className="absolute left-[8%] top-6 font-serif select-none pointer-events-none"
          style={{ fontSize: '42px', color: 'var(--ink)', opacity: 0.06, transform: 'rotate(-15deg)' }}
          aria-hidden
        >
          語
        </span>
        <span
          className="absolute left-[18%] bottom-6 font-serif select-none pointer-events-none"
          style={{ fontSize: '32px', color: 'var(--ink)', opacity: 0.06, transform: 'rotate(10deg)' }}
          aria-hidden
        >
          文
        </span>

        {/* Ornamen tategaki di pojok kanan atas */}
        <div
          className="absolute top-6 right-8 hidden md:block font-serif select-none pointer-events-none tategaki-accent"
          style={{
            fontSize: '14px',
            color: data.accentColor,
            opacity: 0.7,
            letterSpacing: '0.3em',
          }}
          aria-hidden
        >
          {ornament}
        </div>

        <div className="relative max-w-5xl mx-auto">
          <div className="flex items-center gap-4 mb-5">
            <span
              className="font-serif text-5xl font-semibold leading-none"
              style={{ color: data.accentColor }}
            >
              {data.level}
            </span>
            <div
              className="w-px h-10 self-center"
              style={{ background: `${data.accentColor}50` }}
            />
            <div>
              <div className="font-serif text-2xl font-semibold" style={{ color: 'var(--ink)' }}>
                {data.name}
              </div>
              <div className="text-[13px] mt-0.5" style={{ color: 'var(--muted)' }}>
                {data.subtitle}
              </div>
            </div>
          </div>

          {/* Sumi-e ink divider */}
          <InkDivider colorVar={data.accentColor} className="max-w-md mb-5" />

          <div className="flex items-center gap-3 flex-wrap">
            {[
              { label: '漢字', count: kanjiCount, suffix: 'kanji' },
              { label: '語彙', count: vocabCount, suffix: 'kosakata' },
              { label: '文法', count: grammarCount, suffix: 'pola' },
              { label: '会話', count: kaiwaCount, suffix: 'percakapan' },
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

      <section className="px-8 py-10 max-w-5xl mx-auto">
        <LevelTabs
          data={data}
          activeTab={activeTab}
          vocabFromDb={vocabPaged}
          kanjiFromDb={kanjiPaged}
          grammarFromDb={grammarPaged}
          kaiwaFromDb={kaiwaStories}
          currentPage={pageNum}
          levelSlug={level.toLowerCase()}
          knownVocabIds={knownVocabIds}
          knownKanjiIds={knownKanjiIds}
          knownVocabTotal={knownVocabTotal}
          knownKanjiTotal={knownKanjiTotal}
        />
      </section>
    </main>
  )
}
