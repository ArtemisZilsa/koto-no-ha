export const metadata = {
  title: 'Kontak — Koto no Ha',
  description: 'Hubungi tim Koto no Ha untuk pertanyaan, saran, atau laporan masalah.',
}

export default function KontakPage() {
  return (
    <main className="min-h-screen px-5 md:px-12 pt-28 pb-20 max-w-[720px] mx-auto">
      <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
        Hubungi Kami
      </p>
      <h1 className="font-serif text-[30px] md:text-[40px] font-semibold text-ink leading-[1.2] mb-6 tracking-tight">
        Kontak
      </h1>

      <div className="space-y-8 text-[15px] text-muted leading-[1.85]">
        <p>
          Ada pertanyaan tentang fitur, laporan bug, atau sekadar ingin menyapa? Kami senang mendengar darimu.
        </p>

        <div
          className="rounded-xl p-6 space-y-4"
          style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
        >
          <div>
            <p className="text-[11px] tracking-[0.1em] uppercase text-muted mb-1">Instagram</p>
            <a
              href="https://www.instagram.com/kotobanoha"
              target="_blank"
              rel="noopener noreferrer"
              className="text-ink font-medium hover:opacity-70 transition-opacity"
            >
              @kotobanoha
            </a>
            <p className="text-xs text-muted mt-0.5">Cara tercepat untuk menghubungi kami — DM terbuka.</p>
          </div>

          <div style={{ borderTop: '0.5px solid var(--border)', paddingTop: '1rem' }}>
            <p className="text-[11px] tracking-[0.1em] uppercase text-muted mb-1">Email</p>
            <a
              href="mailto:halo@kotonoha.id"
              className="text-ink font-medium hover:opacity-70 transition-opacity"
            >
              halo@kotonoha.id
            </a>
            <p className="text-xs text-muted mt-0.5">Kami berusaha membalas dalam 1–3 hari kerja.</p>
          </div>
        </div>

        <p className="text-sm">
          Untuk permintaan penghapusan data, silakan kirim email dengan subjek <strong className="text-ink">"Hapus Akun Saya"</strong> beserta alamat email yang digunakan saat mendaftar.
        </p>
      </div>
    </main>
  )
}
