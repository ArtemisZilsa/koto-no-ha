-- ============================================================
-- Koto no Ha — Tabel Grammar (pola tata bahasa)
-- Sebelumnya grammar hanya ada di file TS legacy. Tabel ini
-- memindahkannya ke DB agar konsisten dengan vocab & kanji.
-- Jalankan SETELAH 002_learning_content.sql.
-- ============================================================

CREATE TABLE IF NOT EXISTS public.grammar (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  level_id     INT  NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  pattern      TEXT NOT NULL,                 -- ～は～です
  reading      TEXT NOT NULL,                 -- ~wa ~desu
  meaning      TEXT NOT NULL,                 -- ~ adalah ~
  explanation  TEXT NOT NULL,                 -- penjelasan (Indonesia)
  tags         TEXT[] NOT NULL DEFAULT '{}',  -- ['copula','basic']
  examples     JSONB NOT NULL,                -- [{sentence, hiragana, meaning}, ...]
  order_index  INT  NOT NULL DEFAULT 0,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_grammar_level ON public.grammar(level_id, order_index);
-- Cegah double-seed (seperti yang sempat terjadi pada vocab)
CREATE UNIQUE INDEX IF NOT EXISTS uniq_grammar_level_pattern ON public.grammar(level_id, pattern);

ALTER TABLE public.grammar ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "grammar_public_read" ON public.grammar;
CREATE POLICY "grammar_public_read" ON public.grammar FOR SELECT USING (true);
