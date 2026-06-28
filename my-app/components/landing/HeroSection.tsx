import Link from 'next/link'
import { AnimatedKanji } from '@/components/ui/AnimatedKanji'
import { Reveal } from '@/components/ui/Reveal'
import { Icon } from '@/components/ui/Icon'
import { HeroBackground } from '@/components/ui/HeroBackground'

export function HeroSection() {
  return (
    <section className="min-h-screen flex items-center px-5 md:px-12 pt-24 pb-16 relative overflow-hidden">
      {/* Foto latar: Gunung Fuji & sakura, ditutup lapisan washi */}
      <HeroBackground
        src="/images/hero-home.jpg"
        alt="Gunung Fuji dengan bunga sakura"
        priority
        overlay={0.8}
      />

      {/* Kabut gradien bergerak (aurora) — termasuk nuansa hijau */}
      <div className="aurora" aria-hidden="true" />

      {/* Latar grid halus */}
      <div
        className="absolute inset-0 pointer-events-none"
        style={{
          backgroundImage:
            'linear-gradient(var(--border) 1px, transparent 1px), linear-gradient(90deg, var(--border) 1px, transparent 1px)',
          backgroundSize: '56px 56px',
          maskImage: 'radial-gradient(ellipse 70% 60% at 70% 50%, black 0%, transparent 75%)',
          WebkitMaskImage: 'radial-gradient(ellipse 70% 60% at 70% 50%, black 0%, transparent 75%)',
          opacity: 0.5,
        }}
        aria-hidden="true"
      />

      <AnimatedKanji
        char="学"
        fontSize="clamp(220px, 32vw, 360px)"
        fillOpacity={0.05}
        className="hidden md:block absolute top-1/2 right-0 -translate-y-1/2 float-soft max-w-[45vw]"
      />

      <div className="relative z-10 max-w-[580px]">
        {/* Badge */}
        <Reveal delay={0}>
          <div
            className="glass inline-flex items-center gap-2 text-[11px] tracking-[0.09em] uppercase mb-8 px-3.5 py-1.5 rounded-full"
            style={{ color: 'var(--red)' }}
          >
            <span className="w-1.5 h-1.5 rounded-full animate-pulse-dot" style={{ background: 'var(--red)' }} />
            Platform Bahasa Jepang · Untuk Indonesia
          </div>
        </Reveal>

        {/* Title */}
        <Reveal delay={90}>
          <h1 className="text-[36px] md:text-[54px] font-semibold leading-[1.15] mb-2 tracking-tight">
            <span className="font-display text-sweep">Bahasa Jepang</span>
            <br />
            <span className="font-serif text-ink">dari Kata ke Dunia</span>
          </h1>
        </Reveal>
        <Reveal delay={160}>
          <p className="font-serif text-lg font-light text-muted italic mb-6">
            言葉から世界へ
          </p>
        </Reveal>
        <Reveal delay={220}>
          <p className="text-[15px] text-muted leading-[1.8] mb-9 max-w-[460px]">
            Dari N5 sampai N1, dari SSW sampai level bisnis — belajar bahasa Jepang
            secara terstruktur dan interaktif, dirancang khusus untuk orang Indonesia
            yang ingin benar-benar lancar.
          </p>
        </Reveal>

        {/* CTA buttons */}
        <Reveal delay={290}>
          <div className="flex flex-wrap items-center gap-3 mb-12">
            <Link
              href="/register"
              className="text-sm font-medium px-8 py-3.5 rounded-lg bg-ink text-paper hover:opacity-90 hover:-translate-y-px transition-all"
            >
              Mulai Belajar Gratis
            </Link>
            <Link
              href="#kaiwa"
              className="inline-flex items-center gap-2 text-sm px-6 py-3.5 rounded-lg border text-ink hover:bg-paper-dark transition-colors"
              style={{ borderColor: 'var(--border)' }}
            >
              <Icon name="play" className="w-3.5 h-3.5" /> Lihat Contoh
            </Link>
          </div>
        </Reveal>

        {/* Stats */}
        <Reveal delay={360}>
          <div className="flex flex-wrap gap-x-9 gap-y-4">
            {[
              { num: '8 Level', label: 'N5 hingga Bisnis' },
              { num: 'SRS', label: 'Sistem Pengulangan Cerdas' },
              { num: 'Gratis', label: 'Daftar Tanpa Biaya' },
            ].map(({ num, label }) => (
              <div key={label}>
                <span className="font-serif text-[26px] font-semibold text-ink block">{num}</span>
                <span className="text-[11px] text-muted tracking-[0.04em]">{label}</span>
              </div>
            ))}
          </div>
        </Reveal>
      </div>

      {/* Scroll hint */}
      <div className="absolute bottom-7 left-12 flex items-center gap-3 text-[11px] text-muted tracking-[0.1em] uppercase">
        <div className="w-10 h-px bg-muted" />
        Scroll
      </div>
    </section>
  )
}
