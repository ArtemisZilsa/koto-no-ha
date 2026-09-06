import type { Metadata } from 'next'
import { Jost } from 'next/font/google'
import { NoirPage } from './NoirPage'

/**
 * Jost adalah kebangkitan Futura — huruf geometris yang sezaman dengan sinema
 * ekspresionis Jerman awal 1930-an. Dipakai hanya di rute ini; sisa situs tetap
 * memakai Inter. Aksara Jepang memakai Noto Serif JP yang sudah dimuat di layout.
 */
const jost = Jost({
  variable: '--font-jost',
  subsets: ['latin'],
  weight: ['200', '300', '500'],
  display: 'swap',
})

export const metadata: Metadata = {
  title: '言の葉 — Dalam Bayangan | Koto no Ha',
  description:
    'Setiap kata yang belum kamu kenal masih berada dalam bayangan. Belajar bahasa Jepang dari N5 sampai N1, dan jalur kerja Tokutei Ginou.',
  openGraph: {
    title: '言の葉 — Dalam Bayangan | Koto no Ha',
    description:
      'Setiap kata yang belum kamu kenal masih berada dalam bayangan. Belajar bahasa Jepang dari N5 sampai N1, dan jalur kerja Tokutei Ginou.',
    locale: 'id_ID',
    type: 'website',
  },
}

export default function Noir() {
  return (
    <div className={jost.variable}>
      <NoirPage />
    </div>
  )
}
