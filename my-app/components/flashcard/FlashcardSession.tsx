'use client'

import { useCallback, useState } from 'react'
import Link from 'next/link'
import FlashCard, { vocabToCard, kanjiToCard, type FlashCardData } from './FlashCard'
import type { FlashcardStudyItem } from '@/lib/data/queries'
import { reviewFlashcard, type ReviewGrade } from '@/app/actions/flashcard'

interface FlashcardSessionProps {
  items: FlashcardStudyItem[]
  /** false = tamu; progres tidak disimpan ke Supabase. */
  signedIn: boolean
  /** Warna aksen level (mis. var(--teal)). */
  accentColor: string
  /** Slug level huruf kecil untuk link kembali (mis. "n3"). */
  levelSlug: string
}

interface QueueCard {
  card: FlashCardData
  itemType: FlashcardStudyItem['itemType']
  isNew: boolean
}

function toQueueCard(item: FlashcardStudyItem): QueueCard {
  return {
    card: item.itemType === 'vocab' ? vocabToCard(item.entry) : kanjiToCard(item.entry),
    itemType: item.itemType,
    isNew: item.isNew,
  }
}

/**
 * Sesi belajar flashcard: satu kartu per waktu dengan tombol "Tahu" / "Ulangi".
 * - "Tahu"   → kartu lewat; progres SRS naik (kalau login).
 * - "Ulangi" → kartu dimasukkan lagi ke akhir antrean sesi; progres SRS direset.
 * Layar selesai menampilkan rekap sederhana.
 */
export default function FlashcardSession({
  items,
  signedIn,
  accentColor,
  levelSlug,
}: FlashcardSessionProps) {
  const [queue, setQueue] = useState<QueueCard[]>(() => items.map(toQueueCard))
  const [index, setIndex] = useState(0)
  const [tahuCount, setTahuCount] = useState(0)
  const [ulangiCount, setUlangiCount] = useState(0)
  const [saveError, setSaveError] = useState<string | null>(null)

  const totalUnique = items.length
  const current = index < queue.length ? queue[index] : null
  const done = totalUnique > 0 && current === null

  const grade = useCallback(
    (g: ReviewGrade) => {
      if (!current) return

      // Simpan progres SRS di latar belakang (hanya untuk user login &
      // kartu yang punya id dari database).
      if (signedIn && current.card.id) {
        reviewFlashcard(current.itemType, current.card.id, g)
          .then((res) => {
            if (!res.ok && res.error) setSaveError(res.error)
          })
          .catch(() => setSaveError('Gagal menyimpan progres. Koneksi bermasalah?'))
      }

      if (g === 'tahu') {
        setTahuCount((n) => n + 1)
      } else {
        setUlangiCount((n) => n + 1)
        // Kartu "ulangi" muncul lagi di akhir antrean sesi ini.
        setQueue((q) => [...q, current])
      }
      setIndex((i) => i + 1)
    },
    [current, signedIn],
  )

  /* ─── Sesi kosong ───────────────────────────────────────────── */
  if (totalUnique === 0) {
    return (
      <div
        className="max-w-md mx-auto rounded-2xl px-6 py-10 text-center"
        style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
      >
        <p className="font-serif text-xl text-ink mb-2">Belum ada kartu</p>
        <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>
          Tidak ada kartu jatuh tempo atau kartu baru untuk sesi ini. Coba lagi nanti,
          atau pelajari materi lain dulu.
        </p>
        <Link
          href={`/learn/${levelSlug}`}
          className="inline-block rounded-full px-5 py-2.5 text-sm font-medium no-underline"
          style={{ background: accentColor, color: '#fff' }}
        >
          Kembali ke Materi
        </Link>
      </div>
    )
  }

  /* ─── Layar selesai ─────────────────────────────────────────── */
  if (done) {
    return (
      <div
        className="max-w-md mx-auto rounded-2xl px-6 py-10 text-center"
        style={{ background: 'var(--surface)', border: '0.5px solid var(--border)' }}
      >
        <p className="font-serif text-2xl text-ink mb-1">お疲れ様でした！</p>
        <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>
          Sesi selesai — {totalUnique} kartu dipelajari.
        </p>

        <div className="flex justify-center gap-3 mb-7">
          <div
            className="rounded-xl px-5 py-3"
            style={{ background: 'var(--paper)', border: '0.5px solid var(--border)' }}
          >
            <div className="text-2xl font-semibold" style={{ color: accentColor }}>
              {tahuCount}
            </div>
            <div className="text-[11px] uppercase tracking-wide" style={{ color: 'var(--muted)' }}>
              Tahu
            </div>
          </div>
          <div
            className="rounded-xl px-5 py-3"
            style={{ background: 'var(--paper)', border: '0.5px solid var(--border)' }}
          >
            <div className="text-2xl font-semibold" style={{ color: 'var(--red)' }}>
              {ulangiCount}
            </div>
            <div className="text-[11px] uppercase tracking-wide" style={{ color: 'var(--muted)' }}>
              Ulangi
            </div>
          </div>
        </div>

        {!signedIn && (
          <p className="text-xs mb-5" style={{ color: 'var(--muted)' }}>
            Progres sesi ini tidak tersimpan.{' '}
            <Link href="/login" style={{ color: accentColor }}>
              Masuk
            </Link>{' '}
            agar jadwal pengulanganmu tersimpan.
          </p>
        )}

        <div className="flex justify-center gap-3 flex-wrap">
          <button
            type="button"
            onClick={() => window.location.reload()}
            className="rounded-full px-5 py-2.5 text-sm font-medium cursor-pointer"
            style={{ background: accentColor, color: '#fff', border: 'none' }}
          >
            Mulai Sesi Baru
          </button>
          <Link
            href={`/learn/${levelSlug}`}
            className="rounded-full px-5 py-2.5 text-sm font-medium no-underline"
            style={{
              background: 'transparent',
              color: 'var(--ink)',
              border: '0.5px solid var(--border)',
            }}
          >
            Kembali ke Materi
          </Link>
        </div>
      </div>
    )
  }

  /* ─── Kartu aktif ───────────────────────────────────────────── */
  if (!current) return null // tidak terjadi; menjaga penyempitan tipe

  return (
    <div className="max-w-md mx-auto">
      {/* Progres */}
      <div className="flex items-center justify-between mb-4">
        <span className="text-xs" style={{ color: 'var(--muted)' }}>
          Kartu {Math.min(index + 1, queue.length)} dari {queue.length}
        </span>
        <span
          className="text-[11px] font-medium rounded-full px-2.5 py-1"
          style={{
            background: current.isNew ? `${accentColor}18` : 'var(--paper)',
            color: current.isNew ? accentColor : 'var(--muted)',
            border: '0.5px solid var(--border)',
          }}
        >
          {current.isNew ? 'Baru' : 'Jatuh tempo'}
        </span>
      </div>

      {/* Bar progres tipis */}
      <div
        className="h-1 rounded-full mb-6 overflow-hidden"
        style={{ background: 'var(--border)' }}
        aria-hidden
      >
        <div
          className="h-full rounded-full transition-all duration-300"
          style={{ width: `${(index / queue.length) * 100}%`, background: accentColor }}
        />
      </div>

      {/* Kartu — key memaksa remount agar kartu berikutnya mulai dari sisi depan */}
      <FlashCard
        key={`${index}-${current.card.id ?? current.card.front}`}
        card={current.card}
        accentColor={accentColor}
      />

      {/* Tombol nilai */}
      <div className="grid grid-cols-2 gap-3 mt-6">
        <button
          type="button"
          onClick={() => grade('ulangi')}
          className="rounded-full py-3 text-sm font-semibold cursor-pointer transition-opacity hover:opacity-85"
          style={{
            background: 'var(--red-bg)',
            color: 'var(--red)',
            border: '0.5px solid var(--red)',
          }}
        >
          Ulangi
        </button>
        <button
          type="button"
          onClick={() => grade('tahu')}
          className="rounded-full py-3 text-sm font-semibold cursor-pointer transition-opacity hover:opacity-85"
          style={{ background: accentColor, color: '#fff', border: 'none' }}
        >
          Tahu
        </button>
      </div>

      <p className="text-center text-[11px] mt-4" style={{ color: 'var(--muted)' }}>
        Klik kartu untuk melihat arti, lalu pilih <strong>Tahu</strong> atau{' '}
        <strong>Ulangi</strong>.
        {!signedIn && ' (Masuk untuk menyimpan progres.)'}
      </p>

      {saveError && (
        <p className="text-center text-xs mt-2" style={{ color: 'var(--red)' }}>
          {saveError}
        </p>
      )}
    </div>
  )
}
