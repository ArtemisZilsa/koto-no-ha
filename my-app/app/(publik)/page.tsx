import type { Metadata } from 'next'
import { HeroWashi } from '@/components/landing/washi/HeroWashi'
import { LevelTangga } from '@/components/landing/washi/LevelTangga'
import { CobaSoal } from '@/components/landing/washi/CobaSoal'
import { HargaSection } from '@/components/landing/washi/HargaSection'
import { FaqSection } from '@/components/landing/FaqSection'
import { CTASection } from '@/components/landing/CTASection'

export const metadata: Metadata = {
  alternates: { canonical: '/' },
}

// Statis dari CDN, diperbarui paling lambat tiap 1 jam (jumlah soal di tangga level).
export const revalidate = 3600

// Beranda 5 section (T8, docs/launch-12okt/PLAN.md §6), gaya washi + sumi-e.
// Section lama (Berita, SSW, Kaiwa, dst.) tetap punya halaman sendiri dan bisa dibuka dari navbar.
export default function HomePage() {
  return (
    <main>
      <HeroWashi />
      <LevelTangga />
      <CobaSoal />
      <HargaSection />
      <FaqSection />
      <CTASection />
    </main>
  )
}
