import { getProgressOverview } from '@/lib/data/queries'
import { Reveal } from '@/components/ui/Reveal'
import { NeonGridBackground } from '@/components/effects/NeonGridBackground'
import ProgressOverview from '@/components/progress/ProgressOverview'

export const metadata = {
  title: 'Progres Belajar — Koto no Ha',
}

export default async function ProgressPage() {
  const overview = await getProgressOverview()

  return (
    <main className="relative z-10 px-5 md:px-8 py-10 max-w-5xl mx-auto">
      <NeonGridBackground />

      <Reveal className="mb-8">
        <p className="text-[11px] tracking-[0.14em] uppercase mb-1" style={{ color: 'var(--gold)' }}>
          進捗 · Progres Belajar
        </p>
        <h1 className="font-serif text-3xl font-semibold text-ink mb-1">Perjalananmu</h1>
        <p className="text-muted text-sm">Ringkasan XP, streak, penguasaan tiap level, dan aktivitas belajarmu.</p>
      </Reveal>

      <ProgressOverview data={overview} />
    </main>
  )
}
