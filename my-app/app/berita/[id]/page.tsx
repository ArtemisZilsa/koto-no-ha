import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { getNewsById, levelCodeById } from '@/lib/data/queries'

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ id: string }>
}): Promise<Metadata> {
  const { id } = await params
  const article = await getNewsById(id)
  if (!article) return { title: 'Berita tidak ditemukan | Koto no Ha' }
  return {
    title: `${article.title_id ?? article.title_jp} | Koto no Ha`,
    description: article.title_id ?? article.title_jp,
  }
}

export default async function BeritaDetailPage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  const article = await getNewsById(id)
  if (!article) notFound()

  const level = levelCodeById(article.level_tag_id)

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <article className="px-6 md:px-12 py-14 max-w-[760px] mx-auto">
          <Link
            href="/berita"
            className="inline-block text-[13px] text-muted no-underline mb-8 hover:text-koto-text transition-colors"
          >
            ← Kembali ke Berita
          </Link>

          {/* Meta */}
          <div className="flex items-center gap-2.5 mb-4">
            {article.category && (
              <span className="text-[11px] tracking-[0.1em] uppercase" style={{ color: 'var(--red)' }}>
                {article.category}
              </span>
            )}
            {level && (
              <span
                className="text-[10px] px-2 py-0.5 rounded"
                style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
              >
                {level} Level
              </span>
            )}
            <span className="text-[11px] text-muted">{formatDate(article.published_at)}</span>
          </div>

          {/* Judul */}
          <h1 className="font-serif text-[28px] md:text-[34px] font-semibold text-ink leading-[1.35] mb-3 tracking-tight">
            {article.title_jp}
          </h1>
          {article.title_id && (
            <p className="text-[16px] text-muted leading-[1.6] mb-8">{article.title_id}</p>
          )}

          <hr className="ink-stroke mb-8" />

          {/* Isi artikel — pertahankan baris baru */}
          <div className="font-serif text-[17px] text-ink leading-[2] whitespace-pre-line">
            {article.content_jp}
          </div>

          {/* Sumber */}
          {article.source_url && (
            <div className="mt-10 pt-6" style={{ borderTop: '0.5px solid var(--border)' }}>
              <a
                href={article.source_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 text-[13px] font-medium px-5 py-2.5 rounded-lg bg-ink text-paper no-underline hover:opacity-90 transition-opacity"
              >
                Baca Sumber Asli (NHK) ↗
              </a>
            </div>
          )}
        </article>
      </main>
      <Footer />
    </>
  )
}
