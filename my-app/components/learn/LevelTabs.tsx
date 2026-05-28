'use client'

import { useState } from 'react'
import type { LevelData } from '@/lib/data/types'
import KanjiGrid from './KanjiGrid'
import VocabList from './VocabList'
import GrammarList from './GrammarList'

type Tab = 'kanji' | 'vocab' | 'grammar'

const TABS: { id: Tab; label: string; jp: string; count: (d: LevelData) => number }[] = [
  { id: 'kanji',   label: 'Kanji',     jp: '漢字', count: (d) => d.kanji.length   },
  { id: 'vocab',   label: 'Kosakata',  jp: '語彙', count: (d) => d.vocab.length   },
  { id: 'grammar', label: 'Tata Bahasa', jp: '文法', count: (d) => d.grammar.length },
]

interface LevelTabsProps {
  data: LevelData
}

export default function LevelTabs({ data }: LevelTabsProps) {
  const [active, setActive] = useState<Tab>('kanji')

  return (
    <>
      {/* Tab bar */}
      <div className="flex items-center gap-2 mb-8">
        {TABS.map((tab) => {
          const isActive = active === tab.id
          return (
            <button
              key={tab.id}
              onClick={() => setActive(tab.id)}
              className="flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm font-medium transition-all duration-150 cursor-pointer"
              style={
                isActive
                  ? {
                      background: 'var(--ink)',
                      color: 'var(--paper)',
                      boxShadow: '0 2px 8px rgba(13,13,18,0.15)',
                    }
                  : {
                      background: 'white',
                      color: 'var(--muted)',
                      border: '0.5px solid rgba(13,13,18,0.15)',
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
                {tab.count(data)}
              </span>
            </button>
          )
        })}
      </div>

      {/* Tab content */}
      {active === 'kanji' && (
        <KanjiGrid kanji={data.kanji} accentColor={data.accentColor} />
      )}
      {active === 'vocab' && (
        <VocabList vocab={data.vocab} accentColor={data.accentColor} />
      )}
      {active === 'grammar' && (
        <GrammarList grammar={data.grammar} accentColor={data.accentColor} />
      )}
    </>
  )
}
