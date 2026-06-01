-- ============================================================
-- Koto no Ha — Perbaikan bug duplikat kanji N2 & N1
-- Seed 004_seed_kanji.sql tidak idempoten (baris DELETE-nya
-- di-komentar) dan tidak sengaja dijalankan 2x untuk
-- level N2 (id=4) & N1 (id=5): 500 baris = 250 kanji unik x2.
-- Migration ini menghapus baris ganda (sisakan 1 per kanji)
-- lalu memasang unique index agar tak terulang.
-- Pola sama persis dengan 005_dedup_vocab.sql.
-- Jalankan SETELAH 004_seed_kanji.sql.
-- ============================================================

-- ─── 1. Hapus baris duplikat (sisakan ctid terkecil per level+kanji) ─────────
DELETE FROM public.kanji a
USING public.kanji b
WHERE a.ctid < b.ctid
  AND a.level_id = b.level_id
  AND a.kanji    = b.kanji
  AND a.level_id IN (4, 5);

-- ─── 2. Cegah duplikasi di masa depan (juga arbiter ON CONFLICT di 015) ──────
CREATE UNIQUE INDEX IF NOT EXISTS uniq_kanji_level_kanji
  ON public.kanji (level_id, kanji);

-- ─── DONE ────────────────────────────────────────────────────────────────────
-- Verifikasi: SELECT level_id, count(*) FROM public.kanji GROUP BY 1 ORDER BY 1;
-- Harapan setelah dedup: N5=103, N4=170, N3=194, N2=250, N1=250.
