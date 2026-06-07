import type { KaiwaCategory } from '@/lib/types/database.types'
import type { IconName } from '@/components/ui/Icon'

export interface KaiwaCategoryInfo {
  jp: string
  id: string
  icon: IconName
}

/** Label tema kaiwa (kategori) — dipakai bersama oleh KaiwaList & ThemeGrid. */
export const CATEGORY_LABEL: Record<string, KaiwaCategoryInfo> = {
  daily: { jp: '日常会話', id: 'Sehari-hari', icon: 'home' },
  work: { jp: '職場', id: 'Tempat Kerja', icon: 'building' },
  biz: { jp: 'ビジネス', id: 'Bisnis Formal', icon: 'briefcase' },
  kaigo: { jp: '介護', id: 'Kaigo / Perawatan', icon: 'heart-pulse' },
}

/** Fallback bila kategori tak dikenal. */
export const CATEGORY_FALLBACK: KaiwaCategoryInfo = { jp: '会話', id: 'Percakapan', icon: 'message' }

export function getCategoryInfo(category: string): KaiwaCategoryInfo {
  return CATEGORY_LABEL[category] ?? CATEGORY_FALLBACK
}

/** Urutan tampilan tema yang konsisten. */
export const CATEGORY_ORDER: KaiwaCategory[] = ['daily', 'work', 'biz', 'kaigo']
