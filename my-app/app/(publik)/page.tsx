import type { Metadata } from 'next'
import { HeroSection } from '@/components/landing/HeroSection'
import { LevelStrip } from '@/components/landing/LevelStrip'
import { FeaturesGrid } from '@/components/landing/FeaturesGrid'
import { StudyTools } from '@/components/landing/StudyTools'
import { ProgressSection } from '@/components/landing/ProgressSection'
import { KaiwaPreview } from '@/components/landing/KaiwaPreview'
import { NativeTeaser } from '@/components/landing/NativeTeaser'
import { NewsSection } from '@/components/landing/NewsSection'
import { VisaSection } from '@/components/landing/VisaSection'
import { HowItWorks } from '@/components/landing/HowItWorks'
import { CTASection } from '@/components/landing/CTASection'
import { FaqSection } from '@/components/landing/FaqSection'

export const metadata: Metadata = {
  alternates: { canonical: '/' },
}

export default function HomePage() {
  return (
    <>
      <main>
        <HeroSection />
        <LevelStrip />
        <FeaturesGrid />
        <StudyTools />
        <ProgressSection />
        <KaiwaPreview />
        <NativeTeaser />
        <NewsSection />
        <VisaSection />
        <HowItWorks />
        <FaqSection />
        <CTASection />
      </main>
    </>
  )
}
