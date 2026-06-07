import Link from 'next/link'
import { AnimatedKanji } from '@/components/ui/AnimatedKanji'

export function CTASection() {
  return (
    <section
      className="px-5 md:px-12 py-16 md:py-24 text-center relative overflow-hidden"
      style={{ background: 'var(--ink-surface)' }}
    >
      {/* Kabut gradien bergerak (aurora, nuansa hijau) di latar gelap */}
      <div className="aurora" aria-hidden="true" style={{ opacity: 0.5 }} />

      {/* Background character — ditulis ala sumi-e */}
      <AnimatedKanji
        char="言"
        fontSize="240px"
        color="#f7f2ea"
        fillOpacity={0.03}
        className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 float-soft"
      />

      <h2 className="font-serif text-[30px] md:text-[42px] font-semibold leading-tight mb-3 relative" style={{ color: 'var(--on-ink)' }}>
        Mulai Perjalananmu Hari Ini
      </h2>
      <p className="text-[15px] mb-9 relative" style={{ color: 'var(--on-ink-muted)' }}>
        Fitur dasar gratis selamanya. Tingkatkan ke versi lengkap kapan saja.
      </p>
      <Link
        href="/register"
        className="relative inline-block text-sm font-medium px-9 py-3.5 rounded-lg hover:opacity-90 transition-opacity"
        style={{ background: 'var(--on-ink)', color: 'var(--ink-surface)' }}
      >
        Daftar Sekarang — Gratis
      </Link>
    </section>
  )
}
