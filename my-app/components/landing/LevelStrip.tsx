import Link from 'next/link'

const levels = [
  { code: 'N5', name: 'Dasar', active: false },
  { code: 'N4', name: 'Pemula', active: false },
  { code: 'N3', name: 'Menengah', active: true },
  { code: 'N2', name: 'Lanjutan', active: false },
  { code: 'N1', name: 'Mahir', active: false },
]

const special = [
  { code: 'SSW', name: 'Tokutei Ginou', href: '/ssw' },
  { code: 'TG', name: 'Gijinkoku', href: '/ssw' },
  { code: 'BIZ', name: 'Bisnis', href: '#level-biz' },
]

export function LevelStrip() {
  return (
    <div
      id="level"
      className="flex items-stretch overflow-x-auto px-5 md:px-12"
      style={{ background: 'var(--ink-surface)' }}
    >
      {levels.map((lvl) => (
        <Link
          key={lvl.code}
          href={`#level-${lvl.code.toLowerCase()}`}
          className="flex flex-col items-center gap-1 px-6 py-4 min-w-[80px] transition-colors no-underline"
          style={{
            borderRight: '0.5px solid var(--on-ink-line)',
            background: lvl.active ? 'rgba(200,16,46,0.15)' : 'transparent',
          }}
        >
          <span
            className="font-serif text-[16px] font-semibold"
            style={{ color: lvl.active ? 'var(--red)' : 'var(--on-ink)' }}
          >
            {lvl.code}
          </span>
          <span className="text-[10px] tracking-[0.04em] text-center" style={{ color: 'var(--on-ink-faint)' }}>
            {lvl.name}
          </span>
        </Link>
      ))}

      {/* Divider */}
      <div className="w-px self-stretch mx-2" style={{ background: 'var(--on-ink-line)' }} />

      {special.map((s) => (
        <Link
          key={s.code}
          href={s.href}
          className="flex flex-col items-center gap-1 px-6 py-4 min-w-[80px] hover:bg-white/[0.06] transition-colors no-underline"
          style={{ borderRight: '0.5px solid var(--on-ink-line)' }}
        >
          <span className="font-serif text-[14px] font-semibold" style={{ color: 'var(--on-ink)' }}>
            {s.code}
          </span>
          <span className="text-[10px] tracking-[0.04em] text-center" style={{ color: 'var(--on-ink-faint)' }}>
            {s.name}
          </span>
        </Link>
      ))}
    </div>
  )
}
