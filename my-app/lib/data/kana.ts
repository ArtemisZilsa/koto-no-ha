// Data Kana — Hiragana (ひらがな) & Katakana (カタカナ).
// Statis (tanpa DB). Dipakai oleh halaman /kana untuk belajar aksara dasar.

export type KanaScript = 'hiragana' | 'katakana'

/** Kelompok baris kana untuk filter & tata letak grid. */
export type KanaGroup = 'gojuon' | 'dakuten' | 'youon'

export interface KanaCell {
  /** Karakter hiragana (mis. "か"). Kosong ('') untuk sel rumpang di grid 5 kolom. */
  hira: string
  /** Karakter katakana (mis. "カ"). */
  kata: string
  /** Cara baca romaji (mis. "ka"). Kosong untuk sel rumpang. */
  romaji: string
}

export interface KanaRow {
  /** Label baris (konsonan), mis. "k", "s", "—" untuk vokal murni. */
  label: string
  group: KanaGroup
  cells: KanaCell[]
}

const c = (hira: string, kata: string, romaji: string): KanaCell => ({ hira, kata, romaji })
/** Sel kosong (untuk menjaga grid 5 kolom tetap rapi, mis. baris ya/ra). */
const gap: KanaCell = { hira: '', kata: '', romaji: '' }

/** Gojūon — 46 bunyi dasar, disusun 5 kolom (a i u e o). */
export const GOJUON: KanaRow[] = [
  { label: '—', group: 'gojuon', cells: [c('あ', 'ア', 'a'), c('い', 'イ', 'i'), c('う', 'ウ', 'u'), c('え', 'エ', 'e'), c('お', 'オ', 'o')] },
  { label: 'k', group: 'gojuon', cells: [c('か', 'カ', 'ka'), c('き', 'キ', 'ki'), c('く', 'ク', 'ku'), c('け', 'ケ', 'ke'), c('こ', 'コ', 'ko')] },
  { label: 's', group: 'gojuon', cells: [c('さ', 'サ', 'sa'), c('し', 'シ', 'shi'), c('す', 'ス', 'su'), c('せ', 'セ', 'se'), c('そ', 'ソ', 'so')] },
  { label: 't', group: 'gojuon', cells: [c('た', 'タ', 'ta'), c('ち', 'チ', 'chi'), c('つ', 'ツ', 'tsu'), c('て', 'テ', 'te'), c('と', 'ト', 'to')] },
  { label: 'n', group: 'gojuon', cells: [c('な', 'ナ', 'na'), c('に', 'ニ', 'ni'), c('ぬ', 'ヌ', 'nu'), c('ね', 'ネ', 'ne'), c('の', 'ノ', 'no')] },
  { label: 'h', group: 'gojuon', cells: [c('は', 'ハ', 'ha'), c('ひ', 'ヒ', 'hi'), c('ふ', 'フ', 'fu'), c('へ', 'ヘ', 'he'), c('ほ', 'ホ', 'ho')] },
  { label: 'm', group: 'gojuon', cells: [c('ま', 'マ', 'ma'), c('み', 'ミ', 'mi'), c('む', 'ム', 'mu'), c('め', 'メ', 'me'), c('も', 'モ', 'mo')] },
  { label: 'y', group: 'gojuon', cells: [c('や', 'ヤ', 'ya'), gap, c('ゆ', 'ユ', 'yu'), gap, c('よ', 'ヨ', 'yo')] },
  { label: 'r', group: 'gojuon', cells: [c('ら', 'ラ', 'ra'), c('り', 'リ', 'ri'), c('る', 'ル', 'ru'), c('れ', 'レ', 're'), c('ろ', 'ロ', 'ro')] },
  { label: 'w', group: 'gojuon', cells: [c('わ', 'ワ', 'wa'), gap, gap, gap, c('を', 'ヲ', 'wo')] },
  { label: 'n', group: 'gojuon', cells: [c('ん', 'ン', 'n'), gap, gap, gap, gap] },
]

/** Dakuten (゛) & handakuten (゜) — bunyi bersuara: g z d b p. */
export const DAKUTEN: KanaRow[] = [
  { label: 'g', group: 'dakuten', cells: [c('が', 'ガ', 'ga'), c('ぎ', 'ギ', 'gi'), c('ぐ', 'グ', 'gu'), c('げ', 'ゲ', 'ge'), c('ご', 'ゴ', 'go')] },
  { label: 'z', group: 'dakuten', cells: [c('ざ', 'ザ', 'za'), c('じ', 'ジ', 'ji'), c('ず', 'ズ', 'zu'), c('ぜ', 'ゼ', 'ze'), c('ぞ', 'ゾ', 'zo')] },
  { label: 'd', group: 'dakuten', cells: [c('だ', 'ダ', 'da'), c('ぢ', 'ヂ', 'ji'), c('づ', 'ヅ', 'zu'), c('で', 'デ', 'de'), c('ど', 'ド', 'do')] },
  { label: 'b', group: 'dakuten', cells: [c('ば', 'バ', 'ba'), c('び', 'ビ', 'bi'), c('ぶ', 'ブ', 'bu'), c('べ', 'ベ', 'be'), c('ぼ', 'ボ', 'bo')] },
  { label: 'p', group: 'dakuten', cells: [c('ぱ', 'パ', 'pa'), c('ぴ', 'ピ', 'pi'), c('ぷ', 'プ', 'pu'), c('ぺ', 'ペ', 'pe'), c('ぽ', 'ポ', 'po')] },
]

/** Yōon — gabungan dengan ya/yu/yo (3 kolom). */
export const YOUON: KanaRow[] = [
  { label: 'ky', group: 'youon', cells: [c('きゃ', 'キャ', 'kya'), c('きゅ', 'キュ', 'kyu'), c('きょ', 'キョ', 'kyo')] },
  { label: 'sh', group: 'youon', cells: [c('しゃ', 'シャ', 'sha'), c('しゅ', 'シュ', 'shu'), c('しょ', 'ショ', 'sho')] },
  { label: 'ch', group: 'youon', cells: [c('ちゃ', 'チャ', 'cha'), c('ちゅ', 'チュ', 'chu'), c('ちょ', 'チョ', 'cho')] },
  { label: 'ny', group: 'youon', cells: [c('にゃ', 'ニャ', 'nya'), c('にゅ', 'ニュ', 'nyu'), c('にょ', 'ニョ', 'nyo')] },
  { label: 'hy', group: 'youon', cells: [c('ひゃ', 'ヒャ', 'hya'), c('ひゅ', 'ヒュ', 'hyu'), c('ひょ', 'ヒョ', 'hyo')] },
  { label: 'my', group: 'youon', cells: [c('みゃ', 'ミャ', 'mya'), c('みゅ', 'ミュ', 'myu'), c('みょ', 'ミョ', 'myo')] },
  { label: 'ry', group: 'youon', cells: [c('りゃ', 'リャ', 'rya'), c('りゅ', 'リュ', 'ryu'), c('りょ', 'リョ', 'ryo')] },
  { label: 'gy', group: 'youon', cells: [c('ぎゃ', 'ギャ', 'gya'), c('ぎゅ', 'ギュ', 'gyu'), c('ぎょ', 'ギョ', 'gyo')] },
  { label: 'j', group: 'youon', cells: [c('じゃ', 'ジャ', 'ja'), c('じゅ', 'ジュ', 'ju'), c('じょ', 'ジョ', 'jo')] },
  { label: 'by', group: 'youon', cells: [c('びゃ', 'ビャ', 'bya'), c('びゅ', 'ビュ', 'byu'), c('びょ', 'ビョ', 'byo')] },
  { label: 'py', group: 'youon', cells: [c('ぴゃ', 'ピャ', 'pya'), c('ぴゅ', 'ピュ', 'pyu'), c('ぴょ', 'ピョ', 'pyo')] },
]

export interface KanaGroupMeta {
  id: KanaGroup
  jp: string
  label: string
  desc: string
  rows: KanaRow[]
  /** Jumlah kolom grid untuk grup ini. */
  cols: number
}

export const KANA_GROUPS: KanaGroupMeta[] = [
  { id: 'gojuon', jp: '五十音', label: 'Gojūon', desc: 'Bunyi dasar — fondasi semua kana.', rows: GOJUON, cols: 5 },
  { id: 'dakuten', jp: '濁音・半濁音', label: 'Dakuten', desc: 'Bunyi bersuara (゛) & setengah (゜).', rows: DAKUTEN, cols: 5 },
  { id: 'youon', jp: '拗音', label: 'Yōon', desc: 'Gabungan dengan ゃ ゅ ょ kecil.', rows: YOUON, cols: 3 },
]

export const SCRIPT_META: Record<KanaScript, { jp: string; label: string; desc: string }> = {
  hiragana: { jp: 'ひらがな', label: 'Hiragana', desc: 'Untuk kata asli Jepang, partikel, & akhiran kata.' },
  katakana: { jp: 'カタカナ', label: 'Katakana', desc: 'Untuk kata serapan asing, nama, & penegasan.' },
}

/** Semua sel non-kosong dari satu skrip — dipakai untuk hitung total & mode kuis nanti. */
export function allCells(): KanaCell[] {
  return [...GOJUON, ...DAKUTEN, ...YOUON].flatMap((r) => r.cells).filter((cell) => cell.romaji !== '')
}
