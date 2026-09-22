import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import PracticeDrill from '@/components/practice/PracticeDrill'
import { createClient } from '@/lib/supabase/server'
import { getPracticeSet } from '@/lib/data/queries'
import { CATEGORY_META, PRACTICE_LEVELS, categoryFromSlug } from '@/lib/data/practice'
import type { JLPTLevel } from '@/lib/data/types'
import { recordPracticeAnswers } from '@/app/actions/practice'

type Params = { kategori: string; level: string; set: string }

function parse(p: Params) {
  const category = categoryFromSlug(p.kategori)
  const level = p.level.toUpperCase() as JLPTLevel
  const setNo = Number(p.set)
  if (!category || !PRACTICE_LEVELS.includes(level) || !Number.isInteger(setNo)) return null
  return { category, level, setNo }
}

export async function generateMetadata({ params }: { params: Promise<Params> }): Promise<Metadata> {
  const parsed = parse(await params)
  if (!parsed) return { title: 'Soal Latihan | Koto no Ha' }
  const label = CATEGORY_META[parsed.category].label
  return {
    title: `${label} ${parsed.level} · Set ${parsed.setNo} | Koto no Ha`,
    description: `Soal latihan ${label.toLowerCase()} JLPT ${parsed.level}, set ${parsed.setNo}: pilihan ganda dengan koreksi langsung.`,
  }
}

export default async function PracticeSetPage({ params }: { params: Promise<Params> }) {
  const p = await params
  const parsed = parse(p)
  if (!parsed) notFound()

  const set = await getPracticeSet(parsed.category, parsed.level, parsed.setNo)
  if (!set) notFound()

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const meta = CATEGORY_META[parsed.category]
  const levelSlug = parsed.level.toLowerCase()
  const nextHref =
    set.setNo < set.totalSets ? `/latihan/${meta.slug}/${levelSlug}/${set.setNo + 1}` : undefined

  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        <section className="px-5 md:px-12 py-12 md:py-16">
          <PracticeDrill
            // key: pindah set = state drill mulai dari awal
            key={`${parsed.category}-${parsed.level}-${set.setNo}`}
            questions={set.questions}
            title={`${meta.label} ${parsed.level} · Set ${set.setNo}/${set.totalSets}`}
            isLoggedIn={!!user}
            recordAction={recordPracticeAnswers}
            nextHref={nextHref}
            backHref="/latihan"
          />
        </section>
      </main>
      <Footer />
    </>
  )
}
