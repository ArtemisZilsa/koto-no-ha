import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/site'

// Menghasilkan /sitemap.xml — daftar halaman PUBLIK agar Google cepat
// menemukan & mengindeks. Halaman privat (dashboard, login) sengaja
// tidak dimasukkan; itu sudah diblokir di robots.ts.
export default function sitemap(): MetadataRoute.Sitemap {
  const lastModified = new Date()

  const routes: Array<{
    path: string
    changeFrequency: MetadataRoute.Sitemap[number]['changeFrequency']
    priority: number
  }> = [
    { path: '/', changeFrequency: 'weekly', priority: 1 },
    { path: '/kaiwa', changeFrequency: 'weekly', priority: 0.8 },
    { path: '/ssw', changeFrequency: 'monthly', priority: 0.7 },
    { path: '/berita', changeFrequency: 'daily', priority: 0.6 },
  ]

  return routes.map(({ path, changeFrequency, priority }) => ({
    url: `${SITE_URL}${path}`,
    lastModified,
    changeFrequency,
    priority,
  }))
}
