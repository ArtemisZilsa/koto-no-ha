-- ============================================================
-- Koto no Ha — Perbaikan bug duplikat vocab N5 & N4
-- Seed 003_seed_vocab.sql tidak sengaja dijalankan 2x untuk
-- level N5 (id=1) & N4 (id=2): 400 baris = 200 kata unik x2.
-- Migration ini menghapus baris ganda (sisakan 1 per kata)
-- lalu memasang unique index agar tak terulang.
-- Jalankan SETELAH 003_seed_vocab.sql.
-- ============================================================

-- ─── 1. Hapus baris duplikat (sisakan ctid terkecil per level+word) ──────────
DELETE FROM public.vocab a
USING public.vocab b
WHERE a.ctid < b.ctid
  AND a.level_id = b.level_id
  AND a.word     = b.word
  AND a.level_id IN (1, 2);

-- ─── 2. Cegah duplikasi di masa depan ────────────────────────────────────────
CREATE UNIQUE INDEX IF NOT EXISTS uniq_vocab_level_word
  ON public.vocab (level_id, word);

-- ─── DONE ────────────────────────────────────────────────────────────────────
-- Verifikasi: SELECT level_id, count(*) FROM public.vocab GROUP BY 1 ORDER BY 1;
-- Harapan setelah dedup: N5=200, N4=200, N3=200, N2=200, N1=200.
