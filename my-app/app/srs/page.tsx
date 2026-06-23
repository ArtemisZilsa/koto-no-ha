import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { createClient } from '@/lib/supabase/server'
import { getDueCount } from '@/lib/data/queries'
import SrsApp from '@/components/srs/SrsApp'
import { loadSrsSession, reviewCard } from '@/app/actions/srs'

export const metadata: Metadata = {
  title: 'Kartu Hafalan (SRS) | Koto no Ha',
  description:
    'Hafal kanji & kosakata dengan kartu pengulangan terjadwal (SRS). Pilih level & jenis, balik kartu, tandai sudah/belum hafal — kartu dijadwalkan ulang otomatis dan XP masuk akun.',
}

export default async function SrsPage() {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  const dueCount = user ? await getDueCount() : 0

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16">
          <div className="max-w-[480px] mx-auto mb-8 text-center">
            <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--gold)' }}>
              暗記カード · Kartu Hafalan
            </p>
            <h1 className="font-serif text-[26px] md:text-[32px] font-semibold text-ink leading-tight mb-2 tracking-tight">
              Hafal & Ingat Lebih Lama
            </h1>
            <p className="text-[13.5px] text-muted leading-[1.7]">
              Sistem pengulangan terjadwal (SRS) menampilkan kartu tepat sebelum kamu lupa.
              Balik kartu, nilai ingatanmu, dan
              {user ? ' jadwal ulang otomatis tersimpan di akunmu.' : ' masuk untuk menyimpan jadwal & XP.'}
            </p>
          </div>

          <SrsApp
            isLoggedIn={!!user}
            dueCount={dueCount}
            loadAction={loadSrsSession}
            reviewAction={reviewCard}
          />
        </section>
      </main>
      <Footer />
    </>
  )
}
