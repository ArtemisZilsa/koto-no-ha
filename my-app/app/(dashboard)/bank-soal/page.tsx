import type { Metadata } from 'next'
import Link from 'next/link'
import { hasBankSoalAccess } from '@/lib/access'
import { getBankMenu, type BankUnit } from '@/lib/data/bankSoal'
import { percent } from '@/lib/data/practice'

// Konten berbayar: jangan diindeks. Login sudah dicek oleh (dashboard)/layout.tsx.
export const metadata: Metadata = {
  title: 'Bank Soal JLPT | Koto no Ha',
  robots: { index: false, follow: false },
}

export default async function BankSoalPage() {
  if (!(await hasBankSoalAccess())) return <Paywall />

  const menu = await getBankMenu()
  const empty = menu.grammar.length + menu.checkpoints.length + menu.kanji.length === 0

  return (
    <main className="px-5 md:px-12 py-12 md:py-16 max-w-5xl mx-auto">
      <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--crimson)' }}>
        問題集 · Bank Soal N5
      </p>
      <h1 className="font-serif text-[28px] md:text-[34px] font-semibold mb-3 flex items-center gap-3" style={{ color: 'var(--text)' }}>
        Bank Soal JLPT N5
        <span className="text-[11px] font-sans font-medium px-2 py-0.5 rounded-md" style={{ background: 'var(--crimson)', color: '#FAFAFA' }}>
          BETA
        </span>
      </h1>
      <p className="text-[14px] leading-[1.7] max-w-[640px] mb-12" style={{ color: 'var(--muted)' }}>
        Kerjakan latihan setelah menonton video tiap batch, lalu uji dirimu di checkpoint.
        Soal masih tahap beta: kalau ada yang janggal, tekan &ldquo;Laporkan soal&rdquo; di bawah pembahasan.
      </p>

      {empty && (
        <p className="text-[14px]" style={{ color: 'var(--muted)' }}>Soal sedang disiapkan. Cek lagi sebentar lagi, ya.</p>
      )}

      <Section jp="文法" title="Tata Bahasa · Latihan per video" units={menu.grammar} />
      <Section jp="確認" title="Checkpoint (diskor)" units={menu.checkpoints} />
      <Section jp="漢字" title="Kanji · per tema" units={menu.kanji} note="Tiap tema dibagi set berisi 20 soal." />
    </main>
  )
}

function Section({ jp, title, units, note }: { jp: string; title: string; units: BankUnit[]; note?: string }) {
  if (units.length === 0) return null
  return (
    <section className="mb-14">
      <h2 className="flex items-baseline gap-2 mb-1">
        <span lang="ja" className="font-serif text-[15px]" style={{ color: 'var(--crimson)' }}>{jp}</span>
        <span className="text-[16px] font-semibold" style={{ color: 'var(--text)' }}>{title}</span>
      </h2>
      {note && <p className="text-[12.5px] mb-4" style={{ color: 'var(--muted)' }}>{note}</p>}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 mt-4">
        {units.map((u) => {
          const pct = percent(u.mastered, u.total)
          return (
            <Link
              key={u.href}
              href={u.href}
              className="block rounded-xl p-4 no-underline transition-colors hover:border-[var(--crimson)]"
              style={{ border: '1px solid var(--brand-line)', background: 'var(--surface)' }}
            >
              <div className="flex items-baseline justify-between gap-2 mb-1">
                <span className="text-[14px] font-semibold" style={{ color: 'var(--text)' }}>{u.title}</span>
                <span className="text-[12px] tabular-nums" style={{ color: 'var(--muted)' }}>{u.mastered}/{u.total}</span>
              </div>
              <p lang="ja" className="text-[12.5px] leading-[1.6] mb-3 line-clamp-2" style={{ color: 'var(--muted)' }}>{u.subtitle}</p>
              <div className="h-[4px] rounded-full overflow-hidden" style={{ background: 'var(--brand-line)' }}>
                <div className="h-full" style={{ width: `${pct}%`, background: 'var(--crimson)' }} />
              </div>
            </Link>
          )
        })}
      </div>
    </section>
  )
}

function Paywall() {
  return (
    <main className="px-5 md:px-12 py-16 max-w-xl mx-auto text-center">
      <h1 className="font-serif text-[26px] font-semibold mb-3" style={{ color: 'var(--text)' }}>
        Bank Soal khusus pelanggan
      </h1>
      <p className="text-[14px] leading-[1.7] mb-8" style={{ color: 'var(--muted)' }}>
        Lebih dari 2.000 soal JLPT N5 lengkap dengan pembahasan, terbuka untuk pelanggan Video Kelas.
        Soal latihan gratis tetap bisa kamu kerjakan di halaman Latihan.
      </p>
      <div className="flex gap-3 justify-center flex-wrap">
        <Link href="/harga" className="px-5 py-2.5 rounded-lg text-[14px] no-underline" style={{ background: 'var(--crimson)', color: '#FAFAFA' }}>
          Lihat harga
        </Link>
        <Link href="/latihan" className="px-5 py-2.5 rounded-lg text-[14px] no-underline" style={{ border: '1px solid var(--brand-line)', color: 'var(--text)' }}>
          Latihan gratis
        </Link>
      </div>
    </main>
  )
}
