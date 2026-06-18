// KotonoHa Quiz Component

export type QuizLevel = 'N5' | 'N4' | 'N3'

export interface QuizKanji {
  id: string
  kanji: string
  furigana: string
  romaji: string
  meaning: string // arti dalam Bahasa Indonesia
  level: QuizLevel
  example: string // contoh kalimat (Jepang)
  exampleTranslation: string // terjemahan (Indonesia)
}

// 50 Kanji N5 — campuran angka, waktu, alam, orang, tempat, aksi.
// Dipilih yang dipakai sehari-hari; asumsi pembelajar sudah kuasai kana.
export const quizKanji: QuizKanji[] = [
  // — Angka —
  { id: 'q01', kanji: '一', furigana: 'いち', romaji: 'ichi', meaning: 'satu', level: 'N5', example: 'りんごを一つください。', exampleTranslation: 'Tolong satu apel.' },
  { id: 'q02', kanji: '二', furigana: 'に', romaji: 'ni', meaning: 'dua', level: 'N5', example: '二人で行きます。', exampleTranslation: 'Pergi berdua.' },
  { id: 'q03', kanji: '三', furigana: 'さん', romaji: 'san', meaning: 'tiga', level: 'N5', example: '三時に会いましょう。', exampleTranslation: 'Mari bertemu jam tiga.' },
  { id: 'q04', kanji: '四', furigana: 'よん', romaji: 'yon', meaning: 'empat', level: 'N5', example: '四つ買います。', exampleTranslation: 'Beli empat buah.' },
  { id: 'q05', kanji: '五', furigana: 'ご', romaji: 'go', meaning: 'lima', level: 'N5', example: '五時に起きます。', exampleTranslation: 'Bangun jam lima.' },
  { id: 'q06', kanji: '六', furigana: 'ろく', romaji: 'roku', meaning: 'enam', level: 'N5', example: '六月は雨が多いです。', exampleTranslation: 'Bulan Juni banyak hujan.' },
  { id: 'q07', kanji: '七', furigana: 'なな', romaji: 'nana', meaning: 'tujuh', level: 'N5', example: '今、七時です。', exampleTranslation: 'Sekarang jam tujuh.' },
  { id: 'q08', kanji: '八', furigana: 'はち', romaji: 'hachi', meaning: 'delapan', level: 'N5', example: '八百円です。', exampleTranslation: 'Harganya delapan ratus yen.' },
  { id: 'q09', kanji: '九', furigana: 'きゅう', romaji: 'kyū', meaning: 'sembilan', level: 'N5', example: '九時に寝ます。', exampleTranslation: 'Tidur jam sembilan.' },
  { id: 'q10', kanji: '十', furigana: 'じゅう', romaji: 'jū', meaning: 'sepuluh', level: 'N5', example: '十人います。', exampleTranslation: 'Ada sepuluh orang.' },
  { id: 'q11', kanji: '百', furigana: 'ひゃく', romaji: 'hyaku', meaning: 'seratus', level: 'N5', example: '百円のパンです。', exampleTranslation: 'Roti seharga seratus yen.' },
  { id: 'q12', kanji: '千', furigana: 'せん', romaji: 'sen', meaning: 'seribu', level: 'N5', example: '千円札を出す。', exampleTranslation: 'Mengeluarkan uang seribu yen.' },

  // — Waktu —
  { id: 'q13', kanji: '日', furigana: 'ひ', romaji: 'hi', meaning: 'hari; matahari', level: 'N5', example: '日曜日は休みです。', exampleTranslation: 'Hari Minggu libur.' },
  { id: 'q14', kanji: '月', furigana: 'つき', romaji: 'tsuki', meaning: 'bulan', level: 'N5', example: '夜の月がきれいです。', exampleTranslation: 'Bulan malam ini indah.' },
  { id: 'q15', kanji: '年', furigana: 'とし', romaji: 'toshi', meaning: 'tahun', level: 'N5', example: '来年日本へ行きます。', exampleTranslation: 'Tahun depan pergi ke Jepang.' },
  { id: 'q16', kanji: '時', furigana: 'じ', romaji: 'ji', meaning: 'waktu; jam', level: 'N5', example: '時間がありません。', exampleTranslation: 'Tidak ada waktu.' },
  { id: 'q17', kanji: '分', furigana: 'ふん', romaji: 'fun', meaning: 'menit; bagian', level: 'N5', example: '五分待ってください。', exampleTranslation: 'Tolong tunggu lima menit.' },
  { id: 'q18', kanji: '今', furigana: 'いま', romaji: 'ima', meaning: 'sekarang', level: 'N5', example: '今、忙しいです。', exampleTranslation: 'Sekarang sedang sibuk.' },
  { id: 'q19', kanji: '午', furigana: 'ご', romaji: 'go', meaning: 'tengah hari', level: 'N5', example: '午後三時に来ます。', exampleTranslation: 'Datang jam tiga sore.' },
  { id: 'q20', kanji: '半', furigana: 'はん', romaji: 'han', meaning: 'setengah', level: 'N5', example: '六時半に起きます。', exampleTranslation: 'Bangun jam setengah tujuh.' },

  // — Alam —
  { id: 'q21', kanji: '山', furigana: 'やま', romaji: 'yama', meaning: 'gunung', level: 'N5', example: '夏に山に登ります。', exampleTranslation: 'Mendaki gunung di musim panas.' },
  { id: 'q22', kanji: '川', furigana: 'かわ', romaji: 'kawa', meaning: 'sungai', level: 'N5', example: '川で魚をとる。', exampleTranslation: 'Menangkap ikan di sungai.' },
  { id: 'q23', kanji: '水', furigana: 'みず', romaji: 'mizu', meaning: 'air', level: 'N5', example: '水を飲みます。', exampleTranslation: 'Minum air.' },
  { id: 'q24', kanji: '火', furigana: 'ひ', romaji: 'hi', meaning: 'api', level: 'N5', example: '火に気をつけて。', exampleTranslation: 'Hati-hati dengan api.' },
  { id: 'q25', kanji: '木', furigana: 'き', romaji: 'ki', meaning: 'pohon; kayu', level: 'N5', example: '木の下で休みます。', exampleTranslation: 'Istirahat di bawah pohon.' },
  { id: 'q26', kanji: '金', furigana: 'かね', romaji: 'kane', meaning: 'uang; emas', level: 'N5', example: 'お金がありません。', exampleTranslation: 'Tidak punya uang.' },
  { id: 'q27', kanji: '土', furigana: 'つち', romaji: 'tsuchi', meaning: 'tanah', level: 'N5', example: '土の中に種をまく。', exampleTranslation: 'Menanam benih di dalam tanah.' },
  { id: 'q28', kanji: '雨', furigana: 'あめ', romaji: 'ame', meaning: 'hujan', level: 'N5', example: '朝から雨が降る。', exampleTranslation: 'Hujan turun sejak pagi.' },

  // — Orang —
  { id: 'q29', kanji: '人', furigana: 'ひと', romaji: 'hito', meaning: 'orang', level: 'N5', example: 'あの人は先生です。', exampleTranslation: 'Orang itu seorang guru.' },
  { id: 'q30', kanji: '男', furigana: 'おとこ', romaji: 'otoko', meaning: 'laki-laki', level: 'N5', example: '男の子が走る。', exampleTranslation: 'Anak laki-laki berlari.' },
  { id: 'q31', kanji: '女', furigana: 'おんな', romaji: 'onna', meaning: 'perempuan', level: 'N5', example: '女の人が歌う。', exampleTranslation: 'Seorang perempuan bernyanyi.' },
  { id: 'q32', kanji: '子', furigana: 'こ', romaji: 'ko', meaning: 'anak', level: 'N5', example: '子どもが遊ぶ。', exampleTranslation: 'Anak-anak bermain.' },
  { id: 'q33', kanji: '父', furigana: 'ちち', romaji: 'chichi', meaning: 'ayah', level: 'N5', example: '父は会社員です。', exampleTranslation: 'Ayah seorang pegawai.' },
  { id: 'q34', kanji: '母', furigana: 'はは', romaji: 'haha', meaning: 'ibu', level: 'N5', example: '母は料理が上手です。', exampleTranslation: 'Ibu pandai memasak.' },
  { id: 'q35', kanji: '友', furigana: 'とも', romaji: 'tomo', meaning: 'teman', level: 'N5', example: '友だちと話します。', exampleTranslation: 'Berbicara dengan teman.' },
  { id: 'q36', kanji: '名', furigana: 'な', romaji: 'na', meaning: 'nama', level: 'N5', example: 'ここに名前を書く。', exampleTranslation: 'Tulis nama di sini.' },

  // — Tempat —
  { id: 'q37', kanji: '国', furigana: 'くに', romaji: 'kuni', meaning: 'negara', level: 'N5', example: 'どこの国の人ですか。', exampleTranslation: 'Anda orang dari negara mana?' },
  { id: 'q38', kanji: '町', furigana: 'まち', romaji: 'machi', meaning: 'kota kecil', level: 'N5', example: '町を散歩します。', exampleTranslation: 'Berjalan-jalan di kota.' },
  { id: 'q39', kanji: '道', furigana: 'みち', romaji: 'michi', meaning: 'jalan', level: 'N5', example: '道を渡ります。', exampleTranslation: 'Menyeberang jalan.' },
  { id: 'q40', kanji: '駅', furigana: 'えき', romaji: 'eki', meaning: 'stasiun', level: 'N5', example: '駅で友だちに会う。', exampleTranslation: 'Bertemu teman di stasiun.' },
  { id: 'q41', kanji: '店', furigana: 'みせ', romaji: 'mise', meaning: 'toko', level: 'N5', example: 'その店は九時に開く。', exampleTranslation: 'Toko itu buka jam sembilan.' },
  { id: 'q42', kanji: '田', furigana: 'た', romaji: 'ta', meaning: 'sawah', level: 'N5', example: '田んぼが広いです。', exampleTranslation: 'Sawahnya luas.' },
  { id: 'q43', kanji: '校', furigana: 'こう', romaji: 'kō', meaning: 'sekolah', level: 'N5', example: '毎日学校へ行く。', exampleTranslation: 'Setiap hari pergi ke sekolah.' },

  // — Aksi —
  { id: 'q44', kanji: '見', furigana: 'みる', romaji: 'miru', meaning: 'melihat', level: 'N5', example: '映画を見ます。', exampleTranslation: 'Menonton film.' },
  { id: 'q45', kanji: '行', furigana: 'いく', romaji: 'iku', meaning: 'pergi', level: 'N5', example: '学校に行きます。', exampleTranslation: 'Pergi ke sekolah.' },
  { id: 'q46', kanji: '来', furigana: 'くる', romaji: 'kuru', meaning: 'datang', level: 'N5', example: '友だちが来ます。', exampleTranslation: 'Teman akan datang.' },
  { id: 'q47', kanji: '食', furigana: 'たべる', romaji: 'taberu', meaning: 'makan', level: 'N5', example: 'ご飯を食べます。', exampleTranslation: 'Makan nasi.' },
  { id: 'q48', kanji: '飲', furigana: 'のむ', romaji: 'nomu', meaning: 'minum', level: 'N5', example: 'お茶を飲みます。', exampleTranslation: 'Minum teh.' },
  { id: 'q49', kanji: '読', furigana: 'よむ', romaji: 'yomu', meaning: 'membaca', level: 'N5', example: '本を読みます。', exampleTranslation: 'Membaca buku.' },
  { id: 'q50', kanji: '書', furigana: 'かく', romaji: 'kaku', meaning: 'menulis', level: 'N5', example: '手紙を書きます。', exampleTranslation: 'Menulis surat.' },
]

// Kelompok makna — dipakai untuk memilih distraktor yang nyambung (bukan acak buta).
type Category = 'numbers' | 'time' | 'nature' | 'people' | 'places' | 'actions'
const CATEGORIES: Record<Category, string[]> = {
  numbers: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '百', '千'],
  time: ['日', '月', '年', '時', '分', '今', '午', '半'],
  nature: ['山', '川', '水', '火', '木', '金', '土', '雨'],
  people: ['人', '男', '女', '子', '父', '母', '友', '名'],
  places: ['国', '町', '道', '駅', '店', '田', '校'],
  actions: ['見', '行', '来', '食', '飲', '読', '書'],
}

// Pasangan kanji yang mirip secara visual (prioritas distraktor tersulit).
const CONFUSABLE: Record<string, string[]> = {
  日: ['月', '田', '目'],
  月: ['日', '川'],
  田: ['国', '日', '町'],
  国: ['田'],
  土: ['十'],
  十: ['土', '千'],
  千: ['十', '午'],
  午: ['千', '年'],
  人: ['八', '入'],
  八: ['人', '六'],
  六: ['八'],
  川: ['三', '月'],
  三: ['川', '二'],
  二: ['三'],
  食: ['飲'],
  飲: ['食'],
  読: ['書'],
  書: ['読'],
  水: ['木'],
  木: ['水', '本'],
  見: ['貝'],
  父: ['交'],
  母: ['毎'],
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

function categoryOf(kanji: string): Category | null {
  for (const key of Object.keys(CATEGORIES) as Category[]) {
    if (CATEGORIES[key].includes(kanji)) return key
  }
  return null
}

/**
 * Pilih `count` distraktor untuk sebuah kanji target dari pool selevel.
 * Prioritas: (1) mirip visual, (2) satu kelompok makna, (3) fallback selevel.
 * Tidak pernah acak buta — selalu relevan & menantang.
 */
export function getDistractors(
  target: QuizKanji,
  pool: QuizKanji[] = quizKanji,
  count = 3,
): QuizKanji[] {
  const byKanji = new Map(pool.map((k) => [k.kanji, k]))
  const sameLevel = pool.filter((k) => k.level === target.level && k.kanji !== target.kanji)

  const picked: QuizKanji[] = []
  const seen = new Set<string>([target.kanji])

  const add = (kanji: string) => {
    if (picked.length >= count || seen.has(kanji)) return
    const entry = byKanji.get(kanji)
    if (entry && entry.level === target.level) {
      picked.push(entry)
      seen.add(kanji)
    }
  }

  // 1) mirip visual
  for (const k of shuffle(CONFUSABLE[target.kanji] ?? [])) add(k)

  // 2) satu kelompok makna
  const cat = categoryOf(target.kanji)
  if (cat) for (const k of shuffle(CATEGORIES[cat])) add(k)

  // 3) fallback: selevel mana saja
  for (const k of shuffle(sameLevel)) add(k.kanji)

  return picked.slice(0, count)
}

/** Acak urutan opsi (target + distraktor) untuk satu soal. */
export function buildOptions(target: QuizKanji, pool: QuizKanji[] = quizKanji): QuizKanji[] {
  return shuffle([target, ...getDistractors(target, pool)])
}

/** Ambil `n` kanji acak untuk satu sesi kuis. */
export function pickQuizSet(n = 10, pool: QuizKanji[] = quizKanji): QuizKanji[] {
  return shuffle(pool).slice(0, Math.min(n, pool.length))
}
