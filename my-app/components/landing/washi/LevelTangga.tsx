import Link from 'next/link'
import { getPracticeTotals } from '@/lib/data/queries'
import { WashiArt } from './WashiArt'

const LEVELS = [
  { code: 'N5', name: 'Dasar', jp: '初級', note: 'Huruf, salam, kalimat pertama' },
  { code: 'N4', name: 'Pemula', jp: '初中級', note: 'Percakapan sehari-hari' },
  { code: 'N3', name: 'Menengah', jp: '中級', note: 'Siap kerja & tinggal di Jepang' },
] as const

const fmt = (n: number) => n.toLocaleString('id-ID')

// Section 2 — Tangga level. Angka asli dari database (cache 1 jam, lihat getPracticeTotals).
// Anak tangga naik ke kanan: N5 paling bawah, N3 paling atas, searah tangga torii di ilustrasi.
export async function LevelTangga() {
  const totals = await getPracticeTotals()

  return (
    <section id="level" className="relative isolate px-5 md:px-12 py-20 md:py-28 overflow-hidden">
      <WashiArt src="/images/washi/level-torii.webp" />

      <div className="max-w-5xl mx-auto">
        <p className="text-[12px] tracking-[0.14em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
          <span lang="ja" className="font-serif">階段</span> · Naik level selangkah demi selangkah
        </p>
        <h2 className="font-serif text-[28px] md:text-[40px] font-semibold leading-tight mb-12 max-w-[520px]" style={{ color: 'var(--text)' }}>
          Dari nol sampai siap kerja di Jepang.
        </h2>

        <ol className="tangga grid gap-4 md:grid-cols-3 md:items-end list-none p-0">
          {LEVELS.map((l, i) => (
            <li key={l.code} className="tangga-step" style={{ '--step': i } as React.CSSProperties}>
              <Link
                href="/latihan"
                className="block rounded-xl p-6 no-underline"
                style={{ background: 'color-mix(in srgb, var(--surface) 88%, transparent)', border: '1px solid var(--brand-line)' }}
              >
                <div className="flex items-baseline justify-between mb-1">
                  <span className="font-serif text-[34px] font-semibold" style={{ color: 'var(--crimson)' }}>{l.code}</span>
                  <span lang="ja" className="font-serif text-[13px]" style={{ color: 'var(--muted)' }}>{l.jp}</span>
                </div>
                <p className="text-[15px] font-medium mb-1" style={{ color: 'var(--text)' }}>{l.name}</p>
                <p className="text-[13px] mb-5" style={{ color: 'var(--muted)' }}>{l.note}</p>
                <dl className="grid grid-cols-3 gap-2 text-center">
                  {[
                    ['Kosakata', totals.kosakata[l.code] ?? 0],
                    ['Kanji', totals.kanji[l.code] ?? 0],
                    ['Pola', totals.tata_bahasa[l.code] ?? 0],
                  ].map(([label, n]) => (
                    <div key={label as string} className="flex flex-col-reverse">
                      <dt className="text-[11px]" style={{ color: 'var(--muted)' }}>{label}</dt>
                      <dd className="font-serif text-[18px] font-semibold tabular-nums m-0" style={{ color: 'var(--text)' }}>{fmt(n as number)}</dd>
                    </div>
                  ))}
                </dl>
              </Link>
            </li>
          ))}
        </ol>
      </div>
    </section>
  )
}
