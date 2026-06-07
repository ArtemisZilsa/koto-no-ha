'use server'

import { createClient } from '@/lib/supabase/server'

export type ItemType = 'vocab' | 'kanji'

export interface ToggleResult {
  ok: boolean
  known: boolean
  /** Total XP terbaru (hanya terisi saat menandai dikenal). */
  totalXp?: number
  /** Streak terbaru (hanya terisi saat menandai dikenal). */
  streakDays?: number
  error?: string
}

/**
 * Toggle status "dikenal" sebuah item (kosakata/kanji) untuk user saat ini.
 * - Menandai dikenal → RPC mark_item_known (atomik: +XP saat pertama kali,
 *   update streak harian).
 * - Membatalkan → hapus baris (RLS membatasi ke milik user sendiri).
 */
export async function toggleItemKnown(
  itemType: ItemType,
  itemId: string,
  next: boolean,
): Promise<ToggleResult> {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    return { ok: false, known: !next, error: 'Silakan masuk untuk menyimpan progres.' }
  }

  if (next) {
    // Cast pada CLIENT (bukan metode rpc) supaya `this` tetap terikat ke client.
    // Tipe Database hand-maintained belum punya generic Functions lengkap untuk
    // inferensi rpc supabase-js; argumen & hasil tetap divalidasi di dalam RPC.
    type MarkKnownRow = { known: boolean; total_xp: number; streak_days: number }
    const db = supabase as unknown as {
      rpc: (
        fn: 'mark_item_known',
        args: { p_item_type: ItemType; p_item_id: string; p_xp: number },
      ) => Promise<{ data: MarkKnownRow[] | null; error: { message: string } | null }>
    }

    const { data, error } = await db.rpc('mark_item_known', {
      p_item_type: itemType,
      p_item_id: itemId,
      p_xp: 5,
    })
    if (error) {
      console.error('mark_item_known error', error)
      return { ok: false, known: false, error: 'Gagal menyimpan. Coba lagi.' }
    }
    const row = Array.isArray(data) ? data[0] : data
    return {
      ok: true,
      known: true,
      totalXp: row?.total_xp ?? undefined,
      streakDays: row?.streak_days ?? undefined,
    }
  }

  // Batalkan tanda dikenal (tidak mengurangi XP yang sudah diberikan).
  const { error } = await supabase
    .from('user_item_progress')
    .delete()
    .eq('user_id', user.id)
    .eq('item_type', itemType)
    .eq('item_id', itemId)

  if (error) {
    console.error('unmark item error', error)
    return { ok: false, known: true, error: 'Gagal memperbarui. Coba lagi.' }
  }
  return { ok: true, known: false }
}
