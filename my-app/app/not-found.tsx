import Link from 'next/link'
import { Footer } from '@/components/landing/Footer'

const shortcuts = [
  { href: '/kaiwa', label: 'Kaiwa' },
  { href: '/quiz', label: 'Kuis Kanji' },
  { href: '/ssw', label: 'Panduan SSW' },
  { href: '/berita', label: 'Berita' },
]

// Sengaja tanpa <Nav />: Nav membaca cookie auth, dan karena not-found root
// ikut di pohon setiap rute, itu membuat /login, /register, /noir jadi dinamis.
export default function NotFound() {
  return (
    <>
      <main className="min-h-screen px-5 md:px-12 pt-12 pb-20 max-w-[720px] mx-auto">
        <Link href="/" className="inline-flex items-center gap-2.5 no-underline mb-16">
          <span className="font-serif text-[22px] font-semibold text-ink tracking-tight">言の葉</span>
          <span className="text-[11px] text-muted tracking-[0.12em] uppercase">Koto no Ha</span>
        </Link>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          見つかりません · 404
        </p>
        <h1 className="font-serif text-[30px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-6 tracking-tight">
          Halaman tidak ditemukan
        </h1>

        <div className="space-y-8 text-[15px] text-muted leading-[1.85]">
          <p>
            Alamat yang kamu buka tidak ada, mungkin karena salah ketik atau halamannya sudah dipindah.
          </p>

          <div className="flex flex-wrap items-center gap-3">
            <Link
              href="/"
              className="text-sm font-medium px-6 py-3 rounded-lg bg-ink text-paper hover:opacity-90 transition-opacity no-underline"
            >
              Kembali ke Beranda
            </Link>
          </div>

          <div>
            <p className="text-[11px] tracking-[0.1em] uppercase text-muted mb-3">Atau langsung ke</p>
            <div className="flex flex-wrap gap-2">
              {shortcuts.map(({ href, label }) => (
                <Link
                  key={href}
                  href={href}
                  className="text-[13px] px-4 py-2 rounded-lg no-underline text-ink hover:bg-paper-dark transition-colors"
                  style={{ border: '0.5px solid var(--border)' }}
                >
                  {label}
                </Link>
              ))}
            </div>
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
