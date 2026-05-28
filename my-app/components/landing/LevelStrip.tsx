import Link from 'next/link'

const levels = [
  { code: 'N5', name: 'Dasar', active: false },
  { code: 'N4', name: 'Pemula', active: false },
  { code: 'N3', name: 'Menengah', active: true },
  { code: 'N2', name: 'Lanjutan', active: false },
  { code: 'N1', name: 'Mahir', active: false },
]

const special = [
  { code: 'SSW', name: 'Tokutei Ginou' },
  { code: 'TG', name: 'Gijinkoku' },
  { code: 'BIZ', name: 'Bisnis' },
]

export function LevelStrip() {
  return (
    <div
      id="level"
      className="flex items-stretch overflow-x-auto px-12"
      style={{ background: 'var(--ink)' }}
    >
      {levels.map((lvl) => (
        <Link
          key={lvl.code}
          href={`#level-${lvl.code.toLowerCase()}`}
          className="flex flex-col items-center gap-1 px-6 py-4 min-w-[80px] transition-colors no-underline"
          style={{
            borderRight: '0.5px solid rgba(255,255,255,0.08)',
            background: lvl.active ? 'rgba(200,16,46,0.15)' : 'transparent',
          }}
        >
          <span
            className="font-serif text-[16px] font-semibold"
            style={{ color: lvl.active ? 'var(--red)' : 'rgba(255,255,255,0.9)' }}
          >
            {lvl.code}
          </span>
          <span className="text-[10px] tracking-[0.04em] text-center" style={{ color: 'rgba(255,255,255,0.35)' }}>
            {lvl.name}
          </span>
        </Link>
      ))}

      {/* Divider */}
      <div className="w-px self-stretch mx-2" style={{ background: 'rgba(255,255,255,0.08)' }} />

      {special.map((s) => (
        <Link
          key={s.code}
          href={`#level-${s.code.toLowerCase()}`}
          className="flex flex-col items-center gap-1 px-6 py-4 min-w-[80px] hover:bg-white/[0.06] transition-colors no-underline"
          style={{ borderRight: '0.5px solid rgba(255,255,255,0.08)' }}
        >
          <span className="font-serif text-[14px] font-semibold" style={{ color: 'rgba(255,255,255,0.9)' }}>
            {s.code}
          </span>
          <span className="text-[10px] tracking-[0.04em] text-center" style={{ color: 'rgba(255,255,255,0.35)' }}>
            {s.name}
          </span>
        </Link>
      ))}
    </div>
  )
}
