import { createClient } from '@/lib/supabase/server'

type Rpc = (fn: string, args?: Record<string, unknown>) => Promise<{ data: unknown; error: { message: string } | null }>

/**
 * Panggil RPC admin (062). Cast pada CLIENT agar `this` tetap terikat — pola sama dengan actions/quiz.ts.
 * Semua RPC admin_* menolak di database bila pemanggil bukan admin atau belum 2 langkah (aal2).
 */
export async function adminRpc<T>(fn: string, args?: Record<string, unknown>): Promise<{ data: T | null; error: string | null }> {
  const supabase = await createClient()
  const db = supabase as unknown as { rpc: Rpc }
  const { data, error } = await db.rpc(fn, args)
  if (error) console.error(`${fn} error`, error)
  return { data: (data as T) ?? null, error: error?.message ?? null }
}

export interface AdminState {
  isAdmin: boolean
  /** Sesi sudah lolos verifikasi 2 langkah. */
  aal2: boolean
  /** Sudah pernah memasang authenticator. */
  hasFactor: boolean
}

export async function getAdminState(): Promise<AdminState> {
  const supabase = await createClient()
  const db = supabase as unknown as { rpc: Rpc }
  const { data: isAdmin } = await db.rpc('is_admin')
  if (isAdmin !== true) return { isAdmin: false, aal2: false, hasFactor: false }

  const { data: aal } = await supabase.auth.mfa.getAuthenticatorAssuranceLevel()
  return {
    isAdmin: true,
    aal2: aal?.currentLevel === 'aal2',
    hasFactor: aal?.nextLevel === 'aal2',
  }
}
