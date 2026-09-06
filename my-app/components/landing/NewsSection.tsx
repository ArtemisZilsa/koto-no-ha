import Link from 'next/link'
import { Reveal } from '@/components/ui/Reveal'
import { Icon } from '@/components/ui/Icon'

/**
 * Kartu di bawah ini contoh tampilan, bukan feed langsung dari database —
 * makanya tidak ada tanggal dan tidak diklaim sebagai artikel terbaru. Daftar
 * artikel yang sebenarnya ada di /berita.
 */
const articles = [
  {
    featured: true,
    cat: 'Ekonomi',
    title: '日本の物価上昇が続く中、政府は新しい対策を発表した',
    excerpt:
      'Pemerintah Jepang mengumumkan paket kebijakan baru untuk mengatasi kenaikan harga yang terus berlanjut sejak awal tahun ini, termasuk subsidi energi dan bantuan langsung...',
    chip: null,
  },
  {
    featured: false,
    cat: 'Teknologi',
    title: 'AIロボットが介護現場に導入される',
    excerpt:
      'Robot AI kini mulai digunakan di fasilitas perawatan lansia di seluruh Jepang untuk mengurangi beban tenaga kaigo.',
    chip: 'N3 Level',
  },
  {
    featured: false,
    cat: 'Ketenagakerjaan',
    title: '外国人労働者のための日本語支援が47都道府県に拡大',
    excerpt:
      'Program dukungan bahasa Jepang untuk tenaga kerja asing diperluas ke seluruh prefektur mulai Juli mendatang.',
    chip: 'N2 Level',
  },
]

export function NewsSection() {
  return (
    <section id="berita" className="px-5 md:px-12 py-16 md:py-22" style={{ background: 'var(--paper-dark)' }}>
      <Reveal>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Baca Berita
        </p>
        <h2 className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
          Belajar dari Berita Jepang Asli
        </h2>
        <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-3">
          Artikel berbahasa Jepang lengkap dengan judul terjemahan Indonesia dan tanda level JLPT, jadi kamu bisa belajar langsung dari konteksnya. Tiap artikel ada tautan ke sumber aslinya di NHK.
        </p>
        <p className="text-[12.5px] text-muted max-w-[540px] leading-[1.7] mb-12 italic">
          Tiga kartu di bawah cuma contoh tampilan — daftar artikelnya ada di halaman Berita.
        </p>
      </Reveal>

      <div className="grid grid-cols-1 md:grid-cols-[1.2fr_1fr_1fr] gap-3.5">
        {articles.map(({ featured, cat, title, excerpt, chip }, i) => (
          <Reveal key={title} delay={i * 80}>
          <Link
            href="/berita"
            className="block h-full rounded-xl p-5 no-underline hover-lift"
            style={{
              background: featured ? 'var(--ink-surface)' : 'var(--surface)',
              border: '0.5px solid var(--border)',
            }}
          >
            {featured && (
              <div
                className="inline-flex items-center gap-1.5 text-[10px] px-2 py-0.5 rounded mb-2.5"
                style={{
                  background: 'rgba(247,242,234,0.08)',
                  color: 'var(--on-ink-muted)',
                  border: '0.5px solid var(--on-ink-line)',
                }}
              >
                <Icon name="newspaper" className="w-3 h-3" /> Contoh tampilan
              </div>
            )}
            {!featured && chip && (
              <span
                className="text-[10px] px-2 py-0.5 rounded inline-block mb-2.5"
                style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
              >
                {chip}
              </span>
            )}
            <div
              className="text-[10px] tracking-[0.1em] uppercase mb-2.5"
              style={{ color: featured ? '#ff6b81' : 'var(--red)' }}
            >
              {cat}
            </div>
            <div
              className="font-serif font-semibold leading-[1.55] mb-2"
              style={{
                fontSize: featured ? '16px' : '14px',
                color: featured ? 'var(--on-ink)' : 'var(--ink)',
              }}
            >
              {title}
            </div>
            <div
              className="text-[12px] leading-[1.65]"
              style={{ color: featured ? 'var(--on-ink-muted)' : 'var(--muted)' }}
            >
              {excerpt}
            </div>
          </Link>
          </Reveal>
        ))}
      </div>

      <div className="mt-9">
        <Link
          href="/berita"
          className="inline-flex items-center gap-2 text-[13px] font-medium px-6 py-2.5 rounded-lg bg-ink text-paper no-underline hover:opacity-90 transition-opacity"
        >
          Lihat Semua Berita →
        </Link>
      </div>
    </section>
  )
}
