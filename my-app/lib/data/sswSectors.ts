import type { IconName } from '@/components/ui/Icon'

/**
 * 16 bidang SSW (Tokutei Ginou) — satu sumber kebenaran untuk hub /ssw dan
 * halaman kosakata per-bidang (/learn/bidang/[slug]).
 *
 * Jumlahnya 16 sejak Juni 2024: 12 bidang hasil penggabungan 2022, ditambah
 * 自動車運送業, 鉄道, 林業, dan 木材産業. Angka "14 sektor" yang beredar luas
 * mengacu pada daftar lama sebelum penggabungan — jangan dipakai lagi.
 *
 * `slug` dipakai sebagai segmen URL DAN nilai kolom `vocab.field`.
 * Bidang `status: 'active'` punya kosakata & bisa diklik; 'soon' = terkunci.
 * Sejak migrasi 063 semua 16 bidang aktif (kaigo 300 kata, lainnya 100).
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
  /** Jumlah kosakata di tabel vocab (field = slug). Sumber: migrasi 022 (kaigo) & 063. */
  count: number
}

const ACCENTS: { accent: string; accentBg: string }[] = [
  { accent: 'var(--red)', accentBg: 'var(--red-bg)' },
  { accent: 'var(--gold)', accentBg: 'var(--gold-bg)' },
  { accent: 'var(--teal)', accentBg: 'var(--teal-bg)' },
  { accent: 'var(--green)', accentBg: 'var(--green-bg)' },
]

type SectorSeed = Omit<SswSector, 'accent' | 'accentBg'>

const SEED: SectorSeed[] = [
  { slug: 'kaigo', jp: '介護', label: 'Perawatan Lansia (Kaigo)', icon: 'heart-pulse', bgKanji: '介', status: 'active', count: 300 },
  { slug: 'building-cleaning', jp: 'ビルクリーニング', label: 'Kebersihan Gedung', icon: 'brush', bgKanji: '清', status: 'active', count: 100 },
  { slug: 'manufacturing', jp: '素形材・産業機械・電気電子', label: 'Manufaktur Mesin & Elektronik', icon: 'cog', bgKanji: '機', status: 'active', count: 100 },
  { slug: 'construction', jp: '建設', label: 'Konstruksi', icon: 'hard-hat', bgKanji: '建', status: 'active', count: 100 },
  { slug: 'shipbuilding', jp: '造船・舶用工業', label: 'Galangan Kapal', icon: 'ship', bgKanji: '船', status: 'active', count: 100 },
  { slug: 'automobile-maintenance', jp: '自動車整備', label: 'Perawatan Otomotif', icon: 'car', bgKanji: '車', status: 'active', count: 100 },
  { slug: 'aviation', jp: '航空', label: 'Penerbangan (Ground & Maintenance)', icon: 'plane', bgKanji: '空', status: 'active', count: 100 },
  { slug: 'accommodation', jp: '宿泊', label: 'Perhotelan', icon: 'hotel', bgKanji: '宿', status: 'active', count: 100 },
  { slug: 'agriculture', jp: '農業', label: 'Pertanian', icon: 'wheat', bgKanji: '農', status: 'active', count: 100 },
  { slug: 'fishery', jp: '漁業', label: 'Perikanan', icon: 'fish', bgKanji: '漁', status: 'active', count: 100 },
  { slug: 'food-manufacturing', jp: '飲食料品製造業', label: 'Produksi Makanan & Minuman', icon: 'utensils', bgKanji: '食', status: 'active', count: 100 },
  { slug: 'food-service', jp: '外食業', label: 'Industri Restoran', icon: 'bowl', bgKanji: '外', status: 'active', count: 100 },
  { slug: 'road-transport', jp: '自動車運送業', label: 'Transportasi / Sopir', icon: 'truck', bgKanji: '運', status: 'active', count: 100 },
  { slug: 'railway', jp: '鉄道', label: 'Perkeretaapian', icon: 'train', bgKanji: '鉄', status: 'active', count: 100 },
  { slug: 'forestry', jp: '林業', label: 'Kehutanan', icon: 'tree', bgKanji: '林', status: 'active', count: 100 },
  { slug: 'wood-industry', jp: '木材産業', label: 'Industri Kayu', icon: 'layers', bgKanji: '木', status: 'active', count: 100 },
]

export const sswSectors: SswSector[] = SEED.map((s, i) => ({
  ...s,
  ...ACCENTS[i % ACCENTS.length],
}))

export function getSswSector(slug: string): SswSector | undefined {
  return sswSectors.find((s) => s.slug === slug)
}
