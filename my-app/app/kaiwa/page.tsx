import Link from 'next/link'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import KaiwaList from '@/components/learn/KaiwaList'
import ThemeGrid, { type ThemeCount } from '@/components/kaiwa/ThemeGrid'
import { getKaiwaByLevel } from '@/lib/data/queries'
import { CATEGORY_ORDER, getCategoryInfo } from '@/lib/data/kaiwaCategories'
import type { JLPTLevel } from '@/lib/data/types'
import { Icon } from '@/components/ui/Icon'
import { HeroBackground } from '@/components/ui/HeroBackground'

export const metadata: Metadata = {
  title: 'Kaiwa Stories — Percakapan Bahasa Jepang | Koto no Ha',
  description:
    'Latihan percakapan (kaiwa) bahasa Jepang N5–N1 per tema, dengan cara baca (hiragana & romaji) dan terjemahan Indonesia.',
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
  searchParams: Promise<{ level?: string; theme?: string }>
}) {
  const { level, theme } = await searchParams
  const active = LEVELS.find((l) => l.code === (level ?? '').toUpperCase()) ?? LEVELS[0]
  const kaiwa = await getKaiwaByLevel(active.code)

  // Hitung jumlah dialog per tema, urut sesuai CATEGORY_ORDER.
  const counts = new Map<string, number>()
  for (const k of kaiwa) counts.set(k.category, (counts.get(k.category) ?? 0) + 1)
  const themes: ThemeCount[] = CATEGORY_ORDER.filter((c) => counts.has(c)).map((c) => ({
    category: c,
    count: counts.get(c)!,
  }))

  // Tema aktif hanya valid bila ada dialognya di level ini.
  const activeTheme = theme && counts.has(theme) ? theme : null
  const themeInfo = activeTheme ? getCategoryInfo(activeTheme) : null
  const filtered = activeTheme ? kaiwa.filter((k) => k.category === activeTheme) : []

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        {/* Hero dengan foto latar */}
        <div className="relative overflow-hidden" style={{ borderBottom: '0.5px solid var(--border)' }}>
          <HeroBackground
            src="/images/hero-kaiwa.jpg"
            alt="Terowongan bunga sakura di sepanjang sungai Meguro"
            priority
            overlay={0.84}
          />
          <div className="px-5 md:px-12 pt-12 pb-10 max-w-3xl mx-auto relative">
            <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
              会話 · Kaiwa Stories
            </p>
            <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-3 tracking-tight">
              Latihan Percakapan
            </h1>
            <p className="text-[15px] text-muted max-w-[560px] leading-[1.8]">
              Pilih level, lalu pilih tema percakapan. Setiap baris dilengkapi cara baca
              (hiragana &amp; romaji) dan terjemahan Indonesia, beserta kosakata penting.
            </p>
          </div>
        </div>

        <section className="px-5 md:px-12 py-12 max-w-3xl mx-auto">
          {/* Langkah 1: Pemilih level (selalu tampil; klik mereset tema) */}
          <div className="mb-8">
            <p className="text-[12px] font-medium mb-2.5" style={{ color: 'var(--muted)' }}>
              1 · Pilih Level
            </p>
            <div className="flex items-center gap-2 flex-wrap">
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
          </div>

          {/* Langkah 2 & 3: tema → dialog */}
          {activeTheme === null ? (
            <div>
              <p className="text-[12px] font-medium mb-2.5" style={{ color: 'var(--muted)' }}>
                2 · Pilih Tema ({active.code})
              </p>
              <ThemeGrid levelSlug={active.code} themes={themes} accentColor={active.accent} />
            </div>
          ) : (
            <div>
              <Link
                href={`/kaiwa?level=${active.code}`}
                className="inline-flex items-center gap-1.5 text-[13px] no-underline mb-5 hover:text-koto-text transition-colors"
                style={{ color: 'var(--muted)' }}
              >
                ← Semua Tema
              </Link>
              <h2 className="inline-flex items-center gap-2 font-serif text-[20px] font-semibold text-ink mb-1">
                <Icon name={themeInfo!.icon} className="w-5 h-5" style={{ color: active.accent }} /> {themeInfo!.id}
              </h2>
              <p className="text-[12px] mb-6" style={{ color: 'var(--muted)' }}>
                {active.code} · {themeInfo!.jp} · {filtered.length} dialog
              </p>
              <KaiwaList kaiwa={filtered} accentColor={active.accent} />
            </div>
          )}
        </section>
      </main>
      <Footer />
    </>
  )
}
