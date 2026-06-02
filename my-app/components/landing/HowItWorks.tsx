const steps = [
  {
    num: '01',
    title: 'Tentukan Level & Tujuan',
    desc: 'Mulai dari placement test singkat atau pilih level langsung. Platform membuat jalur belajar yang dipersonalisasi berdasarkan target kamu.',
  },
  {
    num: '02',
    title: 'Belajar dengan Sistem Terstruktur',
    desc: 'Ikuti lesson, latihan soal, dan kaiwa stories secara berurutan. Flashcard SRS memastikan kamu tidak lupa materi yang sudah dipelajari.',
  },
  {
    num: '03',
    title: 'Pantau & Tingkatkan Terus',
    desc: 'Dashboard tracking menunjukkan persis di mana kamu perlu fokus. Target mingguan dan streak harian menjaga konsistensi belajarmu.',
  },
]

export function HowItWorks() {
  return (
    <section className="px-12 py-22" style={{ background: 'var(--paper-dark)' }}>
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Cara Kerja
      </p>
      <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] tracking-tight">
        Tiga Langkah Menuju Fasih
      </h2>

      <div
        className="grid grid-cols-1 md:grid-cols-3 mt-10 rounded-xl overflow-hidden"
        style={{ border: '0.5px solid var(--border)' }}
      >
        {steps.map(({ num, title, desc }, i) => (
          <div
            key={num}
            className="p-8"
            style={i < steps.length - 1 ? { borderRight: '0.5px solid var(--border)' } : {}}
          >
            <div
              className="font-serif text-[48px] font-light leading-none mb-5"
              style={{ color: 'var(--ink)', opacity: 0.08 }}
            >
              {num}
            </div>
            <div className="font-serif text-[16px] font-semibold text-ink mb-2">{title}</div>
            <div className="text-[13px] text-muted leading-[1.75]">{desc}</div>
          </div>
        ))}
      </div>
    </section>
  )
}
