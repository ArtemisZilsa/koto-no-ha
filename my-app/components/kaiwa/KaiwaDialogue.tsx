'use client'

import { useEffect, useRef, useState } from 'react'
import type { KaiwaLine } from '@/lib/types/database.types'
import { Icon } from '@/components/ui/Icon'

/** Pilihan kecepatan putar. 0,75 untuk latihan, 1,25 untuk uji kuping. */
const SPEEDS = [0.75, 1, 1.25] as const

/**
 * Panjang jeda setelah tiap baris, sebagai kelipatan durasi baris itu.
 * Inilah inti latihan shadowing: jeda dipakai untuk menirukan kalimatnya.
 */
const FOLLOW_RATES = [
  { value: 0, label: 'Mati' },
  { value: 1, label: '1×' },
  { value: 1.5, label: '1,5×' },
] as const

type PlayerOpts = {
  speed: number
  repeatLine: boolean
  loopAll: boolean
  followRate: number
}

type Controller = {
  play(index: number): void
  stop(): void
  applySpeed(speed: number): void
  dispose(): void
}

/**
 * Mesin pemutar, sengaja ditulis di luar komponen sebagai closure biasa.
 *
 * Alurnya rekursif (baris selesai → jeda → baris berikutnya) dan perlu baca
 * setelan terbaru saat callback berjalan. Kalau ditulis pakai useCallback,
 * aturan React Compiler menolaknya: fungsi tidak boleh memanggil dirinya
 * sendiri sebelum dideklarasikan, dan ref tidak boleh disentuh saat render.
 * Sebagai fungsi biasa, keduanya bukan masalah.
 */
function createController(deps: {
  getLines: () => KaiwaLine[]
  getOpts: () => PlayerOpts
  title: string
  onActive: (index: number | null) => void
  onPlaying: (playing: boolean) => void
  onWaiting: (waiting: boolean) => void
}): Controller {
  const { getLines, getOpts, title, onActive, onPlaying, onWaiting } = deps

  const audio = new Audio()
  audio.preload = 'auto'

  let timer: number | null = null
  let disposed = false

  const clearTimer = () => {
    if (timer !== null) {
      window.clearTimeout(timer)
      timer = null
    }
  }

  /** Indeks baris berikutnya yang punya audio, mulai dari `from`. -1 kalau habis. */
  const nextPlayable = (from: number): number => {
    const lines = getLines()
    for (let i = Math.max(0, from); i < lines.length; i++) {
      if (lines[i]?.audio) return i
    }
    return -1
  }

  const stop = () => {
    clearTimer()
    audio.pause()
    onPlaying(false)
    onWaiting(false)
    onActive(null)
  }

  const play = (target: number): void => {
    if (disposed) return

    const idx = nextPlayable(target)
    if (idx === -1) {
      // Sudah lewat baris terakhir yang punya audio.
      const first = getOpts().loopAll ? nextPlayable(0) : -1
      if (first !== -1) play(first)
      else stop()
      return
    }

    clearTimer()

    const lines = getLines()
    const line = lines[idx]!

    audio.src = line.audio!
    audio.playbackRate = getOpts().speed
    audio.currentTime = 0

    audio.onended = () => {
      if (disposed) return
      const { repeatLine, loopAll, followRate } = getOpts()
      const duration = Number.isFinite(audio.duration) ? audio.duration : 2
      const gapMs = followRate > 0 ? duration * followRate * 1000 : 0

      const resume = () => {
        timer = null
        onWaiting(false)
        if (repeatLine) {
          play(idx)
          return
        }
        const next = nextPlayable(idx + 1)
        if (next !== -1) {
          play(next)
          return
        }
        const first = loopAll ? nextPlayable(0) : -1
        if (first !== -1) play(first)
        else stop()
      }

      if (gapMs > 0) {
        onWaiting(true)
        timer = window.setTimeout(resume, gapMs)
      } else {
        resume()
      }
    }

    onActive(idx)
    onPlaying(true)
    onWaiting(false)

    void audio.play().catch(() => {
      // Browser menolak autoplay, atau berkasnya gagal dimuat.
      stop()
    })

    // Hangatkan cache baris berikutnya supaya perpindahannya tidak menggantung.
    const upcoming = nextPlayable(idx + 1)
    if (upcoming !== -1) {
      const warm = new Audio()
      warm.preload = 'auto'
      warm.src = lines[upcoming]!.audio!
    }

    if ('mediaSession' in navigator) {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: `${line.speaker}: ${line.text}`,
        artist: title,
        album: 'Koto no Ha — Kaiwa',
      })
    }
  }

  return {
    play,
    stop,
    applySpeed: (speed: number) => {
      audio.playbackRate = speed
    },
    dispose: () => {
      disposed = true
      clearTimer()
      audio.onended = null
      audio.pause()
      audio.src = ''
    },
  }
}

type Props = {
  lines: KaiwaLine[]
  accentColor: string
  title: string
}

export default function KaiwaDialogue({ lines, accentColor, title }: Props) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null)
  const [isPlaying, setIsPlaying] = useState(false)
  const [waiting, setWaiting] = useState(false)
  const [speed, setSpeed] = useState<number>(1)
  const [repeatLine, setRepeatLine] = useState(false)
  const [loopAll, setLoopAll] = useState(false)
  const [followRate, setFollowRate] = useState<number>(0)

  const controllerRef = useRef<Controller | null>(null)
  const linesRef = useRef(lines)
  const optsRef = useRef<PlayerOpts>({ speed, repeatLine, loopAll, followRate })

  // Ref di-update di effect, bukan saat render.
  useEffect(() => {
    linesRef.current = lines
  }, [lines])

  useEffect(() => {
    optsRef.current = { speed, repeatLine, loopAll, followRate }
  }, [speed, repeatLine, loopAll, followRate])

  useEffect(() => {
    const controller = createController({
      getLines: () => linesRef.current,
      getOpts: () => optsRef.current,
      title,
      onActive: setActiveIndex,
      onPlaying: setIsPlaying,
      onWaiting: setWaiting,
    })
    controllerRef.current = controller
    return () => {
      controller.dispose()
      controllerRef.current = null
    }
  }, [title])

  // Ubah kecepatan langsung terasa, tanpa memutar ulang barisnya.
  useEffect(() => {
    controllerRef.current?.applySpeed(speed)
  }, [speed])

  const firstSpeaker = lines[0]?.speaker
  const hasAnyAudio = lines.some((l) => l.audio)
  const isActive = isPlaying || waiting

  const togglePlayAll = () => {
    if (isActive) controllerRef.current?.stop()
    else controllerRef.current?.play(activeIndex ?? 0)
  }

  return (
    <div className="flex flex-col">
      {hasAnyAudio && (
        <div
          className="flex flex-wrap items-center gap-2 px-5 py-3"
          style={{ borderBottom: '0.5px solid var(--border)', background: 'var(--paper-dark)' }}
        >
          <button
            type="button"
            onClick={togglePlayAll}
            aria-label={isActive ? 'Hentikan pemutaran' : 'Putar seluruh dialog'}
            className="inline-flex items-center gap-1.5 text-[12px] px-3 py-1.5 rounded-full font-medium transition-opacity hover:opacity-85"
            style={{ background: accentColor, color: 'var(--on-ink)' }}
          >
            <Icon name={isActive ? 'pause' : 'play'} className="w-3.5 h-3.5" />
            {isActive ? 'Jeda' : 'Putar Semua'}
          </button>

          <ControlGroup icon="gauge" label="Kecepatan">
            {SPEEDS.map((s) => (
              <Chip
                key={s}
                active={speed === s}
                accentColor={accentColor}
                onClick={() => setSpeed(s)}
                label={`${String(s).replace('.', ',')}×`}
                aria-label={`Kecepatan ${s} kali`}
              />
            ))}
          </ControlGroup>

          <ControlGroup icon="timer" label="Jeda Tiru">
            {FOLLOW_RATES.map((r) => (
              <Chip
                key={r.value}
                active={followRate === r.value}
                accentColor={accentColor}
                onClick={() => setFollowRate(r.value)}
                label={r.label}
                aria-label={`Jeda untuk menirukan: ${r.label}`}
              />
            ))}
          </ControlGroup>

          <Chip
            active={repeatLine}
            accentColor={accentColor}
            onClick={() => setRepeatLine((v) => !v)}
            label="Ulang Baris"
            icon="repeat-one"
            aria-label="Ulangi baris yang sedang diputar"
          />
          <Chip
            active={loopAll}
            accentColor={accentColor}
            onClick={() => setLoopAll((v) => !v)}
            label="Ulang Semua"
            icon="repeat"
            aria-label="Ulangi seluruh dialog"
          />

          <span
            className="text-[10px] px-2 py-1 rounded-full ml-auto whitespace-nowrap"
            style={{ background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }}
            title="Audio dibuat dengan suara sintetis (AI), bukan rekaman penutur asli."
          >
            Suara AI
          </span>
        </div>
      )}

      <div className="p-5 flex flex-col gap-4">
        {lines.map((line, i) => (
          <DialogueLine
            key={i}
            line={line}
            side={line.speaker === firstSpeaker ? 'a' : 'b'}
            accentColor={accentColor}
            isCurrent={activeIndex === i}
            isWaiting={activeIndex === i && waiting}
            onPlay={line.audio ? () => controllerRef.current?.play(i) : undefined}
          />
        ))}
      </div>
    </div>
  )
}

function ControlGroup({
  icon,
  label,
  children,
}: {
  icon: 'gauge' | 'timer'
  label: string
  children: React.ReactNode
}) {
  return (
    <span className="inline-flex items-center gap-1" title={label}>
      <Icon name={icon} className="w-3.5 h-3.5" style={{ color: 'var(--muted)' }} />
      <span className="sr-only">{label}</span>
      {children}
    </span>
  )
}

function Chip({
  active,
  accentColor,
  onClick,
  label,
  icon,
  ...rest
}: {
  active: boolean
  accentColor: string
  onClick: () => void
  label: string
  icon?: 'repeat' | 'repeat-one'
} & React.ButtonHTMLAttributes<HTMLButtonElement>) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-pressed={active}
      className="inline-flex items-center gap-1 text-[11px] px-2.5 py-1 rounded-full transition-colors"
      style={
        active
          ? { background: `${accentColor}24`, color: accentColor, border: `0.5px solid ${accentColor}` }
          : { background: 'var(--surface)', color: 'var(--muted)', border: '0.5px solid var(--border)' }
      }
      {...rest}
    >
      {icon && <Icon name={icon} className="w-3 h-3" />}
      {label}
    </button>
  )
}

function DialogueLine({
  line,
  side,
  accentColor,
  isCurrent,
  isWaiting,
  onPlay,
}: {
  line: KaiwaLine
  side: 'a' | 'b'
  accentColor: string
  isCurrent: boolean
  isWaiting: boolean
  onPlay?: () => void
}) {
  const isA = side === 'a'
  const ref = useRef<HTMLDivElement | null>(null)

  // Ikut bergulir mengikuti baris yang sedang diputar.
  useEffect(() => {
    if (isCurrent) ref.current?.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }, [isCurrent])

  return (
    <div ref={ref} className={`flex gap-2.5 items-start ${isA ? '' : 'flex-row-reverse'}`}>
      <div
        className="w-[34px] h-[34px] rounded-full shrink-0 flex items-center justify-center text-[11px] font-medium"
        style={
          isA
            ? { background: 'var(--ink)', color: 'var(--paper)' }
            : { background: `${accentColor}1f`, color: accentColor }
        }
      >
        {line.speaker}
      </div>
      <div
        className="max-w-[80%] rounded-[12px] px-3.5 py-2.5 transition-shadow"
        style={{
          ...(isA
            ? { background: 'var(--paper-dark)', borderBottomLeftRadius: '3px' }
            : { background: accentColor, borderBottomRightRadius: '3px' }),
          ...(isCurrent ? { boxShadow: `0 0 0 2px ${accentColor}` } : null),
        }}
      >
        {/* Teks Jepang + tombol putar baris */}
        <div className="flex items-start gap-2">
          <div
            className="font-serif text-[15px] leading-snug"
            style={{ color: isA ? 'var(--ink)' : 'var(--on-ink)' }}
          >
            {line.text}
          </div>
          {onPlay && (
            <button
              type="button"
              onClick={onPlay}
              aria-label={`Putar baris: ${line.text}`}
              className="shrink-0 mt-0.5 opacity-55 hover:opacity-100 transition-opacity"
              style={{ color: isA ? 'var(--ink)' : 'var(--on-ink)' }}
            >
              <Icon name={isWaiting ? 'timer' : 'play'} className="w-3.5 h-3.5" />
            </button>
          )}
        </div>
        {/* Cara baca: hiragana */}
        {line.reading && (
          <div className="text-[12px] mt-1" style={{ color: isA ? 'var(--muted)' : 'var(--on-ink-muted)' }}>
            {line.reading}
          </div>
        )}
        {/* Cara baca: romaji */}
        {line.romaji && (
          <div className="text-[11px] italic mt-0.5" style={{ color: isA ? 'var(--muted)' : 'var(--on-ink-muted)' }}>
            {line.romaji}
          </div>
        )}
        {/* Terjemahan Indonesia */}
        <div
          className="text-[12.5px] mt-1.5 pt-1.5"
          style={{
            color: isA ? 'var(--ink)' : 'var(--on-ink)',
            borderTop: `0.5px solid ${isA ? 'var(--border)' : 'var(--on-ink-line)'}`,
            opacity: 0.9,
          }}
        >
          {line.trans}
        </div>
      </div>
    </div>
  )
}
