/**
 * Alamat publik (canonical) website — dipakai oleh sitemap.ts, robots.ts,
 * dan metadata sosial. Satu sumber kebenaran supaya tidak tersebar.
 *
 * Diatur lewat env var NEXT_PUBLIC_SITE_URL di Netlify (Site settings →
 * Environment variables). Tanpa trailing slash, mis:
 *   https://koto-no-ha.netlify.app
 *
 * Fallback ke URL otomatis Netlify (URL var) saat build, lalu localhost.
 */
function resolveSiteUrl(): string {
  const fromEnv =
    process.env.NEXT_PUBLIC_SITE_URL ?? // diset manual (disarankan)
    process.env.URL ?? // disuntik otomatis oleh Netlify saat build
    'http://localhost:3000'

  // Buang trailing slash agar penggabungan path konsisten.
  return fromEnv.replace(/\/+$/, '')
}

export const SITE_URL = resolveSiteUrl()
