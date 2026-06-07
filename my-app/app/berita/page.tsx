import Link from 'next/link'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { BeritaCard } from '@/components/berita/BeritaCard'
import { getNewsList } from '@/lib/data/queries'

export const metadata: Metadata = {
  title: 'Berita Jepang | Koto no Ha',
  description: 'Belajar bahasa Jepang dari berita asli NHK Web Easy, ditandai sesuai level JLPT.',
}

export default async function BeritaPage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string }>
}) {
  const { page } = await searchParams
  const pageNum = Math.max(1, parseInt(page ?? '1', 10) || 1)
  const { items, totalPages } = await getNewsList(pageNum)

  const [featured, ...rest] = items

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-6 md:px-12 py-14 max-w-[1100px] mx-auto">
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Konten Terkini
          </p>
          <h1 className="font-serif text-[32px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-3 tracking-tight">
            Berita Jepang Asli
          </h1>
          <p className="text-[15px] text-muted max-w-[560px] leading-[1.8] mb-10">
            Artikel dari NHK Web Easy lengkap dengan furigana. Kata-kata sulit ditandai sesuai
            level JLPT kamu, jadi belajarnya langsung dari konteks. Klik artikel untuk membaca selengkapnya.
          </p>

          {items.length === 0 ? (
            <p className="text-muted text-sm">Belum ada artikel. Silakan kembali lagi nanti.</p>
          ) : (
            <>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
                {featured && (
                  <div className="md:col-span-3 lg:col-span-1 md:row-span-2">
                    <BeritaCard article={featured} featured />
                  </div>
                )}
                {rest.map((article) => (
                  <BeritaCard key={article.id} article={article} />
                ))}
              </div>

              {totalPages > 1 && (
                <nav className="flex items-center justify-center gap-2 mt-12" aria-label="Pagination">
                  <Link
                    href={`/berita?page=${Math.max(1, pageNum - 1)}`}
                    aria-disabled={pageNum === 1}
                    className={`text-[12px] px-3 py-1.5 rounded-lg no-underline transition-colors ${
                      pageNum === 1 ? 'pointer-events-none opacity-40' : ''
                    }`}
                    style={{ border: '0.5px solid var(--border-strong)', color: 'var(--muted)', background: 'var(--surface)' }}
                  >
                    ← Sebelumnya
                  </Link>
                  <span className="text-[12px] text-muted px-2">
                    Halaman {pageNum} / {totalPages}
                  </span>
                  <Link
                    href={`/berita?page=${Math.min(totalPages, pageNum + 1)}`}
                    aria-disabled={pageNum === totalPages}
                    className={`text-[12px] px-3 py-1.5 rounded-lg no-underline transition-colors ${
                      pageNum === totalPages ? 'pointer-events-none opacity-40' : ''
                    }`}
                    style={{ border: '0.5px solid var(--border-strong)', color: 'var(--muted)', background: 'var(--surface)' }}
                  >
                    Berikutnya →
                  </Link>
                </nav>
              )}
            </>
          )}
        </section>
      </main>
      <Footer />
    </>
  )
}
