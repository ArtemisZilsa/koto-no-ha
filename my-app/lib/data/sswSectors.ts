import type { IconName } from '@/components/ui/Icon'

/**
 * 14 sektor SSW (Tokutei Ginou) — satu sumber kebenaran untuk hub /ssw dan
 * halaman kosakata per-bidang (/learn/bidang/[slug]).
 *
 * `slug` dipakai sebagai segmen URL DAN nilai kolom `vocab.field`.
 * Bidang `status: 'active'` punya kosakata & bisa diklik; 'soon' = terkunci.
 */
export interface SswSector {
  slug: string
  jp: string
  label: string
  icon: IconName
  accent: string
  accentBg: string
  bgKanji: string
  status: 'active' | 'soon'
}

const ACCENTS: { accent: string; accentBg: string }[] = [
  { accent: 'var(--red)', accentBg: 'var(--red-bg)' },
  { accent: 'var(--gold)', accentBg: 'var(--gold-bg)' },
  { accent: 'var(--teal)', accentBg: 'var(--teal-bg)' },
  { accent: 'var(--green)', accentBg: 'var(--green-bg)' },
]

type SectorSeed = Omit<SswSector, 'accent' | 'accentBg'>

const SEED: SectorSeed[] = [
  { slug: 'kaigo', jp: '介護', label: 'Perawatan Lansia (Kaigo)', icon: 'heart-pulse', bgKanji: '介', status: 'active' },
  { slug: 'building-cleaning', jp: 'ビルクリーニング', label: 'Kebersihan Gedung', icon: 'brush', bgKanji: '清', status: 'soon' },
  { slug: 'manufacturing', jp: '素形材・産業機械・電気電子', label: 'Manufaktur Mesin & Elektronik', icon: 'cog', bgKanji: '機', status: 'soon' },
  { slug: 'construction', jp: '建設', label: 'Konstruksi', icon: 'hard-hat', bgKanji: '建', status: 'soon' },
  { slug: 'shipbuilding', jp: '造船・舶用工業', label: 'Galangan Kapal', icon: 'ship', bgKanji: '船', status: 'soon' },
  { slug: 'automobile-maintenance', jp: '自動車整備', label: 'Perawatan Otomotif', icon: 'car', bgKanji: '車', status: 'soon' },
  { slug: 'aviation', jp: '航空', label: 'Penerbangan (Ground & Maintenance)', icon: 'plane', bgKanji: '空', status: 'soon' },
  { slug: 'accommodation', jp: '宿泊', label: 'Perhotelan', icon: 'hotel', bgKanji: '宿', status: 'soon' },
  { slug: 'agriculture', jp: '農業', label: 'Pertanian', icon: 'wheat', bgKanji: '農', status: 'soon' },
  { slug: 'fishery', jp: '漁業', label: 'Perikanan', icon: 'fish', bgKanji: '漁', status: 'soon' },
  { slug: 'food-manufacturing', jp: '飲食料品製造業', label: 'Produksi Makanan & Minuman', icon: 'utensils', bgKanji: '食', status: 'soon' },
  { slug: 'food-service', jp: '外食業', label: 'Industri Restoran', icon: 'bowl', bgKanji: '外', status: 'soon' },
  { slug: 'road-transport', jp: '自動車運送業', label: 'Transportasi / Sopir', icon: 'truck', bgKanji: '運', status: 'soon' },
  { slug: 'railway', jp: '鉄道', label: 'Perkeretaapian', icon: 'train', bgKanji: '鉄', status: 'soon' },
]

export const sswSectors: SswSector[] = SEED.map((s, i) => ({
  ...s,
  ...ACCENTS[i % ACCENTS.length],
}))

export function getSswSector(slug: string): SswSector | undefined {
  return sswSectors.find((s) => s.slug === slug)
}
