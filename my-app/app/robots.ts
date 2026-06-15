import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/site'

// Menghasilkan /robots.txt — memberi tahu mesin pencari halaman mana yang
// boleh dirayapi, dan di mana letak sitemap.
export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      // Halaman privat / butuh login — tidak perlu muncul di hasil pencarian.
      disallow: ['/dashboard', '/learn/', '/login', '/register'],
    },
    sitemap: `${SITE_URL}/sitemap.xml`,
    host: SITE_URL,
  }
}
