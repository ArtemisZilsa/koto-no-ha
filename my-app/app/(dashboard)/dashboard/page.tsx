import { createClient } from '@/lib/supabase/server'
import type { Profile } from '@/lib/types/database.types'
import Link from 'next/link'
import { Icon, type IconName } from '@/components/ui/Icon'
import { Reveal } from '@/components/ui/Reveal'
import { sswSectors } from '@/lib/data/sswSectors'

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
        <Reveal as="h2" className="font-serif text-lg font-semibold text-ink mb-4">Materi Belajar</Reveal>
        <div className="grid grid-cols-2 md:grid-cols-6 gap-3">
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
            {
              level: 'SSW',
              name: 'Tokutei Ginou',
              subtitle: 'Kosakata Kerja Spesialis',
              bgKanji: '技',
              color: 'var(--gold)',
              bg: 'var(--gold-bg)',
              href: '/ssw',
              counts: '介護 · 300 kosakata',
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

      {/* ── Kosakata Kerja SSW (Tokutei Ginou) ─────────────────────── */}
      <div className="mb-8">
        <div className="flex items-end justify-between gap-3 mb-4">
          <div>
            <Reveal as="h2" className="font-serif text-lg font-semibold text-ink">
              Kosakata Kerja · SSW
            </Reveal>
            <p className="text-[12px] text-muted mt-0.5">
              Istilah khusus (専門用語) tiap bidang Tokutei Ginou. Langsung mulai dari bidang yang tersedia.
            </p>
          </div>
          <Link
            href="/ssw"
            className="shrink-0 inline-flex items-center gap-1 text-[12px] no-underline hover:opacity-80 transition-opacity"
            style={{ color: 'var(--gold)' }}
          >
            Lihat semua bidang
            <Icon name="chevron-right" className="w-3.5 h-3.5" />
          </Link>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
          {sswSectors
            .filter((s) => s.status === 'active')
            .map((s, i) => (
              <Reveal key={s.slug} delay={i * 70}>
                <Link
                  href={`/learn/bidang/${s.slug}`}
                  className="relative block h-full overflow-hidden rounded-2xl p-6 hover-lift no-underline cursor-pointer focus-visible:outline-none focus-visible:ring-2"
                  style={{ background: s.accentBg, border: `0.5px solid ${s.accent}30` }}
                >
                  {/* Watermark kanji */}
                  <span
                    className="absolute -right-2 -bottom-3 font-serif select-none pointer-events-none leading-none float-soft"
                    style={{ fontSize: 'clamp(56px, 7vw, 80px)', color: `${s.accent}18`, zIndex: 0 }}
                    aria-hidden
                  >
                    {s.bgKanji}
                  </span>
                  <div className="relative flex items-start gap-3">
                    <span
                      className="inline-flex items-center justify-center w-10 h-10 rounded-lg shrink-0"
                      style={{ background: `${s.accent}1a`, color: s.accent }}
                    >
                      <Icon name={s.icon} className="w-5 h-5" />
                    </span>
                    <div className="min-w-0">
                      <div className="font-serif text-[15px] font-semibold text-ink leading-tight">{s.label}</div>
                      <div className="text-[12px] text-muted">{s.jp}</div>
                      <div className="mt-3 inline-flex items-center gap-1 text-[11px] font-medium" style={{ color: s.accent }}>
                        300 kosakata
                        <Icon name="chevron-right" className="w-3.5 h-3.5" />
                      </div>
                    </div>
                  </div>
                </Link>
              </Reveal>
            ))}

          {/* Kartu ajakan ke hub untuk bidang lain */}
          <Reveal delay={sswSectors.filter((s) => s.status === 'active').length * 70}>
            <Link
              href="/ssw"
              className="relative block h-full overflow-hidden rounded-2xl p-6 hover-lift no-underline cursor-pointer koto-bordered focus-visible:outline-none focus-visible:ring-2"
              style={{ background: 'var(--surface)' }}
            >
              <div className="flex items-start gap-3">
                <span
                  className="inline-flex items-center justify-center w-10 h-10 rounded-lg shrink-0 text-ink"
                  style={{ background: 'var(--paper-dark)' }}
                >
                  <Icon name="layers" className="w-5 h-5" />
                </span>
                <div className="min-w-0">
                  <div className="font-serif text-[15px] font-semibold text-ink leading-tight">14 Bidang SSW</div>
                  <div className="text-[12px] text-muted">特定技能 · Tokutei Ginou</div>
                  <div className="mt-3 inline-flex items-center gap-1 text-[11px] font-medium text-muted">
                    Bidang lain segera hadir
                    <Icon name="chevron-right" className="w-3.5 h-3.5" />
                  </div>
                </div>
              </div>
            </Link>
          </Reveal>
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
