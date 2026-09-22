import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { getKaiwaJob, getKaiwaLessons, levelCodeById } from '@/lib/data/queries'
import { getSswSector } from '@/lib/data/sswSectors'
import { Icon } from '@/components/ui/Icon'
import { JsonLd, SITE_NAME, absoluteUrl, breadcrumbJsonLd } from '@/lib/seo'

type Params = Promise<{ job: string }>

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const { job: slug } = await params
  const job = await getKaiwaJob(slug)
  if (!job) return { title: 'Profesi tidak ditemukan | Koto no Ha' }

  return {
    alternates: { canonical: `/kaiwa/kerja/${job.slug}` },
    title: `${job.label} (${job.jp}) — Kaiwa Kerja | Koto no Ha`,
    description:
      job.summary ??
      `Latihan percakapan kerja bahasa Jepang untuk profesi ${job.label}, disusun berurutan.`,
  }
}

export default async function KaiwaJobPage({ params }: { params: Params }) {
  const { job: slug } = await params
  const job = await getKaiwaJob(slug)
  if (!job) notFound()

  const [lessons, sector] = [await getKaiwaLessons(slug), getSswSector(job.sector_slug)]
  const accent = sector?.accent ?? 'var(--red)'

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <JsonLd
          data={[
            breadcrumbJsonLd([
              { name: 'Beranda', path: '/' },
              { name: 'Kaiwa Kerja', path: '/kaiwa/kerja' },
              { name: job.label, path: `/kaiwa/kerja/${job.slug}` },
            ]),
            {
              '@context': 'https://schema.org',
              '@type': 'Course',
              name: `Kaiwa Kerja: ${job.label} (${job.jp})`,
              description:
                job.summary ?? `Latihan percakapan kerja bahasa Jepang untuk profesi ${job.label}, disusun berurutan.`,
              url: absoluteUrl(`/kaiwa/kerja/${job.slug}`),
              inLanguage: ['id', 'ja'],
              isAccessibleForFree: true,
              provider: { '@type': 'EducationalOrganization', name: SITE_NAME, sameAs: absoluteUrl('/') },
              numberOfLessons: lessons.length,
              hasCourseInstance: {
                '@type': 'CourseInstance',
                courseMode: 'online',
                courseWorkload: `${lessons.length} pelajaran`,
              },
              offers: { '@type': 'Offer', price: 0, priceCurrency: 'IDR', category: 'Free' },
            },
          ]}
        />
        <section className="px-5 md:px-12 py-10 max-w-3xl mx-auto">
          <Link
            href="/kaiwa/kerja"
            className="inline-flex items-center gap-1.5 text-[13px] no-underline mb-6 hover:text-koto-text transition-colors"
            style={{ color: 'var(--muted)' }}
          >
            ← Semua Profesi
          </Link>

          {/* Kepala: profesi + jumlah pelajaran */}
          <div
            className="rounded-2xl p-6 mb-8"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            <div className="flex items-start gap-4">
              {sector && (
                <span
                  className="w-14 h-14 rounded-xl shrink-0 flex items-center justify-center font-serif text-[22px]"
                  style={{ background: sector.accentBg, color: sector.accent }}
                >
                  {sector.bgKanji}
                </span>
              )}
              <div className="min-w-0">
                <h1 className="font-serif text-[24px] md:text-[28px] font-semibold text-ink leading-tight">
                  {job.label}
                </h1>
                <p className="font-serif text-[15px] mt-0.5" style={{ color: 'var(--muted)' }}>
                  {job.jp}
                  {sector && ` · ${sector.label}`}
                </p>
              </div>
            </div>

            {job.summary && (
              <p className="text-[14px] mt-4 leading-[1.8]" style={{ color: 'var(--ink)' }}>
                {job.summary}
              </p>
            )}

            <p
              className="text-[12px] mt-4 pt-4 leading-[1.7]"
              style={{ color: 'var(--muted)', borderTop: '0.5px solid var(--border)' }}
            >
              {lessons.length} pelajaran · Kesulitan tata bahasa dan kosakata naik bertahap
              mengikuti nomor pelajaran. Mulai dari nomor 1.
            </p>
          </div>

          {/* Silabus */}
          {lessons.length === 0 ? (
            <p className="text-[14px]" style={{ color: 'var(--muted)' }}>
              Pelajaran untuk profesi ini sedang disiapkan. Segera hadir.
            </p>
          ) : (
            <div className="flex flex-col gap-2.5">
              {lessons.map((lesson) => {
                const level = levelCodeById(lesson.level_id)
                return (
                  <Link
                    key={lesson.id}
                    href={`/kaiwa/kerja/${job.slug}/${lesson.lesson_no}`}
                    className="flex items-start gap-4 rounded-xl p-4 no-underline hover-lift"
                    style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
                  >
                    <span
                      className="w-10 h-10 rounded-lg shrink-0 flex items-center justify-center font-serif text-[15px] font-semibold"
                      style={{ background: `${accent}18`, color: accent }}
                    >
                      {lesson.lesson_no}
                    </span>
                    <div className="min-w-0 flex-1">
                      <div className="font-serif text-[15px] font-medium text-ink leading-snug">
                        第{lesson.lesson_no}課 · {lesson.title}
                      </div>
                      {lesson.goal && (
                        <p className="text-[12px] mt-1 leading-[1.7]" style={{ color: 'var(--muted)' }}>
                          {lesson.goal}
                        </p>
                      )}
                    </div>
                    {level && (
                      <span
                        className="text-[10px] px-2 py-1 rounded-full shrink-0 font-serif"
                        style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
                      >
                        {level}
                      </span>
                    )}
                    <Icon
                      name="chevron-right"
                      className="w-4 h-4 shrink-0 mt-2.5"
                      style={{ color: 'var(--muted)' }}
                    />
                  </Link>
                )
              })}
            </div>
          )}
        </section>
      </main>
      <Footer />
    </>
  )
}
