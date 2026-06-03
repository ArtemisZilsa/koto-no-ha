import type { KaiwaCategory } from '@/lib/types/database.types'

export interface KaiwaCategoryInfo {
  jp: string
  id: string
  emoji: string
}

/** Label tema kaiwa (kategori) — dipakai bersama oleh KaiwaList & ThemeGrid. */
export const CATEGORY_LABEL: Record<string, KaiwaCategoryInfo> = {
  daily: { jp: '日常会話', id: 'Sehari-hari', emoji: '🏠' },
  work: { jp: '職場', id: 'Tempat Kerja', emoji: '🏢' },
  biz: { jp: 'ビジネス', id: 'Bisnis Formal', emoji: '💼' },
  kaigo: { jp: '介護', id: 'Kaigo / Perawatan', emoji: '🏥' },
}

/** Fallback bila kategori tak dikenal. */
export const CATEGORY_FALLBACK: KaiwaCategoryInfo = { jp: '会話', id: 'Percakapan', emoji: '💬' }

export function getCategoryInfo(category: string): KaiwaCategoryInfo {
  return CATEGORY_LABEL[category] ?? CATEGORY_FALLBACK
}

/** Urutan tampilan tema yang konsisten. */
export const CATEGORY_ORDER: KaiwaCategory[] = ['daily', 'work', 'biz', 'kaigo']
