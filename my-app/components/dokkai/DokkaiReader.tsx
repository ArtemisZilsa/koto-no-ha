'use client'

import { useMemo, useState, type ReactNode } from 'react'
import type { DokkaiSentence, DokkaiHighlightWord } from '@/lib/types/database.types'
import { isWordBoundaryMatch } from '@/lib/data/dokkaiHighlight'

/**
 * Penampil bacaan dokkai kalimat-per-kalimat. Furigana selalu tampil; romaji &
 * terjemahan bisa di-toggle agar bisa dipakai untuk latihan baca mandiri.
 * Kata vocab sesuai level user disorot (toggle "Sorot Kosakata") dengan
 * tooltip cara baca + arti.
 */
export default function DokkaiReader({
  sentences,
  fallbackText,
  accentColor,
  highlightWords = [],
  highlightLevel = null,
}: {
  sentences: DokkaiSentence[] | null
  fallbackText: string
  accentColor: string
  highlightWords?: DokkaiHighlightWord[]
  highlightLevel?: string | null
}) {
  const [showRomaji, setShowRomaji] = useState(false)
  const [showTrans, setShowTrans] = useState(true)
  const [showHighlight, setShowHighlight] = useState(true)

  // Regex gabungan semua kata sorot; kata terpanjang dicocokkan lebih dulu
  // agar mis. 気持ち menang atas 気. Peta kata → info untuk tooltip.
  const { pattern, wordMap } = useMemo(() => {
    if (highlightWords.length === 0) return { pattern: null as RegExp | null, wordMap: new Map<string, DokkaiHighlightWord>() }
    const sorted = [...highlightWords].sort((a, b) => b.word.length - a.word.length)
    const map = new Map<string, DokkaiHighlightWord>()
    for (const w of sorted) if (!map.has(w.word)) map.set(w.word, w)
    const escaped = [...map.keys()].map((w) => w.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
    return { pattern: new RegExp(`(${escaped.join('|')})`, 'g'), wordMap: map }
  }, [highlightWords])

  /** Pecah teks Jepang menjadi segmen; kata vocab dibungkus <span> sorot. */
  const renderJp = (text: string) => {
    if (!showHighlight || !pattern) return text
    const nodes: ReactNode[] = []
    let cursor = 0
    let key = 0
    for (const match of text.matchAll(pattern)) {
      const word = match[0]
      const start = match.index
      const info = wordMap.get(word)
      if (!info || !isWordBoundaryMatch(text, word, start)) continue
      if (start > cursor) nodes.push(text.slice(cursor, start))
      nodes.push(
        <span
          key={key++}
          className="cursor-help rounded-[3px] px-[1px]"
          style={{
            background: `${accentColor}1f`,
            borderBottom: `1.5px dashed ${accentColor}`,
          }}
          title={`${info.reading} — ${info.meaning}`}
        >
          {word}
        </span>,
      )
      cursor = start + word.length
    }
    if (cursor === 0) return text
    if (cursor < text.length) nodes.push(text.slice(cursor))
    return nodes
  }

  // Fallback: bila belum ada content_json, tampilkan teks polos (tetap disorot).
  if (!sentences || sentences.length === 0) {
    return (
      <p className="font-serif text-[17px] leading-[2.1] text-ink whitespace-pre-line">
        {renderJp(fallbackText)}
      </p>
    )
  }

  const toggleStyle = (on: boolean) => ({
    background: on ? accentColor : 'var(--surface)',
    color: on ? 'var(--on-ink)' : 'var(--muted)',
    border: `0.5px solid ${on ? accentColor : 'var(--border)'}`,
  })

  return (
    <div>
      {/* Kontrol tampilan */}
      <div className="flex items-center flex-wrap gap-2 mb-5">
        <button
          type="button"
          onClick={() => setShowRomaji((v) => !v)}
          aria-pressed={showRomaji}
          className="text-[11.5px] font-medium px-3 py-1.5 rounded-lg cursor-pointer transition-colors"
          style={toggleStyle(showRomaji)}
        >
          Romaji
        </button>
        <button
          type="button"
          onClick={() => setShowTrans((v) => !v)}
          aria-pressed={showTrans}
          className="text-[11.5px] font-medium px-3 py-1.5 rounded-lg cursor-pointer transition-colors"
          style={toggleStyle(showTrans)}
        >
          Terjemahan
        </button>
        {highlightWords.length > 0 && (
          <button
            type="button"
            onClick={() => setShowHighlight((v) => !v)}
            aria-pressed={showHighlight}
            className="text-[11.5px] font-medium px-3 py-1.5 rounded-lg cursor-pointer transition-colors"
            style={toggleStyle(showHighlight)}
          >
            Sorot Kosakata{highlightLevel ? ` ${highlightLevel}` : ''}
          </button>
        )}
      </div>

      {/* Kalimat */}
      <div className="flex flex-col gap-5">
        {sentences.map((s, i) => (
          <div
            key={i}
            className="pb-4"
            style={{ borderBottom: i < sentences.length - 1 ? '0.5px solid var(--border)' : 'none' }}
          >
            {/* Furigana di atas teks Jepang */}
            <div className="text-[12px] leading-tight mb-1" style={{ color: 'var(--muted)' }}>
              {s.furigana}
            </div>
            <p className="font-serif text-[18px] md:text-[19px] leading-[1.7] text-ink">{renderJp(s.jp)}</p>
            {showRomaji && (
              <p className="text-[12.5px] italic mt-1" style={{ color: 'var(--muted)' }}>
                {s.romaji}
              </p>
            )}
            {showTrans && (
              <p className="text-[13.5px] mt-1.5 leading-relaxed" style={{ color: 'var(--ink)', opacity: 0.85 }}>
                {s.id}
              </p>
            )}
          </div>
        ))}
      </div>
    </div>
  )
}
