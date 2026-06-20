import Link from 'next/link'
import type { Metadata } from 'next'
import { getDokkaiByLevel } from '@/lib/data/queries'
import type { JLPTLevel } from '@/lib/data/types'
import type { DokkaPassage } from '@/lib/types/database.types'
import { Icon } from '@/components/ui/Icon'
import { Reveal } from '@/components/ui/Reveal'
import { NeonGridBackground } from '@/components/effects/NeonGridBackground'

export const metadata: Metadata = {
  title: 'Dokkai — Latihan Membaca | Koto no Ha',
  description:
    'Latihan membaca (dokkai) bahasa Jepang N5–N1: bacaan dengan furigana, romaji, terjemahan Indonesia, dan soal pemahaman.',
}

const LEVELS: { code: JLPTLevel; name: string; accent: string; bg: string }[] = [
  { code: 'N5', name: 'Dasar', accent: 'var(--red)', bg: 'var(--red-bg)' },
  { code: 'N4', name: 'Pemula', accent: 'var(--gold)', bg: 'var(--gold-bg)' },
  { code: 'N3', name: 'Menengah', accent: 'var(--teal)', bg: 'var(--teal-bg)' },
  { code: 'N2', name: 'Lanjutan', accent: 'var(--green)', bg: 'var(--green-bg)' },
  { code: 'N1', name: 'Mahir', accent: 'var(--gold)', bg: 'var(--gold-bg)' },
]

/** Cuplikan singkat dari teks bacaan (potong di batas karakter). */
function snippet(p: DokkaPassage, max = 64): string {
  const base = p.text_content?.replace(/\s+/g, '') ?? ''
  return base.length > max ? base.slice(0, max) + '…' : base
}

export default async function DokkaiPage({
  searchParams,
}: {
  searchParams: Promise<{ level?: string; page?: string }>
}) {
  const { level, page } = await searchParams
  const active = LEVELS.find((l) => l.code === (level ?? '').toUpperCase()) ?? LEVELS[0]
  const pageNum = Math.max(1, parseInt(page ?? '1', 10) || 1)

  const { items, total, totalPages } = await getDokkaiByLevel(active.code, pageNum)

  return (
    <main className="relative z-10 px-5 md:px-8 py-10 max-w-4xl mx-auto">
      <NeonGridBackground />

      {/* Judul */}
      <Reveal className="mb-8">
        <p className="text-[11px] tracking-[0.12em] uppercase mb-2" style={{ color: active.accent }}>
          読解 · Dokkai
        </p>
        <h1 className="font-serif text-[26px] md:text-[34px] font-semibold text-ink leading-[1.2] mb-2 tracking-tight">
          Latihan Membaca
        </h1>
        <p className="text-[14px] text-muted max-w-[560px] leading-[1.8]">
          Pilih level, lalu pilih bacaan. Tiap kalimat dilengkapi cara baca (furigana &amp; romaji)
          dan terjemahan Indonesia, ditutup dengan soal pemahaman.
        </p>
      </Reveal>

      {/* Pemilih level */}
      <div className="mb-8">
        <p className="text-[12px] font-medium mb-2.5" style={{ color: 'var(--muted)' }}>
          Pilih Level
        </p>
        <div className="flex items-center gap-2 flex-wrap">
          {LEVELS.map((l) => {
            const isActive = l.code === active.code
            return (
              <Link
                key={l.code}
                href={`/dokkai?level=${l.code}`}
                className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium transition-all no-underline"
                style={
                  isActive
                    ? { background: 'var(--ink)', color: 'var(--paper)', boxShadow: 'var(--shadow-soft)' }
                    : { background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }
                }
              >
                <span className="font-serif">{l.code}</span>
                <span className="text-xs opacity-70">{l.name}</span>
              </Link>
            )
          })}
        </div>
      </div>

      {/* Daftar bacaan */}
      {items.length === 0 ? (
        <p className="text-[14px]" style={{ color: 'var(--muted)' }}>
          Belum ada bacaan untuk level ini. Segera hadir.
        </p>
      ) : (
        <>
          <p className="text-[12px] mb-4" style={{ color: 'var(--muted)' }}>
            {active.code} · {total} bacaan
          </p>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            {items.map((p, i) => (
              <Reveal key={p.id} delay={(i % 2) * 70}>
                <Link
                  href={`/dokkai/${p.id}`}
                  className="relative block h-full overflow-hidden rounded-2xl p-5 hover-lift no-underline"
                  style={{ background: 'var(--surface)', border: `0.5px solid ${active.accent}30` }}
                >
                  <div className="flex items-start gap-3">
                    <span
                      className="inline-flex items-center justify-center w-10 h-10 rounded-lg shrink-0"
                      style={{ background: active.bg, color: active.accent }}
                    >
                      <Icon name="reading" className="w-5 h-5" />
                    </span>
                    <div className="min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        <span
                          className="text-[10px] px-2 py-0.5 rounded-full"
                          style={{ background: `${active.accent}18`, color: active.accent }}
                        >
                          {active.code}
                        </span>
                        {p.is_premium && (
                          <span className="inline-flex items-center gap-1 text-[10px]" style={{ color: 'var(--muted)' }}>
                            <Icon name="lock" className="w-3 h-3" /> Premium
                          </span>
                        )}
                      </div>
                      <div className="font-serif text-[15px] font-semibold text-ink leading-snug mb-1">
                        {p.title}
                      </div>
                      <p className="font-serif text-[12.5px] leading-relaxed line-clamp-2" style={{ color: 'var(--muted)' }}>
                        {snippet(p)}
                      </p>
                      <div className="mt-2 inline-flex items-center gap-1 text-[11px] font-medium" style={{ color: active.accent }}>
                        Baca
                        <Icon name="chevron-right" className="w-3.5 h-3.5" />
                      </div>
                    </div>
                  </div>
                </Link>
              </Reveal>
            ))}
          </div>

          {/* Paginasi sederhana (muncul saat konten bertambah) */}
          {totalPages > 1 && (
            <nav className="flex items-center justify-center gap-2 mt-8" aria-label="Halaman">
              <Link
                href={`/dokkai?level=${active.code}&page=${Math.max(1, pageNum - 1)}`}
                aria-disabled={pageNum === 1}
                className={`text-[12px] px-3 py-1.5 rounded-lg no-underline ${pageNum === 1 ? 'pointer-events-none opacity-40' : ''}`}
                style={{ border: '0.5px solid var(--border)', color: 'var(--muted)', background: 'var(--surface)' }}
              >
                ← Sebelumnya
              </Link>
              <span className="text-[12px]" style={{ color: 'var(--muted)' }}>
                {pageNum} / {totalPages}
              </span>
              <Link
                href={`/dokkai?level=${active.code}&page=${Math.min(totalPages, pageNum + 1)}`}
                aria-disabled={pageNum === totalPages}
                className={`text-[12px] px-3 py-1.5 rounded-lg no-underline ${pageNum === totalPages ? 'pointer-events-none opacity-40' : ''}`}
                style={{ border: '0.5px solid var(--border)', color: 'var(--muted)', background: 'var(--surface)' }}
              >
                Selanjutnya →
              </Link>
            </nav>
          )}
        </>
      )}
    </main>
  )
}
