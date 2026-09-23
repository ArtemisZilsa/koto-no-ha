import type { Metadata, Viewport } from 'next'
import { Inter } from 'next/font/google'
import { Noto_Sans_JP, Noto_Serif_JP } from 'next/font/google'
import './globals.css'
import { ThemeScript } from '@/components/theme/ThemeScript'
import { AmbientEffects } from '@/components/effects/AmbientEffects'
import { SITE_URL } from '@/lib/site'
import { JsonLd, SITE_DESCRIPTION, SITE_NAME, organizationJsonLd, websiteJsonLd } from '@/lib/seo'

const inter = Inter({
  variable: '--font-inter',
  subsets: ['latin'],
})

const notoSansJP = Noto_Sans_JP({
  variable: '--font-noto-sans-jp',
  subsets: ['latin'],
  weight: ['300', '400', '500'],
})

const notoSerifJP = Noto_Serif_JP({
  variable: '--font-noto-serif-jp',
  subsets: ['latin'],
  weight: ['300', '400', '600'],
})

export const metadata: Metadata = {
  // Semua URL relatif (canonical, og:image) di-resolve terhadap domain ini.
  metadataBase: new URL(SITE_URL),
  title: '言の葉 | Koto no Ha — Belajar Bahasa Jepang',
  description: SITE_DESCRIPTION,
  applicationName: SITE_NAME,
  authors: [{ name: 'Zilsa', url: `${SITE_URL}/tentang` }],
  creator: 'Zilsa',
  publisher: SITE_NAME,
  category: 'education',
  keywords: [
    'belajar bahasa Jepang',
    'JLPT N5',
    'JLPT N4',
    'JLPT N3',
    'soal latihan JLPT',
    'kanji',
    'kosakata bahasa Jepang',
    'tata bahasa Jepang',
    'kaiwa',
    'Tokutei Ginou',
    'SSW kaigo',
  ],
  manifest: '/manifest.webmanifest',
  appleWebApp: {
    capable: true,
    statusBarStyle: 'default',
    title: 'Koto no Ha',
  },
  formatDetection: { telephone: false },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-snippet': -1,
      'max-image-preview': 'large',
      'max-video-preview': -1,
    },
  },
  // Verifikasi kepemilikan situs untuk Google Search Console.
  verification: {
    google: 'UNkyFGw554wUmbQ5wLhqomwWir47S8dJjA55BLlPvEQ',
  },
  // Sengaja tanpa title/description/url: objek ini diwarisi semua halaman.
  // Next.js mengisi og:title/og:description dari title/description tiap halaman.
  openGraph: {
    siteName: SITE_NAME,
    locale: 'id_ID',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
  },
}

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  maximumScale: 5,
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: '#f7f2ea' },
    { media: '(prefers-color-scheme: dark)', color: '#14141c' },
  ],
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html
      lang="id"
      className={`${inter.variable} ${notoSansJP.variable} ${notoSerifJP.variable}`}
      suppressHydrationWarning
    >
      <head>
        <ThemeScript />
      </head>
      <body className="min-h-screen">
        <JsonLd data={[organizationJsonLd(), websiteJsonLd()]} />
        <AmbientEffects />
        {children}
      </body>
    </html>
  )
}
