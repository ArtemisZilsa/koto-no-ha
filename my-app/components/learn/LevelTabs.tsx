import Link from 'next/link'
import type { LevelData, VocabEntry, KanjiEntry, GrammarEntry } from '@/lib/data/types'
import type { PagedResult } from '@/lib/data/queries'
import type { KaiwaStory } from '@/lib/types/database.types'
import KanjiGrid from './KanjiGrid'
import VocabList from './VocabList'
import GrammarList from './GrammarList'
import KaiwaList from './KaiwaList'
import Pagination from './Pagination'

type Tab = 'kanji' | 'vocab' | 'grammar' | 'kaiwa'

interface LevelTabsProps {
  data: LevelData
  activeTab: Tab
  vocabFromDb: PagedResult<VocabEntry> | null
  kanjiFromDb: PagedResult<KanjiEntry> | null
  grammarFromDb: PagedResult<GrammarEntry> | null
  kaiwaFromDb: KaiwaStory[]
  currentPage: number
  levelSlug: string
  knownVocabIds: string[]
  knownKanjiIds: string[]
  knownVocabTotal: number
  knownKanjiTotal: number
}

export default function LevelTabs({
  data,
  activeTab,
  vocabFromDb,
  kanjiFromDb,
  grammarFromDb,
  kaiwaFromDb,
  currentPage,
  levelSlug,
  knownVocabIds,
  knownKanjiIds,
  knownVocabTotal,
  knownKanjiTotal,
}: LevelTabsProps) {
  const basePath = `/learn/${levelSlug}`
  const knownVocabSet = new Set(knownVocabIds)
  const knownKanjiSet = new Set(knownKanjiIds)

  const vocabItems = vocabFromDb?.items ?? data.vocab
  const vocabCount = vocabFromDb?.total ?? data.vocab.length

  const kanjiItems = kanjiFromDb?.items ?? data.kanji
  const kanjiCount = kanjiFromDb?.total ?? data.kanji.length

  const grammarItems = grammarFromDb?.items ?? data.grammar
  const grammarCount = grammarFromDb?.total ?? data.grammar.length

  const kaiwaCount = kaiwaFromDb.length

  const TABS: { id: Tab; label: string; jp: string; count: number }[] = [
    { id: 'kanji', label: 'Kanji', jp: '漢字', count: kanjiCount },
    { id: 'vocab', label: 'Kosakata', jp: '語彙', count: vocabCount },
    { id: 'grammar', label: 'Tata Bahasa', jp: '文法', count: grammarCount },
    { id: 'kaiwa', label: 'Percakapan', jp: '会話', count: kaiwaCount },
  ]

  return (
    <>
      {/* Tab bar */}
      <div className="flex items-center gap-2 mb-8 flex-wrap">
        {TABS.map((tab) => {
          const isActive = activeTab === tab.id
          // Reset page to 1 when switching tab
          const href = `${basePath}?tab=${tab.id}&page=1`
          return (
            <Link
              key={tab.id}
              href={href}
              className="flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm font-medium transition-all duration-150 no-underline"
              style={
                isActive
                  ? {
                      background: 'var(--ink)',
                      color: 'var(--paper)',
                      boxShadow: 'var(--shadow-soft)',
                    }
                  : {
                      background: 'var(--surface)',
                      color: 'var(--muted)',
                      border: '0.5px solid var(--border)',
                    }
              }
            >
              <span className="font-serif text-base">{tab.jp}</span>
              <span className={`font-sans text-xs ${isActive ? 'opacity-80' : 'opacity-60'}`}>
                {tab.label}
              </span>
              <span
                className="text-[10px] px-1.5 py-0.5 rounded-full ml-1"
                style={
                  isActive
                    ? { background: 'rgba(247,242,234,0.2)', color: 'var(--paper)' }
                    : { background: data.accentBg, color: data.accentColor }
                }
              >
                {tab.count}
              </span>
            </Link>
          )
        })}
      </div>

      {/* Tab content */}
      {activeTab === 'kanji' && (
        <>
          {kanjiFromDb && kanjiFromDb.total > 0 && (
            <div className="mb-4 flex flex-wrap items-center gap-x-3 gap-y-1 text-[12px]" style={{ color: 'var(--muted)' }}>
              <span>
                Menampilkan{' '}
                <span className="font-medium" style={{ color: 'var(--ink)' }}>
                  {(kanjiFromDb.page - 1) * kanjiFromDb.pageSize + 1}–
                  {Math.min(kanjiFromDb.page * kanjiFromDb.pageSize, kanjiFromDb.total)}
                </span>{' '}
                dari <span className="font-medium" style={{ color: 'var(--ink)' }}>{kanjiFromDb.total}</span> kanji
              </span>
              <KnownSummary known={knownKanjiTotal} total={kanjiFromDb.total} accentColor={data.accentColor} />
            </div>
          )}
          <KanjiGrid kanji={kanjiItems} accentColor={data.accentColor} knownIds={knownKanjiSet} />
          {kanjiFromDb && (
            <Pagination
              currentPage={currentPage}
              totalPages={kanjiFromDb.totalPages}
              basePath={basePath}
              tabParam="kanji"
              accentColor={data.accentColor}
            />
          )}
        </>
      )}

      {activeTab === 'vocab' && (
        <>
          {vocabFromDb && vocabFromDb.total > 0 && (
            <div className="mb-4 flex flex-wrap items-center gap-x-3 gap-y-1 text-[12px]" style={{ color: 'var(--muted)' }}>
              <span>
                Menampilkan{' '}
                <span className="font-medium" style={{ color: 'var(--ink)' }}>
                  {(vocabFromDb.page - 1) * vocabFromDb.pageSize + 1}–
                  {Math.min(vocabFromDb.page * vocabFromDb.pageSize, vocabFromDb.total)}
                </span>{' '}
                dari <span className="font-medium" style={{ color: 'var(--ink)' }}>{vocabFromDb.total}</span> kosakata
              </span>
              <KnownSummary known={knownVocabTotal} total={vocabFromDb.total} accentColor={data.accentColor} />
            </div>
          )}
          <VocabList vocab={vocabItems} accentColor={data.accentColor} knownIds={knownVocabSet} />
          {vocabFromDb && (
            <Pagination
              currentPage={currentPage}
              totalPages={vocabFromDb.totalPages}
              basePath={basePath}
              tabParam="vocab"
              accentColor={data.accentColor}
            />
          )}
        </>
      )}

      {activeTab === 'grammar' && (
        <>
          {grammarFromDb && grammarFromDb.total > 0 && (
            <div className="mb-4 text-[12px]" style={{ color: 'var(--muted)' }}>
              Menampilkan{' '}
              <span className="font-medium" style={{ color: 'var(--ink)' }}>
                {(grammarFromDb.page - 1) * grammarFromDb.pageSize + 1}–
                {Math.min(grammarFromDb.page * grammarFromDb.pageSize, grammarFromDb.total)}
              </span>{' '}
              dari <span className="font-medium" style={{ color: 'var(--ink)' }}>{grammarFromDb.total}</span> pola
            </div>
          )}
          <GrammarList grammar={grammarItems} accentColor={data.accentColor} />
          {grammarFromDb && (
            <Pagination
              currentPage={currentPage}
              totalPages={grammarFromDb.totalPages}
              basePath={basePath}
              tabParam="grammar"
              accentColor={data.accentColor}
            />
          )}
        </>
      )}

      {activeTab === 'kaiwa' && (
        <>
          {kaiwaCount > 0 && (
            <div className="mb-5 text-[12px]" style={{ color: 'var(--muted)' }}>
              <span className="font-medium" style={{ color: 'var(--ink)' }}>{kaiwaCount}</span> percakapan ·
              setiap baris dilengkapi cara baca (hiragana &amp; romaji) dan terjemahan
            </div>
          )}
          <KaiwaList kaiwa={kaiwaFromDb} accentColor={data.accentColor} />
        </>
      )}
    </>
  )
}

/** Badge ringkasan "X/Y dikenal" dengan bar progres mini. */
function KnownSummary({ known, total, accentColor }: { known: number; total: number; accentColor: string }) {
  if (total <= 0) return null
  const pct = Math.round((known / total) * 100)
  return (
    <span
      className="inline-flex items-center gap-2 rounded-full px-2.5 py-1"
      style={{ background: 'var(--green-bg)', color: 'var(--green)' }}
      title={`${known} dari ${total} sudah kamu kenal (${pct}%)`}
    >
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
        <path d="M20 6 9 17l-5-5" />
      </svg>
      <span className="font-medium tabular-nums">{known}/{total} dikenal</span>
    </span>
  )
}
