import type { MetadataRoute } from 'next'

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Koto no Ha — Belajar Bahasa Jepang',
    short_name: 'Koto no Ha',
    description:
      'Platform belajar bahasa Jepang untuk orang Indonesia. N5–N1, SSW, dan level bisnis.',
    start_url: '/',
    display: 'standalone',
    orientation: 'portrait',
    background_color: '#f7f2ea',
    theme_color: '#c8102e',
    lang: 'id',
    categories: ['education'],
    icons: [
      {
        src: '/icon.svg',
        sizes: 'any',
        type: 'image/svg+xml',
        purpose: 'any',
      },
      {
        src: '/icon-maskable.svg',
        sizes: 'any',
        type: 'image/svg+xml',
        purpose: 'maskable',
      },
    ],
  }
}
