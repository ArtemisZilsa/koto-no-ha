import Link from 'next/link'

export const metadata = {
  alternates: { canonical: '/tentang' },
  title: 'Tentang — Koto no Ha',
  description: 'Cerita di balik Koto no Ha — platform belajar bahasa Jepang untuk orang Indonesia, disusun langsung dari pengalaman tinggal dan kerja di Jepang.',
}

export default function TentangPage() {
  return (
    <>
      <main className="min-h-screen px-5 md:px-12 pt-28 pb-20 max-w-[720px] mx-auto">
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Tentang Aku
        </p>
        <h1 className="font-serif text-[30px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-6 tracking-tight">
          言の葉 · Koto no Ha
        </h1>

        <div className="prose-koto space-y-5 text-[15px] text-muted leading-[1.85]">
          <p>
            Aku Zilsa. Sudah 3 tahun tinggal dan kerja di Jepang, dengan kemampuan bahasa Jepang setara JLPT N1.
          </p>
          <p>
            <strong className="text-ink">Koto no Ha</strong> lahir dari rasa frustrasi pribadi — banyak materi bahasa Jepang yang beredar isinya cuma tata bahasa buku teks, sementara yang beneran dipakai orang Jepang sehari-hari itu jauh berbeda. Idiom, ungkapan, kata-kata yang nggak pernah diajarin di kelas formal, tapi justru yang bikin kamu kedengeran natural pas ngobrol sama orang Jepang beneran.
          </p>
          <p>
            Semua konten di sini aku susun sendiri, berdasarkan apa yang beneran aku dengar dan pakai selama tinggal di sini — bukan hasil terjemahan dari sumber lain.
          </p>
          <p>
            Kalau kamu lagi belajar bahasa Jepang dan capek sama materi yang kaku, aku harap Koto no Ha bisa jadi tempat yang lebih nyambung.
          </p>

          <h2 className="font-serif text-[20px] font-semibold text-ink mt-8 mb-3">Hubungi aku</h2>
          <p>
            Ada pertanyaan atau saran? Kunjungi halaman{' '}
            <Link href="/kontak" className="text-ink underline hover:opacity-70 transition-opacity">Kontak</Link>{' '}
            atau ikuti aku di{' '}
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
    </>
  )
}
