import Link from 'next/link'

export const metadata = {
  title: 'Tentang — Koto no Ha',
  description: 'Koto no Ha adalah platform belajar bahasa Jepang gratis untuk orang Indonesia, dari N5 hingga level bisnis.',
}

export default function TentangPage() {
  return (
    <main className="min-h-screen px-5 md:px-12 pt-28 pb-20 max-w-[720px] mx-auto">
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Tentang Kami
      </p>
      <h1 className="font-serif text-[30px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-6 tracking-tight">
        言の葉 · Koto no Ha
      </h1>

      <div className="prose-koto space-y-5 text-[15px] text-muted leading-[1.85]">
        <p>
          <strong className="text-ink">Koto no Ha</strong> (言の葉) berarti "kata-kata" dalam bahasa Jepang — nama yang mencerminkan misi kami: membawa bahasa Jepang lebih dekat ke tangan orang Indonesia.
        </p>
        <p>
          Platform ini dibangun untuk siapa saja yang ingin belajar bahasa Jepang secara serius — mulai dari pemula level N5, pelajar yang mempersiapkan diri untuk ujian JLPT, hingga pekerja yang mengincar program SSW (Specified Skilled Worker) di Jepang.
        </p>

        <h2 className="font-serif text-[20px] font-semibold text-ink mt-8 mb-3">Apa yang kami tawarkan</h2>
        <ul className="list-disc list-inside space-y-2">
          <li>Materi terstruktur dari N5 hingga N1 (kanji, kosakata, tata bahasa)</li>
          <li>Latihan percakapan (Kaiwa) dengan furigana dan terjemahan</li>
          <li>Kuis interaktif dengan sistem pengulangan cerdas (SRS)</li>
          <li>Panduan SSW dan visa kerja Jepang</li>
          <li>Berita Jepang yang disesuaikan dengan level JLPT</li>
        </ul>

        <h2 className="font-serif text-[20px] font-semibold text-ink mt-8 mb-3">Gratis selamanya?</h2>
        <p>
          Ya. Semua fitur inti Koto no Ha tersedia gratis. Kami percaya bahwa akses ke pendidikan berkualitas tidak seharusnya dibatasi oleh dompet.
        </p>

        <h2 className="font-serif text-[20px] font-semibold text-ink mt-8 mb-3">Hubungi kami</h2>
        <p>
          Ada pertanyaan atau saran? Kunjungi halaman{' '}
          <Link href="/kontak" className="text-ink underline hover:opacity-70 transition-opacity">Kontak</Link>{' '}
          atau ikuti kami di{' '}
          <a
            href="https://www.instagram.com/kotobanoha"
            target="_blank"
            rel="noopener noreferrer"
            className="text-ink underline hover:opacity-70 transition-opacity"
          >
            Instagram @kotobanoha
          </a>
          .
        </p>
      </div>
    </main>
  )
}
