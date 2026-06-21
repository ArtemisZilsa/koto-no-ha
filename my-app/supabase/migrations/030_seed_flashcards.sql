-- Seed kartu hafalan (SRS) dari konten vocab & kanji yang sudah ada.
-- Idempotent: hanya mengisi bila tabel flashcards masih kosong.
-- Target ±250 kartu: 30 vocab + 20 kanji per level N5..N1 (level_id 1..5).

INSERT INTO public.flashcards (level_id, card_type, front, back, reading, example_sentence)
SELECT level_id, 'vocab'::card_type_enum, word, meaning, hiragana, example_sentence
FROM (
  SELECT
    v.level_id,
    v.word,
    v.meaning,
    v.hiragana,
    v.example_sentence,
    row_number() OVER (PARTITION BY v.level_id ORDER BY v.order_index) AS rn
  FROM public.vocab v
  WHERE v.level_id BETWEEN 1 AND 5
) ranked
WHERE rn <= 30
  AND NOT EXISTS (SELECT 1 FROM public.flashcards);

INSERT INTO public.flashcards (level_id, card_type, front, back, reading, example_sentence)
SELECT level_id, 'kanji'::card_type_enum, kanji, meaning, hiragana, example_sentence
FROM (
  SELECT
    k.level_id,
    k.kanji,
    k.meaning,
    k.hiragana,
    CASE
      WHEN jsonb_array_length(coalesce(k.examples, '[]'::jsonb)) > 0
        THEN (k.examples->0->>'kanji') || '（' || (k.examples->0->>'hiragana') || '）'
      ELSE NULL
    END AS example_sentence,
    row_number() OVER (PARTITION BY k.level_id ORDER BY k.order_index) AS rn
  FROM public.kanji k
  WHERE k.level_id BETWEEN 1 AND 5
) ranked
WHERE rn <= 20
  -- guard: hanya seed kanji bila belum ada satu pun kartu kanji (tetap idempotent
  -- meski vocab sudah terisi di statement sebelumnya pada run yang sama).
  AND NOT EXISTS (SELECT 1 FROM public.flashcards WHERE card_type = 'kanji');
</content>
