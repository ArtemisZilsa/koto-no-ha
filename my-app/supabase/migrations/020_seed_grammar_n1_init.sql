-- ============================================================
-- Koto no Ha — Seed Grammar N1 (3 Pola Tata Bahasa Awal)
-- Level: N1 (level_id=5)
-- Jalankan SETELAH 008_grammar_table.sql
-- Idempoten: ON CONFLICT DO NOTHING
-- ============================================================

INSERT INTO public.grammar (level_id, pattern, reading, meaning, explanation, tags, examples, order_index) VALUES
(5, '～にほかならない', '~ni hoka naranai', 'Tidak lain adalah ~, Tak bukan ~', 'Menyatakan dengan tegas bahwa sesuatu adalah identitas, alasan, atau kesimpulan yang pasti dan tidak dapat dibantah. Lebih formal dan lebih kuat dari ～だ biasa.', ARRAY['penegasan','formal','identitas']::text[], '[{"sentence":"彼が成功したのは、絶え間ない努力にほかならない。","hiragana":"かれがせいこうしたのは、たえまないどりょくにほかならない。","meaning":"Alasan dia sukses tidak lain adalah kerja keras yang tiada henti."},{"sentence":"この政策は国民を守るためにほかならない。","hiragana":"このせいさくはこくみんをまもるためにほかならない。","meaning":"Kebijakan ini tidak lain adalah demi melindungi rakyat."}]'::jsonb, 1),
(5, '～とはいえ', '~to wa ie', 'Meskipun begitu ~, Walaupun memang benar ~', 'Mengakui suatu fakta atau pernyataan namun langsung menambahkan pengecualian atau kontras. Dipakai dalam konteks formal dan tulisan. Mirip ～けれども namun lebih elegan dan literatur.', ARRAY['kontras','pengakuan','formal']::text[], '[{"sentence":"春とはいえ、まだ朝晩は寒い。","hiragana":"はるとはいえ、まだあさばんはさむい。","meaning":"Meskipun memang sudah musim semi, pagi dan malam masih dingin."},{"sentence":"ベテランとはいえ、ミスをすることもある。","hiragana":"べてらんとはいえ、ミスをすることもある。","meaning":"Meskipun memang sudah berpengalaman, tetap bisa saja membuat kesalahan."}]'::jsonb, 2),
(5, '～べく', '~beku', 'Demi ~, Untuk (tujuan) ~', 'Bentuk formal dan sastra dari ～ために yang menyatakan tujuan atau maksud tindakan. Dipakai dalam tulisan resmi, berita, dan literatur. Hanya diikuti kata kerja bentuk kamus, kecuali する yang menjadi すべく.', ARRAY['tujuan','formal','sastra']::text[], '[{"sentence":"夢を叶えるべく、毎日努力しています。","hiragana":"ゆめをかなえるべく、まいにちどりょくしています。","meaning":"Demi mewujudkan mimpi, saya berusaha setiap hari."},{"sentence":"問題を解決すべく、緊急会議が開かれた。","hiragana":"もんだいをかいけつすべく、きんきゅうかいぎがひらかれた。","meaning":"Demi menyelesaikan masalah, rapat darurat diadakan."}]'::jsonb, 3)
ON CONFLICT (level_id, pattern) DO NOTHING;
