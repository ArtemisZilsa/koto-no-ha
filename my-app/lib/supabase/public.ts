import { createClient } from '@supabase/supabase-js'
import type { Database } from '@/lib/types/database.types'

/**
 * Client tanpa cookie untuk konten publik (dibaca sebagai anon, tunduk RLS).
 * Tidak menyentuh cookies() → halaman yang memakainya bisa statis / di-cache CDN.
 * Jangan dipakai untuk data milik user.
 */
export function createPublicClient() {
  return createClient<Database>(process.env.NEXT_PUBLIC_SUPABASE_URL!, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!, {
    auth: { persistSession: false, autoRefreshToken: false },
  })
}
