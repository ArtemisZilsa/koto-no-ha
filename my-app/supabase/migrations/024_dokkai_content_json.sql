-- ============================================================
-- Koto no Ha — Dokkai: kolom konten terstruktur
-- ============================================================
-- Tabel public.dokkai_passages sudah dibuat di 001_initial_schema.sql.
-- Migrasi ini menambah:
--   content_json : array kalimat agar tiap kalimat memenuhi aturan konten
--                  (kanji + furigana + romaji + terjemahan Indonesia).
--                  Bentuk: [{ "jp": "...", "furigana": "...", "romaji": "...", "id": "..." }]
--   order_index  : urutan tampil bacaan dalam satu level.
-- Idempoten: IF NOT EXISTS.
-- ============================================================

ALTER TABLE public.dokkai_passages
  ADD COLUMN IF NOT EXISTS content_json JSONB;

ALTER TABLE public.dokkai_passages
  ADD COLUMN IF NOT EXISTS order_index INT NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS idx_dokkai_level_order
  ON public.dokkai_passages(level_id, order_index);
