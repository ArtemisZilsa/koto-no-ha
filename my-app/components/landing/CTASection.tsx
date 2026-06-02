import Link from 'next/link'

export function CTASection() {
  return (
    <section
      className="px-5 md:px-12 py-16 md:py-24 text-center relative overflow-hidden"
      style={{ background: 'var(--ink-surface)' }}
    >
      {/* Background character */}
      <div
        className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 font-serif font-light leading-none pointer-events-none select-none"
        style={{ fontSize: '240px', color: 'rgba(247,242,234,0.025)' }}
        aria-hidden="true"
      >
        言
      </div>

      <h2 className="font-serif text-[30px] md:text-[42px] font-semibold leading-tight mb-3 relative" style={{ color: 'var(--on-ink)' }}>
        Mulai Perjalananmu Hari Ini
      </h2>
      <p className="text-[15px] mb-9 relative" style={{ color: 'var(--on-ink-muted)' }}>
        Gratis untuk fitur dasar. Upgrade kapan saja.
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
