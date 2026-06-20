import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'

export const metadata: Metadata = {
  title: 'Kontak — Koto no Ha',
  description: 'Hubungi tim Koto no Ha untuk pertanyaan, masukan, atau kolaborasi.',
}

export default function KontakPage() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <div className="px-5 md:px-12 py-16 max-w-2xl mx-auto">
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Hubungi Kami
          </p>
          <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-4 tracking-tight">
            Kontak
          </h1>
          <p className="text-[15px] text-muted leading-[1.8] mb-10 max-w-[500px]">
            Ada pertanyaan, masukan, atau ingin berkolaborasi? Kami senang mendengar dari kamu.
          </p>

          <div className="space-y-6">
            {/* TODO: tambahkan kartu Email kontak resmi di sini ketika alamat sudah siap. */}
            <div
              className="rounded-xl p-6"
              style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
            >
              <p className="text-[11px] tracking-[0.1em] uppercase mb-1" style={{ color: 'var(--muted)' }}>
                Instagram
              </p>
              <a
                href="https://instagram.com/kotobanoha"
                target="_blank"
                rel="noopener noreferrer"
                className="font-serif text-[17px] font-medium text-ink hover:opacity-70 transition-opacity no-underline"
              >
                @kotobanoha
              </a>
            </div>

            <div
              className="rounded-xl p-6"
              style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
            >
              <p className="text-[11px] tracking-[0.1em] uppercase mb-2" style={{ color: 'var(--muted)' }}>
                Waktu Respons
              </p>
              <p className="text-[14px] text-muted leading-[1.7]">
                Kami biasanya merespons dalam 1–2 hari kerja. Untuk pertanyaan teknis, sertakan deskripsi masalah secara detail agar kami dapat membantu lebih cepat.
              </p>
            </div>
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
