import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'

export const metadata: Metadata = {
  title: 'Kebijakan Privasi — Koto no Ha',
  description: 'Kebijakan privasi Koto no Ha: bagaimana kami mengumpulkan, menggunakan, dan melindungi data pengguna.',
}

export default function KebijakanPrivasiPage() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <div className="px-5 md:px-12 py-16 max-w-2xl mx-auto">
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Legal
          </p>
          <h1 className="font-serif text-[28px] md:text-[38px] font-semibold text-ink leading-[1.2] mb-2 tracking-tight">
            Kebijakan Privasi
          </h1>
          <p className="text-[12px] text-muted mb-8">Terakhir diperbarui: Juni 2026</p>

          <div className="space-y-8 text-[15px] text-muted leading-[1.9]">
            <section>
              <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">Data yang Kami Kumpulkan</h2>
              <p>
                Kami mengumpulkan data yang kamu berikan saat mendaftar (nama, alamat email) dan data aktivitas belajar di platform (progres kanji, kosakata, hasil kuis). Data ini digunakan untuk mempersonalisasi pengalaman belajarmu.
              </p>
            </section>

            <section>
              <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">Bagaimana Kami Menggunakan Data</h2>
              <ul className="list-disc pl-5 space-y-2">
                <li>Menyimpan progres belajar dan jadwal SRS kamu</li>
                <li>Menampilkan statistik kemajuan di dashboard</li>
                <li>Mengirim pengingat belajar (jika kamu mengaktifkannya)</li>
                <li>Meningkatkan kualitas konten dan fitur platform</li>
              </ul>
            </section>

            <section>
              <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">Keamanan Data</h2>
              <p>
                Data kamu disimpan di Supabase dengan enkripsi standar industri. Kami tidak menjual atau membagikan data pribadimu ke pihak ketiga untuk tujuan komersial.
              </p>
            </section>

            <section>
              <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">Cookies</h2>
              <p>
                Kami menggunakan cookies untuk mempertahankan sesi login dan preferensi tampilan. Kamu dapat menonaktifkan cookies di pengaturan browser, namun beberapa fitur mungkin tidak berfungsi optimal.
              </p>
            </section>

            <section>
              <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">Kontak</h2>
              {/* TODO: tambahkan email kontak resmi di sini ketika alamat sudah siap. */}
              <p>
                Pertanyaan seputar privasi? Hubungi kami melalui Instagram{' '}
                <a
                  href="https://instagram.com/kotobanoha"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-ink underline hover:opacity-70 transition-opacity"
                >
                  @kotobanoha
                </a>
              </p>
            </section>
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
