export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

// ─── Enum Types ───────────────────────────────────────────────────────────────

export type CardType = 'kanji' | 'vocab' | 'grammar'
export type LessonType = 'grammar' | 'vocab' | 'kanji' | 'choukai' | 'dokkai'
export type QuestionType = 'grammar' | 'vocab' | 'kanji' | 'choukai' | 'dokkai'
export type SkillType = 'kanji' | 'bunpo' | 'dokkai' | 'choukai'
export type VisaType = 'SSW' | 'TG' | 'GK'
export type KaiwaCategory = 'daily' | 'work' | 'biz' | 'kaigo'
export type LevelCode = 'N5' | 'N4' | 'N3' | 'N2' | 'N1' | 'SSW' | 'BIZ'

// ─── Table Row Types ──────────────────────────────────────────────────────────

export interface Profile {
  id: string
  username: string | null
  full_name: string | null
  avatar_url: string | null
  current_level_id: number | null
  streak_days: number
  total_xp: number
  is_premium: boolean
  created_at: string
  last_active_date: string | null
}

export interface UserItemProgress {
  id: string
  user_id: string
  item_type: 'vocab' | 'kanji'
  item_id: string
  known_at: string
}

export interface Level {
  id: number
  code: LevelCode
  name: string
  description: string | null
  order_index: number
  is_active: boolean
}

export interface Lesson {
  id: string
  level_id: number
  title: string
  lesson_type: LessonType
  order_index: number
  video_url: string | null
  is_premium: boolean
  created_at: string
}

export interface Flashcard {
  id: string
  level_id: number
  card_type: CardType
  front: string
  back: string
  reading: string | null
  example_sentence: string | null
  audio_url: string | null
}

export interface UserFlashcardProgress {
  id: string
  user_id: string
  flashcard_id: string
  interval_days: number
  ease_factor: number
  next_review_at: string
  review_count: number
  last_reviewed_at: string | null
}

export interface QuizQuestion {
  id: string
  level_id: number
  lesson_id: string | null
  question_type: QuestionType
  question_text: string
  options: Json // array[4] of strings
  correct_answer: number // index 0-3
  explanation: string | null
  audio_url: string | null
}

export interface QuizResult {
  id: string
  user_id: string
  question_id: string
  is_correct: boolean
  answered_at: string
  time_taken_ms: number | null
}

export interface KaiwaLine {
  speaker: string
  text: string        // teks Jepang
  reading?: string    // cara baca hiragana penuh
  romaji?: string     // cara baca romaji
  trans: string       // terjemahan Indonesia
  audio?: string
}

export interface KaiwaStory {
  id: string
  level_id: number
  title: string
  category: KaiwaCategory
  lines: KaiwaLine[]
  vocab_highlight: Json | null
  is_premium: boolean
}

/** Satu kalimat bacaan dokkai — memenuhi aturan konten (kanji+furigana+romaji+terjemahan). */
export interface DokkaiSentence {
  jp: string        // teks Jepang (mengandung kanji)
  furigana: string  // cara baca penuh (hiragana)
  romaji: string    // cara baca romaji
  id: string        // terjemahan Bahasa Indonesia
}

/** Catatan kosakata penting pada bacaan dokkai. */
export interface DokkaiVocabNote {
  word: string
  reading: string
  romaji: string
  meaning: string   // arti Bahasa Indonesia
}

/** Soal pemahaman pilihan ganda untuk satu bacaan dokkai. */
export interface DokkaiQuestion {
  q: string            // pertanyaan (Bahasa Indonesia; boleh mengutip kalimat Jepang)
  options: string[]    // 4 pilihan
  answer: number       // index jawaban benar (0-3)
  explanation: string  // penjelasan (Bahasa Indonesia)
}

export interface DokkaPassage {
  id: string
  level_id: number
  title: string
  text_content: string
  content_json: DokkaiSentence[] | null
  vocab_notes: Json | null
  questions: Json | null
  source: string | null
  is_premium: boolean
  order_index: number
}

export interface UserProgress {
  id: string
  user_id: string
  level_id: number
  skill_type: SkillType
  progress_pct: number
  items_studied: number
  items_mastered: number
  last_activity_at: string | null
}

export interface NewsArticle {
  id: string
  title_jp: string
  title_id: string | null
  content_jp: string
  category: string | null
  level_tag_id: number | null
  source_url: string | null
  published_at: string
  cached_at: string | null
}

export interface VisaInfo {
  id: string
  visa_type: string // 'SSW' | 'TG' | 'GK' | etc
  title: string
  description: string | null
  requirements: Json | null
  language_req: string | null // 'N4', 'N3', etc
  updated_at: string
}

// ─── Learning Content (migration 002) ────────────────────────────────────────

export interface Vocab {
  id: string
  level_id: number
  word: string
  hiragana: string
  romaji: string
  meaning: string
  part_of_speech: string
  usage_id: string
  usage_jp: string | null
  full_meaning: string
  example_sentence: string
  example_hiragana: string
  example_meaning: string
  order_index: number
  /** Sub-bidang untuk vocab non-JLPT (mis. SSW: 'kaigo'). NULL untuk N5..N1. */
  field: string | null
  created_at: string
}

export interface KanjiExampleJson {
  kanji: string
  hiragana: string
  meaning: string
}

export interface Kanji {
  id: string
  level_id: number
  kanji: string
  hiragana: string
  romaji: string
  meaning: string
  hint: string
  stroke_count: number
  examples: KanjiExampleJson[]
  order_index: number
  created_at: string
}

export interface GrammarExampleJson {
  sentence: string
  hiragana: string
  meaning: string
}

export interface Grammar {
  id: string
  level_id: number
  pattern: string
  reading: string
  meaning: string
  explanation: string
  tags: string[]
  examples: GrammarExampleJson[]
  order_index: number
  created_at: string
}

// ─── Database Schema Type ─────────────────────────────────────────────────────

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: Profile
        Insert: Omit<Profile, 'streak_days' | 'total_xp' | 'is_premium' | 'created_at'> &
          Partial<Pick<Profile, 'streak_days' | 'total_xp' | 'is_premium' | 'created_at'>>
        Update: Partial<Omit<Profile, 'id'>>
      }
      levels: {
        Row: Level
        Insert: Omit<Level, 'id'>
        Update: Partial<Omit<Level, 'id'>>
      }
      lessons: {
        Row: Lesson
        Insert: Omit<Lesson, 'id' | 'created_at'> & Partial<Pick<Lesson, 'id' | 'created_at'>>
        Update: Partial<Omit<Lesson, 'id'>>
      }
      flashcards: {
        Row: Flashcard
        Insert: Omit<Flashcard, 'id'> & Partial<Pick<Flashcard, 'id'>>
        Update: Partial<Omit<Flashcard, 'id'>>
      }
      user_flashcard_progress: {
        Row: UserFlashcardProgress
        Insert: Omit<UserFlashcardProgress, 'id'> & Partial<Pick<UserFlashcardProgress, 'id'>>
        Update: Partial<Omit<UserFlashcardProgress, 'id'>>
      }
      quiz_questions: {
        Row: QuizQuestion
        Insert: Omit<QuizQuestion, 'id'> & Partial<Pick<QuizQuestion, 'id'>>
        Update: Partial<Omit<QuizQuestion, 'id'>>
      }
      quiz_results: {
        Row: QuizResult
        Insert: Omit<QuizResult, 'id' | 'answered_at'> & Partial<Pick<QuizResult, 'id' | 'answered_at'>>
        Update: Partial<Omit<QuizResult, 'id'>>
      }
      kaiwa_stories: {
        Row: KaiwaStory
        Insert: Omit<KaiwaStory, 'id'> & Partial<Pick<KaiwaStory, 'id'>>
        Update: Partial<Omit<KaiwaStory, 'id'>>
      }
      dokkai_passages: {
        Row: DokkaPassage
        Insert: Omit<DokkaPassage, 'id'> & Partial<Pick<DokkaPassage, 'id'>>
        Update: Partial<Omit<DokkaPassage, 'id'>>
      }
      user_progress: {
        Row: UserProgress
        Insert: Omit<UserProgress, 'id'> & Partial<Pick<UserProgress, 'id'>>
        Update: Partial<Omit<UserProgress, 'id'>>
      }
      news_articles: {
        Row: NewsArticle
        Insert: Omit<NewsArticle, 'id'> & Partial<Pick<NewsArticle, 'id'>>
        Update: Partial<Omit<NewsArticle, 'id'>>
      }
      visa_info: {
        Row: VisaInfo
        Insert: Omit<VisaInfo, 'id'> & Partial<Pick<VisaInfo, 'id'>>
        Update: Partial<Omit<VisaInfo, 'id'>>
      }
      vocab: {
        Row: Vocab
        Insert: Omit<Vocab, 'id' | 'created_at'> & Partial<Pick<Vocab, 'id' | 'created_at'>>
        Update: Partial<Omit<Vocab, 'id'>>
      }
      kanji: {
        Row: Kanji
        Insert: Omit<Kanji, 'id' | 'created_at'> & Partial<Pick<Kanji, 'id' | 'created_at'>>
        Update: Partial<Omit<Kanji, 'id'>>
      }
      grammar: {
        Row: Grammar
        Insert: Omit<Grammar, 'id' | 'created_at'> & Partial<Pick<Grammar, 'id' | 'created_at'>>
        Update: Partial<Omit<Grammar, 'id'>>
      }
      user_item_progress: {
        Row: UserItemProgress
        Insert: Omit<UserItemProgress, 'id' | 'known_at'> & Partial<Pick<UserItemProgress, 'id' | 'known_at'>>
        Update: Partial<Omit<UserItemProgress, 'id'>>
      }
    }
    Functions: {
      mark_item_known: {
        Args: { p_item_type: string; p_item_id: string; p_xp?: number }
        Returns: { known: boolean; total_xp: number; streak_days: number }[]
      }
    }
  }
}
