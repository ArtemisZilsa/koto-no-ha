import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/site'

// Menghasilkan /robots.txt — memberi tahu mesin pencari halaman mana yang
// boleh dirayapi, dan di mana letak sitemap.

// Halaman privat / butuh login — tidak perlu muncul di hasil pencarian.
const PRIVATE = ['/dashboard', '/learn/', '/dokkai', '/login', '/register']

// Crawler mesin jawaban AI (GEO). Diizinkan secara eksplisit supaya Koto no Ha
// bisa dikutip di ChatGPT, Claude, Perplexity, Gemini, dan AI Overviews.
const AI_CRAWLERS = [
  'GPTBot',
  'OAI-SearchBot',
  'ChatGPT-User',
  'ClaudeBot',
  'Claude-SearchBot',
  'Claude-User',
  'PerplexityBot',
  'Perplexity-User',
  'Google-Extended',
  'Applebot-Extended',
  'CCBot',
]

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      { userAgent: '*', allow: '/', disallow: PRIVATE },
      { userAgent: AI_CRAWLERS, allow: '/', disallow: PRIVATE },
    ],
    sitemap: `${SITE_URL}/sitemap.xml`,
    host: SITE_URL,
  }
}
