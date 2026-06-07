import Image from 'next/image'

interface HeroBackgroundProps {
  /** Path gambar di /public (mis. '/images/hero-home.jpg'). */
  src: string
  /** Alt deskriptif untuk aksesibilitas. */
  alt: string
  /**
   * Kekuatan overlay washi (0–1). Lebih tinggi = teks lebih terbaca,
   * foto lebih samar. Default 0.82 agar konten tetap kontras.
   */
  overlay?: number
  /** Prioritas muat (true untuk hero di atas lipatan / homepage). */
  priority?: boolean
  /** Animasi zoom lambat (Ken Burns). Default true; nonaktif di reduced-motion. */
  animate?: boolean
}

/**
 * Latar foto Jepang untuk section hero. Foto dioptimasi via next/image,
 * lalu ditutup lapisan washi (gradient ke --paper) supaya teks di atasnya
 * tetap terbaca di mode terang & gelap. Murni dekoratif (aria-hidden).
 */
export function HeroBackground({
  src,
  alt,
  overlay = 0.82,
  priority = false,
  animate = true,
}: HeroBackgroundProps) {
  return (
    <div className="absolute inset-0 overflow-hidden pointer-events-none -z-10" aria-hidden="true">
      <Image
        src={src}
        alt={alt}
        fill
        priority={priority}
        sizes="100vw"
        className={`object-cover ${animate ? 'hero-photo' : ''}`}
        style={{ opacity: 0.9 }}
      />
      {/* Lapisan washi: gradient menuju warna kertas + tint dasar agar teks kontras */}
      <div
        className="absolute inset-0"
        style={{
          background: `linear-gradient(180deg,
            color-mix(in srgb, var(--paper) ${Math.round(overlay * 70)}%, transparent) 0%,
            color-mix(in srgb, var(--paper) ${Math.round(overlay * 100)}%, transparent) 55%,
            var(--paper) 100%)`,
        }}
      />
      {/* Tint datar tambahan untuk menstabilkan kontras (light & dark) */}
      <div
        className="absolute inset-0"
        style={{ background: 'var(--paper)', opacity: overlay * 0.35 }}
      />
    </div>
  )
}
