const visaCards = [
  {
    type: 'ssw',
    badge: 'SSW · 特定技能',
    title: 'Specified Skilled Worker',
    desc: 'Visa kerja untuk sektor tertentu yang membutuhkan keahlian teknis dan kemampuan bahasa Jepang minimum N4.',
    items: [
      'Syarat JLPT N4 atau ujian sektoral',
      '14 sektor industri tersedia',
      'Durasi visa hingga 5 tahun (SSW1)',
      'Panduan ujian sektoral tersedia',
    ],
    accent: 'var(--red)',
    badgeBg: 'var(--red-bg)',
    badgeColor: 'var(--red)',
  },
  {
    type: 'tg',
    badge: 'TG2 · 特定技能2号',
    title: 'Tokutei Ginou 2 (SSW2)',
    desc: 'Perpanjangan SSW dengan hak membawa keluarga dan durasi tidak terbatas, untuk pekerja yang memenuhi syarat.',
    items: [
      'Bawa keluarga diizinkan',
      'Perpanjangan indefinite',
      'Syarat keahlian lebih tinggi',
      'Jalur menuju PR (Permanent Resident)',
    ],
    accent: 'var(--gold)',
    badgeBg: 'var(--gold-bg)',
    badgeColor: 'var(--gold)',
  },
  {
    type: 'gk',
    badge: 'GK · 技人国',
    title: 'Gijutsu · Jinbunchishiki',
    desc: 'Visa untuk insinyur, spesialis IT, dan tenaga ahli dengan kualifikasi profesional atau gelar sarjana terkait.',
    items: [
      'Cocok untuk lulusan IT / Teknik',
      'Tidak ada batasan sektor',
      'Dapat diperpanjang terus-menerus',
      'Syarat bahasa lebih fleksibel',
    ],
    accent: 'var(--teal)',
    badgeBg: 'var(--teal-bg)',
    badgeColor: 'var(--teal)',
  },
]

export function VisaSection() {
  return (
    <section id="visa" className="px-12 py-22">
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Visa & Ketenagakerjaan
      </p>
      <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
        SSW, Tokutei Ginou & Gijinkoku<br />dalam Bahasa Indonesia
      </h2>
      <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
        Panduan lengkap status visa kerja di Jepang — syarat, prosedur, dan tips lulus — semuanya tersedia di platform ini.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
        {visaCards.map(({ badge, title, desc, items, accent, badgeBg, badgeColor }) => (
          <div
            key={title}
            className="bg-white rounded-xl p-6 relative overflow-hidden"
            style={{ border: '0.5px solid rgba(13,13,18,0.1)' }}
          >
            {/* Top accent bar */}
            <div className="absolute top-0 left-0 right-0 h-[3px]" style={{ background: accent }} />

            <span
              className="text-[11px] font-medium px-2.5 py-0.5 rounded inline-block mb-3"
              style={{ background: badgeBg, color: badgeColor }}
            >
              {badge}
            </span>
            <div className="font-serif text-[15px] font-semibold text-ink mb-2">{title}</div>
            <div className="text-[12.5px] text-muted leading-[1.7] mb-3">{desc}</div>
            <ul className="flex flex-col gap-1.5">
              {items.map((item) => (
                <li key={item} className="flex items-start gap-2 text-xs text-muted">
                  <span style={{ color: 'var(--border)', flexShrink: 0 }}>▸</span>
                  {item}
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </section>
  )
}
