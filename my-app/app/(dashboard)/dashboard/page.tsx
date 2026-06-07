import { createClient } from '@/lib/supabase/server'
import type { Profile } from '@/lib/types/database.types'
import Link from 'next/link'
import { Icon, type IconName } from '@/components/ui/Icon'
import { Reveal } from '@/components/ui/Reveal'

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
      <Reveal className="mb-10">
        <h1 className="font-serif text-3xl font-semibold text-ink mb-1">
          こんにちは、{displayName}！
        </h1>
        <p className="text-muted text-sm">Selamat datang di Koto no Ha. Mari lanjutkan belajar.</p>
      </Reveal>

      {/* Stats row */}
      <div className="grid grid-cols-3 gap-4 mb-10">
        {([
          {
            label: 'Streak Harian',
            value: `${profile?.streak_days ?? 0} hari`,
            icon: 'flame' as IconName,
            color: 'var(--red)',
            bg: 'var(--red-bg)',
          },
          {
            label: 'Total XP',
            value: `${profile?.total_xp ?? 0} XP`,
            icon: 'star' as IconName,
            color: 'var(--gold)',
            bg: 'var(--gold-bg)',
          },
          {
            label: 'Level Saat Ini',
            value: profile?.levels?.code ?? 'N5',
            icon: 'book' as IconName,
            color: 'var(--teal)',
            bg: 'var(--teal-bg)',
          },
        ]).map(({ label, value, icon, color, bg }, i) => (
          <Reveal
            key={label}
            delay={i * 80}
            className="rounded-xl p-5 flex items-center gap-4"
            style={{ background: bg, border: `0.5px solid ${color}20` }}
          >
            <span
              className="inline-flex items-center justify-center w-10 h-10 rounded-lg shrink-0"
              style={{ background: `${color}1a`, color }}
            >
              <Icon name={icon} className="w-5 h-5" />
            </span>
            <div>
              <div className="font-serif text-xl font-semibold" style={{ color }}>
                {value}
              </div>
              <div className="text-xs text-muted">{label}</div>
            </div>
          </Reveal>
        ))}
      </div>

      {/* JLPT Level Quick Access */}
      <div className="mb-8">
        <Reveal as="h2" className="font-serif text-lg font-semibold text-ink mb-4">Materi Belajar JLPT</Reveal>
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
              subtitle: 'Memperluas Kemampuan',
              bgKanji: '語',
              color: 'var(--green)',
              bg: 'var(--green-bg)',
              href: '/learn/n4',
              counts: '200 kosakata',
            },
            {
              level: 'N3',
              name: 'Menengah',
              subtitle: 'Mulai Lebih Mahir',
              bgKanji: '読',
              color: 'var(--teal)',
              bg: 'var(--teal-bg)',
              href: '/learn/n3',
              counts: '200 kosakata',
            },
            {
              level: 'N2',
              name: 'Lanjutan',
              subtitle: 'Tingkat Lanjutan',
              bgKanji: '究',
              color: 'var(--gold)',
              bg: 'var(--gold-bg)',
              href: '/learn/n2',
              counts: '250 kanji · 200 kosakata · 50 pola',
            },
            {
              level: 'N1',
              name: 'Mahir',
              subtitle: 'Tingkat Tertinggi',
              bgKanji: '極',
              color: 'var(--red)',
              bg: 'var(--red-bg)',
              href: '/learn/n1',
              counts: '250 kanji · 200 kosakata · 30 pola',
            },
          ].map(({ level, name, subtitle, bgKanji, color, bg, href, counts }, i) => (
            <Reveal key={level} delay={i * 70}>
            <Link
              href={href}
              className="relative block h-full overflow-hidden rounded-2xl p-6 hover-lift no-underline"
              style={{ background: bg, border: `0.5px solid ${color}30` }}
            >
              {/* Background kanji watermark — clamped inside card, won't overflow */}
              <span
                className="absolute -right-2 -bottom-3 font-serif select-none pointer-events-none leading-none float-soft"
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
            </Reveal>
          ))}
        </div>
      </div>

      {/* Other sections */}
      <div className="grid grid-cols-2 gap-4">
        {([
          { title: 'Kartu Hafalan Hari Ini', icon: 'cards' as IconName, href: '#', desc: 'Belum ada kartu yang perlu diulang hari ini.' },
          { title: 'Berita Terbaru', icon: 'newspaper' as IconName, href: '/berita', desc: 'Baca artikel Jepang terbaru untuk latihan.' },
          { title: 'Latihan Percakapan', icon: 'mic' as IconName, href: '#', desc: 'Berlatih percakapan dari situasi sehari-hari.' },
          { title: 'Progres Belajar', icon: 'bar-chart' as IconName, href: '#', desc: 'Lihat statistik dan perkembangan belajarmu.' },
        ]).map(({ title, icon, href, desc }, i) => (
          <Reveal key={title} delay={(i % 2) * 80}>
          <Link
            href={href}
            className="block h-full rounded-xl p-6 hover-lift no-underline koto-bordered"
            style={{ background: 'var(--surface)' }}
          >
            <span className="inline-flex items-center justify-center w-10 h-10 rounded-lg mb-3 text-ink" style={{ background: 'var(--paper-dark)' }}>
              <Icon name={icon} className="w-5 h-5" />
            </span>
            <div className="font-serif text-[15px] font-semibold text-ink mb-1">{title}</div>
            <div className="text-[12px] text-muted">{desc}</div>
          </Link>
          </Reveal>
        ))}
      </div>
    </main>
  )
}
