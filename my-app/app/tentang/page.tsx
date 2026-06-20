import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'

export const metadata: Metadata = {
  title: 'Tentang Kami — Koto no Ha',
  description: 'Koto no Ha adalah platform belajar bahasa Jepang online untuk pelajar Indonesia, dari N5 hingga level bisnis.',
}

export default function TentangPage() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <div className="px-5 md:px-12 py-16 max-w-2xl mx-auto">
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Tentang
          </p>
          <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-6 tracking-tight">
            Tentang Koto no Ha
          </h1>

          <div className="prose-koto space-y-5 text-[15px] text-muted leading-[1.9]">
            <p>
              <strong className="text-ink">Koto no Ha</strong> (言の葉) berarti &ldquo;daun kata&rdquo; dalam bahasa Jepang — sebuah metafora untuk kata-kata yang tumbuh dan menjadi bagian dari kehidupan sehari-hari.
            </p>
            <p>
              Kami membangun platform ini khusus untuk pelajar Indonesia yang ingin menguasai bahasa Jepang secara serius — dari fondasi N5 hingga percakapan bisnis dan persiapan kerja di Jepang.
            </p>
            <p>
              Koto no Ha menyediakan latihan kosakata, kanji, tata bahasa, percakapan (kaiwa), membaca (dokkai), serta informasi visa dan SSW — semuanya dalam satu platform yang terstruktur dan interaktif.
            </p>
            <p>
              Platform ini dikembangkan dari Jepang, dengan pemahaman langsung tentang kebutuhan orang Indonesia yang ingin bekerja, belajar, atau tinggal di Jepang.
            </p>
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
