import Link from 'next/link'

const skills = [
  { name: '漢字 Kanji', pct: 72, color: 'var(--red)' },
  { name: '文法 Bunpo', pct: 58, color: 'var(--gold)' },
  { name: '読解 Dokkai', pct: 45, color: 'var(--teal)' },
  { name: '聴解 Choukai', pct: 31, color: 'var(--ink)' },
]

export function ProgressSection() {
  return (
    <section className="px-12 py-22" style={{ background: 'var(--paper-dark)' }}>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-10 items-center">
        {/* Text */}
        <div>
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Dashboard Belajar
          </p>
          <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
            Lihat Kemajuanmu<br />Setiap Hari
          </h2>
          <p className="text-[15px] text-muted leading-[1.8] mb-6 max-w-[460px]">
            Tracking terpisah untuk tiap skill. Streak harian, XP, dan laporan mingguan menjaga konsistensimu.
          </p>
          <Link
            href="/register"
            className="inline-block text-[13px] font-medium px-6 py-2.5 rounded-lg bg-ink text-paper hover:opacity-90 transition-opacity"
          >
            Coba Gratis Sekarang
          </Link>
        </div>

        {/* Mock dashboard card */}
        <div
          className="bg-surface rounded-2xl p-7"
          style={{ border: '0.5px solid var(--border)' }}
        >
          {/* User */}
          <div className="flex items-center gap-2.5 mb-6">
            <div className="w-[38px] h-[38px] rounded-full bg-ink flex items-center justify-center text-sm font-medium text-paper shrink-0">
              Z
            </div>
            <div>
              <div className="text-sm font-medium text-ink">Zilsa · N2 Learner</div>
              <div
                className="text-[10px] px-2 py-0.5 rounded mt-0.5 inline-block"
                style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
              >
                🔥 14 Hari Streak &nbsp;|&nbsp; N2 Target
              </div>
            </div>
          </div>

          {/* Progress bars */}
          <div className="flex flex-col gap-3.5">
            {skills.map(({ name, pct, color }) => (
              <div key={name}>
                <div className="flex justify-between text-xs mb-1.5">
                  <span className="text-muted">{name}</span>
                  <span className="font-medium text-ink">{pct}%</span>
                </div>
                <div className="h-1.5 rounded-full overflow-hidden" style={{ background: 'var(--paper-dark)' }}>
                  <div
                    className="h-full rounded-full transition-all"
                    style={{ width: `${pct}%`, background: color }}
                  />
                </div>
              </div>
            ))}
          </div>

          {/* Stats row */}
          <div
            className="flex mt-6 pt-5"
            style={{ borderTop: '0.5px solid var(--border)' }}
          >
            {[
              { num: '14', label: 'Hari Streak' },
              { num: '340', label: 'XP Minggu Ini' },
              { num: '128', label: 'Kanji Dikuasai' },
            ].map(({ num, label }, i) => (
              <div
                key={label}
                className="flex-1 text-center"
                style={i > 0 ? { borderLeft: '0.5px solid var(--border)' } : {}}
              >
                <span className="font-serif text-[22px] font-semibold text-ink block">{num}</span>
                <span className="text-[10px] text-muted">{label}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
