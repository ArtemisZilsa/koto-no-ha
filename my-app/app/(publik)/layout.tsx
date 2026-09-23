import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'

// Nav dan Footer dipasang sekali di sini (bukan di tiap halaman), jadi
// loading.tsx bisa tampil tanpa navbar ikut berkedip saat pindah halaman.
// Grup (publik) tidak mengubah URL.
export default function PublikLayout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <Nav />
      {children}
      <Footer />
    </>
  )
}
