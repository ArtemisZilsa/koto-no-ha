import { NavClient } from './NavClient'

// Tanpa baca cookie di server: halaman publik tetap statis (lihat NavClient).
export function Nav() {
  return <NavClient />
}
