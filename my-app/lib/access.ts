import { createClient } from '@/lib/supabase/server'

/** Produk yang membuka bank soal (PLAN.md: ikut langganan video). */
export const BANK_SOAL_PRODUCT_ID = 'video-bulanan'

type RpcResult = Promise<{ data: boolean | null; error: { message: string } | null }>

/**
 * Cek hak akses di server tiap request (RPC 059, tunduk RLS). Admin selalu boleh.
 * Ini hanya untuk tampilan; pengaman sebenarnya adalah RLS di tabel bank_soal (060).
 */
export async function hasBankSoalAccess(): Promise<boolean> {
  const supabase = await createClient()
  // Cast pada CLIENT (bukan metode rpc) agar `this` tetap terikat — pola sama dengan actions/quiz.ts.
  const db = supabase as unknown as {
    rpc(fn: 'has_entitlement', args: { p_product_id: string }): RpcResult
    rpc(fn: 'is_admin'): RpcResult
  }
  const [paid, admin] = await Promise.all([
    db.rpc('has_entitlement', { p_product_id: BANK_SOAL_PRODUCT_ID }),
    db.rpc('is_admin'),
  ])
  if (paid.error || admin.error) console.error('cek akses bank soal gagal', paid.error ?? admin.error)
  return paid.data === true || admin.data === true
}
