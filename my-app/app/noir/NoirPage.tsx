'use client'

import type { CSSProperties } from 'react'
import { useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import './noir.css'

/**
 * Jumlah di bawah ini diambil langsung dari Supabase (levels + vocab/kanji/
 * grammar/dokkai) pada 30 Agustus 2026. Jangan ubah tanpa menghitung ulang —
 * halaman ini tidak boleh memuat angka karangan.
 */
const BERKAS = [
  { code: 'N5', href: '/learn/n5', vocab: 400, kanji: 103, grammar: 146, dokkai: 15 },
  { code: 'N4', href: '/learn/n4', vocab: 600, kanji: 170, grammar: 115, dokkai: 15 },
  { code: 'N3', href: '/learn/n3', vocab: 785, kanji: 194, grammar: 120, dokkai: 15 },
  { code: 'N2', href: '/learn/n2', vocab: 200, kanji: 250, grammar: 150, dokkai: 15 },
  { code: 'N1', href: '/learn/n1', vocab: 200, kanji: 250, grammar: 150, dokkai: 15 },
] as const

const JALUR = [
  {
    head: 'Jalur Ujian',
    sub: 'JLPT · N5 sampai N1',
    rows: [
      {
        title: 'Kosakata & Kanji',
        meta: '01',
        body: 'Daftar per level dengan cara baca, arti, dan contoh kalimat. Tiap kata bisa ditandai "sudah tahu" supaya yang tersisa hanya yang belum kamu kuasai.',
      },
      {
        title: 'Tata Bahasa',
        meta: '02',
        body: 'Pola per level lengkap dengan bentuk, nuansa pemakaian, dan contoh. N5 sampai N3 paling padat; N2 dan N1 sudah terisi 150 pola masing-masing.',
      },
      {
        title: 'Dokkai',
        meta: '03',
        body: 'Lima belas bacaan di tiap level, masing-masing dengan soal pemahaman bergaya JLPT dan penjelasan jawaban. Kosakata selevelmu ikut disorot di dalam teks.',
      },
    ],
  },
  {
    head: 'Jalur Kerja',
    sub: 'Tokutei Ginou · SSW',
    rows: [
      {
        title: 'Empat Belas Bidang',
        meta: '01',
        body: 'Kaigo, konstruksi, pertanian, perhotelan, dan sepuluh bidang lain yang dibuka program Tokutei Ginou. Tiap bidang punya halamannya sendiri.',
      },
      {
        title: 'Kosakata Bidang',
        meta: '02',
        body: 'Istilah khusus yang benar-benar dipakai di tempat kerja, bukan kosakata ujian. Bidang Kaigo sudah terisi tiga ratus istilah.',
      },
      {
        title: 'Kaiwa Tempat Kerja',
        meta: '03',
        body: 'Percakapan sesuai situasi — melapor ke atasan, menerima tamu, menjelaskan keadaan pasien. Setiap dialog disertai terjemahan baris per baris.',
      },
    ],
  },
] as const

const DIALOG = [
  { ja: '「すみません、これはいくらですか。」', id: 'Permisi, ini berapa harganya?' },
  { ja: '「三百円です。」', id: 'Tiga ratus yen.' },
  { ja: '「じゃあ、二つください。」', id: 'Kalau begitu, minta dua.' },
] as const

export function NoirPage() {
  const [open, setOpen] = useState<string | null>(null)
  const heroRef = useRef<HTMLElement | null>(null)

  // Satu observer untuk seluruh halaman — menambahkan .is-in sekali lalu berhenti.
  useEffect(() => {
    const targets = document.querySelectorAll<HTMLElement>('[data-scene]')
    const io = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (!entry.isIntersecting) continue
          entry.target.classList.add('is-in')
          io.unobserve(entry.target)
        }
      },
      { threshold: 0.2, rootMargin: '0px 0px -8% 0px' },
    )
    targets.forEach((t) => io.observe(t))
    return () => io.disconnect()
  }, [])

  // interaction-effects #37 Flashlight reveal — versi bertepi keras.
  useEffect(() => {
    const el = heroRef.current
    if (!el) return

    const still = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (still) {
      el.style.setProperty('--r', '150vmax')
      return
    }

    // Tanpa penunjuk presisi (sentuh): satu sapuan lambat otomatis.
    if (!window.matchMedia('(pointer: fine)').matches) {
      let t = 0
      let raf = 0
      const step = () => {
        t += 0.0045
        el.style.setProperty('--mx', `${50 + Math.sin(t) * 26}%`)
        el.style.setProperty('--my', `${46 + Math.cos(t * 0.7) * 7}%`)
        raf = requestAnimationFrame(step)
      }
      raf = requestAnimationFrame(step)
      return () => cancelAnimationFrame(raf)
    }

    const onMove = (e: PointerEvent) => {
      const r = el.getBoundingClientRect()
      el.style.setProperty('--mx', `${((e.clientX - r.left) / r.width) * 100}%`)
      el.style.setProperty('--my', `${((e.clientY - r.top) / r.height) * 100}%`)
    }
    el.addEventListener('pointermove', onMove, { passive: true })
    return () => el.removeEventListener('pointermove', onMove)
  }, [])

  return (
    <div className="noirRoot">
      {/* ── Adegan 1 · Tanda ─────────────────────────────────── */}
      <header className="noirHero" data-scene ref={heroRef}>
        <div className="noirBar noirLabel">
          <span className="noirBrand">
            <b>言の葉</b> Koto no Ha
          </span>
          <nav>
            <Link href="/learn/n5">Belajar</Link>
            <Link href="/kaiwa">Kaiwa</Link>
            <Link href="/ssw">SSW</Link>
            <Link href="/">Beranda</Link>
          </nav>
        </div>

        <div className="noirFrame">
          <div className="noirStage">
            <div>
              <p className="noirWord">言の葉</p>
              <p className="noirWordSub">kotonoha · kata-kata</p>
            </div>
          </div>

          <span className="noirBracket" data-c="tl" aria-hidden="true" />
          <span className="noirBracket" data-c="tr" aria-hidden="true" />
          <span className="noirBracket" data-c="bl" aria-hidden="true" />
          <span className="noirBracket" data-c="br" aria-hidden="true" />

          <div className="noirShade" aria-hidden="true" />

          <div className="noirLower">
            <p>
              Setiap kata yang belum kamu kenal masih berada dalam <em>bayangan</em>.
            </p>
            <span className="noirLabel">Gerakkan cahaya</span>
          </div>
        </div>

        <div className="noirBar noirLabel">
          <span>Bahasa Jepang untuk Indonesia</span>
          <span>N5 — N1 · SSW</span>
        </div>
      </header>

      {/* ── Adegan 2 · Yang Hilang ───────────────────────────── */}
      <section className="noirVoid" data-scene>
        <p>Kamu bisa mendengar seluruh kalimatnya — dan tetap tidak tahu apa yang diminta.</p>
      </section>

      {/* ── Adegan 3 · Dua Jalur ─────────────────────────────── */}
      <section className="noirTracks" data-scene aria-label="Dua jalur belajar">
        {JALUR.map((track) => (
          <div key={track.head}>
            <h2 className="noirTrackHead">
              <span className="noirLabel">{track.sub}</span>
              {track.head}
            </h2>

            {track.rows.map((row) => {
              const key = `${track.head}-${row.title}`
              const isOpen = open === key
              return (
                <div className="noirRow" data-open={isOpen} key={key}>
                  <button
                    type="button"
                    aria-expanded={isOpen}
                    onClick={() => setOpen(isOpen ? null : key)}
                  >
                    {row.title}
                    <span>{isOpen ? '—' : row.meta}</span>
                  </button>
                  <div>
                    <p>{row.body}</p>
                  </div>
                </div>
              )
            })}
          </div>
        ))}
      </section>

      {/* ── Adegan 4 · Suara ─────────────────────────────────── */}
      <section className="noirVoice" data-scene>
        <p className="noirLabel" style={{ marginBottom: '2rem' }}>
          Dikenali lebih dulu dari suaranya
        </p>

        {DIALOG.map((line, i) => (
          <div key={line.ja}>
            <div className="noirLine">
              <span className="noirJa" style={{ '--i': i * 2 } as CSSProperties}>
                {line.ja}
              </span>
            </div>
            <div className="noirLine">
              <span className="noirId" style={{ '--i': i * 2 + 1 } as CSSProperties}>
                {line.id}
              </span>
            </div>
          </div>
        ))}

        <p className="noirNote">
          Audio kaiwa dibacakan suara sintetis, bukan rekaman penutur asli. Berguna untuk
          menangkap ritme dan pemenggalan kalimat, tapi bukan pengganti mendengar orang Jepang
          bicara langsung.
        </p>
      </section>

      {/* ── Adegan 5 · Berkas ────────────────────────────────── */}
      <section className="noirWall" data-scene aria-label="Isi tiap level">
        {BERKAS.map((f) => (
          <Link className="noirFile" href={f.href} key={f.code} data-mark={f.code === 'N5'}>
            <span className="noirFileCode">{f.code}</span>
            <span className="noirFileMeta">
              {f.vocab} kosakata
              <br />
              {f.kanji} kanji
              <br />
              {f.grammar} tata bahasa
              <br />
              {f.dokkai} bacaan
            </span>
          </Link>
        ))}
      </section>

      {/* ── Adegan 6 · jeda ──────────────────────────────────── */}
      <section className="noirHold">
        <p>
          Dibuat satu orang, pelan-pelan. Kosakata N2 dan N1 masih tipis — dua ratus kata per
          level, dan itu memang belum cukup. Yang belum ada, belum ada.
        </p>
      </section>

      {/* ── Adegan 7 · Putusan ───────────────────────────────── */}
      <section className="noirVerdict" data-scene>
        <p className="noirSweep">Mulai dari N5.</p>
        <Link className="noirGo" href="/learn/n5">
          <i aria-hidden="true" />
          Masuk ke N5
        </Link>
      </section>

      {/* ── Adegan 8 · Footer ────────────────────────────────── */}
      <footer className="noirFoot noirLabel">
        <span>言の葉 Koto no Ha</span>
        <span>
          <Link href="/tentang">Tentang</Link> · <Link href="/kontak">Kontak</Link>
        </span>
      </footer>
    </div>
  )
}
