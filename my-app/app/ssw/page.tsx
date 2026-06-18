import type { Metadata } from 'next'
import Link from 'next/link'
import { Nav } from '@/components/nav/Nav'
import { Footer } from '@/components/landing/Footer'
import { Icon } from '@/components/ui/Icon'
import { Reveal } from '@/components/ui/Reveal'
import { HeroBackground } from '@/components/ui/HeroBackground'
import { sswSectors } from '@/lib/data/sswSectors'

export const metadata: Metadata = {
  title: 'Panduan SSW / Tokutei Ginou | Koto no Ha',
  description:
    'Panduan lengkap visa kerja SSW (Specified Skilled Worker / Tokutei Ginou): 14 sektor, syarat JLPT & ujian keahlian, perbedaan SSW i & ii, dan alur prosesnya.',
}

const requirements: { title: string; desc: string }[] = [
  {
    title: 'Kemampuan Bahasa Jepang',
    desc: 'Lulus JLPT N4 atau JFT-Basic (A2). Sektor kaigo wajib tambahan ujian bahasa keperawatan (介護日本語評価試験).',
  },
  {
    title: 'Ujian Keterampilan (技能試験)',
    desc: 'Lulus ujian keterampilan sesuai sektor (Skill Measurement Test). Bisa diikuti di Indonesia maupun Jepang.',
  },
  {
    title: 'Usia & Kesehatan',
    desc: 'Minimal 18 tahun, sehat jasmani, dan tidak memiliki catatan pelanggaran imigrasi.',
  },
  {
    title: 'Lewat Jalur Magang (alternatif)',
    desc: 'Eks-Ginou Jisshuusei (magang) yang selesai 3 tahun bisa pindah ke SSW tanpa ujian, sesuai sektor terkait.',
  },
]

const tiers: { tag: string; name: string; points: string[]; accent: string }[] = [
  {
    tag: 'SSW i · 特定技能1号',
    name: 'Specified Skilled Worker 1',
    accent: 'var(--red)',
    points: [
      'Durasi maksimal 5 tahun (diperpanjang per 1/6/12 bulan)',
      'Tidak boleh membawa keluarga',
      'Syarat: JLPT N4/JFT-Basic + ujian keterampilan',
      'Tersedia di seluruh 14 sektor',
    ],
  },
  {
    tag: 'SSW ii · 特定技能2号',
    name: 'Specified Skilled Worker 2',
    accent: 'var(--gold)',
    points: [
      'Durasi dapat diperpanjang tanpa batas',
      'Boleh membawa keluarga (pasangan & anak)',
      'Syarat keahlian & ujian tingkat lanjut',
      'Jalur menuju Permanent Resident (eijuuken)',
    ],
  },
]

const steps: { num: string; title: string; desc: string }[] = [
  { num: '01', title: 'Belajar Bahasa', desc: 'Capai level N4 / JFT-Basic dan pelajari kosakata sektor tujuan.' },
  { num: '02', title: 'Lulus Ujian', desc: 'Ikuti ujian bahasa dan ujian keterampilan sesuai sektor.' },
  { num: '03', title: 'Cari Perusahaan Penerima', desc: 'Dapatkan tawaran kerja dari perusahaan Jepang atau lewat agen resmi (SO/LPK).' },
  { num: '04', title: 'Kontrak & Dokumen', desc: 'Tandatangani kontrak kerja dan siapkan dokumen COE (Certificate of Eligibility).' },
  { num: '05', title: 'Visa & Berangkat', desc: 'Ajukan visa di kedutaan, ikuti orientasi pra-keberangkatan, lalu berangkat ke Jepang.' },
]

export default function SSWPage() {
  return (
    <>
      <Nav />
      <main className="pt-[60px] min-h-screen">
        {/* Hero */}
        <section
          className="px-5 md:px-12 py-14 relative overflow-hidden"
          style={{ borderBottom: '0.5px solid var(--border)' }}
        >
          <HeroBackground
            src="/images/hero-ssw.jpg"
            alt="Jalan tradisional Kyoto dengan pagoda"
            priority
            overlay={0.84}
          />
          <span
            className="absolute right-0 top-1/2 -translate-y-1/2 font-serif select-none pointer-events-none float-soft"
            style={{ fontSize: 'clamp(160px, 30vw, 300px)', lineHeight: 1, color: 'var(--ink)', opacity: 0.05, right: '-3%' }}
            aria-hidden
          >
            技能
          </span>
          <div className="relative max-w-4xl mx-auto">
            <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
              特定技能 · Specified Skilled Worker
            </p>
            <h1 className="font-serif text-[30px] md:text-[42px] font-semibold text-ink leading-[1.2] mb-4 tracking-tight">
              Panduan Lengkap Visa SSW
            </h1>
            <p className="text-[15px] text-muted max-w-[620px] leading-[1.8]">
              SSW (Tokutei Ginou) adalah visa kerja Jepang untuk mengisi kekurangan tenaga kerja
              di 14 sektor. Di sini kamu bisa lihat ringkasannya: daftar sektor, syarat, perbedaan tiap tingkat, dan alur prosesnya.
            </p>
          </div>
        </section>

        <div className="max-w-4xl mx-auto px-5 md:px-12 py-12 flex flex-col gap-14">
          {/* 14 Sektor — hub belajar kosakata per bidang */}
          <section>
            <h2 className="font-serif text-[22px] md:text-[26px] font-semibold text-ink mb-1">Belajar Kosakata per Bidang</h2>
            <p className="text-[13px] text-muted mb-6">
              Kosakata istilah khusus (専門用語) untuk tiap sektor SSW. Pilih bidang untuk mulai belajar
              — bidang lain menyusul.
            </p>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
              {sswSectors.map((s, i) => {
                const num = String(i + 1).padStart(2, '0')

                // Isi kartu (dipakai untuk versi aktif & terkunci)
                const inner = (
                  <>
                    {/* Watermark kanji samar di pojok */}
                    <span
                      className="absolute -right-1 -bottom-2 font-serif select-none pointer-events-none leading-none"
                      style={{ fontSize: '46px', color: `${s.accent}14`, zIndex: 0 }}
                      aria-hidden
                    >
                      {s.bgKanji}
                    </span>
                    <span
                      className="relative inline-flex items-center justify-center w-9 h-9 rounded-lg shrink-0 z-[1]"
                      style={{ background: s.accentBg, color: s.accent }}
                    >
                      <Icon name={s.icon} className="w-[18px] h-[18px]" />
                    </span>
                    <div className="relative z-[1] min-w-0">
                      <div className="font-serif text-[14px] font-medium text-ink leading-tight">{s.label}</div>
                      <div className="text-[12px]" style={{ color: 'var(--muted)' }}>{s.jp}</div>
                    </div>
                    <div className="relative z-[1] ml-auto flex items-center gap-2 shrink-0">
                      {s.status === 'active' ? (
                        <>
                          <span
                            className="text-[10px] font-medium px-2 py-0.5 rounded-full whitespace-nowrap"
                            style={{ background: s.accentBg, color: s.accent }}
                          >
                            300 kosakata
                          </span>
                          <Icon name="chevron-right" className="w-4 h-4" style={{ color: s.accent }} />
                        </>
                      ) : (
                        <span
                          className="inline-flex items-center gap-1 text-[10px] font-medium px-2 py-0.5 rounded-full whitespace-nowrap"
                          style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
                        >
                          <Icon name="lock" className="w-3 h-3" aria-hidden />
                          Segera hadir
                        </span>
                      )}
                    </div>
                  </>
                )

                return s.status === 'active' ? (
                  <Link
                    key={s.slug}
                    href={`/learn/bidang/${s.slug}`}
                    aria-label={`Belajar kosakata bidang ${s.label}`}
                    className="relative flex items-center gap-3 rounded-xl px-4 py-3 overflow-hidden hover-lift no-underline cursor-pointer transition-shadow focus-visible:outline-none focus-visible:ring-2"
                    style={{
                      background: 'var(--surface)',
                      border: `0.5px solid ${s.accent}40`,
                    }}
                  >
                    {inner}
                  </Link>
                ) : (
                  <div
                    key={s.slug}
                    aria-disabled="true"
                    title="Segera hadir"
                    className="relative flex items-center gap-3 rounded-xl px-4 py-3 overflow-hidden cursor-not-allowed select-none"
                    style={{
                      background: 'var(--surface)',
                      border: '0.5px solid var(--border)',
                      opacity: 0.6,
                    }}
                  >
                    {inner}
                    <span className="sr-only">{num}</span>
                  </div>
                )
              })}
            </div>
          </section>

          {/* Syarat */}
          <section>
            <h2 className="font-serif text-[22px] md:text-[26px] font-semibold text-ink mb-1">Syarat Utama</h2>
            <p className="text-[13px] text-muted mb-6">Yang perlu dipenuhi untuk mendaftar.</p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
              {requirements.map((r) => (
                <div
                  key={r.title}
                  className="rounded-xl p-5"
                  style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
                >
                  <div className="font-serif text-[15px] font-semibold text-ink mb-1.5">{r.title}</div>
                  <div className="text-[13px] leading-[1.7]" style={{ color: 'var(--muted)' }}>{r.desc}</div>
                </div>
              ))}
            </div>
          </section>

          {/* SSW i vs ii */}
          <section>
            <h2 className="font-serif text-[22px] md:text-[26px] font-semibold text-ink mb-1">SSW i vs SSW ii</h2>
            <p className="text-[13px] text-muted mb-6">Dua tingkat dengan hak yang berbeda.</p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3.5">
              {tiers.map((t) => (
                <div
                  key={t.tag}
                  className="rounded-xl p-6 relative overflow-hidden"
                  style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
                >
                  <div className="absolute top-0 left-0 right-0 h-[3px]" style={{ background: t.accent }} />
                  <span
                    className="text-[11px] font-medium px-2.5 py-0.5 rounded inline-block mb-3"
                    style={{ background: `${t.accent}1f`, color: t.accent }}
                  >
                    {t.tag}
                  </span>
                  <div className="font-serif text-[15px] font-semibold text-ink mb-3">{t.name}</div>
                  <ul className="flex flex-col gap-2">
                    {t.points.map((p) => (
                      <li key={p} className="flex items-start gap-2 text-[13px]" style={{ color: 'var(--muted)' }}>
                        <span style={{ color: t.accent, flexShrink: 0 }}>▸</span>
                        {p}
                      </li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          </section>

          {/* Alur proses */}
          <section>
            <h2 className="font-serif text-[22px] md:text-[26px] font-semibold text-ink mb-1">Alur Proses</h2>
            <p className="text-[13px] text-muted mb-6">Lima langkah dari nol hingga berangkat.</p>
            <div className="flex flex-col gap-2.5">
              {steps.map((s) => (
                <div
                  key={s.num}
                  className="flex items-start gap-4 rounded-xl p-5"
                  style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
                >
                  <span className="font-serif text-[24px] font-light leading-none shrink-0" style={{ color: 'var(--red)', opacity: 0.5 }}>
                    {s.num}
                  </span>
                  <div>
                    <div className="font-serif text-[15px] font-semibold text-ink mb-1">{s.title}</div>
                    <div className="text-[13px] leading-[1.7]" style={{ color: 'var(--muted)' }}>{s.desc}</div>
                  </div>
                </div>
              ))}
            </div>
          </section>

          {/* Disclaimer */}
          <p className="text-[12px] leading-[1.7]" style={{ color: 'var(--muted)' }}>
            * Informasi bersifat ringkasan edukatif. Syarat & sektor dapat berubah sesuai kebijakan
            Imigrasi Jepang (出入国在留管理庁). Selalu cek sumber resmi sebelum mendaftar.
          </p>
        </div>
      </main>
      <Footer />
    </>
  )
}
