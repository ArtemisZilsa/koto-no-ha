import Link from 'next/link'
import { AnimatedKanji } from '@/components/ui/AnimatedKanji'
import { Reveal } from '@/components/ui/Reveal'
import { Icon } from '@/components/ui/Icon'
import { HeroBackground } from '@/components/ui/HeroBackground'

// 10 hyougen bertema kata & belajar — satu dipilih acak tiap render.
// Halaman ini dirender dinamis per request, jadi tagline berganti
// setiap pengunjung kembali ke halaman depan.
const HYOUGEN = [
  { jp: '言葉は心の使い', romaji: 'Kotoba wa kokoro no tsukai', id: 'Kata-kata adalah utusan hati' },
  { jp: '継続は力なり', romaji: 'Keizoku wa chikara nari', id: 'Konsistensi adalah kekuatan' },
  { jp: '千里の道も一歩から', romaji: 'Senri no michi mo ippo kara', id: 'Perjalanan jauh dimulai dari satu langkah' },
  { jp: '七転び八起き', romaji: 'Nanakorobi yaoki', id: 'Jatuh tujuh kali, bangkit delapan kali' },
  { jp: '塵も積もれば山となる', romaji: 'Chiri mo tsumoreba yama to naru', id: 'Debu yang menumpuk pun menjadi gunung' },
  { jp: '習うより慣れろ', romaji: 'Narau yori narero', id: 'Praktik lebih ampuh daripada teori' },
  { jp: '初心忘るべからず', romaji: 'Shoshin wasuru bekarazu', id: 'Jangan lupakan semangat awalmu' },
  { jp: '好きこそ物の上手なれ', romaji: 'Suki koso mono no jouzu nare', id: 'Yang kamu sukai, akan kamu kuasai' },
  { jp: '石の上にも三年', romaji: 'Ishi no ue ni mo sannen', id: 'Kesabaran pasti membuahkan hasil' },
  { jp: '温故知新', romaji: 'Onko chishin', id: 'Belajar dari yang lama, temukan yang baru' },
]

// Fungsi biasa (bukan komponen) — dipanggil per request untuk memilih tagline acak.
function pickHyougen() {
  return HYOUGEN[Math.floor(Math.random() * HYOUGEN.length)]
}

export function HeroSection() {
  const hyougen = pickHyougen()

  return (
    <section className="min-h-screen flex items-center px-5 md:px-12 pt-24 pb-16 relative overflow-hidden">
      {/* Foto latar: Gunung Fuji & sakura, ditutup lapisan washi */}
      <HeroBackground
        src="/images/hero-home.jpg"
        alt="Gunung Fuji dengan bunga sakura"
        priority
        overlay={0.8}
      />

      {/* Kabut gradien bergerak (aurora) — termasuk nuansa hijau */}
      <div className="aurora" aria-hidden="true" />

      {/* Latar grid halus */}
      <div
        className="absolute inset-0 pointer-events-none"
        style={{
          backgroundImage:
            'linear-gradient(var(--border) 1px, transparent 1px), linear-gradient(90deg, var(--border) 1px, transparent 1px)',
          backgroundSize: '56px 56px',
          maskImage: 'radial-gradient(ellipse 70% 60% at 70% 50%, black 0%, transparent 75%)',
          WebkitMaskImage: 'radial-gradient(ellipse 70% 60% at 70% 50%, black 0%, transparent 75%)',
          opacity: 0.5,
        }}
        aria-hidden="true"
      />

      <AnimatedKanji
        char="学"
        fontSize="clamp(220px, 32vw, 360px)"
        fillOpacity={0.05}
        className="hidden md:block absolute top-1/2 right-0 -translate-y-1/2 float-soft max-w-[45vw]"
      />

      <div className="relative z-10 max-w-[580px]">
        {/* Badge */}
        <Reveal delay={0}>
          <div
            className="glass inline-flex items-center gap-2 text-[11px] tracking-[0.09em] uppercase mb-8 px-3.5 py-1.5 rounded-full"
            style={{ color: 'var(--red)' }}
          >
            <span className="w-1.5 h-1.5 rounded-full animate-pulse-dot" style={{ background: 'var(--red)' }} />
            Platform Bahasa Jepang · Untuk Indonesia
          </div>
        </Reveal>

        {/* Title */}
        <Reveal delay={90}>
          <h1 className="text-[36px] md:text-[54px] font-semibold leading-[1.15] mb-2 tracking-tight">
            <span className="font-display text-sweep">{hyougen.jp}</span>
            <br />
            <span className="font-serif text-ink">{hyougen.id}</span>
          </h1>
        </Reveal>
        <Reveal delay={160}>
          <p className="font-serif text-lg font-light text-muted italic mb-6">
            {hyougen.romaji}
          </p>
        </Reveal>
        <Reveal delay={220}>
          <p className="text-[15px] text-muted leading-[1.8] mb-9 max-w-[460px]">
            Dari N5 sampai N1, plus kosakata kerja SSW — belajar bahasa Jepang
            secara terstruktur dan interaktif, dirancang khusus untuk orang Indonesia
            yang ingin benar-benar lancar.
          </p>
        </Reveal>

        {/* CTA buttons */}
        <Reveal delay={290}>
          <div className="flex flex-wrap items-center gap-3 mb-12">
            <Link
              href="/register"
              className="text-sm font-medium px-8 py-3.5 rounded-lg bg-ink text-paper hover:opacity-90 hover:-translate-y-px transition-all"
            >
              Mulai Belajar Gratis
            </Link>
            <Link
              href="#kaiwa"
              className="inline-flex items-center gap-2 text-sm px-6 py-3.5 rounded-lg border text-ink hover:bg-paper-dark transition-colors"
              style={{ borderColor: 'var(--border)' }}
            >
              <Icon name="play" className="w-3.5 h-3.5" /> Lihat Contoh
            </Link>
          </div>
        </Reveal>

        {/* Stats */}
        <Reveal delay={360}>
          <div className="flex flex-wrap gap-x-9 gap-y-4">
            {[
              { num: '6 Level', label: 'N5 sampai N1 + SSW' },
              { num: '40+', label: 'Dialog dari Situasi Nyata' },
              { num: 'Gratis', label: 'Daftar Tanpa Biaya' },
            ].map(({ num, label }) => (
              <div key={label}>
                <span className="font-serif text-[26px] font-semibold text-ink block">{num}</span>
                <span className="text-[11px] text-muted tracking-[0.04em]">{label}</span>
              </div>
            ))}
          </div>
        </Reveal>
      </div>

      {/* Scroll hint */}
      <div className="absolute bottom-7 left-12 flex items-center gap-3 text-[11px] text-muted tracking-[0.1em] uppercase">
        <div className="w-10 h-px bg-muted" />
        Scroll
      </div>
    </section>
  )
}
