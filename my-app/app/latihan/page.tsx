import type { Metadata } from 'next'
import Link from 'next/link'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import PracticeProgress from '@/components/practice/PracticeProgress'
import { getPracticeProgress, getPracticeTotals } from '@/lib/data/queries'
import { CATEGORY_META, PRACTICE_CATEGORIES, PRACTICE_LEVELS, setCount } from '@/lib/data/practice'

export const metadata: Metadata = {
  title: 'Soal Latihan N5–N3 | Koto no Ha',
  description:
    'Soal latihan pilihan ganda kosakata, tata bahasa, dan kanji JLPT N5–N3, dibagi per set dengan koreksi langsung dan progres tersimpan.',
}

// Daftar set sederhana. Katalog lengkap dengan filter menyusul (Fase 9 #5).
export default async function LatihanPage() {
  const [totals, progress] = await Promise.all([getPracticeTotals(), getPracticeProgress()])

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16 max-w-5xl mx-auto">
          <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--crimson)' }}>
            練習問題 · Soal Latihan
          </p>
          <h1 className="font-serif text-[28px] md:text-[34px] font-semibold leading-tight mb-3" style={{ color: 'var(--text)' }}>
            Latihan per Set
          </h1>
          <p className="text-[14px] leading-[1.7] max-w-[620px] mb-12" style={{ color: 'var(--muted)' }}>
            Set kosakata berisi {CATEGORY_META.kosakata.setSize} soal, tata bahasa {CATEGORY_META.tata_bahasa.setSize} soal,
            kanji {CATEGORY_META.kanji.setSize} soal. Kerjakan berurutan atau pilih set mana saja.
          </p>

          {progress.length > 0 && (
            <div className="mb-14">
              <h2 className="text-[13px] font-semibold mb-5" style={{ color: 'var(--text)' }}>Progresmu</h2>
              <PracticeProgress rows={progress} />
            </div>
          )}

          <div className="flex flex-col gap-12">
            {PRACTICE_LEVELS.map((level) => (
              <div key={level}>
                <h2 className="font-serif text-[22px] font-semibold mb-5" style={{ color: 'var(--text)' }}>{level}</h2>
                <div className="flex flex-col gap-6">
                  {PRACTICE_CATEGORIES.map((category) => {
                    const meta = CATEGORY_META[category]
                    const count = setCount(category, totals[category][level] ?? 0)
                    if (count === 0) return null
                    return (
                      <div key={category}>
                        <div className="flex items-baseline gap-2 mb-2.5">
                          <span lang="ja" className="font-serif text-[14px]" style={{ color: 'var(--crimson)' }}>{meta.jp}</span>
                          <span className="text-[13px]" style={{ color: 'var(--text)' }}>{meta.label}</span>
                          <span className="text-[12px]" style={{ color: 'var(--muted)' }}>· {count} set</span>
                        </div>
                        <div className="flex flex-wrap gap-2">
                          {Array.from({ length: count }, (_, i) => i + 1).map((n) => (
                            <Link
                              key={n}
                              href={`/latihan/${meta.slug}/${level.toLowerCase()}/${n}`}
                              className="inline-flex items-center justify-center min-w-[44px] h-[36px] px-3 rounded-lg text-[13px] tabular-nums no-underline transition-colors hover:border-[var(--crimson)] hover:text-[var(--crimson)]"
                              style={{ border: '1px solid var(--brand-line)', color: 'var(--text)', background: 'var(--surface)' }}
                            >
                              {n}
                            </Link>
                          ))}
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>
            ))}
          </div>
        </section>
      </main>
      <Footer />
    </>
  )
}
