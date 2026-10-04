import type { Metadata } from 'next'
import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { hasBankSoalAccess } from '@/lib/access'

// Konten berbayar: jangan diindeks. Login sudah dicek oleh (dashboard)/layout.tsx.
export const metadata: Metadata = {
  title: 'Bank Soal JLPT | Koto no Ha',
  robots: { index: false, follow: false },
}

export default async function BankSoalPage() {
  if (!(await hasBankSoalAccess())) return <Paywall />

  const supabase = await createClient()
  const { count } = await supabase.from('bank_soal').select('id', { count: 'exact', head: true })

  return (
    <main className="px-5 md:px-12 py-12 md:py-16 max-w-3xl mx-auto">
      <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--crimson)' }}>
        問題集 · Bank Soal
      </p>
      <h1 className="font-serif text-[28px] font-semibold mb-3" style={{ color: 'var(--text)' }}>
        Bank Soal JLPT
      </h1>
      <p className="text-[14px] leading-[1.7]" style={{ color: 'var(--muted)' }}>
        {count ? `${count} soal tersedia.` : 'Soal sedang disiapkan. Cek lagi sebentar lagi, ya.'}
      </p>
    </main>
  )
}

function Paywall() {
  return (
    <main className="px-5 md:px-12 py-16 max-w-xl mx-auto text-center">
      <h1 className="font-serif text-[26px] font-semibold mb-3" style={{ color: 'var(--text)' }}>
        Bank Soal khusus pelanggan
      </h1>
      <p className="text-[14px] leading-[1.7] mb-8" style={{ color: 'var(--muted)' }}>
        Bank soal JLPT lengkap dengan pembahasan terbuka untuk pelanggan Video Kelas.
        Soal latihan gratis tetap bisa kamu kerjakan di halaman Latihan.
      </p>
      <div className="flex gap-3 justify-center flex-wrap">
        <Link
          href="/harga"
          className="px-5 py-2.5 rounded-lg text-[14px] no-underline"
          style={{ background: 'var(--crimson)', color: '#FAFAFA' }}
        >
          Lihat harga
        </Link>
        <Link
          href="/latihan"
          className="px-5 py-2.5 rounded-lg text-[14px] no-underline"
          style={{ border: '1px solid var(--brand-line)', color: 'var(--text)' }}
        >
          Latihan gratis
        </Link>
      </div>
    </main>
  )
}
