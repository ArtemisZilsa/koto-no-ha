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
  text: string
  trans: string
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

export interface DokkaPassage {
  id: string
  level_id: number
  title: string
  text_content: string
  vocab_notes: Json | null
  questions: Json | null
  source: string | null
  is_premium: boolean
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
    }
  }
}
