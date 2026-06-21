import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import KanaBoard from '@/components/kana/KanaBoard'

export const metadata: Metadata = {
  title: 'Hiragana & Katakana | Koto no Ha',
  description:
    'Belajar aksara dasar Jepang: Hiragana (ひらがな) & Katakana (カタカナ). Gojūon, dakuten, dan yōon lengkap dengan romaji, kartu interaktif, dan mode latihan.',
}

export default function KanaPage() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16">
          <div className="max-w-4xl mx-auto mb-10 text-center">
            <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--teal)' }}>
              仮名 · Kana
            </p>
            <h1 className="font-serif text-[28px] md:text-[36px] font-semibold text-ink leading-tight mb-3 tracking-tight">
              Hiragana &amp; Katakana
            </h1>
            <p className="text-[14px] text-muted leading-[1.8] max-w-[560px] mx-auto">
              Langkah pertama menguasai bahasa Jepang: kuasai dua aksara dasarnya. Pelajari
              setiap bunyi lewat kartu interaktif, lalu nyalakan <span className="text-ink">mode latihan</span> untuk
              menguji ingatanmu tanpa romaji.
            </p>
          </div>

          <KanaBoard />
        </section>
      </main>
      <Footer />
    </>
  )
}
