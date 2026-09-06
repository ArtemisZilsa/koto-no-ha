import { Reveal } from '@/components/ui/Reveal'

const steps = [
  {
    num: '01',
    title: 'Pilih Level & Tujuan',
    desc: 'Pilih sendiri mau mulai dari mana, N5 sampai N1 atau langsung kosakata kerja SSW. Belum yakin di level mana? Coba kuisnya dulu buat ngukur.',
  },
  {
    num: '02',
    title: 'Belajar Secara Bertahap',
    desc: 'Kerjakan kosakata, kanji, dan tata bahasa per level, lalu latih lewat percakapan dan bacaan dokkai. Semuanya bisa kamu buka kapan saja, tanpa urutan yang mengunci.',
  },
  {
    num: '03',
    title: 'Pantau & Terus Berkembang',
    desc: 'Uji hafalanmu lewat kuis — XP-nya masuk ke akunmu dan streak harian ikut jalan. Halaman progres detail dan kartu hafalan SRS lagi aku garap.',
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
