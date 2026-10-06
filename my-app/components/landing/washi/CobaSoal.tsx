'use client'

import Link from 'next/link'
import { useState } from 'react'

// Contoh soal asli dari Bank Soal N5 (Excel Zilsa, kode di sebelah kanan).
// Disalin statis ke beranda supaya pengunjung tanpa akun bisa mencoba; bank lengkap tetap terkunci (RLS 060).
const SAMPLES = [
  {
    code: 'G5-001-01',
    label: 'Tata Bahasa',
    instruction: 'Pilih partikel yang tepat untuk （　）.',
    body: 'わたし（　）学生です。',
    options: ['で', 'へ', 'は', 'を'],
    answer: 2,
    explanation: "は menandai topik: 'Saya (adalah) pelajar'. を, へ, dan で butuh kata kerja, tidak bisa dipakai dengan です.",
  },
  {
    code: 'G5-015-05',
    label: 'Tata Bahasa',
    instruction: 'Pilih partikel yang tepat untuk （　）.',
    body: 'タクシー（　）うちへ かえりました。',
    options: ['を', 'へ', 'に', 'で'],
    answer: 3,
    explanation: 'Kendaraan ditandai で: pulang ke rumah naik taksi.',
  },
  {
    code: 'K5-0001',
    label: 'Kanji',
    instruction: 'Apa arti kata berikut?',
    body: '一つ（ひとつ）',
    options: ['satu orang', 'satu kali', 'satu buah', 'satu tahun'],
    answer: 2,
    explanation: '一つ dibaca ひとつ, artinya "satu buah".',
  },
]

// Section 3 — demo bank soal. Kartu berbalik (CSS 3D) setelah menjawab untuk menampilkan pembahasan.
export function CobaSoal() {
  const [i, setI] = useState(0)
  const [picked, setPicked] = useState<number | null>(null)
  const q = SAMPLES[i]
  const done = picked !== null
  const correct = picked === q.answer

  const next = () => {
    setI((n) => (n + 1) % SAMPLES.length)
    setPicked(null)
  }

  return (
    <section id="coba" className="px-5 md:px-12 py-20 md:py-28">
      <div className="max-w-5xl mx-auto grid gap-10 md:grid-cols-[1fr_1.1fr] md:items-center">
        <div>
          <p className="text-[12px] tracking-[0.14em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
            <span lang="ja" className="font-serif">練習</span> · Coba sekarang, tanpa daftar
          </p>
          <h2 className="font-serif text-[28px] md:text-[40px] font-semibold leading-tight mb-4" style={{ color: 'var(--text)' }}>
            Jawab satu soal. Lihat bedanya.
          </h2>
          <p className="text-[15px] leading-[1.8]" style={{ color: 'var(--muted)' }}>
            Setiap soal di Bank Soal punya pembahasan dalam Bahasa Indonesia: bukan cuma benar atau salah,
            tapi <i>kenapa</i>. Ini salah satu dari 2.000+ soal N5.
          </p>
        </div>

        <div className="kartu-soal" data-flipped={done}>
          <div className="kartu-soal__inner">
            {/* Depan: soal */}
            <div className="kartu-soal__face rounded-2xl p-6 md:p-8" inert={done}>
              <div className="flex justify-between text-[12px] mb-5" style={{ color: 'var(--muted)' }}>
                <span>{q.label} · N5</span>
                <span className="tabular-nums">{q.code}</span>
              </div>
              <p className="text-[13px] mb-2 text-center" style={{ color: 'var(--muted)' }}>{q.instruction}</p>
              <p lang="ja" className="font-serif text-[26px] md:text-[30px] font-semibold text-center mb-7" style={{ color: 'var(--text)' }}>
                {q.body}
              </p>
              <div className="grid grid-cols-2 gap-2.5" role="group" aria-label="Pilihan jawaban">
                {q.options.map((o, n) => (
                  <button
                    key={o}
                    type="button"
                    disabled={done}
                    onClick={() => setPicked(n)}
                    className="rounded-xl px-4 py-3 text-[16px] text-left cursor-pointer hover:border-[var(--crimson)]"
                    style={{ border: '1px solid var(--brand-line)', background: 'var(--paper)', color: 'var(--text)' }}
                  >
                    <span className="text-[11px] mr-2" style={{ color: 'var(--muted)' }}>{'ABCD'[n]}</span>
                    <span lang="ja">{o}</span>
                  </button>
                ))}
              </div>
            </div>

            {/* Belakang: pembahasan */}
            <div className="kartu-soal__face kartu-soal__back rounded-2xl p-6 md:p-8 flex flex-col" inert={!done} aria-live="polite">
              <p className="font-serif text-[22px] font-semibold mb-1" style={{ color: correct ? 'var(--green)' : 'var(--crimson)' }}>
                {done ? (correct ? '正解! Benar.' : 'Belum tepat.') : ''}
              </p>
              <p className="text-[14px] mb-4" style={{ color: 'var(--muted)' }}>
                Jawaban: <b lang="ja" style={{ color: 'var(--text)' }}>{'ABCD'[q.answer]}. {q.options[q.answer]}</b>
              </p>
              <p className="text-[15px] leading-[1.8] mb-6" style={{ color: 'var(--text)' }}>{q.explanation}</p>
              <div className="mt-auto flex flex-wrap gap-3">
                <button
                  type="button"
                  onClick={next}
                  className="rounded-lg px-5 py-2.5 text-[14px] cursor-pointer"
                  style={{ border: '1px solid var(--brand-line)', color: 'var(--text)' }}
                >
                  Soal lain
                </button>
                <Link
                  href="#harga"
                  className="rounded-lg px-5 py-2.5 text-[14px] font-medium no-underline"
                  style={{ background: 'var(--crimson)', color: '#FAFAFA' }}
                >
                  Buka 2.000+ soal
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}
