// KotonoHa Quiz Component
import type { Metadata } from 'next'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { createClient } from '@/lib/supabase/server'
import KanjiQuiz from '@/components/quiz/KanjiQuiz'
import { awardQuizXp } from '@/app/actions/quiz'

export const metadata: Metadata = {
  title: 'Kuis Kanji | Koto no Ha',
  description:
    'Kuis Kanji pilihan ganda interaktif — 10 soal, skor, streak, dan XP. Latih hafalan Kanji N5 dengan cara yang seru.',
}

export default async function QuizPage() {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16">
          <div className="max-w-[480px] mx-auto mb-8 text-center">
            <p className="text-[11px] tracking-[0.14em] uppercase mb-2" style={{ color: 'var(--gold)' }}>
              漢字クイズ · Kuis Kanji
            </p>
            <h1 className="font-serif text-[26px] md:text-[32px] font-semibold text-ink leading-tight mb-2 tracking-tight">
              Uji Hafalan Kanji-mu
            </h1>
            <p className="text-[13.5px] text-muted leading-[1.7]">
              10 soal pilihan ganda level N5. Jawab cepat untuk bonus XP, jaga streak-mu, dan
              {user ? ' XP otomatis masuk ke akunmu.' : ' masuk untuk menyimpan XP ke akun.'}
            </p>
          </div>

          <KanjiQuiz isLoggedIn={!!user} awardAction={awardQuizXp} />
        </section>
      </main>
      <Footer />
    </>
  )
}
