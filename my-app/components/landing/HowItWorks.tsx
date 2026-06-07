import { Reveal } from '@/components/ui/Reveal'

const steps = [
  {
    num: '01',
    title: 'Tentukan Level & Tujuan',
    desc: 'Ikuti tes penempatan singkat atau langsung pilih level. Sistem akan menyusun jalur belajar yang sesuai dengan targetmu.',
  },
  {
    num: '02',
    title: 'Belajar Secara Bertahap',
    desc: 'Kerjakan materi, latihan soal, dan percakapan secara berurutan. Kartu hafalan (SRS) memastikan kamu tidak lupa apa yang sudah dipelajari.',
  },
  {
    num: '03',
    title: 'Pantau & Terus Berkembang',
    desc: 'Halaman progres menunjukkan dengan jelas bagian mana yang perlu kamu perkuat. Target mingguan dan streak harian menjaga semangat belajarmu.',
  },
]

export function HowItWorks() {
  return (
    <section className="px-5 md:px-12 py-16 md:py-22" style={{ background: 'var(--paper-dark)' }}>
      <Reveal>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Cara Kerja
        </p>
        <h2 className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] tracking-tight">
          Tiga Langkah Menuju Fasih
        </h2>
      </Reveal>

      <div
        className="grid grid-cols-1 md:grid-cols-3 mt-10 rounded-xl overflow-hidden"
        style={{ border: '0.5px solid var(--border)' }}
      >
        {steps.map(({ num, title, desc }, i) => (
          <Reveal
            key={num}
            delay={i * 100}
            className="p-8"
            style={i < steps.length - 1 ? { borderRight: '0.5px solid var(--border)' } : undefined}
          >
            <div
              className="font-serif text-[48px] font-light leading-none mb-5"
              style={{ color: 'var(--ink)', opacity: 0.08 }}
            >
              {num}
            </div>
            <div className="font-serif text-[16px] font-semibold text-ink mb-2">{title}</div>
            <div className="text-[13px] text-muted leading-[1.75]">{desc}</div>
          </Reveal>
        ))}
      </div>
    </section>
  )
}
