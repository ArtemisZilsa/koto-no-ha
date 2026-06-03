import Link from 'next/link'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import KaiwaList from '@/components/learn/KaiwaList'
import { getKaiwaByLevel } from '@/lib/data/queries'
import type { JLPTLevel } from '@/lib/data/types'

export const metadata: Metadata = {
  title: 'Kaiwa — Percakapan Bahasa Jepang | Koto no Ha',
  description:
    'Latihan percakapan (kaiwa) bahasa Jepang N5–N1 dengan cara baca (hiragana & romaji) dan terjemahan Indonesia.',
}

const LEVELS: { code: JLPTLevel; name: string; accent: string }[] = [
  { code: 'N5', name: 'Dasar', accent: 'var(--red)' },
  { code: 'N4', name: 'Pemula', accent: 'var(--gold)' },
  { code: 'N3', name: 'Menengah', accent: 'var(--teal)' },
  { code: 'N2', name: 'Lanjutan', accent: 'var(--red)' },
  { code: 'N1', name: 'Mahir', accent: 'var(--gold)' },
]

export default async function KaiwaPage({
  searchParams,
}: {
  searchParams: Promise<{ level?: string }>
}) {
  const { level } = await searchParams
  const active = LEVELS.find((l) => l.code === (level ?? '').toUpperCase()) ?? LEVELS[0]
  const kaiwa = await getKaiwaByLevel(active.code)

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 max-w-3xl mx-auto">
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            会話 · Kaiwa
          </p>
          <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-3 tracking-tight">
            Latihan Percakapan
          </h1>
          <p className="text-[15px] text-muted max-w-[560px] leading-[1.8] mb-8">
            Dialog situasional dari N5 hingga N1. Setiap baris dilengkapi cara baca (hiragana &amp;
            romaji) dan terjemahan Indonesia, beserta kosakata penting.
          </p>

          {/* Pemilih level */}
          <div className="flex items-center gap-2 mb-8 flex-wrap">
            {LEVELS.map((l) => {
              const isActive = l.code === active.code
              return (
                <Link
                  key={l.code}
                  href={`/kaiwa?level=${l.code}`}
                  className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium transition-all no-underline"
                  style={
                    isActive
                      ? { background: 'var(--ink)', color: 'var(--paper)', boxShadow: 'var(--shadow-soft)' }
                      : { background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }
                  }
                >
                  <span className="font-serif">{l.code}</span>
                  <span className="text-xs opacity-70">{l.name}</span>
                </Link>
              )
            })}
          </div>

          <KaiwaList kaiwa={kaiwa} accentColor={active.accent} />
        </section>
      </main>
      <Footer />
    </>
  )
}
