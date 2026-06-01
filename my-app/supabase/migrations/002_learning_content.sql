-- ============================================================
-- Koto no Ha — Learning Content Tables (vocab + kanji)
-- Run this AFTER 001_initial_schema.sql in Supabase SQL Editor
-- ============================================================

-- ─── KOSAKATA (Vocabulary) ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.vocab (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id         INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  word             TEXT NOT NULL,              -- 食べる
  hiragana         TEXT NOT NULL,              -- たべる
  romaji           TEXT NOT NULL,              -- taberu
  meaning          TEXT NOT NULL,              -- makan
  part_of_speech   TEXT NOT NULL,              -- "Kata kerja golongan 2 (Ichidan)"
  usage_id         TEXT NOT NULL,              -- penjelasan penggunaan (Indonesia)
  usage_jp         TEXT,                       -- penjelasan dalam Jepang (opsional)
  full_meaning     TEXT NOT NULL,              -- makna lengkap (Indonesia)
  example_sentence TEXT NOT NULL,              -- ご飯を食べる
  example_hiragana TEXT NOT NULL,              -- ごはんをたべる
  example_meaning  TEXT NOT NULL,              -- Makan nasi
  order_index      INT  NOT NULL DEFAULT 0,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_vocab_level ON public.vocab(level_id, order_index);
CREATE INDEX IF NOT EXISTS idx_vocab_search ON public.vocab USING GIN (
  to_tsvector('simple', word || ' ' || hiragana || ' ' || meaning)
);

-- ─── KANJI ─────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.kanji (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id      INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  kanji         TEXT NOT NULL,                 -- 日
  hiragana      TEXT NOT NULL,                 -- にち・じつ
  romaji        TEXT NOT NULL,                 -- nichi / jitsu
  meaning       TEXT NOT NULL,                 -- hari, matahari
  hint          TEXT NOT NULL,                 -- mnemonic (Indonesia)
  stroke_count  INT  NOT NULL,
  examples      JSONB NOT NULL,                -- [{kanji, hiragana, meaning}, ...]
  order_index   INT  NOT NULL DEFAULT 0,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_kanji_level ON public.kanji(level_id, order_index);
CREATE INDEX IF NOT EXISTS idx_kanji_search ON public.kanji USING GIN (
  to_tsvector('simple', kanji || ' ' || hiragana || ' ' || meaning)
);

-- ─── ROW LEVEL SECURITY — public read ─────────────────────────────────────
ALTER TABLE public.vocab ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.kanji ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "vocab_public_read" ON public.vocab;
CREATE POLICY "vocab_public_read" ON public.vocab FOR SELECT USING (true);

DROP POLICY IF EXISTS "kanji_public_read" ON public.kanji;
CREATE POLICY "kanji_public_read" ON public.kanji FOR SELECT USING (true);

-- ─── DONE ──────────────────────────────────────────────────────────────────
-- Setelah migration ini berhasil, jalankan:
--   003_seed_vocab.sql  — 1000 kosakata
--   004_seed_kanji.sql  — 1000 kanji
