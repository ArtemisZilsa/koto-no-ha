import { getImageProps } from 'next/image'

interface WashiArtProps {
  /** Ilustrasi landscape (desktop). */
  src: string
  /** Versi potret untuk HP (opsional). */
  mobileSrc?: string
  priority?: boolean
  /** Posisi fokus gambar, mis. 'right center'. */
  position?: string
  /** Sembunyikan di HP (layar sempit: ilustrasi menabrak teks). */
  desktopOnly?: boolean
}

/**
 * Ilustrasi sumi-e sebagai latar section. Dekoratif (alt kosong).
 * Satu <picture> dengan art direction: HP memuat versi potret saja, desktop versi landscape saja.
 * Kelas .washi-art menyatukan kertas gambar dengan warna halaman (multiply) dan
 * membalik tinta di mode gelap.
 */
export function WashiArt({ src, mobileSrc, priority = false, position = 'right center', desktopOnly = false }: WashiArtProps) {
  const common = { alt: '', fill: true, priority, sizes: '100vw' } as const
  const { props: desktop } = getImageProps({ ...common, src, quality: 75 })
  const mobile = mobileSrc ? getImageProps({ ...common, src: mobileSrc, quality: 75 }).props : null

  return (
    <div className={`absolute inset-0 -z-10 pointer-events-none ${desktopOnly ? 'hidden md:block' : ''}`} aria-hidden="true">
      <picture>
        {mobile && <source media="(max-width: 767px)" srcSet={mobile.srcSet} />}
        <source media="(min-width: 768px)" srcSet={desktop.srcSet} />
        <img {...desktop} alt="" className="washi-art object-cover" style={{ ...desktop.style, objectPosition: position }} />
      </picture>
      <div className="washi-scrim" />
    </div>
  )
}
