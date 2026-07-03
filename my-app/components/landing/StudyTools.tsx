'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Reveal } from '@/components/ui/Reveal'
import { Icon, type IconName } from '@/components/ui/Icon'

const PDF_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
type PdfLevel = (typeof PDF_LEVELS)[number]

const tools: { icon: IconName; accent: string; bg: string; title: string; desc: string; href: string }[] = [
  {
    icon: 'play',
    accent: 'var(--gold)',
    bg: 'var(--gold-bg)',
    title: 'Kuis Kanji',
    desc: 'Uji hafalanmu — 10 soal, timer, streak, dan XP.',
    href: '/quiz',
  },
  {
    icon: 'message',
    accent: 'var(--red)',
    bg: 'var(--red-bg)',
    title: 'Kaiwa Stories',
    desc: 'Dialog situasi nyata dengan cara baca dan terjemahan.',
    href: '/kaiwa',
  },
  {
    icon: 'newspaper',
    accent: 'var(--teal)',
    bg: 'var(--teal-bg)',
    title: 'Berita NHK',
    desc: 'Baca berita Jepang asli yang ditandai sesuai level.',
    href: '/berita',
  },
]

export function StudyTools() {
  const [pdfLevel, setPdfLevel] = useState<PdfLevel>('N5')

  return (
    <section id="alat-belajar" className="px-5 md:px-12 py-16 md:py-22">
      <Reveal>
        <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
          Alat Belajar
        </p>
        <h2 className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
          PDF &amp; Alat Bantu Belajar
        </h2>
        <p className="text-[15px] text-muted max-w-[540px] leading-[1.8] mb-12">
          Materi pendamping yang bisa kamu pakai kapan saja — mulai dari kuis interaktif sampai PDF
          ringkasan per level.
        </p>
      </Reveal>

      <div className="grid grid-cols-1 md:grid-cols-[1.2fr_1fr] gap-3.5 items-stretch">
        {/* Kartu PDF per level */}
        <Reveal>
          <div
            className="bg-surface rounded-xl p-6 h-full"
            style={{ border: '0.5px solid var(--border)' }}
          >
            <div className="flex items-center gap-2 mb-1.5">
              <span
                className="glass inline-flex items-center justify-center w-11 h-11 rounded-xl"
                style={{ background: 'var(--red-bg)', color: 'var(--red)' }}
              >
                <Icon name="book" className="w-5 h-5" />
              </span>
              <span className="font-serif text-[15px] font-semibold text-ink">PDF Materi per Level</span>
            </div>
            <p className="text-[12.5px] text-muted leading-[1.75] mb-5">
              Ringkasan kosakata, kanji, dan tata bahasa dalam satu PDF yang rapi — pilih levelmu.
            </p>

            <div className="flex flex-wrap items-center gap-2 mb-5">
              {PDF_LEVELS.map((lvl) => (
                <button
                  key={lvl}
                  type="button"
                  onClick={() => setPdfLevel(lvl)}
                  aria-pressed={pdfLevel === lvl}
                  className="font-serif text-[13px] font-medium px-4 py-2 rounded-lg transition-all hover:-translate-y-0.5 cursor-pointer"
                  style={
                    pdfLevel === lvl
                      ? { background: 'var(--red)', color: 'var(--on-ink)', border: '0.5px solid var(--red)' }
                      : { background: 'var(--surface)', color: 'var(--ink)', border: '0.5px solid var(--border)' }
                  }
                >
                  {lvl}
                </button>
              ))}
            </div>

            <div
              aria-live="polite"
              className="flex items-center justify-between gap-3 rounded-xl px-4 py-3"
              style={{ background: 'var(--paper-dark)', border: '0.5px solid var(--border)' }}
            >
              <div className="flex items-center gap-2.5 min-w-0">
                <Icon name="book" className="w-4 h-4 shrink-0" style={{ color: 'var(--muted)' }} />
                <span className="text-[13px] font-medium text-ink truncate">PDF Materi {pdfLevel}</span>
              </div>
              <span
                className="inline-flex items-center gap-1 text-[10px] font-medium px-2 py-0.5 rounded-full whitespace-nowrap shrink-0"
                style={{ background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }}
              >
                <Icon name="lock" className="w-3 h-3" aria-hidden />
                Segera hadir
              </span>
            </div>
          </div>
        </Reveal>

        {/* Alat yang sudah bisa dipakai */}
        <div className="flex flex-col gap-3.5">
          {tools.map(({ icon, accent, bg, title, desc, href }, i) => (
            <Reveal key={title} delay={(i + 1) * 80}>
              <Link
                href={href}
                className="flex items-center gap-3.5 bg-surface rounded-xl px-5 py-4 hover-lift no-underline cursor-pointer"
                style={{ border: `0.5px solid ${accent}40` }}
              >
                <span
                  className="glass inline-flex items-center justify-center w-10 h-10 rounded-xl shrink-0"
                  style={{ background: bg, color: accent }}
                >
                  <Icon name={icon} className="w-5 h-5" />
                </span>
                <span className="min-w-0">
                  <span className="block font-serif text-[14px] font-semibold text-ink">{title}</span>
                  <span className="block text-[12px] text-muted leading-[1.6]">{desc}</span>
                </span>
                <Icon name="chevron-right" className="w-4 h-4 ml-auto shrink-0" style={{ color: 'var(--muted)' }} />
              </Link>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  )
}
