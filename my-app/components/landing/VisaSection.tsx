import Link from 'next/link'
import { Reveal } from '@/components/ui/Reveal'

const visaCards = [
  {
    type: 'ssw',
    badge: 'SSW · 特定技能',
    title: 'Specified Skilled Worker',
    desc: 'Visa kerja untuk sektor tertentu yang membutuhkan keahlian teknis dan kemampuan bahasa Jepang minimal N4.',
    items: [
      'Butuh JLPT N4 atau lulus ujian keahlian sektor',
      'Tersedia di 14 sektor industri',
      'Masa berlaku visa hingga 5 tahun (SSW1)',
      'Dilengkapi panduan ujian per sektor',
    ],
    accent: 'var(--red)',
    badgeBg: 'var(--red-bg)',
    badgeColor: 'var(--red)',
  },
  {
    type: 'tg',
    badge: 'TG2 · 特定技能2号',
    title: 'Tokutei Ginou 2 (SSW2)',
    desc: 'Kelanjutan dari SSW dengan hak membawa keluarga dan masa tinggal tanpa batas, bagi pekerja yang memenuhi syarat.',
    items: [
      'Boleh membawa keluarga',
      'Bisa diperpanjang tanpa batas waktu',
      'Butuh keahlian tingkat lebih tinggi',
      'Bisa jadi jalan menuju izin tinggal tetap',
    ],
    accent: 'var(--gold)',
    badgeBg: 'var(--gold-bg)',
    badgeColor: 'var(--gold)',
  },
  {
    type: 'gk',
    badge: 'GK · 技人国',
    title: 'Gijutsu · Jinbunchishiki',
    desc: 'Visa untuk insinyur, tenaga IT, dan profesional lain yang punya keahlian khusus atau gelar sarjana terkait.',
    items: [
      'Cocok untuk lulusan IT / Teknik',
      'Tidak terbatas pada sektor tertentu',
      'Bisa diperpanjang terus-menerus',
      'Syarat bahasa lebih longgar',
    ],
    accent: 'var(--teal)',
    badgeBg: 'var(--teal-bg)',
    badgeColor: 'var(--teal)',
  },
]

export function VisaSection() {
  return (
    <section id="visa" className="px-5 md:px-12 py-16 md:py-22">
      <Reveal>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Visa & Ketenagakerjaan
        </p>
        <h2 className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
          SSW, Tokutei Ginou & Gijinkoku<br />dalam Bahasa Indonesia
        </h2>
        <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
          Panduan lengkap soal visa kerja di Jepang — mulai dari syarat, prosedur, sampai tips agar lolos — semuanya ada di sini.
        </p>
      </Reveal>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
        {visaCards.map(({ badge, title, desc, items, accent, badgeBg, badgeColor }, i) => (
          <Reveal key={title} delay={i * 80}>
          <div
            className="bg-surface rounded-xl p-6 relative overflow-hidden hover-lift h-full koto-bordered"
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
          </Reveal>
        ))}
      </div>

      <div className="mt-9">
        <Link
          href="/ssw"
          className="inline-flex items-center gap-2 text-[13px] font-medium px-6 py-2.5 rounded-lg bg-ink text-paper no-underline hover:opacity-90 transition-opacity"
        >
          Panduan Lengkap SSW (14 Sektor) →
        </Link>
      </div>
    </section>
  )
}
