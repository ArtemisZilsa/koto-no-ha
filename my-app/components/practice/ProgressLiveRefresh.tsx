'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

/** Satu set soal = sampai 30 INSERT sekaligus; gabungkan jadi satu refresh. */
const REFRESH_DELAY_MS = 600

/**
 * Berlangganan Supabase Realtime untuk progres user yang sedang login
 * (migrasi 056). Setiap jawaban soal baru atau perubahan XP/streak memicu
 * router.refresh(), jadi server component merender ulang dengan data segar
 * tanpa reload halaman. Tamu: tidak berlangganan apa-apa.
 */
export default function ProgressLiveRefresh() {
  const router = useRouter()

  useEffect(() => {
    const supabase = createClient()
    let channel: ReturnType<typeof supabase.channel> | null = null
    let timer: ReturnType<typeof setTimeout> | null = null
    let cancelled = false

    const scheduleRefresh = () => {
      if (timer) clearTimeout(timer)
      timer = setTimeout(() => router.refresh(), REFRESH_DELAY_MS)
    }

    // getSession cukup untuk filter; RLS di server tetap membatasi baris.
    supabase.auth.getSession().then(({ data: { session } }) => {
      const userId = session?.user.id
      if (cancelled || !userId) return
      channel = supabase
        .channel(`progress:${userId}`)
        .on(
          'postgres_changes',
          { event: 'INSERT', schema: 'public', table: 'user_practice_answers', filter: `user_id=eq.${userId}` },
          scheduleRefresh,
        )
        .on(
          'postgres_changes',
          { event: 'UPDATE', schema: 'public', table: 'profiles', filter: `id=eq.${userId}` },
          scheduleRefresh,
        )
        .subscribe()
    })

    return () => {
      cancelled = true
      if (timer) clearTimeout(timer)
      if (channel) supabase.removeChannel(channel)
    }
  }, [router])

  return null
}
