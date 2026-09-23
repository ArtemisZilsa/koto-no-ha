import Link from 'next/link'
import type { Metadata } from 'next'
import { getKaiwaJobs } from '@/lib/data/queries'
import { sswSectors } from '@/lib/data/sswSectors'
import { Icon } from '@/components/ui/Icon'
import { HeroBackground } from '@/components/ui/HeroBackground'

export const metadata: Metadata = {
  alternates: { canonical: '/kaiwa/kerja' },
  title: 'Kaiwa per Profesi — Percakapan Kerja di Jepang | Koto no Ha',
  description:
    'Latihan percakapan kerja bahasa Jepang per profesi, disusun berurutan dari hari pertama masuk kerja. Dikelompokkan menurut 16 bidang SSW (Tokutei Ginou).',
}

export default async function KaiwaKerjaPage() {
  const jobs = await getKaiwaJobs()

  // Kelompokkan profesi per bidang, mengikuti urutan sswSectors — bidang yang
  // belum punya profesi tetap ditampilkan sebagai "segera hadir", supaya
  // pelajar bisa melihat ke mana arah kontennya.
  const bySector = new Map<string, typeof jobs>()
  for (const job of jobs) {
    const list = bySector.get(job.sector_slug) ?? []
    list.push(job)
    bySector.set(job.sector_slug, list)
  }

  const filled = sswSectors.filter((s) => (bySector.get(s.slug)?.length ?? 0) > 0)
  const empty = sswSectors.filter((s) => (bySector.get(s.slug)?.length ?? 0) === 0)

  return (
    <>
      <main className="pt-[60px] min-h-screen">
        <div className="relative overflow-hidden" style={{ borderBottom: '0.5px solid var(--border)' }}>
          <HeroBackground
            src="/images/hero-ssw.jpg"
            alt="Pekerja di Jepang"
            priority
            overlay={0.84}
          />
          <div className="px-5 md:px-12 pt-12 pb-10 max-w-3xl mx-auto relative">
            <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
              仕事の会話 · Kaiwa Kerja
            </p>
            <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-3 tracking-tight">
              Percakapan per Profesi
            </h1>
            <p className="text-[15px] text-muted max-w-[560px] leading-[1.8]">
              Bukan percakapan umum, tapi yang benar-benar dipakai di tempat kerja —
              disusun berurutan dari hari pertama masuk, dan makin sulit seiring nomor
              pelajaran. Dikelompokkan menurut bidang SSW (Tokutei Ginou).
            </p>
          </div>
        </div>

        <section className="px-5 md:px-12 py-12 max-w-3xl mx-auto">
          <Link
            href="/kaiwa"
            className="inline-flex items-center gap-1.5 text-[13px] no-underline mb-7 hover:text-koto-text transition-colors"
            style={{ color: 'var(--muted)' }}
          >
            ← Kaiwa per Tema
          </Link>

          {filled.map((sector) => {
            const sectorJobs = bySector.get(sector.slug) ?? []
            return (
              <div key={sector.slug} className="mb-10">
                <h2 className="inline-flex items-center gap-2 font-serif text-[19px] font-semibold text-ink mb-1">
                  <Icon name={sector.icon} className="w-5 h-5" style={{ color: sector.accent }} />
                  {sector.label}
                </h2>
                <p className="text-[12px] mb-4" style={{ color: 'var(--muted)' }}>
                  {sector.jp} · {sectorJobs.length} profesi
                </p>

                <div className="flex flex-col gap-3">
                  {sectorJobs.map((job) => (
                    <Link
                      key={job.slug}
                      href={`/kaiwa/kerja/${job.slug}`}
                      className="flex items-start gap-4 rounded-xl p-5 no-underline hover-lift"
                      style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
                    >
                      <span
                        className="w-12 h-12 rounded-xl shrink-0 flex items-center justify-center font-serif text-[18px]"
                        style={{ background: sector.accentBg, color: sector.accent }}
                      >
                        {sector.bgKanji}
                      </span>
                      <div className="min-w-0 flex-1">
                        <div className="font-serif text-[16px] font-semibold text-ink leading-tight">
                          {job.jp}
                        </div>
                        <div className="text-[13px] mt-0.5" style={{ color: 'var(--ink)' }}>
                          {job.label}
                        </div>
                        {job.summary && (
                          <p className="text-[12px] mt-1.5 leading-[1.7]" style={{ color: 'var(--muted)' }}>
                            {job.summary}
                          </p>
                        )}
                      </div>
                      <span
                        className="text-[11px] px-2.5 py-1 rounded-full shrink-0 whitespace-nowrap"
                        style={
                          job.lessonCount > 0
                            ? { background: `${sector.accent}18`, color: sector.accent }
                            : { background: 'var(--paper-dark)', color: 'var(--muted)' }
                        }
                      >
                        {job.lessonCount > 0 ? `${job.lessonCount} pelajaran` : 'Segera hadir'}
                      </span>
                    </Link>
                  ))}
                </div>
              </div>
            )
          })}

          {empty.length > 0 && (
            <div className="mt-4">
              <p className="text-[12px] font-medium mb-3" style={{ color: 'var(--muted)' }}>
                Bidang lain — sedang disiapkan
              </p>
              <div className="flex flex-wrap gap-2">
                {empty.map((sector) => (
                  <span
                    key={sector.slug}
                    className="inline-flex items-center gap-1.5 text-[12px] px-3 py-1.5 rounded-full"
                    style={{ background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }}
                  >
                    <Icon name={sector.icon} className="w-3.5 h-3.5" />
                    {sector.label}
                  </span>
                ))}
              </div>
            </div>
          )}
        </section>
      </main>
    </>
  )
}
