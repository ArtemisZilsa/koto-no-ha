import type { Metadata } from 'next'
import { notFound, redirect } from 'next/navigation'
import BankDrill from '@/components/bank-soal/BankDrill'
import { hasBankSoalAccess } from '@/lib/access'
import { getBankSession } from '@/lib/data/bankSoal'
import { recordBankAnswers, reportBankSoal } from '@/app/actions/bankSoal'

export const metadata: Metadata = {
  title: 'Bank Soal JLPT | Koto no Ha',
  robots: { index: false, follow: false },
}

type Params = { kategori: string; unit: string }

export default async function BankSessionPage({ params }: { params: Promise<Params> }) {
  // Belum berlangganan → kembali ke /bank-soal (layar paywall). RLS tetap menjadi pengaman utama.
  if (!(await hasBankSoalAccess())) redirect('/bank-soal')

  const { kategori, unit } = await params
  const session = await getBankSession(kategori, unit)
  if (!session) notFound()

  return (
    <main className="px-5 md:px-12 py-12 md:py-16">
      <BankDrill
        key={`${kategori}-${unit}`}
        questions={session.questions}
        title={session.title}
        kind={session.kind}
        recordAction={recordBankAnswers}
        reportAction={reportBankSoal}
        nextHref={session.nextHref}
        backHref="/bank-soal"
      />
    </main>
  )
}
