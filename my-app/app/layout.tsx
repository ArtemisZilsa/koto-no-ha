import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { Noto_Sans_JP, Noto_Serif_JP } from 'next/font/google'
import './globals.css'

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
    >
      <body className="min-h-screen">{children}</body>
    </html>
  )
}
