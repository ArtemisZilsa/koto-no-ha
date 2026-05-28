import { Nav } from '@/components/nav/Nav'
import { HeroSection } from '@/components/landing/HeroSection'
import { LevelStrip } from '@/components/landing/LevelStrip'
import { FeaturesGrid } from '@/components/landing/FeaturesGrid'
import { ProgressSection } from '@/components/landing/ProgressSection'
import { KaiwaPreview } from '@/components/landing/KaiwaPreview'
import { NewsSection } from '@/components/landing/NewsSection'
import { VisaSection } from '@/components/landing/VisaSection'
import { HowItWorks } from '@/components/landing/HowItWorks'
import { CTASection } from '@/components/landing/CTASection'
import { Footer } from '@/components/landing/Footer'

export default function HomePage() {
  return (
    <>
      <Nav />
      <main>
        <HeroSection />
        <LevelStrip />
        <FeaturesGrid />
        <ProgressSection />
        <KaiwaPreview />
        <NewsSection />
        <VisaSection />
        <HowItWorks />
        <CTASection />
      </main>
      <Footer />
    </>
  )
}
