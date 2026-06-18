import { notFound } from 'next/navigation'
import Link from 'next/link'
import { getSswSector } from '@/lib/data/sswSectors'
import { getVocabByField, getKnownItemIds, getKnownVocabCountByField } from '@/lib/data/queries'
import VocabList from '@/components/learn/VocabList'
import Pagination from '@/components/learn/Pagination'
import InkDivider from '@/components/ui/InkDivider'
import { HeroBackground } from '@/components/ui/HeroBackground'
import { Icon } from '@/components/ui/Icon'

type Params = { field: string }
type SearchParams = { page?: string }

export async function generateMetadata({ params }: { params: Promise<Params> }) {
  const { field } = await params
  const sector = getSswSector(field)
  if (!sector) return { title: 'Koto no Ha' }
  return { title: `${sector.label} — Kosakata SSW | Koto no Ha` }
}

export default async function BidangPage({
  params,
  searchParams,
}: {
  params: Promise<Params>
  searchParams: Promise<SearchParams>
}) {
  const { field } = await params
  const { page } = await searchParams

  const sector = getSswSector(field)
  if (!sector || sector.status !== 'active') {
    notFound()
  }

  const pageNum = Math.max(1, parseInt(page ?? '1', 10) || 1)
  const vocabPaged = await getVocabByField(sector.slug, pageNum)

  const vocabPageIds = vocabPaged.items.map((v) => v.id).filter((x): x is string => !!x)
  const [knownVocabSet, knownVocabTotal] = await Promise.all([
    getKnownItemIds('vocab', vocabPageIds),
    getKnownVocabCountByField(sector.slug),
  ])

  const basePath = `/learn/bidang/${sector.slug}`
  const total = vocabPaged.total
  const knownPct = total > 0 ? Math.round((knownVocabTotal / total) * 100) : 0

  return (
    <main>
      {/* ── Hero ─────────────────────────────────────────────── */}
      <section
        className="relative overflow-hidden px-8 py-16"
        style={{ borderBottom: '0.5px solid var(--border)' }}
      >
        <HeroBackground
          src="/images/hero-ssw.jpg"
          alt="Jalan tradisional Kyoto dengan pagoda"
          priority
          overlay={0.86}
        />
        <div
          className="absolute inset-0 pointer-events-none -z-10"
          style={{ background: `linear-gradient(135deg, ${sector.accentBg} 0%, transparent 70%)`, opacity: 0.6 }}
          aria-hidden
        />

        {/* Watermark kanji raksasa */}
        <span
          className="absolute right-0 top-1/2 -translate-y-1/2 font-serif select-none pointer-events-none float-soft"
          style={{ fontSize: 'clamp(180px, 28vw, 320px)', lineHeight: 1, color: 'var(--ink)', opacity: 0.05, right: '-3%' }}
          aria-hidden
        >
          {sector.bgKanji}
        </span>

        <div className="relative max-w-5xl mx-auto">
          {/* Breadcrumb kembali ke hub */}
          <Link
            href="/ssw"
            className="inline-flex items-center gap-1.5 text-[12px] mb-5 no-underline transition-colors hover:opacity-80"
            style={{ color: 'var(--muted)' }}
          >
            <span aria-hidden>←</span> Kembali ke SSW
          </Link>

          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: sector.accent }}>
            特定技能 · {sector.jp}
          </p>

          <div className="flex items-center gap-4 mb-5">
            <span
              className="inline-flex items-center justify-center w-14 h-14 rounded-2xl shrink-0"
              style={{ background: sector.accentBg, color: sector.accent }}
            >
              <Icon name={sector.icon} className="w-7 h-7" />
            </span>
            <div>
              <h1 className="font-serif text-3xl font-semibold leading-tight" style={{ color: 'var(--ink)' }}>
                {sector.label}
              </h1>
              <div className="text-[13px] mt-0.5" style={{ color: 'var(--muted)' }}>
                Kosakata istilah khusus (専門用語) bidang {sector.jp}
              </div>
            </div>
          </div>

          <InkDivider colorVar={sector.accent} className="max-w-md mb-5" />

          <div className="flex items-center gap-3 flex-wrap">
            <span
              className="flex items-center gap-1.5 text-[12px] px-3 py-1.5 rounded-full"
              style={{ background: `${sector.accent}18`, color: sector.accent, border: `0.5px solid ${sector.accent}40` }}
            >
              <span className="font-serif font-medium">語彙</span>
              <span className="font-sans">{total} kosakata</span>
            </span>
            {knownVocabTotal > 0 && (
              <span
                className="flex items-center gap-1.5 text-[12px] px-3 py-1.5 rounded-full"
                style={{ background: 'var(--green-bg)', color: 'var(--green)' }}
                title={`${knownVocabTotal} dari ${total} sudah kamu kenal (${knownPct}%)`}
              >
                <Icon name="sparkles" className="w-3.5 h-3.5" />
                <span className="font-medium tabular-nums">{knownVocabTotal}/{total} dikenal</span>
              </span>
            )}
          </div>
        </div>
      </section>

      {/* ── Daftar kosakata ──────────────────────────────────── */}
      <section className="px-8 py-10 max-w-5xl mx-auto">
        {total > 0 && (
          <div className="mb-4 text-[12px]" style={{ color: 'var(--muted)' }}>
            Menampilkan{' '}
            <span className="font-medium" style={{ color: 'var(--ink)' }}>
              {(vocabPaged.page - 1) * vocabPaged.pageSize + 1}–
              {Math.min(vocabPaged.page * vocabPaged.pageSize, total)}
            </span>{' '}
            dari <span className="font-medium" style={{ color: 'var(--ink)' }}>{total}</span> kosakata
          </div>
        )}

        <VocabList vocab={vocabPaged.items} accentColor={sector.accent} knownIds={knownVocabSet} />

        <Pagination
          currentPage={pageNum}
          totalPages={vocabPaged.totalPages}
          basePath={basePath}
          tabParam="vocab"
          accentColor={sector.accent}
        />
      </section>
    </main>
  )
}
