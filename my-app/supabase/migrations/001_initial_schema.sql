-- ============================================================
-- Koto no Ha — Initial Schema Migration
-- Run this in Supabase SQL Editor
-- ============================================================

-- ─── Extensions ───────────────────────────────────────────────────────────────
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ─── Enum Types ───────────────────────────────────────────────────────────────

CREATE TYPE card_type_enum     AS ENUM ('kanji', 'vocab', 'grammar');
CREATE TYPE lesson_type_enum   AS ENUM ('grammar', 'vocab', 'kanji', 'choukai', 'dokkai');
CREATE TYPE question_type_enum AS ENUM ('grammar', 'vocab', 'kanji', 'choukai', 'dokkai');
CREATE TYPE skill_type_enum    AS ENUM ('kanji', 'bunpo', 'dokkai', 'choukai');
CREATE TYPE kaiwa_cat_enum     AS ENUM ('daily', 'work', 'biz', 'kaigo');

-- ─── CORE: levels ─────────────────────────────────────────────────────────────

CREATE TABLE public.levels (
  id          SERIAL PRIMARY KEY,
  code        TEXT NOT NULL UNIQUE, -- N5, N4, N3, N2, N1, SSW, BIZ
  name        TEXT NOT NULL,
  description TEXT,
  order_index INT  NOT NULL DEFAULT 0,
  is_active   BOOL NOT NULL DEFAULT true
);

-- Seed levels
INSERT INTO public.levels (code, name, description, order_index) VALUES
  ('N5',  'Dasar',         'JLPT N5 — tingkat paling dasar',              1),
  ('N4',  'Pemula',        'JLPT N4 — pemula menengah',                   2),
  ('N3',  'Menengah',      'JLPT N3 — tingkat menengah',                  3),
  ('N2',  'Lanjutan',      'JLPT N2 — lanjutan',                          4),
  ('N1',  'Mahir',         'JLPT N1 — tingkat tertinggi',                 5),
  ('SSW', 'Tokutei Ginou', 'Specified Skilled Worker — visa kerja Jepang',6),
  ('BIZ', 'Bisnis',        'Bahasa Jepang tingkat bisnis formal',          7);

-- ─── AUTH: profiles ───────────────────────────────────────────────────────────

CREATE TABLE public.profiles (
  id               UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username         TEXT UNIQUE,
  full_name        TEXT,
  avatar_url       TEXT,
  current_level_id INT  REFERENCES public.levels(id),
  streak_days      INT  NOT NULL DEFAULT 0,
  total_xp         INT  NOT NULL DEFAULT 0,
  is_premium       BOOL NOT NULL DEFAULT false,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Auto-create profile on new user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.profiles (id, username, current_level_id)
  VALUES (
    new.id,
    split_part(new.email, '@', 1),
    1 -- default to N5
  );
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ─── CORE: lessons ────────────────────────────────────────────────────────────

CREATE TABLE public.lessons (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id    INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  title       TEXT NOT NULL,
  lesson_type lesson_type_enum NOT NULL,
  order_index INT  NOT NULL DEFAULT 0,
  video_url   TEXT,
  is_premium  BOOL NOT NULL DEFAULT false,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ─── CONTENT: flashcards ──────────────────────────────────────────────────────

CREATE TABLE public.flashcards (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id         INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  card_type        card_type_enum NOT NULL,
  front            TEXT NOT NULL,
  back             TEXT NOT NULL,
  reading          TEXT,           -- furigana
  example_sentence TEXT,
  audio_url        TEXT
);

-- ─── TRACKING: user_flashcard_progress ───────────────────────────────────────

CREATE TABLE public.user_flashcard_progress (
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id        UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  flashcard_id   UUID NOT NULL REFERENCES public.flashcards(id) ON DELETE CASCADE,
  interval_days  INT  NOT NULL DEFAULT 1,    -- SRS interval
  ease_factor    FLOAT NOT NULL DEFAULT 2.5, -- SRS ease
  next_review_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  review_count   INT  NOT NULL DEFAULT 0,
  last_reviewed_at TIMESTAMPTZ,
  UNIQUE(user_id, flashcard_id)
);

-- ─── CONTENT: quiz_questions ──────────────────────────────────────────────────

CREATE TABLE public.quiz_questions (
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id       INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  lesson_id      UUID REFERENCES public.lessons(id) ON DELETE SET NULL, -- nullable
  question_type  question_type_enum NOT NULL,
  question_text  TEXT NOT NULL,
  options        JSONB NOT NULL, -- array of 4 strings
  correct_answer INT  NOT NULL CHECK (correct_answer BETWEEN 0 AND 3),
  explanation    TEXT,
  audio_url      TEXT             -- for choukai (listening) questions
);

-- ─── TRACKING: quiz_results ───────────────────────────────────────────────────

CREATE TABLE public.quiz_results (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  question_id  UUID NOT NULL REFERENCES public.quiz_questions(id) ON DELETE CASCADE,
  is_correct   BOOL NOT NULL,
  answered_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  time_taken_ms INT
);

-- ─── CONTENT: kaiwa_stories ───────────────────────────────────────────────────

CREATE TABLE public.kaiwa_stories (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id        INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  title           TEXT NOT NULL,
  category        kaiwa_cat_enum NOT NULL DEFAULT 'daily',
  lines           JSONB NOT NULL, -- [{speaker, text, trans, audio?}]
  vocab_highlight JSONB,          -- [{word, reading, meaning}]
  is_premium      BOOL NOT NULL DEFAULT false
);

-- ─── CONTENT: dokkai_passages ─────────────────────────────────────────────────

CREATE TABLE public.dokkai_passages (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id     INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  title        TEXT NOT NULL,
  text_content TEXT NOT NULL,
  vocab_notes  JSONB,  -- [{word, reading, meaning}]
  questions    JSONB,  -- [{question, options, correct_answer, explanation}]
  source       TEXT,
  is_premium   BOOL NOT NULL DEFAULT false
);

-- ─── TRACKING: user_progress ──────────────────────────────────────────────────

CREATE TABLE public.user_progress (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id          UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  level_id         INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  skill_type       skill_type_enum NOT NULL,
  progress_pct     FLOAT NOT NULL DEFAULT 0,
  items_studied    INT   NOT NULL DEFAULT 0,
  items_mastered   INT   NOT NULL DEFAULT 0,
  last_activity_at TIMESTAMPTZ,
  UNIQUE(user_id, level_id, skill_type)
);

-- ─── CONTENT: news_articles ───────────────────────────────────────────────────

CREATE TABLE public.news_articles (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title_jp     TEXT NOT NULL,
  title_id     TEXT,             -- Indonesian translation
  content_jp   TEXT NOT NULL,
  category     TEXT,
  level_tag_id INT  REFERENCES public.levels(id) ON DELETE SET NULL, -- nullable
  source_url   TEXT,
  published_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  cached_at    TIMESTAMPTZ
);

-- ─── CONTENT: visa_info ───────────────────────────────────────────────────────

CREATE TABLE public.visa_info (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  visa_type    TEXT NOT NULL, -- 'SSW', 'TG', 'GK', etc
  title        TEXT NOT NULL,
  description  TEXT,
  requirements JSONB,         -- [{item: string}]
  language_req TEXT,          -- 'N4', 'N3', etc
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Seed visa info
INSERT INTO public.visa_info (visa_type, title, description, requirements, language_req) VALUES
(
  'SSW',
  'Specified Skilled Worker (特定技能1号)',
  'Visa kerja untuk sektor tertentu yang membutuhkan keahlian teknis dan kemampuan bahasa Jepang minimum N4.',
  '[
    {"item": "Syarat JLPT N4 atau ujian bahasa sektoral"},
    {"item": "14 sektor industri tersedia"},
    {"item": "Durasi visa hingga 5 tahun (SSW1)"},
    {"item": "Ujian keterampilan sektoral wajib"},
    {"item": "Tidak dapat membawa keluarga"}
  ]'::jsonb,
  'N4'
),
(
  'TG',
  'Tokutei Ginou 2 (特定技能2号)',
  'Perpanjangan SSW dengan hak membawa keluarga dan durasi tidak terbatas.',
  '[
    {"item": "Bawa keluarga diizinkan"},
    {"item": "Perpanjangan indefinite"},
    {"item": "Syarat keahlian lebih tinggi dari SSW1"},
    {"item": "Jalur menuju PR (Permanent Resident)"}
  ]'::jsonb,
  'N3'
),
(
  'GK',
  'Gijutsu · Jinbunchishiki (技術・人文知識)',
  'Visa untuk insinyur, spesialis IT, dan tenaga ahli dengan kualifikasi profesional atau gelar sarjana.',
  '[
    {"item": "Cocok untuk lulusan IT / Teknik / Bisnis"},
    {"item": "Tidak ada batasan sektor khusus"},
    {"item": "Dapat diperpanjang terus-menerus"},
    {"item": "Syarat bahasa lebih fleksibel"},
    {"item": "Perlu kontrak kerja dengan perusahaan Jepang"}
  ]'::jsonb,
  'N3'
);

-- ─── Row Level Security ───────────────────────────────────────────────────────

-- Enable RLS on all tables
ALTER TABLE public.profiles               ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.levels                 ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lessons                ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.flashcards             ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_flashcard_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_questions         ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_results           ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.kaiwa_stories          ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.dokkai_passages        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_progress          ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.news_articles          ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.visa_info              ENABLE ROW LEVEL SECURITY;

-- profiles: users can only view/edit their own row
CREATE POLICY "Users can view own profile"
  ON public.profiles FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
  ON public.profiles FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Public content: anyone can read
CREATE POLICY "Public read levels"
  ON public.levels FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read lessons"
  ON public.lessons FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read flashcards"
  ON public.flashcards FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read quiz_questions"
  ON public.quiz_questions FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read kaiwa_stories"
  ON public.kaiwa_stories FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read dokkai_passages"
  ON public.dokkai_passages FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read news_articles"
  ON public.news_articles FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Public read visa_info"
  ON public.visa_info FOR SELECT TO anon, authenticated USING (true);

-- Tracking tables: users manage their own data only
CREATE POLICY "Users manage own flashcard progress"
  ON public.user_flashcard_progress FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users manage own quiz results"
  ON public.quiz_results FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users manage own progress"
  ON public.user_progress FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ─── Indexes for performance ──────────────────────────────────────────────────

CREATE INDEX idx_lessons_level_id              ON public.lessons(level_id);
CREATE INDEX idx_flashcards_level_id           ON public.flashcards(level_id);
CREATE INDEX idx_ufp_user_id                   ON public.user_flashcard_progress(user_id);
CREATE INDEX idx_ufp_next_review               ON public.user_flashcard_progress(next_review_at);
CREATE INDEX idx_quiz_questions_level_id       ON public.quiz_questions(level_id);
CREATE INDEX idx_quiz_results_user_id          ON public.quiz_results(user_id);
CREATE INDEX idx_kaiwa_level_id                ON public.kaiwa_stories(level_id);
CREATE INDEX idx_dokkai_level_id               ON public.dokkai_passages(level_id);
CREATE INDEX idx_user_progress_user_id         ON public.user_progress(user_id);
CREATE INDEX idx_news_published_at             ON public.news_articles(published_at DESC);
CREATE INDEX idx_news_level_tag                ON public.news_articles(level_tag_id);
