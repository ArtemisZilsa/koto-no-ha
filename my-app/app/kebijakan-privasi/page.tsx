export const metadata = {
  title: 'Kebijakan Privasi — Koto no Ha',
  description: 'Kebijakan privasi Koto no Ha: bagaimana kami mengumpulkan, menggunakan, dan melindungi data kamu.',
}

export default function KebijakanPrivasiPage() {
  return (
    <main className="min-h-screen px-5 md:px-12 pt-28 pb-20 max-w-[720px] mx-auto">
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Legal
      </p>
      <h1 className="font-serif text-[30px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-2 tracking-tight">
        Kebijakan Privasi
      </h1>
      <p className="text-sm text-muted mb-10">Terakhir diperbarui: Juni 2026</p>

      <div className="space-y-8 text-[15px] text-muted leading-[1.85]">
        <section>
          <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">1. Data yang Kami Kumpulkan</h2>
          <p>
            Saat kamu mendaftar, kami menyimpan alamat email dan progress belajarmu (kanji, vocab, dan grammar yang sudah dipelajari). Kami tidak mengumpulkan data sensitif seperti nomor telepon, alamat fisik, atau informasi pembayaran.
          </p>
        </section>

        <section>
          <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">2. Bagaimana Data Digunakan</h2>
          <p>
            Data digunakan semata-mata untuk:
          </p>
          <ul className="list-disc list-inside mt-2 space-y-1">
            <li>Autentikasi akun (login/register)</li>
            <li>Menyimpan dan menampilkan progress belajarmu</li>
            <li>Menjadwalkan ulang materi dengan sistem SRS</li>
          </ul>
          <p className="mt-3">Kami tidak menjual atau berbagi data kamu ke pihak ketiga untuk tujuan pemasaran.</p>
        </section>

        <section>
          <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">3. Layanan Pihak Ketiga</h2>
          <p>
            Koto no Ha menggunakan <strong className="text-ink">Supabase</strong> sebagai layanan database dan autentikasi. Data disimpan di server Supabase yang berlokasi di wilayah yang aman. Silakan baca kebijakan privasi Supabase di{' '}
            <a href="https://supabase.com/privacy" target="_blank" rel="noopener noreferrer" className="text-ink underline hover:opacity-70">supabase.com/privacy</a>.
          </p>
        </section>

        <section>
          <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">4. Hak Kamu</h2>
          <p>
            Kamu berhak untuk meminta penghapusan akun dan seluruh data yang terkait kapan saja. Hubungi kami melalui halaman Kontak untuk mengajukan permintaan tersebut.
          </p>
        </section>

        <section>
          <h2 className="font-serif text-[18px] font-semibold text-ink mb-3">5. Perubahan Kebijakan</h2>
          <p>
            Jika kebijakan ini berubah secara signifikan, kami akan memberi tahu pengguna terdaftar melalui email atau notifikasi di dalam aplikasi.
          </p>
        </section>
      </div>
    </main>
  )
}
