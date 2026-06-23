'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Reveal } from '@/components/ui/Reveal'
import { Icon, type IconName } from '@/components/ui/Icon'
import { isEmptyOverview, rankForXp, type ProgressOverview as Overview } from '@/lib/data/progress'
import XpRankCard from './XpRankCard'
import LevelMasteryBars from './LevelMasteryBars'
import SrsSummaryCard from './SrsSummaryCard'
import ActivityHeatmap from './ActivityHeatmap'

function isReducedMotion(): boolean {
  if (typeof window === 'undefined') return false
  return (
    window.matchMedia('(prefers-reduced-motion: reduce)').matches ||
    document.documentElement.classList.contains('no-anim')
  )
}

const STARTERS: { href: string; label: string; jp: string; icon: IconName; accent: string; bg: string }[] = [
  { href: '/kana', label: 'Belajar Kana', jp: '仮名', icon: 'brush', accent: 'var(--teal)', bg: 'var(--teal-bg)' },
  { href: '/quiz', label: 'Coba Kuis', jp: 'クイズ', icon: 'sparkles', accent: 'var(--gold)', bg: 'var(--gold-bg)' },
  { href: '/srs', label: 'Kartu Hafalan', jp: '暗記', icon: 'cards', accent: 'var(--green)', bg: 'var(--green-bg)' },
]

export default function ProgressOverview({ data }: { data: Overview }) {
  const [reduced] = useState(isReducedMotion)
  const rank = rankForXp(data.profile.total_xp)

  if (isEmptyOverview(data)) {
    return (
      <Reveal className="rounded-2xl p-8 text-center" style={{ background: 'var(--surface)', border: '0.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}>
        <p className="font-serif text-2xl font-semibold text-ink mb-2">始めましょう！</p>
        <p className="text-[14px] text-muted max-w-[420px] mx-auto mb-7 leading-[1.8]">
          Progresmu masih kosong. Mulai dari salah satu aktivitas di bawah — XP, streak,
          dan grafik di halaman ini akan tumbuh seiring kamu belajar.
        </p>
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 max-w-md mx-auto">
          {STARTERS.map((s) => (
            <Link
              key={s.href}
              href={s.href}
              className="rounded-2xl p-5 hover-lift no-underline flex flex-col items-center gap-2"
              style={{ background: s.bg, border: `0.5px solid ${s.accent}30` }}
            >
              <span className="inline-flex items-center justify-center w-11 h-11 rounded-xl" style={{ background: `${s.accent}1a`, color: s.accent }}>
                <Icon name={s.icon} className="w-5 h-5" />
              </span>
              <span className="font-serif text-[15px] font-semibold text-ink">{s.label}</span>
              <span className="font-serif text-[12px] text-muted">{s.jp}</span>
            </Link>
          ))}
        </div>
      </Reveal>
    )
  }

  return (
    <div className="flex flex-col gap-5">
      <Reveal>
        <XpRankCard
          totalXp={data.profile.total_xp}
          streakDays={data.profile.streak_days}
          levelCode={data.profile.level_code}
          levelName={data.profile.level_name}
          rank={rank}
          reduced={reduced}
        />
      </Reveal>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-5">
        <Reveal delay={80} className="lg:col-span-2">
          <LevelMasteryBars levels={data.levels} reduced={reduced} />
        </Reveal>
        <Reveal delay={160}>
          <SrsSummaryCard srs={data.srs} reduced={reduced} />
        </Reveal>
      </div>

      <Reveal delay={120}>
        <ActivityHeatmap activity={data.activity} reduced={reduced} />
      </Reveal>
    </div>
  )
}
