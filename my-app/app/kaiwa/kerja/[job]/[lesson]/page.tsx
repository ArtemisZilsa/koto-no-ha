import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import KaiwaDialogue from '@/components/kaiwa/KaiwaDialogue'
import { getKaiwaJob, getKaiwaLesson, getKaiwaLessons, levelCodeById } from '@/lib/data/queries'
import { getSswSector } from '@/lib/data/sswSectors'
import { Icon } from '@/components/ui/Icon'
import { JsonLd, breadcrumbJsonLd, learningResourceJsonLd } from '@/lib/seo'

type Params = Promise<{ job: string; lesson: string }>

interface VocabHi {
  word: string
  reading?: string
  meaning: string
}

/** Nomor pelajaran dari URL. NaN dan angka non-positif ditolak sebagai 404. */
function parseLessonNo(raw: string): number | null {
  const n = Number(raw)
  return Number.isInteger(n) && n > 0 ? n : null
}

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const { job: slug, lesson: rawNo } = await params
  const lessonNo = parseLessonNo(rawNo)
  if (lessonNo === null) return { title: 'Pelajaran tidak ditemukan | Koto no Ha' }

  const [job, lesson] = await Promise.all([getKaiwaJob(slug), getKaiwaLesson(slug, lessonNo)])
  if (!job || !lesson) return { title: 'Pelajaran tidak ditemukan | Koto no Ha' }

  return {
    alternates: { canonical: `/kaiwa/kerja/${job.slug}/${lessonNo}` },
    title: `第${lessonNo}課 ${lesson.title} — ${job.label} | Koto no Ha`,
    description: lesson.goal ?? `Percakapan kerja bahasa Jepang untuk profesi ${job.label}.`,
  }
}

export default async function KaiwaLessonPage({ params }: { params: Params }) {
  const { job: slug, lesson: rawNo } = await params
  const lessonNo = parseLessonNo(rawNo)
  if (lessonNo === null) notFound()

  const [job, lesson, all] = await Promise.all([
    getKaiwaJob(slug),
    getKaiwaLesson(slug, lessonNo),
    getKaiwaLessons(slug),
  ])
  if (!job || !lesson) notFound()

  const sector = getSswSector(job.sector_slug)
  const accent = sector?.accent ?? 'var(--red)'
  const level = levelCodeById(lesson.level_id)
  const vocab = (lesson.vocab_highlight as unknown as VocabHi[] | null) ?? []

  // Tetangga dicari di daftar silabus, bukan lesson_no ± 1 — nomor bisa
  // berlubang kalau ada pelajaran yang belum terisi.
  const index = all.findIndex((l) => l.lesson_no === lessonNo)
  const prev = index > 0 ? all[index - 1] : undefined
  const next = index >= 0 && index < all.length - 1 ? all[index + 1] : undefined

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
              { name: `第${lessonNo}課 ${lesson.title}`, path: `/kaiwa/kerja/${job.slug}/${lessonNo}` },
            ]),
            learningResourceJsonLd({
              name: `第${lessonNo}課 ${lesson.title} — ${job.label}`,
              description: lesson.goal ?? `Percakapan kerja bahasa Jepang untuk profesi ${job.label}.`,
              path: `/kaiwa/kerja/${job.slug}/${lessonNo}`,
              level: level ?? 'N5',
              resourceType: 'Dialog percakapan',
              teaches: `Percakapan kerja bahasa Jepang untuk ${job.label} (${job.jp})`,
            }),
          ]}
        />
        <section className="px-5 md:px-12 py-10 max-w-3xl mx-auto">
          <Link
            href={`/kaiwa/kerja/${job.slug}`}
            className="inline-flex items-center gap-1.5 text-[13px] no-underline mb-6 hover:text-koto-text transition-colors"
            style={{ color: 'var(--muted)' }}
          >
            ← {job.label}
          </Link>

          {/* Kepala pelajaran */}
          <div className="mb-6">
            <div className="flex items-center gap-2 mb-2">
              <span
                className="text-[11px] px-2.5 py-1 rounded-full font-serif"
                style={{ background: `${accent}18`, color: accent }}
              >
                第{lesson.lesson_no}課
              </span>
              {level && (
                <span
                  className="text-[11px] px-2.5 py-1 rounded-full font-serif"
                  style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
                >
                  {level}
                </span>
              )}
              <span className="text-[11px]" style={{ color: 'var(--muted)' }}>
                {job.jp}
              </span>
            </div>
            <h1 className="font-serif text-[23px] md:text-[27px] font-semibold text-ink leading-tight">
              {lesson.title}
            </h1>
            {lesson.goal && (
              <p
                className="text-[13px] mt-3 p-3.5 rounded-xl leading-[1.8]"
                style={{ background: 'var(--paper-dark)', color: 'var(--ink)' }}
              >
                <span className="font-medium" style={{ color: accent }}>
                  Sasaran ·{' '}
                </span>
                {lesson.goal}
              </p>
            )}
          </div>

          {/* Dialog + pemutar shadowing */}
          <div
            className="rounded-2xl overflow-hidden mb-6"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            <KaiwaDialogue lines={lesson.lines} accentColor={accent} title={lesson.title} />

            {vocab.length > 0 && (
              <div className="flex flex-wrap gap-2 px-5 py-4" style={{ borderTop: '0.5px solid var(--border)' }}>
                {vocab.map((v, i) => (
                  <span
                    key={i}
                    className="text-[11px] px-2.5 py-1 rounded-lg"
                    style={{ background: 'var(--paper-dark)', color: 'var(--ink)' }}
                  >
                    <span className="font-serif font-medium">{v.word}</span>
                    {v.reading && <span className="opacity-60"> ({v.reading})</span>}
                    <span style={{ color: 'var(--muted)' }}> — {v.meaning}</span>
                  </span>
                ))}
              </div>
            )}
          </div>

          {/* Navigasi silabus */}
          <div className="flex items-stretch gap-3">
            {prev ? (
              <Link
                href={`/kaiwa/kerja/${job.slug}/${prev.lesson_no}`}
                className="flex-1 rounded-xl p-4 no-underline hover-lift"
                style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
              >
                <span className="text-[11px]" style={{ color: 'var(--muted)' }}>
                  ← 第{prev.lesson_no}課
                </span>
                <div className="font-serif text-[13px] text-ink leading-snug mt-0.5">{prev.title}</div>
              </Link>
            ) : (
              <div className="flex-1" />
            )}

            {next ? (
              <Link
                href={`/kaiwa/kerja/${job.slug}/${next.lesson_no}`}
                className="flex-1 rounded-xl p-4 no-underline hover-lift text-right"
                style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
              >
                <span className="text-[11px]" style={{ color: 'var(--muted)' }}>
                  第{next.lesson_no}課 →
                </span>
                <div className="font-serif text-[13px] text-ink leading-snug mt-0.5">{next.title}</div>
              </Link>
            ) : (
              <div
                className="flex-1 rounded-xl p-4 flex items-center justify-end gap-2"
                style={{ background: 'var(--paper-dark)' }}
              >
                <Icon name="star" className="w-4 h-4" style={{ color: accent }} />
                <span className="text-[12px]" style={{ color: 'var(--muted)' }}>
                  Pelajaran terakhir
                </span>
              </div>
            )}
          </div>
        </section>
      </main>
      <Footer />
    </>
  )
}
