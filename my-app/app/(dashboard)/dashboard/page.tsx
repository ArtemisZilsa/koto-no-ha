import { createClient } from '@/lib/supabase/server'
import type { Profile } from '@/lib/types/database.types'
import Link from 'next/link'

export const metadata = {
  title: 'Dashboard — Koto no Ha',
}

type ProfileWithLevel = Profile & { levels: { code: string; name: string } | null }

export default async function DashboardPage() {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  // Fetch user profile
  const { data: profileRaw } = await supabase
    .from('profiles')
    .select('*, levels(code, name)')
    .eq('id', user!.id)
    .single()

  const profile = profileRaw as ProfileWithLevel | null

  const displayName = profile?.full_name ?? profile?.username ?? user?.email?.split('@')[0] ?? 'Pelajar'

  return (
    <main className="px-8 py-10 max-w-5xl mx-auto">
      {/* Welcome */}
      <div className="mb-10">
        <h1 className="font-serif text-3xl font-semibold text-ink mb-1">
          こんにちは、{displayName}！
        </h1>
        <p className="text-muted text-sm">Selamat datang di Koto no Ha. Mari lanjutkan belajar.</p>
      </div>

      {/* Stats row */}
      <div className="grid grid-cols-3 gap-4 mb-10">
        {[
          {
            label: 'Streak Harian',
            value: `${profile?.streak_days ?? 0} hari`,
            icon: '🔥',
            color: 'var(--red)',
            bg: 'var(--red-bg)',
          },
          {
            label: 'Total XP',
            value: `${profile?.total_xp ?? 0} XP`,
            icon: '⭐',
            color: 'var(--gold)',
            bg: 'var(--gold-bg)',
          },
          {
            label: 'Level Saat Ini',
            value: profile?.levels?.code ?? 'N5',
            icon: '📚',
            color: 'var(--teal)',
            bg: 'var(--teal-bg)',
          },
        ].map(({ label, value, icon, color, bg }) => (
          <div
            key={label}
            className="rounded-xl p-5 flex items-center gap-4"
            style={{ background: bg, border: `0.5px solid ${color}20` }}
          >
            <span className="text-2xl">{icon}</span>
            <div>
              <div className="font-serif text-xl font-semibold" style={{ color }}>
                {value}
              </div>
              <div className="text-xs text-muted">{label}</div>
            </div>
          </div>
        ))}
      </div>

      {/* JLPT Level Quick Access */}
      <div className="mb-8">
        <h2 className="font-serif text-lg font-semibold text-ink mb-4">Materi Belajar JLPT</h2>
        <div className="grid grid-cols-2 md:grid-cols-5 gap-3">
          {[
            {
              level: 'N5',
              name: 'Dasar',
              subtitle: 'Fondasi Bahasa Jepang',
              bgKanji: '学',
              color: 'var(--red)',
              bg: 'var(--red-bg)',
              href: '/learn/n5',
              counts: '200 kosakata',
            },
            {
              level: 'N4',
              name: 'Pemula',
              subtitle: 'Perluasan Kemampuan',
              bgKanji: '語',
              color: 'var(--gold)',
              bg: 'var(--gold-bg)',
              href: '/learn/n4',
              counts: '200 kosakata',
            },
            {
              level: 'N3',
              name: 'Menengah',
              subtitle: 'Penguasaan Bahasa',
              bgKanji: '読',
              color: 'var(--teal)',
              bg: 'var(--teal-bg)',
              href: '/learn/n3',
              counts: '200 kosakata',
            },
            {
              level: 'N2',
              name: 'Lanjutan',
              subtitle: 'Penguasaan Lanjutan',
              bgKanji: '究',
              color: 'var(--gold)',
              bg: 'var(--gold-bg)',
              href: '/learn/n2',
              counts: '250 kanji · 200 kosakata · 50 pola',
            },
            {
              level: 'N1',
              name: 'Mahir',
              subtitle: 'Tingkat Mahir',
              bgKanji: '極',
              color: 'var(--red)',
              bg: 'var(--red-bg)',
              href: '/learn/n1',
              counts: '250 kanji · 200 kosakata · 30 pola',
            },
          ].map(({ level, name, subtitle, bgKanji, color, bg, href, counts }) => (
            <Link
              key={level}
              href={href}
              className="relative overflow-hidden rounded-2xl p-6 hover:-translate-y-1 hover:shadow-lg transition-all no-underline"
              style={{ background: bg, border: `0.5px solid ${color}30` }}
            >
              {/* Background kanji watermark — clamped inside card, won't overflow */}
              <span
                className="absolute -right-2 -bottom-3 font-serif select-none pointer-events-none leading-none"
                style={{ fontSize: 'clamp(56px, 7vw, 80px)', color: `${color}18`, zIndex: 0 }}
                aria-hidden
              >
                {bgKanji}
              </span>

              <div className="relative">
                <div className="font-serif text-2xl font-semibold mb-0.5" style={{ color }}>
                  {level}
                </div>
                <div className="font-serif text-[15px] font-semibold text-ink">{name}</div>
                <div className="text-[11px] text-muted mb-3">{subtitle}</div>
                <div className="text-[11px]" style={{ color: `${color}cc` }}>{counts}</div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Other sections */}
      <div className="grid grid-cols-2 gap-4">
        {[
          { title: 'Flashcard Hari Ini', icon: '🃏', href: '#', desc: 'Tidak ada kartu untuk direview hari ini.' },
          { title: 'Berita Terbaru', icon: '📰', href: '#', desc: 'Baca artikel Jepang terbaru untuk berlatih.' },
          { title: 'Kaiwa Stories', icon: '🗣️', href: '#', desc: 'Latihan percakapan dari situasi nyata.' },
          { title: 'Progres Belajar', icon: '📊', href: '#', desc: 'Lihat statistik dan perkembangan kamu.' },
        ].map(({ title, icon, href, desc }) => (
          <Link
            key={title}
            href={href}
            className="rounded-xl p-6 hover:-translate-y-0.5 hover:shadow-md transition-all no-underline"
            style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
          >
            <span className="text-xl mb-3 block">{icon}</span>
            <div className="font-serif text-[15px] font-semibold text-ink mb-1">{title}</div>
            <div className="text-[12px] text-muted">{desc}</div>
          </Link>
        ))}
      </div>
    </main>
  )
}
