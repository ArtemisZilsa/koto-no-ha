const articles = [
  {
    featured: true,
    src: '📰 NHK Web Easy · Hari Ini',
    cat: 'Ekonomi',
    title: '日本の物価上昇が続く中、政府は新しい対策を発表した',
    excerpt:
      'Pemerintah Jepang mengumumkan paket kebijakan baru untuk mengatasi kenaikan harga yang terus berlanjut sejak awal tahun ini, termasuk subsidi energi dan bantuan langsung...',
    date: '28 Mei 2026',
    chip: null,
  },
  {
    featured: false,
    src: null,
    cat: 'Teknologi',
    title: 'AIロボットが介護現場に導入される',
    excerpt:
      'Robot AI kini mulai digunakan di fasilitas perawatan lansia di seluruh Jepang untuk mengurangi beban tenaga kaigo.',
    date: '27 Mei 2026',
    chip: 'N3 Level',
  },
  {
    featured: false,
    src: null,
    cat: 'Ketenagakerjaan',
    title: '外国人労働者のための日本語支援が47都道府県に拡大',
    excerpt:
      'Program dukungan bahasa Jepang untuk tenaga kerja asing diperluas ke seluruh prefektur mulai Juli mendatang.',
    date: '26 Mei 2026',
    chip: 'N2 Level',
  },
]

export function NewsSection() {
  return (
    <section id="berita" className="px-12 py-22" style={{ background: 'var(--paper-dark)' }}>
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Konten Terkini
      </p>
      <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
        Belajar dari Berita Jepang Asli
      </h2>
      <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
        Artikel dari NHK Web Easy. Kata sulit otomatis ditandai sesuai level JLPT kamu untuk belajar secara kontekstual.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-[1.2fr_1fr_1fr] gap-3.5">
        {articles.map(({ featured, src, cat, title, excerpt, date, chip }) => (
          <div
            key={title}
            className="rounded-xl p-5"
            style={{
              background: featured ? 'var(--ink)' : 'white',
              border: '0.5px solid rgba(13,13,18,0.1)',
            }}
          >
            {featured && src && (
              <div
                className="text-[10px] px-2 py-0.5 rounded inline-block mb-2.5"
                style={{
                  background: 'rgba(255,255,255,0.08)',
                  color: 'rgba(247,242,234,0.5)',
                  border: '0.5px solid rgba(255,255,255,0.1)',
                }}
              >
                {src}
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
              style={{ color: featured ? 'rgba(200,16,46,0.75)' : 'var(--red)' }}
            >
              {cat}
            </div>
            <div
              className="font-serif font-semibold leading-[1.55] mb-2"
              style={{
                fontSize: featured ? '16px' : '14px',
                color: featured ? 'var(--paper)' : 'var(--ink)',
              }}
            >
              {title}
            </div>
            <div
              className="text-[12px] leading-[1.65]"
              style={{ color: featured ? 'rgba(247,242,234,0.55)' : 'var(--muted)' }}
            >
              {excerpt}
            </div>
            <div
              className="text-[11px] mt-3"
              style={{ color: featured ? 'rgba(247,242,234,0.4)' : 'var(--muted)' }}
            >
              {date}
            </div>
          </div>
        ))}
      </div>
    </section>
  )
}
