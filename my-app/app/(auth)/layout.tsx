import { HeroBackground } from '@/components/ui/HeroBackground'

export default function AuthLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-paper flex items-center justify-center px-4 py-12 relative overflow-hidden">
      {/* Foto latar: toko tradisional Jepang */}
      <HeroBackground
        src="/images/hero-auth.jpg"
        alt="Toko tradisional Jepang"
        priority
        overlay={0.88}
      />

      {/* Faint kanji watermark */}
      <div
        className="fixed inset-0 flex items-center justify-center pointer-events-none select-none"
        aria-hidden="true"
      >
        <span
          className="font-serif text-[400px] font-light leading-none float-soft"
          style={{ color: 'var(--ink)', opacity: 0.025 }}
        >
          語
        </span>
      </div>

      {/* Auth card */}
      <div className="relative z-10 w-full max-w-[400px] bg-surface rounded-2xl border border-[var(--border)] shadow-[0_8px_40px_rgba(13,13,18,0.08)] p-8">
        {children}
      </div>
    </div>
  )
}
