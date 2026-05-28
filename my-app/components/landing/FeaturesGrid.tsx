const features = [
  {
    icon: '📊',
    title: 'Progress Tracking Real-Time',
    desc: 'Pantau kemajuan Kanji, Bunpo, Dokkai, dan Choukai secara terpisah. Algoritma SRS otomatis menjadwalkan ulang materi yang perlu diulang.',
    tag: 'Kanji · Bunpo · Dokkai · Choukai',
  },
  {
    icon: '📰',
    title: 'Berita Jepang Terkini',
    desc: 'Baca berita dari NHK Web Easy dan sumber terpercaya langsung di platform. Kosakata sulit otomatis ditandai sesuai level JLPT kamu.',
    tag: 'Update Harian · Level-Adaptive',
  },
  {
    icon: '🏢',
    title: 'Informasi SSW & Visa Jepang',
    desc: 'Panduan lengkap Tokutei Ginou, Gijinkoku, dan peraturan ketenagakerjaan Jepang terbaru dalam bahasa Indonesia yang mudah dipahami.',
    tag: 'SSW · TG · Gijinkoku · Peraturan',
  },
  {
    icon: '🗣️',
    title: 'Kaiwa Stories',
    desc: '500+ cerita percakapan dari situasi sehari-hari hingga bisnis. Audio native speaker untuk melatih pendengaran dan intonasi alami.',
    tag: 'Audio · Dialog · Konteks Nyata',
  },
  {
    icon: '📖',
    title: 'Latihan Dokkai',
    desc: 'Teks bacaan autentik N5–N1 dengan pertanyaan pemahaman bergaya JLPT, kosakata kunci, dan penjelasan grammar yang terperinci.',
    tag: 'N5 → N1 · JLPT-Style',
  },
  {
    icon: '🃏',
    title: 'Flashcard Cerdas (SRS)',
    desc: 'Kartu Kanji dan kosakata dengan algoritma Spaced Repetition. Belajar lebih sedikit, ingat lebih lama. Dapat dikustomisasi per level.',
    tag: 'SRS · Kanji · Kosakata',
  },
]

export function FeaturesGrid() {
  return (
    <section id="fitur" className="px-12 py-22">
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Fitur Platform
      </p>
      <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
        Semua yang Kamu Butuhkan<br />dalam Satu Tempat
      </h2>
      <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
        Dari latihan soal JLPT hingga percakapan bisnis level — dirancang khusus untuk pelajar Indonesia.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
        {features.map(({ icon, title, desc, tag }) => (
          <div
            key={title}
            className="bg-white rounded-xl p-6 hover:-translate-y-0.5 hover:shadow-[0_10px_28px_rgba(13,13,18,0.07)] transition-all duration-200"
            style={{ border: '0.5px solid rgba(13,13,18,0.1)' }}
          >
            <span className="text-[22px] mb-3.5 block">{icon}</span>
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
          </div>
        ))}
      </div>
    </section>
  )
}
