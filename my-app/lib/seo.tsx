import { SITE_URL } from './site'

// ─── SEO & GEO bersama ───────────────────────────────────────────────────────
// Satu sumber untuk nama situs, deskripsi, dan structured data (JSON-LD)
// supaya mesin pencari dan mesin jawaban AI membaca fakta yang sama.

export const SITE_NAME = 'Koto no Ha'
export const SITE_NAME_JP = '言の葉'
export const SITE_DESCRIPTION =
  'Platform belajar bahasa Jepang gratis untuk orang Indonesia: kosakata, kanji, tata bahasa, soal latihan, kaiwa, dan dokkai JLPT N5 sampai N1, plus kosakata kerja Tokutei Ginou (SSW).'
export const INSTAGRAM_URL = 'https://www.instagram.com/kotobanoha'

export function absoluteUrl(path = '/'): string {
  return `${SITE_URL}${path.startsWith('/') ? path : `/${path}`}`
}

const ORG_ID = `${SITE_URL}/#organization`
const WEBSITE_ID = `${SITE_URL}/#website`

export function organizationJsonLd() {
  return {
    '@context': 'https://schema.org',
    '@type': 'EducationalOrganization',
    '@id': ORG_ID,
    name: SITE_NAME,
    alternateName: SITE_NAME_JP,
    url: SITE_URL,
    logo: absoluteUrl('/icon.svg'),
    description: SITE_DESCRIPTION,
    sameAs: [INSTAGRAM_URL],
    founder: { '@type': 'Person', name: 'Zilsa' },
    areaServed: { '@type': 'Country', name: 'Indonesia' },
    knowsAbout: ['Bahasa Jepang', 'JLPT', 'Kanji', 'Tokutei Ginou (SSW)', 'Kaigo'],
  }
}

export function websiteJsonLd() {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    '@id': WEBSITE_ID,
    name: SITE_NAME,
    alternateName: SITE_NAME_JP,
    url: SITE_URL,
    inLanguage: 'id-ID',
    publisher: { '@id': ORG_ID },
  }
}

export interface Crumb {
  name: string
  path: string
}

export function breadcrumbJsonLd(crumbs: Crumb[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: crumbs.map((c, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: c.name,
      item: absoluteUrl(c.path),
    })),
  }
}

export interface FaqItem {
  q: string
  a: string
}

export function faqJsonLd(items: FaqItem[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: items.map((f) => ({
      '@type': 'Question',
      name: f.q,
      acceptedAnswer: { '@type': 'Answer', text: f.a },
    })),
  }
}

/** Sumber belajar (set soal, pelajaran kaiwa). */
export function learningResourceJsonLd(opts: {
  name: string
  description: string
  path: string
  level: string
  resourceType: string
  teaches: string
}) {
  return {
    '@context': 'https://schema.org',
    '@type': 'LearningResource',
    name: opts.name,
    description: opts.description,
    url: absoluteUrl(opts.path),
    inLanguage: ['id', 'ja'],
    learningResourceType: opts.resourceType,
    educationalLevel: `JLPT ${opts.level}`,
    teaches: opts.teaches,
    isAccessibleForFree: true,
    provider: { '@id': ORG_ID },
  }
}

/**
 * Render JSON-LD sebagai <script>. `<` di-escape agar string dari database
 * tidak bisa menutup tag script (sesuai panduan JSON-LD Next.js).
 */
export function JsonLd({ data }: { data: object | object[] }) {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data).replace(/</g, '\\u003c') }}
    />
  )
}
