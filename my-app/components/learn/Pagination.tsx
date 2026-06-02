import Link from 'next/link'

interface PaginationProps {
  currentPage: number
  totalPages: number
  basePath: string  // misal: /learn/n5
  tabParam: string  // misal: vocab
  accentColor: string
}

export default function Pagination({
  currentPage,
  totalPages,
  basePath,
  tabParam,
  accentColor,
}: PaginationProps) {
  if (totalPages <= 1) return null

  const buildHref = (p: number) => `${basePath}?tab=${tabParam}&page=${p}`

  // Build smart page list (show first, last, current + neighbors)
  const pages: (number | 'gap')[] = []
  for (let p = 1; p <= totalPages; p++) {
    if (p === 1 || p === totalPages || Math.abs(p - currentPage) <= 1) {
      pages.push(p)
    } else if (pages[pages.length - 1] !== 'gap') {
      pages.push('gap')
    }
  }

  const prevPage = Math.max(1, currentPage - 1)
  const nextPage = Math.min(totalPages, currentPage + 1)

  return (
    <nav className="flex items-center justify-center gap-2 mt-10" aria-label="Pagination">
      {/* Prev */}
      <Link
        href={buildHref(prevPage)}
        aria-disabled={currentPage === 1}
        className={`text-[12px] px-3 py-1.5 rounded-lg no-underline transition-colors ${
          currentPage === 1 ? 'pointer-events-none opacity-40' : ''
        }`}
        style={{
          border: '0.5px solid var(--border-strong)',
          color: 'var(--muted)',
          background: 'var(--surface)',
        }}
      >
        ← Sebelumnya
      </Link>

      {/* Page numbers */}
      <div className="flex items-center gap-1">
        {pages.map((p, idx) =>
          p === 'gap' ? (
            <span key={`gap-${idx}`} className="text-muted text-[12px] px-1">
              …
            </span>
          ) : (
            <Link
              key={p}
              href={buildHref(p)}
              className="text-[12px] min-w-[32px] h-[32px] flex items-center justify-center rounded-lg no-underline transition-all"
              style={
                p === currentPage
                  ? {
                      background: accentColor,
                      color: 'var(--on-ink)',
                      boxShadow: '0 2px 6px rgba(0,0,0,0.18)',
                    }
                  : {
                      background: 'var(--surface)',
                      color: 'var(--muted)',
                      border: '0.5px solid var(--border-strong)',
                    }
              }
            >
              {p}
            </Link>
          ),
        )}
      </div>

      {/* Next */}
      <Link
        href={buildHref(nextPage)}
        aria-disabled={currentPage === totalPages}
        className={`text-[12px] px-3 py-1.5 rounded-lg no-underline transition-colors ${
          currentPage === totalPages ? 'pointer-events-none opacity-40' : ''
        }`}
        style={{
          border: '0.5px solid var(--border-strong)',
          color: 'var(--muted)',
          background: 'var(--surface)',
        }}
      >
        Selanjutnya →
      </Link>
    </nav>
  )
}
