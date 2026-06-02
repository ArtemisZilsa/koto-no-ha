import type { Metadata, Viewport } from 'next'
import { Inter } from 'next/font/google'
import { Noto_Sans_JP, Noto_Serif_JP } from 'next/font/google'
import './globals.css'
import { ThemeScript } from '@/components/theme/ThemeScript'
import { SakuraPetals } from '@/components/effects/SakuraPetals'

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
  title: '言の葉 | Koto no Ha — Belajar Bahasa Jepang',
  description:
    'Platform belajar bahasa Jepang untuk orang Indonesia. Dari N5 hingga N1, SSW, dan level bisnis. Kanji, grammar, kaiwa, dan dokkai dalam satu tempat.',
  manifest: '/manifest.webmanifest',
  appleWebApp: {
    capable: true,
    statusBarStyle: 'default',
    title: 'Koto no Ha',
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
        <SakuraPetals />
        {children}
      </body>
    </html>
  )
}
