'use client'

import { useEffect, useRef, useState, type CSSProperties, type ElementType, type ReactNode } from 'react'

interface RevealProps {
  children: ReactNode
  /** Penundaan animasi (ms) untuk efek stagger. */
  delay?: number
  /** Tag pembungkus (default div). */
  as?: ElementType
  className?: string
  style?: CSSProperties
}

/**
 * Membungkus konten dengan animasi geser-dari-kiri (fade-in-left) saat masuk viewport.
 * Memakai IntersectionObserver (tanpa dependency). Animasi dimatikan
 * otomatis lewat CSS di prefers-reduced-motion (lihat globals.css).
 */
export function Reveal({ children, delay = 0, as, className = '', style }: RevealProps) {
  const Tag = (as ?? 'div') as ElementType
  const ref = useRef<HTMLElement | null>(null)
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return
    // Jika IO tak tersedia, tampilkan langsung.
    if (typeof IntersectionObserver === 'undefined') {
      setVisible(true)
      return
    }
    const io = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            setVisible(true)
            io.unobserve(entry.target)
          }
        }
      },
      { threshold: 0.12, rootMargin: '0px 0px -8% 0px' }
    )
    io.observe(el)
    return () => io.disconnect()
  }, [])

  return (
    <Tag
      ref={ref}
      className={`reveal ${visible ? 'is-visible' : ''} ${className}`.trim()}
      style={{ ['--reveal-delay' as string]: `${delay}ms`, ...style }}
    >
      {children}
    </Tag>
  )
}
