import Link from 'next/link'
import type { NewsArticle } from '@/lib/types/database.types'
import { levelCodeById } from '@/lib/data/queries'

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

/** Ambil ringkasan dari content_jp (baris pertama, dipotong). */
function excerpt(content: string, max = 90): string {
  const firstLine = content.split('\n').find((l) => l.trim().length > 0) ?? ''
  // Buang furigana dalam kurung agar ringkasan lebih bersih.
  const clean = firstLine.replace(/\([^)]*\)/g, '')
  return clean.length > max ? clean.slice(0, max) + '…' : clean
}

export function BeritaCard({ article, featured = false }: { article: NewsArticle; featured?: boolean }) {
  const level = levelCodeById(article.level_tag_id)

  return (
    <Link
      href={`/berita/${article.id}`}
      className="block rounded-xl p-5 no-underline transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_10px_28px_rgba(13,13,18,0.08)]"
      style={{
        background: featured ? 'var(--ink-surface)' : 'var(--surface)',
        border: '0.5px solid var(--border)',
      }}
    >
      <div className="flex items-center gap-2 mb-2.5">
        {article.category && (
          <span
            className="text-[10px] tracking-[0.1em] uppercase"
            style={{ color: featured ? '#ff6b81' : 'var(--red)' }}
          >
            {article.category}
          </span>
        )}
        {level && (
          <span
            className="text-[10px] px-2 py-0.5 rounded"
            style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
          >
            {level} Level
          </span>
        )}
      </div>

      <div
        className="font-serif font-semibold leading-[1.5] mb-1.5"
        style={{
          fontSize: featured ? '18px' : '15px',
          color: featured ? 'var(--on-ink)' : 'var(--ink)',
        }}
      >
        {article.title_jp}
      </div>

      {article.title_id && (
        <div
          className="text-[13px] leading-[1.6] mb-2"
          style={{ color: featured ? 'var(--on-ink-muted)' : 'var(--muted)' }}
        >
          {article.title_id}
        </div>
      )}

      <div
        className="text-[12px] leading-[1.65] mb-3"
        style={{ color: featured ? 'var(--on-ink-muted)' : 'var(--muted)' }}
      >
        {excerpt(article.content_jp)}
      </div>

      <div
        className="text-[11px]"
        style={{ color: featured ? 'var(--on-ink-faint)' : 'var(--muted)' }}
      >
        {formatDate(article.published_at)}
      </div>
    </Link>
  )
}
