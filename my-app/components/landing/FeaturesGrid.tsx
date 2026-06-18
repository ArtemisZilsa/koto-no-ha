import Link from 'next/link'
import { Icon, type IconName } from '@/components/ui/Icon'
import { Reveal } from '@/components/ui/Reveal'

const features: { icon: IconName; accent: string; bg: string; title: string; desc: string; tag: string; href?: string }[] = [
  {
    icon: 'play',
    accent: 'var(--gold)',
    bg: 'var(--gold-bg)',
    title: 'Kuis Kanji Interaktif',
    desc: 'Uji hafalan Kanji lewat kuis pilihan ganda yang seru: 10 soal, timer, streak, dan confetti. Kumpulkan XP yang langsung masuk ke akunmu.',
    tag: 'Main Sekarang →',
    href: '/quiz',
  },
  {
    icon: 'bar-chart',
    accent: 'var(--teal)',
    bg: 'var(--teal-bg)',
    title: 'Pantau Kemajuan Belajar',
    desc: 'Lihat perkembangan Kanji, tata bahasa, membaca, dan menyimak secara terpisah. Sistem pengulangan otomatis (SRS) menjadwalkan kembali materi yang perlu kamu ulang.',
    tag: 'Kanji · Tata Bahasa · Membaca · Menyimak',
  },
  {
    icon: 'newspaper',
    accent: 'var(--red)',
    bg: 'var(--red-bg)',
    title: 'Berita Jepang Terkini',
    desc: 'Baca berita dari NHK Web Easy dan sumber tepercaya langsung di sini. Kata-kata sulit otomatis ditandai sesuai level JLPT kamu.',
    tag: 'Diperbarui Tiap Hari · Sesuai Level',
  },
  {
    icon: 'building',
    accent: 'var(--gold)',
    bg: 'var(--gold-bg)',
    title: 'Info SSW & Visa Jepang',
    desc: 'Panduan lengkap soal Tokutei Ginou, Gijinkoku, dan aturan kerja terbaru di Jepang, dijelaskan dengan bahasa Indonesia yang gampang dipahami.',
    tag: 'SSW · TG · Gijinkoku · Aturan Kerja',
  },
  {
    icon: 'mic',
    accent: 'var(--green)',
    bg: 'var(--green-bg)',
    title: 'Latihan Percakapan (Kaiwa)',
    desc: 'Lebih dari 500 cerita percakapan, mulai dari obrolan sehari-hari sampai situasi bisnis. Lengkap dengan audio penutur asli untuk melatih pendengaran dan intonasi.',
    tag: 'Audio · Dialog · Situasi Nyata',
  },
  {
    icon: 'reading',
    accent: 'var(--red)',
    bg: 'var(--red-bg)',
    title: 'Latihan Membaca (Dokkai)',
    desc: 'Bacaan asli level N5–N1 dengan soal pemahaman bergaya JLPT, kosakata penting, dan penjelasan tata bahasa yang rinci.',
    tag: 'N5 → N1 · Gaya JLPT',
  },
  {
    icon: 'cards',
    accent: 'var(--green)',
    bg: 'var(--green-bg)',
    title: 'Kartu Hafalan Pintar (SRS)',
    desc: 'Kartu Kanji dan kosakata dengan sistem pengulangan terjadwal. Belajar lebih sedikit, tapi ingatannya bertahan lebih lama. Bisa diatur per level.',
    tag: 'SRS · Kanji · Kosakata',
  },
]

export function FeaturesGrid() {
  return (
    <section id="fitur" className="px-5 md:px-12 py-16 md:py-22">
      <Reveal>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Fitur Platform
        </p>
        <h2 className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
          Semua yang Kamu Butuhkan<br />dalam Satu Tempat
        </h2>
        <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
          Dari latihan soal JLPT sampai percakapan bisnis — semuanya dirancang khusus untuk pelajar Indonesia.
        </p>
      </Reveal>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
        {features.map(({ icon, accent, bg, title, desc, tag, href }, i) => {
          const inner = (
            <>
              <span
                className="glass inline-flex items-center justify-center w-11 h-11 rounded-xl mb-4"
                style={{ background: bg, color: accent }}
              >
                <Icon name={icon} className="w-5 h-5" />
              </span>
              <div className="font-serif text-[15px] font-semibold text-ink mb-2">{title}</div>
              <div className="text-[12.5px] text-muted leading-[1.75]">{desc}</div>
              <span
                className="inline-block mt-3 text-[10px] tracking-[0.05em] px-2.5 py-0.5 rounded-full"
                style={{
                  background: 'var(--gold-bg)',
                  color: 'var(--gold)',
                  border: '0.5px solid rgba(201,150,60,0.2)',
                }}
              >
                {tag}
              </span>
            </>
          )
          return (
            <Reveal key={title} delay={(i % 3) * 80}>
              {href ? (
                <Link
                  href={href}
                  className="block bg-surface rounded-xl p-6 hover-lift h-full no-underline cursor-pointer"
                  style={{ border: `0.5px solid ${accent}40` }}
                >
                  {inner}
                </Link>
              ) : (
                <div className="bg-surface rounded-xl p-6 hover-lift h-full" style={{ border: '0.5px solid var(--border)' }}>
                  {inner}
                </div>
              )}
            </Reveal>
          )
        })}
      </div>
    </section>
  )
}
