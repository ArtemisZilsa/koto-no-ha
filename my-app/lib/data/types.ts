// ─── Shared content types for N5/N4/N3 learning data ─────────────────────────

export type JLPTLevel = 'N5' | 'N4' | 'N3' | 'N2' | 'N1'

export interface KanjiExample {
  kanji: string      // 今日
  hiragana: string   // きょう
  meaning: string    // hari ini
}

export interface KanjiEntry {
  id?: string             // dari DB (opsional untuk legacy data)
  kanji: string           // 日
  hiragana: string        // にち・じつ
  romaji: string          // nichi / jitsu
  meaning: string         // Hari, Matahari
  hint: string            // Mnemonic / cara ingat dalam Bahasa Indonesia
  examples: KanjiExample[]
  strokeCount: number
  jlptLevel: JLPTLevel
}

export interface VocabExample {
  sentence: string   // ご飯を食べる
  hiragana: string   // ごはんをたべる
  meaning: string    // Makan nasi
}

export interface VocabEntry {
  id?: string             // dari DB (opsional untuk legacy data)
  word: string            // 食べる
  hiragana: string        // たべる
  romaji: string          // taberu
  meaning: string         // makan
  partOfSpeech: string    // "Kata kerja golongan 2 (Ichidan)"
  usage?: string          // Penjelasan penggunaan (Bahasa Indonesia)
  usageJp?: string        // Penjelasan dalam Bahasa Jepang (opsional)
  fullMeaning?: string    // Makna lengkap (Bahasa Indonesia)
  examples: VocabExample[]
}

export interface GrammarExample {
  sentence: string   // 私は学生です
  hiragana: string   // わたしはがくせいです
  meaning: string    // Saya adalah pelajar
}

export interface GrammarEntry {
  pattern: string        // ～は～です
  reading: string        // ~wa ~desu
  meaning: string        // ~ adalah ~
  explanation: string    // Penjelasan penggunaan dalam Bahasa Indonesia
  examples: GrammarExample[]
  level: JLPTLevel
  tags: string[]         // ['copula', 'basic']
}

export interface LevelData {
  level: JLPTLevel
  name: string           // Dasar / Pemula / Menengah
  subtitle: string       // Fondasi Bahasa Jepang
  bgKanji: string        // 学
  accentColor: string    // var(--red)
  accentBg: string       // var(--red-bg)
  kanji: KanjiEntry[]
  vocab: VocabEntry[]
  grammar: GrammarEntry[]
}
