import Link from 'next/link'
import { WashiArt } from './WashiArt'
import { PohonKata } from './PohonKata'

// Section 1 — Hero. Teks adalah elemen LCP: tanpa animasi masuk, tanpa menunggu JS.
export function HeroWashi() {
  return (
    <section className="relative isolate min-h-[92vh] flex items-end md:items-center px-5 md:px-12 pt-28 pb-16 overflow-hidden">
      <WashiArt src="/images/washi/hero-ranting.webp" mobileSrc="/images/washi/hero-ranting-hp.webp" priority />
      <PohonKata />

      <div className="relative z-10 max-w-[560px]">
        <p className="text-[12px] tracking-[0.14em] uppercase mb-5" style={{ color: 'var(--crimson)' }}>
          <span lang="ja" className="font-serif">言の葉</span> · Bahasa Jepang untuk orang Indonesia
        </p>
        <h1 className="font-serif text-[36px] md:text-[56px] font-semibold leading-[1.12] tracking-tight mb-5" style={{ color: 'var(--text)' }}>
          Belajar bahasa Jepang, satu kata setiap hari.
        </h1>
        <p className="text-[15px] md:text-[16px] leading-[1.8] mb-9 max-w-[480px]" style={{ color: 'var(--muted)' }}>
          Materi N5–N3 berbahasa Indonesia, 2.000+ soal latihan lengkap dengan pembahasan, dan video per pola.
          Mulai gratis, lanjut kapan pun kamu siap.
        </p>
        <div className="flex flex-wrap gap-3">
          <Link
            href="/register"
            className="text-[14px] font-medium px-7 py-3.5 rounded-lg no-underline hover:opacity-90"
            style={{ background: 'var(--crimson)', color: '#FAFAFA' }}
          >
            Mulai gratis
          </Link>
          <Link
            href="#harga"
            className="text-[14px] px-7 py-3.5 rounded-lg no-underline"
            style={{ border: '1px solid var(--brand-line)', color: 'var(--text)', background: 'color-mix(in srgb, var(--paper) 70%, transparent)' }}
          >
            Lihat paket
          </Link>
        </div>
        <p className="hidden md:block mt-8 text-[13px]" style={{ color: 'var(--muted)' }}>
          Arahkan kursor ke daun di kanan untuk melihat cara baca dan artinya.
        </p>
      </div>
    </section>
  )
}
