import Link from 'next/link'

export function HeroSection() {
  return (
    <section className="min-h-screen flex items-center px-12 pt-20 pb-16 relative overflow-hidden">
      {/* Background kanji */}
      <div
        className="absolute top-1/2 right-[-2%] -translate-y-1/2 font-serif font-light leading-none pointer-events-none select-none"
        style={{ fontSize: '360px', color: 'var(--ink)', opacity: 0.04, letterSpacing: '-0.05em' }}
        aria-hidden="true"
      >
        学
      </div>

      <div className="relative z-10 max-w-[580px]">
        {/* Badge */}
        <div
          className="inline-flex items-center gap-2 text-[11px] tracking-[0.09em] uppercase mb-8 px-3 py-1 rounded-full"
          style={{
            color: 'var(--red)',
            border: '0.5px solid rgba(200,16,46,0.3)',
          }}
        >
          <span className="w-1.5 h-1.5 rounded-full animate-pulse-dot" style={{ background: 'var(--red)' }} />
          Platform Bahasa Jepang · Untuk Indonesia
        </div>

        {/* Title */}
        <h1 className="font-serif text-[54px] font-semibold leading-[1.15] text-ink mb-2 tracking-tight">
          Bahasa Jepang<br />dari Kata ke Dunia
        </h1>
        <p className="font-serif text-lg font-light text-muted italic mb-6">
          言葉から世界へ
        </p>
        <p className="text-[15px] text-muted leading-[1.8] mb-9 max-w-[460px]">
          Dari N5 hingga N1, dari SSW hingga level bisnis — pelajari bahasa Jepang
          dengan metode terstruktur, interaktif, dan dirancang untuk orang Indonesia
          yang ingin benar-benar fasih.
        </p>

        {/* CTA buttons */}
        <div className="flex items-center gap-3 mb-12">
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
            <span>▶</span> Lihat Demo
          </Link>
        </div>

        {/* Stats */}
        <div className="flex gap-9">
          {[
            { num: '12K+', label: 'Pengguna Aktif' },
            { num: '8 Level', label: 'N5 hingga Bisnis' },
            { num: '500+', label: 'Cerita Kaiwa' },
          ].map(({ num, label }) => (
            <div key={label}>
              <span className="font-serif text-[26px] font-semibold text-ink block">{num}</span>
              <span className="text-[11px] text-muted tracking-[0.04em]">{label}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Scroll hint */}
      <div className="absolute bottom-7 left-12 flex items-center gap-3 text-[11px] text-muted tracking-[0.1em] uppercase">
        <div className="w-10 h-px bg-muted" />
        Scroll
      </div>
    </section>
  )
}
