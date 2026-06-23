import Link from 'next/link'
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'

export const metadata: Metadata = {
  title: 'Halaman tidak ditemukan | Koto no Ha',
}

export default function NotFound() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen flex items-center justify-center px-5">
        <section className="relative text-center py-20 overflow-hidden">
          {/* Watermark kanji 迷 (tersesat) */}
          <span
            className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 font-serif select-none pointer-events-none float-soft"
            style={{ fontSize: 'clamp(180px, 30vw, 300px)', color: 'var(--ink)', opacity: 0.05, lineHeight: 1 }}
            aria-hidden
          >
            迷
          </span>

          <div className="relative">
            <p className="font-serif text-[64px] md:text-[88px] font-semibold text-ink leading-none mb-2">404</p>
            <p className="font-serif text-lg text-muted italic mb-1">道に迷いました</p>
            <h1 className="font-serif text-2xl font-semibold text-ink mb-3">Halaman tidak ditemukan</h1>
            <p className="text-[14px] text-muted max-w-[420px] mx-auto mb-8 leading-[1.8]">
              Sepertinya kamu tersesat. Halaman yang kamu cari mungkin sudah dipindahkan
              atau tidak pernah ada. Mari kembali ke jalur belajarmu.
            </p>
            <div className="flex flex-wrap items-center justify-center gap-3">
              <Link
                href="/"
                className="text-sm font-medium px-7 py-3 rounded-lg bg-ink text-paper hover:opacity-90 transition-opacity no-underline"
              >
                Ke Beranda
              </Link>
              <Link
                href="/kana"
                className="text-sm px-6 py-3 rounded-lg border text-ink hover:bg-paper-dark transition-colors no-underline"
                style={{ borderColor: 'var(--border)' }}
              >
                Mulai dari Kana
              </Link>
            </div>
          </div>
        </section>
      </main>
      <Footer />
    </>
  )
}
