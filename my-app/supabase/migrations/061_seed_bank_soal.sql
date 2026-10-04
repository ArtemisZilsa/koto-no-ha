-- 061: Seed bank soal. DIBUAT OTOMATIS oleh tools/import-bank-soal.py, jangan diedit manual.
-- 2184 soal. Upsert per code: aman dijalankan ulang.
BEGIN;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-0001', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一つ（ひとつ）', '["satu orang", "satu kali", "satu buah", "satu tahun"]'::jsonb, 2, '一つ dibaca ひとつ, artinya "satu buah".', 'makna sekanji', 'belum', 1),
('K5-0002', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一つ', '["ひどつ", "ひとつ", "びとつ", "びどつ"]'::jsonb, 1, '一つ artinya "satu buah", dibaca ひとつ.', 'daku / daku+daku', 'belum', 2),
('K5-0003', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一人（ひとり）', '["satu orang", "satu kali", "satu buah", "satu tahun"]'::jsonb, 0, '一人 dibaca ひとり, artinya "satu orang".', 'makna sekanji', 'belum', 3),
('K5-0004', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一人', '["ひどり", "ひどる", "ひとる", "ひとり"]'::jsonb, 3, '一人 artinya "satu orang", dibaca ひとり.', 'daku / vowel / daku+vowel', 'belum', 4),
('K5-0005', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一月（いちがつ）', '["bulan Juni", "pukul satu", "bulan Januari", "bulan Mei"]'::jsonb, 2, '一月 dibaca いちがつ, artinya "bulan Januari".', 'makna sekanji', 'belum', 5),
('K5-0006', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一月', '["いっちがつ", "おちがつ", "おっちがつ", "いちがつ"]'::jsonb, 3, '一月 artinya "bulan Januari", dibaca いちがつ.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 6),
('K5-0007', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一日（ついたち）', '["tanggal 1", "bersama", "tanggal 10", "bulan Januari"]'::jsonb, 0, '一日 dibaca ついたち, artinya "tanggal 1".', 'makna sekanji', 'belum', 7),
('K5-0008', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一日', '["つうえたち", "ついたち", "つえたち", "つういたち"]'::jsonb, 1, '一日 artinya "tanggal 1", dibaca ついたち.', 'chouon+ / vowel / chouon++vowel', 'belum', 8),
('K5-0009', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一年（いちねん）', '["satu tahun", "satu orang", "satu kali", "satu buah"]'::jsonb, 0, '一年 dibaca いちねん, artinya "satu tahun".', 'makna sekanji', 'belum', 9),
('K5-0010', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一年', '["いっちねん", "あっちねん", "いちねん", "あちねん"]'::jsonb, 2, '一年 artinya "satu tahun", dibaca いちねん.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 10),
('K5-0011', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一番（いちばん）', '["pukul satu", "satu buah", "satu orang", "nomor satu"]'::jsonb, 3, '一番 dibaca いちばん, artinya "nomor satu".', 'makna sekanji', 'belum', 11),
('K5-0012', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一番', '["いっちばん", "いちばん", "うっちばん", "うちばん"]'::jsonb, 1, '一番 artinya "nomor satu", dibaca いちばん.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 12),
('K5-0013', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一時（いちじ）', '["pukul satu", "satu buah", "nomor satu", "satu tahun"]'::jsonb, 0, '一時 dibaca いちじ, artinya "pukul satu".', 'makna sekanji', 'belum', 13),
('K5-0014', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一時', '["うちじ", "うっちじ", "いっちじ", "いちじ"]'::jsonb, 3, '一時 artinya "pukul satu", dibaca いちじ.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 14),
('K5-0015', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一週間（いっしゅうかん）', '["satu orang", "satu minggu", "satu kali", "satu tahun"]'::jsonb, 1, '一週間 dibaca いっしゅうかん, artinya "satu minggu".', 'makna sekanji', 'belum', 15),
('K5-0016', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一週間', '["いしゅうかん", "えっしゅうかん", "いっしゅうかん", "えしゅうかん"]'::jsonb, 2, '一週間 artinya "satu minggu", dibaca いっしゅうかん.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 16),
('K5-0017', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一緒（いっしょ）', '["satu tahun", "bersama", "satu kali", "pukul satu"]'::jsonb, 1, '一緒 dibaca いっしょ, artinya "bersama".', 'makna sekanji', 'belum', 17),
('K5-0018', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一緒', '["いしょ", "あっしょ", "あしょ", "いっしょ"]'::jsonb, 3, '一緒 artinya "bersama", dibaca いっしょ.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 18),
('K5-0019', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一回（いっかい）', '["satu orang", "satu tahun", "satu kali", "satu buah"]'::jsonb, 2, '一回 dibaca いっかい, artinya "satu kali".', 'makna sekanji', 'belum', 19),
('K5-0020', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一回', '["いっかい", "いかい", "あっかい", "あかい"]'::jsonb, 0, '一回 artinya "satu kali", dibaca いっかい.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 20),
('K5-0021', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二つ（ふたつ）', '["dua buah", "dua belas", "dua kali", "dua tahun"]'::jsonb, 0, '二つ dibaca ふたつ, artinya "dua buah".', 'makna sekanji', 'belum', 21),
('K5-0022', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二つ', '["ふたっつ", "ふたつ", "ふだつ", "ふだっつ"]'::jsonb, 1, '二つ artinya "dua buah", dibaca ふたつ.', 'daku / sokuon+ / daku+sokuon+', 'belum', 22),
('K5-0023', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二人（ふたり）', '["dua ribu", "dua belas", "dua orang", "dua kali"]'::jsonb, 2, '二人 dibaca ふたり, artinya "dua orang".', 'makna sekanji', 'belum', 23),
('K5-0024', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二人', '["ふたら", "ふだり", "ふだら", "ふたり"]'::jsonb, 3, '二人 artinya "dua orang", dibaca ふたり.', 'daku / vowel / daku+vowel', 'belum', 24),
('K5-0025', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二月（にがつ）', '["bulan April", "dua tahun", "bulan Februari", "tanggal 2"]'::jsonb, 2, '二月 dibaca にがつ, artinya "bulan Februari".', 'makna sekanji', 'belum', 25),
('K5-0026', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二月', '["ねがつ", "にがつ", "ねかつ", "にかつ"]'::jsonb, 1, '二月 artinya "bulan Februari", dibaca にがつ.', 'vowel / daku / vowel+daku', 'belum', 26),
('K5-0027', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二日（ふつか）', '["tanggal 1", "tanggal 5", "tanggal 7", "tanggal 2"]'::jsonb, 3, '二日 dibaca ふつか, artinya "tanggal 2".', 'makna sekanji', 'belum', 27),
('K5-0028', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二日', '["ふつか", "ふっつか", "ぶっつか", "ぶつか"]'::jsonb, 0, '二日 artinya "tanggal 2", dibaca ふつか.', 'daku / sokuon+ / daku+sokuon+', 'belum', 28),
('K5-0029', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二時（にじ）', '["nomor dua", "dua tahun", "pukul dua", "dua orang"]'::jsonb, 2, '二時 dibaca にじ, artinya "pukul dua".', 'makna sekanji', 'belum', 29),
('K5-0030', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二時', '["なし", "なじ", "にし", "にじ"]'::jsonb, 3, '二時 artinya "pukul dua", dibaca にじ.', 'vowel / daku / vowel+daku', 'belum', 30),
('K5-0031', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二年（にねん）', '["dua tahun", "dua belas", "dua orang", "dua ribu"]'::jsonb, 0, '二年 dibaca にねん, artinya "dua tahun".', 'makna sekanji', 'belum', 31),
('K5-0032', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二年', '["ぬにん", "にねん", "ににん", "ぬねん"]'::jsonb, 1, '二年 artinya "dua tahun", dibaca にねん.', 'vowel / vowel+vowel', 'belum', 32),
('K5-0033', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二回（にかい）', '["dua ribu", "dua belas", "dua kali", "dua buah"]'::jsonb, 2, '二回 dibaca にかい, artinya "dua kali".', 'makna sekanji', 'belum', 33),
('K5-0034', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二回', '["ながい", "にがい", "なかい", "にかい"]'::jsonb, 3, '二回 artinya "dua kali", dibaca にかい.', 'vowel / daku / vowel+daku', 'belum', 34),
('K5-0035', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二番（にばん）', '["nomor dua", "dua belas", "pukul dua", "dua ribu"]'::jsonb, 0, '二番 dibaca にばん, artinya "nomor dua".', 'makna sekanji', 'belum', 35),
('K5-0036', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二番', '["にはん", "にばん", "のばん", "のはん"]'::jsonb, 1, '二番 artinya "nomor dua", dibaca にばん.', 'vowel / daku / vowel+daku', 'belum', 36),
('K5-0037', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二千（にせん）', '["dua tahun", "dua buah", "dua belas", "dua ribu"]'::jsonb, 3, '二千 dibaca にせん, artinya "dua ribu".', 'makna sekanji', 'belum', 37),
('K5-0038', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二千', '["のせん", "にせん", "のぜん", "にぜん"]'::jsonb, 1, '二千 artinya "dua ribu", dibaca にせん.', 'vowel / daku / vowel+daku', 'belum', 38),
('K5-0039', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十二（じゅうに）', '["dua buah", "dua tahun", "dua belas", "dua kali"]'::jsonb, 2, '十二 dibaca じゅうに, artinya "dua belas".', 'makna sekanji', 'belum', 39),
('K5-0040', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十二', '["じゅうに", "しゆうに", "しゅうに", "じゆうに"]'::jsonb, 0, '十二 artinya "dua belas", dibaca じゅうに.', 'daku / youon / daku+youon', 'belum', 40),
('K5-0041', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三つ（みっつ）', '["tiga buah", "tiga kali", "tiga tahun", "tiga orang"]'::jsonb, 0, '三つ dibaca みっつ, artinya "tiga buah".', 'makna sekanji', 'belum', 41),
('K5-0042', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三つ', '["みつ", "むつ", "むっつ", "みっつ"]'::jsonb, 3, '三つ artinya "tiga buah", dibaca みっつ.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 42),
('K5-0043', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三人（さんにん）', '["tiga tahun", "tiga kali", "tiga orang", "tiga buah"]'::jsonb, 2, '三人 dibaca さんにん, artinya "tiga orang".', 'makna sekanji', 'belum', 43),
('K5-0044', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三人', '["ざんぬん", "さんにん", "さんぬん", "ざんにん"]'::jsonb, 1, '三人 artinya "tiga orang", dibaca さんにん.', 'daku / vowel / daku+vowel', 'belum', 44),
('K5-0045', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三月（さんがつ）', '["bulan Maret", "tiga orang", "tiga tahun", "bulan Juni"]'::jsonb, 0, '三月 dibaca さんがつ, artinya "bulan Maret".', 'makna sekanji', 'belum', 45),
('K5-0046', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三月', '["さんかつ", "ざんかつ", "ざんがつ", "さんがつ"]'::jsonb, 3, '三月 artinya "bulan Maret", dibaca さんがつ.', 'daku / daku+daku', 'belum', 46),
('K5-0047', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三日（みっか）', '["tiga tahun", "tiga orang", "tanggal 3", "tanggal 8"]'::jsonb, 2, '三日 dibaca みっか, artinya "tanggal 3".', 'makna sekanji', 'belum', 47),
('K5-0048', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三日', '["めっか", "みっか", "みか", "めか"]'::jsonb, 1, '三日 artinya "tanggal 3", dibaca みっか.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 48),
('K5-0049', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三時（さんじ）', '["nomor tiga", "pukul tiga", "tiga kali", "tiga tahun"]'::jsonb, 1, '三時 dibaca さんじ, artinya "pukul tiga".', 'makna sekanji', 'belum', 49),
('K5-0050', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三時', '["ざんし", "ざんじ", "さんじ", "さんし"]'::jsonb, 2, '三時 artinya "pukul tiga", dibaca さんじ.', 'daku / daku+daku', 'belum', 50),
('K5-0051', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三年（さんねん）', '["tiga buah", "tiga belas", "tiga orang", "tiga tahun"]'::jsonb, 3, '三年 dibaca さんねん, artinya "tiga tahun".', 'makna sekanji', 'belum', 51),
('K5-0052', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三年', '["さんねん", "ざんねん", "さんなん", "ざんなん"]'::jsonb, 0, '三年 artinya "tiga tahun", dibaca さんねん.', 'daku / vowel / daku+vowel', 'belum', 52),
('K5-0053', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三回（さんかい）', '["tiga orang", "tiga kali", "tiga tahun", "tiga belas"]'::jsonb, 1, '三回 dibaca さんかい, artinya "tiga kali".', 'makna sekanji', 'belum', 53),
('K5-0054', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三回', '["ざんかい", "さんがい", "ざんがい", "さんかい"]'::jsonb, 3, '三回 artinya "tiga kali", dibaca さんかい.', 'daku / daku+daku', 'belum', 54),
('K5-0055', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三番（さんばん）', '["tiga kali", "pukul tiga", "nomor tiga", "tiga tahun"]'::jsonb, 2, '三番 dibaca さんばん, artinya "nomor tiga".', 'makna sekanji', 'belum', 55),
('K5-0056', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三番', '["さんばん", "ざんはん", "さんはん", "ざんばん"]'::jsonb, 0, '三番 artinya "nomor tiga", dibaca さんばん.', 'daku / daku+daku', 'belum', 56),
('K5-0057', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三角（さんかく）', '["bulan Maret", "tanggal 3", "segitiga", "tiga belas"]'::jsonb, 2, '三角 dibaca さんかく, artinya "segitiga".', 'makna sekanji', 'belum', 57),
('K5-0058', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三角', '["ざんがく", "ざんかく", "さんがく", "さんかく"]'::jsonb, 3, '三角 artinya "segitiga", dibaca さんかく.', 'daku / daku+daku', 'belum', 58),
('K5-0059', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十三（じゅうさん）', '["tiga belas", "tiga orang", "tiga kali", "tiga tahun"]'::jsonb, 0, '十三 dibaca じゅうさん, artinya "tiga belas".', 'makna sekanji', 'belum', 59),
('K5-0060', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十三', '["じゆうさん", "じゅうさん", "しゆうさん", "しゅうさん"]'::jsonb, 1, '十三 artinya "tiga belas", dibaca じゅうさん.', 'daku / youon / daku+youon', 'belum', 60),
('K5-0061', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四つ（よっつ）', '["empat kali", "empat buah", "empat puluh", "empat orang"]'::jsonb, 1, '四つ dibaca よっつ, artinya "empat buah".', 'makna sekanji', 'belum', 61),
('K5-0062', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四つ', '["よつ", "ようつ", "よっつ", "ようっつ"]'::jsonb, 2, '四つ artinya "empat buah", dibaca よっつ.', 'chouon+ / sokuon- / chouon++sokuon-', 'belum', 62),
('K5-0063', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四人（よにん）', '["empat orang", "empat tahun", "empat kali", "empat puluh"]'::jsonb, 0, '四人 dibaca よにん, artinya "empat orang".', 'makna sekanji', 'belum', 63),
('K5-0064', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四人', '["ようにん", "よぬん", "ようぬん", "よにん"]'::jsonb, 3, '四人 artinya "empat orang", dibaca よにん.', 'chouon+ / vowel / chouon++vowel', 'belum', 64),
('K5-0065', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四月（しがつ）', '["bulan April", "tanggal 4", "pukul empat", "segi empat"]'::jsonb, 0, '四月 dibaca しがつ, artinya "bulan April".', 'makna sekanji', 'belum', 65),
('K5-0066', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四月', '["じがつ", "しがつ", "じかつ", "しかつ"]'::jsonb, 1, '四月 artinya "bulan April", dibaca しがつ.', 'daku / daku+daku', 'belum', 66),
('K5-0067', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四日（よっか）', '["tanggal 7", "tanggal 3", "tanggal 4", "empat belas"]'::jsonb, 2, '四日 dibaca よっか, artinya "tanggal 4".', 'makna sekanji', 'belum', 67),
('K5-0068', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四日', '["ようっか", "ようか", "よか", "よっか"]'::jsonb, 3, '四日 artinya "tanggal 4", dibaca よっか.', 'chouon+ / sokuon- / chouon++sokuon-', 'belum', 68),
('K5-0069', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四時（よじ）', '["pukul empat", "empat puluh", "segi empat", "empat tahun"]'::jsonb, 0, '四時 dibaca よじ, artinya "pukul empat".', 'makna sekanji', 'belum', 69),
('K5-0070', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四時', '["ようし", "よし", "よじ", "ようじ"]'::jsonb, 2, '四時 artinya "pukul empat", dibaca よじ.', 'chouon+ / daku / chouon++daku', 'belum', 70),
('K5-0071', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四年（よねん）', '["empat buah", "empat tahun", "empat belas", "empat kali"]'::jsonb, 1, '四年 dibaca よねん, artinya "empat tahun".', 'makna sekanji', 'belum', 71),
('K5-0072', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四年', '["ようぬん", "よぬん", "ようねん", "よねん"]'::jsonb, 3, '四年 artinya "empat tahun", dibaca よねん.', 'chouon+ / vowel / chouon++vowel', 'belum', 72),
('K5-0073', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四角（しかく）', '["segi empat", "empat puluh", "pukul empat", "empat kali"]'::jsonb, 0, '四角 dibaca しかく, artinya "segi empat".', 'makna sekanji', 'belum', 73),
('K5-0074', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四角', '["じかく", "しかく", "じがく", "しがく"]'::jsonb, 1, '四角 artinya "segi empat", dibaca しかく.', 'daku / daku+daku', 'belum', 74),
('K5-0075', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四十（よんじゅう）', '["empat orang", "empat kali", "empat puluh", "empat tahun"]'::jsonb, 2, '四十 dibaca よんじゅう, artinya "empat puluh".', 'makna sekanji', 'belum', 75),
('K5-0076', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四十', '["ようんじゅう", "よんしゅう", "ようんしゅう", "よんじゅう"]'::jsonb, 3, '四十 artinya "empat puluh", dibaca よんじゅう.', 'chouon+ / daku / chouon++daku', 'belum', 76),
('K5-0077', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
四回（よんかい）', '["empat kali", "empat belas", "empat orang", "empat buah"]'::jsonb, 0, '四回 dibaca よんかい, artinya "empat kali".', 'makna sekanji', 'belum', 77),
('K5-0078', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
四回', '["よんがい", "ようんがい", "ようんかい", "よんかい"]'::jsonb, 3, '四回 artinya "empat kali", dibaca よんかい.', 'chouon+ / daku / chouon++daku', 'belum', 78),
('K5-0079', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十四（じゅうよん）', '["empat puluh", "empat kali", "empat belas", "empat buah"]'::jsonb, 2, '十四 dibaca じゅうよん, artinya "empat belas".', 'makna sekanji', 'belum', 79),
('K5-0080', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十四', '["しゅうよん", "じゅうよん", "しゆうよん", "じゆうよん"]'::jsonb, 1, '十四 artinya "empat belas", dibaca じゅうよん.', 'daku / youon / daku+youon', 'belum', 80),
('K5-0081', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五つ（いつつ）', '["lima kali", "lima buah", "lima belas", "lima tahun"]'::jsonb, 1, '五つ dibaca いつつ, artinya "lima buah".', 'makna sekanji', 'belum', 81),
('K5-0082', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五つ', '["いつつ", "おつうつ", "いつうつ", "おつつ"]'::jsonb, 0, '五つ artinya "lima buah", dibaca いつつ.', 'vowel / chouon+ / vowel+chouon+', 'belum', 82),
('K5-0083', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五人（ごにん）', '["lima menit", "lima kali", "lima buah", "lima orang"]'::jsonb, 3, '五人 dibaca ごにん, artinya "lima orang".', 'makna sekanji', 'belum', 83),
('K5-0084', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五人', '["このん", "ごのん", "ごにん", "こにん"]'::jsonb, 2, '五人 artinya "lima orang", dibaca ごにん.', 'daku / vowel / daku+vowel', 'belum', 84),
('K5-0085', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五月（ごがつ）', '["bulan September", "lima buah", "bulan April", "bulan Mei"]'::jsonb, 3, '五月 dibaca ごがつ, artinya "bulan Mei".', 'makna sekanji', 'belum', 85),
('K5-0086', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五月', '["こかつ", "ごかつ", "ごがつ", "こがつ"]'::jsonb, 2, '五月 artinya "bulan Mei", dibaca ごがつ.', 'daku / daku+daku', 'belum', 86),
('K5-0087', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五日（いつか）', '["lima puluh", "tanggal 5", "tanggal 7", "tanggal 1"]'::jsonb, 1, '五日 dibaca いつか, artinya "tanggal 5".', 'makna sekanji', 'belum', 87),
('K5-0088', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五日', '["いつか", "おつか", "おつうか", "いつうか"]'::jsonb, 0, '五日 artinya "tanggal 5", dibaca いつか.', 'vowel / chouon+ / vowel+chouon+', 'belum', 88),
('K5-0089', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五時（ごじ）', '["lima belas", "lima tahun", "pukul lima", "lima orang"]'::jsonb, 2, '五時 dibaca ごじ, artinya "pukul lima".', 'makna sekanji', 'belum', 89),
('K5-0090', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五時', '["こじ", "ごし", "こし", "ごじ"]'::jsonb, 3, '五時 artinya "pukul lima", dibaca ごじ.', 'daku / daku+daku', 'belum', 90),
('K5-0091', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五年（ごねん）', '["lima tahun", "lima buah", "lima kali", "lima menit"]'::jsonb, 0, '五年 dibaca ごねん, artinya "lima tahun".', 'makna sekanji', 'belum', 91),
('K5-0092', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五年', '["こねん", "ごねん", "こぬん", "ごぬん"]'::jsonb, 1, '五年 artinya "lima tahun", dibaca ごねん.', 'daku / vowel / daku+vowel', 'belum', 92),
('K5-0093', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五十（ごじゅう）', '["lima kali", "lima puluh", "lima buah", "lima tahun"]'::jsonb, 1, '五十 dibaca ごじゅう, artinya "lima puluh".', 'makna sekanji', 'belum', 93),
('K5-0094', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五十', '["ごしゅう", "こしゅう", "こじゅう", "ごじゅう"]'::jsonb, 3, '五十 artinya "lima puluh", dibaca ごじゅう.', 'daku / daku+daku', 'belum', 94),
('K5-0095', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五回（ごかい）', '["lima kali", "lima buah", "lima menit", "lima orang"]'::jsonb, 0, '五回 dibaca ごかい, artinya "lima kali".', 'makna sekanji', 'belum', 95),
('K5-0096', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五回', '["こかい", "こがい", "ごかい", "ごがい"]'::jsonb, 2, '五回 artinya "lima kali", dibaca ごかい.', 'daku / daku+daku', 'belum', 96),
('K5-0097', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五分（ごふん）', '["lima kali", "lima menit", "lima orang", "lima puluh"]'::jsonb, 1, '五分 dibaca ごふん, artinya "lima menit".', 'makna sekanji', 'belum', 97),
('K5-0098', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五分', '["ごふん", "ごぶん", "こふん", "こぶん"]'::jsonb, 0, '五分 artinya "lima menit", dibaca ごふん.', 'daku / daku+daku', 'belum', 98),
('K5-0099', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十五（じゅうご）', '["lima orang", "lima kali", "lima belas", "lima menit"]'::jsonb, 2, '十五 dibaca じゅうご, artinya "lima belas".', 'makna sekanji', 'belum', 99),
('K5-0100', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十五', '["しゆうご", "しゅうご", "じゆうご", "じゅうご"]'::jsonb, 3, '十五 artinya "lima belas", dibaca じゅうご.', 'daku / youon / daku+youon', 'belum', 100),
('K5-0101', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六つ（むっつ）', '["enam buah", "enam belas", "enam puluh", "enam ratus"]'::jsonb, 0, '六つ dibaca むっつ, artinya "enam buah".', 'makna sekanji', 'belum', 101),
('K5-0102', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六つ', '["むうつ", "むうっつ", "むっつ", "むつ"]'::jsonb, 2, '六つ artinya "enam buah", dibaca むっつ.', 'chouon+ / sokuon- / chouon++sokuon-', 'belum', 102),
('K5-0103', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六人（ろくにん）', '["enam ratus", "enam puluh", "enam buah", "enam orang"]'::jsonb, 3, '六人 dibaca ろくにん, artinya "enam orang".', 'makna sekanji', 'belum', 103),
('K5-0104', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六人', '["ろうくにん", "ろくにん", "ろうぐにん", "ろぐにん"]'::jsonb, 1, '六人 artinya "enam orang", dibaca ろくにん.', 'chouon+ / daku / chouon++daku', 'belum', 104),
('K5-0105', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六月（ろくがつ）', '["enam tahun", "bulan Juni", "bulan Agustus", "bulan Oktober"]'::jsonb, 1, '六月 dibaca ろくがつ, artinya "bulan Juni".', 'makna sekanji', 'belum', 105),
('K5-0106', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六月', '["ろくがつ", "ろうぐがつ", "ろうくがつ", "ろぐがつ"]'::jsonb, 0, '六月 artinya "bulan Juni", dibaca ろくがつ.', 'chouon+ / daku / chouon++daku', 'belum', 106),
('K5-0107', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六日（むいか）', '["bulan Juni", "enam tahun", "tanggal 6", "tanggal 1"]'::jsonb, 2, '六日 dibaca むいか, artinya "tanggal 6".', 'makna sekanji', 'belum', 107),
('K5-0108', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六日', '["むうおか", "むおか", "むういか", "むいか"]'::jsonb, 3, '六日 artinya "tanggal 6", dibaca むいか.', 'chouon+ / vowel / chouon++vowel', 'belum', 108),
('K5-0109', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六時（ろくじ）', '["enam orang", "enam kali", "enam ratus", "pukul enam"]'::jsonb, 3, '六時 dibaca ろくじ, artinya "pukul enam".', 'makna sekanji', 'belum', 109),
('K5-0110', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六時', '["ろうぐじ", "ろくじ", "ろうくじ", "ろぐじ"]'::jsonb, 1, '六時 artinya "pukul enam", dibaca ろくじ.', 'chouon+ / daku / chouon++daku', 'belum', 110),
('K5-0111', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六年（ろくねん）', '["enam orang", "enam puluh", "enam tahun", "enam belas"]'::jsonb, 2, '六年 dibaca ろくねん, artinya "enam tahun".', 'makna sekanji', 'belum', 111),
('K5-0112', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六年', '["ろくねん", "ろぐねん", "ろうぐねん", "ろうくねん"]'::jsonb, 0, '六年 artinya "enam tahun", dibaca ろくねん.', 'chouon+ / daku / chouon++daku', 'belum', 112),
('K5-0113', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六十（ろくじゅう）', '["enam buah", "enam puluh", "enam ratus", "enam tahun"]'::jsonb, 1, '六十 dibaca ろくじゅう, artinya "enam puluh".', 'makna sekanji', 'belum', 113),
('K5-0114', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六十', '["ろくじゅう", "ろうぐじゅう", "ろうくじゅう", "ろぐじゅう"]'::jsonb, 0, '六十 artinya "enam puluh", dibaca ろくじゅう.', 'chouon+ / daku / chouon++daku', 'belum', 114),
('K5-0115', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六回（ろっかい）', '["enam buah", "enam ratus", "enam belas", "enam kali"]'::jsonb, 3, '六回 dibaca ろっかい, artinya "enam kali".', 'makna sekanji', 'belum', 115),
('K5-0116', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六回', '["ろかい", "ろうっかい", "ろっかい", "ろうかい"]'::jsonb, 2, '六回 artinya "enam kali", dibaca ろっかい.', 'chouon+ / sokuon- / chouon++sokuon-', 'belum', 116),
('K5-0117', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
六百（ろっぴゃく）', '["enam orang", "enam ratus", "enam kali", "enam puluh"]'::jsonb, 1, '六百 dibaca ろっぴゃく, artinya "enam ratus".', 'makna sekanji', 'belum', 117),
('K5-0118', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
六百', '["ろうっぴゃく", "ろうぴゃく", "ろぴゃく", "ろっぴゃく"]'::jsonb, 3, '六百 artinya "enam ratus", dibaca ろっぴゃく.', 'chouon+ / sokuon- / chouon++sokuon-', 'belum', 118),
('K5-0119', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十六（じゅうろく）', '["enam belas", "enam ratus", "enam orang", "enam kali"]'::jsonb, 0, '十六 dibaca じゅうろく, artinya "enam belas".', 'makna sekanji', 'belum', 119),
('K5-0120', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十六', '["しゆうろく", "しゅうろく", "じゅうろく", "じゆうろく"]'::jsonb, 2, '十六 artinya "enam belas", dibaca じゅうろく.', 'daku / youon / daku+youon', 'belum', 120),
('K5-0121', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七つ（ななつ）', '["tujuh buah", "tujuh kali", "tujuh ratus", "tujuh belas"]'::jsonb, 0, '七つ dibaca ななつ, artinya "tujuh buah".', 'makna sekanji', 'belum', 121),
('K5-0122', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七つ', '["なにつ", "ななつ", "ねなつ", "しちつ"]'::jsonb, 1, '七つ artinya "tujuh buah", dibaca ななつ. Membacanya しちつ adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 122),
('K5-0123', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七人（しちにん）', '["tujuh puluh", "tujuh kali", "tujuh orang", "tujuh belas"]'::jsonb, 2, '七人 dibaca しちにん, artinya "tujuh orang".', 'makna sekanji', 'belum', 123),
('K5-0124', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七人', '["しっちにん", "ななにん", "じちにん", "しちにん"]'::jsonb, 3, '七人 artinya "tujuh orang", dibaca しちにん. Membacanya ななにん adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 124),
('K5-0125', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七月（しちがつ）', '["bulan Juli", "tujuh orang", "bulan Januari", "tujuh puluh"]'::jsonb, 0, '七月 dibaca しちがつ, artinya "bulan Juli".', 'makna sekanji', 'belum', 125),
('K5-0126', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七月', '["しっちがつ", "しちがつ", "じちがつ", "なながつ"]'::jsonb, 1, '七月 artinya "bulan Juli", dibaca しちがつ. Membacanya なながつ adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 126),
('K5-0127', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七日（なのか）', '["tanggal 2", "tujuh orang", "tujuh ratus", "tanggal 7"]'::jsonb, 3, '七日 dibaca なのか, artinya "tanggal 7".', 'makna sekanji', 'belum', 127),
('K5-0128', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七日', '["ぬのうか", "なのうか", "なのか", "ぬのか"]'::jsonb, 2, '七日 artinya "tanggal 7", dibaca なのか.', 'vowel / chouon+ / vowel+chouon+', 'belum', 128),
('K5-0129', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七時（しちじ）', '["tujuh belas", "tujuh buah", "pukul tujuh", "tujuh puluh"]'::jsonb, 2, '七時 dibaca しちじ, artinya "pukul tujuh".', 'makna sekanji', 'belum', 129),
('K5-0130', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七時', '["しちじ", "じちじ", "しっちじ", "ななじ"]'::jsonb, 0, '七時 artinya "pukul tujuh", dibaca しちじ. Membacanya ななじ adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 130),
('K5-0131', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七年（ななねん）', '["tujuh orang", "tujuh tahun", "tujuh belas", "tujuh puluh"]'::jsonb, 1, '七年 dibaca ななねん, artinya "tujuh tahun".', 'makna sekanji', 'belum', 131),
('K5-0132', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七年', '["しちねん", "なねねん", "ぬなねん", "ななねん"]'::jsonb, 3, '七年 artinya "tujuh tahun", dibaca ななねん. Membacanya しちねん adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 132),
('K5-0133', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七十（ななじゅう）', '["tujuh buah", "tujuh ratus", "tujuh puluh", "tujuh tahun"]'::jsonb, 2, '七十 dibaca ななじゅう, artinya "tujuh puluh".', 'makna sekanji', 'belum', 133),
('K5-0134', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七十', '["ねなじゅう", "しちじゅう", "なのじゅう", "ななじゅう"]'::jsonb, 3, '七十 artinya "tujuh puluh", dibaca ななじゅう. Membacanya しちじゅう adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 134),
('K5-0135', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七回（ななかい）', '["tujuh belas", "tujuh kali", "tujuh orang", "tujuh puluh"]'::jsonb, 1, '七回 dibaca ななかい, artinya "tujuh kali".', 'makna sekanji', 'belum', 135),
('K5-0136', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七回', '["ななかい", "しちかい", "なにかい", "のなかい"]'::jsonb, 0, '七回 artinya "tujuh kali", dibaca ななかい. Membacanya しちかい adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 136),
('K5-0137', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
七百（ななひゃく）', '["tujuh tahun", "tujuh belas", "tujuh kali", "tujuh ratus"]'::jsonb, 3, '七百 dibaca ななひゃく, artinya "tujuh ratus".', 'makna sekanji', 'belum', 137),
('K5-0138', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
七百', '["しちひゃく", "ななひゃく", "になひゃく", "なにひゃく"]'::jsonb, 1, '七百 artinya "tujuh ratus", dibaca ななひゃく. Membacanya しちひゃく adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 138),
('K5-0139', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十七（じゅうなな）', '["tujuh tahun", "tujuh buah", "tujuh belas", "tujuh orang"]'::jsonb, 2, '十七 dibaca じゅうなな, artinya "tujuh belas".', 'makna sekanji', 'belum', 139),
('K5-0140', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十七', '["じゅうなな", "しゆうなな", "じゆうなな", "しゅうなな"]'::jsonb, 0, '十七 artinya "tujuh belas", dibaca じゅうなな.', 'daku / youon / daku+youon', 'belum', 140),
('K5-0141', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八つ（やっつ）', '["delapan tahun", "delapan orang", "delapan buah", "delapan puluh"]'::jsonb, 2, '八つ dibaca やっつ, artinya "delapan buah".', 'makna sekanji', 'belum', 141),
('K5-0142', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八つ', '["やつ", "ゆっつ", "ゆつ", "やっつ"]'::jsonb, 3, '八つ artinya "delapan buah", dibaca やっつ.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 142),
('K5-0143', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八人（はちにん）', '["delapan tahun", "delapan orang", "delapan buah", "delapan belas"]'::jsonb, 1, '八人 dibaca はちにん, artinya "delapan orang".', 'makna sekanji', 'belum', 143),
('K5-0144', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八人', '["はちにん", "はっちにん", "ばちにん", "ばっちにん"]'::jsonb, 0, '八人 artinya "delapan orang", dibaca はちにん.', 'daku / sokuon+ / daku+sokuon+', 'belum', 144),
('K5-0145', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八月（はちがつ）', '["tanggal 8", "delapan orang", "bulan Januari", "bulan Agustus"]'::jsonb, 3, '八月 dibaca はちがつ, artinya "bulan Agustus".', 'makna sekanji', 'belum', 145),
('K5-0146', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八月', '["はちかつ", "はちがつ", "はっちがつ", "はっちかつ"]'::jsonb, 1, '八月 artinya "bulan Agustus", dibaca はちがつ.', 'sokuon+ / daku / sokuon++daku', 'belum', 146),
('K5-0147', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八日（ようか）', '["tanggal 8", "tanggal 4", "delapan tahun", "bulan Agustus"]'::jsonb, 0, '八日 dibaca ようか, artinya "tanggal 8".', 'makna sekanji', 'belum', 147),
('K5-0148', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八日', '["やか", "やうか", "ようか", "よか"]'::jsonb, 2, '八日 artinya "tanggal 8", dibaca ようか.', 'vowel / chouon- / vowel+chouon-', 'belum', 148),
('K5-0149', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八時（はちじ）', '["delapan belas", "delapan kali", "delapan puluh", "pukul delapan"]'::jsonb, 3, '八時 dibaca はちじ, artinya "pukul delapan".', 'makna sekanji', 'belum', 149),
('K5-0150', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八時', '["はちじ", "はっちじ", "はっちし", "はちし"]'::jsonb, 0, '八時 artinya "pukul delapan", dibaca はちじ.', 'sokuon+ / daku / sokuon++daku', 'belum', 150),
('K5-0151', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八年（はちねん）', '["delapan belas", "delapan tahun", "delapan buah", "delapan orang"]'::jsonb, 1, '八年 dibaca はちねん, artinya "delapan tahun".', 'makna sekanji', 'belum', 151),
('K5-0152', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八年', '["ばっちねん", "ばちねん", "はちねん", "はっちねん"]'::jsonb, 2, '八年 artinya "delapan tahun", dibaca はちねん.', 'daku / sokuon+ / daku+sokuon+', 'belum', 152),
('K5-0153', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八十（はちじゅう）', '["delapan orang", "delapan puluh", "delapan tahun", "delapan kali"]'::jsonb, 1, '八十 dibaca はちじゅう, artinya "delapan puluh".', 'makna sekanji', 'belum', 153),
('K5-0154', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八十', '["はっちじゅう", "はちしゅう", "はちじゅう", "はっちしゅう"]'::jsonb, 2, '八十 artinya "delapan puluh", dibaca はちじゅう.', 'sokuon+ / daku / sokuon++daku', 'belum', 154),
('K5-0155', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八回（はっかい）', '["delapan kali", "delapan puluh", "delapan buah", "delapan tahun"]'::jsonb, 0, '八回 dibaca はっかい, artinya "delapan kali".', 'makna sekanji', 'belum', 155),
('K5-0156', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八回', '["ばっかい", "ばかい", "はかい", "はっかい"]'::jsonb, 3, '八回 artinya "delapan kali", dibaca はっかい.', 'daku / sokuon- / daku+sokuon-', 'belum', 156),
('K5-0157', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八百屋（やおや）', '["delapan kali", "tanggal 8", "toko sayur", "delapan belas"]'::jsonb, 2, '八百屋 dibaca やおや, artinya "toko sayur".', 'makna sekanji', 'belum', 157),
('K5-0158', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八百屋', '["やおうや", "やおや", "よおうや", "よおや"]'::jsonb, 1, '八百屋 artinya "toko sayur", dibaca やおや.', 'vowel / chouon+ / vowel+chouon+', 'belum', 158),
('K5-0159', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十八（じゅうはち）', '["delapan belas", "delapan buah", "delapan kali", "delapan puluh"]'::jsonb, 0, '十八 dibaca じゅうはち, artinya "delapan belas".', 'makna sekanji', 'belum', 159),
('K5-0160', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十八', '["しゆうはち", "じゆうはち", "しゅうはち", "じゅうはち"]'::jsonb, 3, '十八 artinya "delapan belas", dibaca じゅうはち.', 'daku / youon / daku+youon', 'belum', 160),
('K5-0161', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九つ（ここのつ）', '["sembilan puluh", "sembilan tahun", "sembilan buah", "sembilan orang"]'::jsonb, 2, '九つ dibaca ここのつ, artinya "sembilan buah".', 'makna sekanji', 'belum', 161),
('K5-0162', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九つ', '["ごこのつ", "ごごのつ", "こごのつ", "ここのつ"]'::jsonb, 3, '九つ artinya "sembilan buah", dibaca ここのつ.', 'daku / daku+daku', 'belum', 162),
('K5-0163', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九人（きゅうにん）', '["sembilan puluh", "sembilan orang", "sembilan ratus", "sembilan belas"]'::jsonb, 1, '九人 dibaca きゅうにん, artinya "sembilan orang".', 'makna sekanji', 'belum', 163),
('K5-0164', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九人', '["きゅうにん", "きゆうにん", "ぎゅうにん", "ぎゆうにん"]'::jsonb, 0, '九人 artinya "sembilan orang", dibaca きゅうにん.', 'daku / youon / daku+youon', 'belum', 164),
('K5-0165', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九月（くがつ）', '["bulan September", "bulan Oktober", "bulan Januari", "bulan Juli"]'::jsonb, 0, '九月 dibaca くがつ, artinya "bulan September".', 'makna sekanji', 'belum', 165),
('K5-0166', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九月', '["ぐがつ", "ぐかつ", "くがつ", "くかつ"]'::jsonb, 2, '九月 artinya "bulan September", dibaca くがつ.', 'daku / daku+daku', 'belum', 166),
('K5-0167', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九日（ここのか）', '["tanggal 2", "tanggal 1", "tanggal 3", "tanggal 9"]'::jsonb, 3, '九日 dibaca ここのか, artinya "tanggal 9".', 'makna sekanji', 'belum', 167),
('K5-0168', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九日', '["ごこのか", "ここのか", "ごごのか", "こごのか"]'::jsonb, 1, '九日 artinya "tanggal 9", dibaca ここのか.', 'daku / daku+daku', 'belum', 168),
('K5-0169', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九時（くじ）', '["sembilan ratus", "pukul sembilan", "sembilan orang", "sembilan buah"]'::jsonb, 1, '九時 dibaca くじ, artinya "pukul sembilan".', 'makna sekanji', 'belum', 169),
('K5-0170', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九時', '["くじ", "ぐじ", "ぐし", "くし"]'::jsonb, 0, '九時 artinya "pukul sembilan", dibaca くじ.', 'daku / daku+daku', 'belum', 170),
('K5-0171', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九年（きゅうねん）', '["sembilan kali", "sembilan buah", "sembilan orang", "sembilan tahun"]'::jsonb, 3, '九年 dibaca きゅうねん, artinya "sembilan tahun".', 'makna sekanji', 'belum', 171),
('K5-0172', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九年', '["ぎゅうねん", "きゆうねん", "きゅうねん", "ぎゆうねん"]'::jsonb, 2, '九年 artinya "sembilan tahun", dibaca きゅうねん.', 'daku / youon / daku+youon', 'belum', 172),
('K5-0173', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九十（きゅうじゅう）', '["sembilan belas", "sembilan puluh", "sembilan ratus", "sembilan orang"]'::jsonb, 1, '九十 dibaca きゅうじゅう, artinya "sembilan puluh".', 'makna sekanji', 'belum', 173),
('K5-0174', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九十', '["きゆうじゅう", "ぎゆうじゅう", "ぎゅうじゅう", "きゅうじゅう"]'::jsonb, 3, '九十 artinya "sembilan puluh", dibaca きゅうじゅう.', 'daku / youon / daku+youon', 'belum', 174),
('K5-0175', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九回（きゅうかい）', '["sembilan kali", "sembilan ratus", "sembilan buah", "sembilan orang"]'::jsonb, 0, '九回 dibaca きゅうかい, artinya "sembilan kali".', 'makna sekanji', 'belum', 175),
('K5-0176', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九回', '["きゆうかい", "ぎゅうかい", "きゅうかい", "ぎゆうかい"]'::jsonb, 2, '九回 artinya "sembilan kali", dibaca きゅうかい.', 'daku / youon / daku+youon', 'belum', 176),
('K5-0177', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
九百（きゅうひゃく）', '["sembilan orang", "sembilan tahun", "sembilan ratus", "sembilan kali"]'::jsonb, 2, '九百 dibaca きゅうひゃく, artinya "sembilan ratus".', 'makna sekanji', 'belum', 177),
('K5-0178', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
九百', '["きゆうひゃく", "きゅうひゃく", "ぎゆうひゃく", "ぎゅうひゃく"]'::jsonb, 1, '九百 artinya "sembilan ratus", dibaca きゅうひゃく.', 'daku / youon / daku+youon', 'belum', 178),
('K5-0179', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十九（じゅうきゅう）', '["sembilan puluh", "sembilan kali", "sembilan ratus", "sembilan belas"]'::jsonb, 3, '十九 dibaca じゅうきゅう, artinya "sembilan belas".', 'makna sekanji', 'belum', 179),
('K5-0180', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十九', '["じゅうきゅう", "じゆうきゅう", "しゆうきゅう", "しゅうきゅう"]'::jsonb, 0, '十九 artinya "sembilan belas", dibaca じゅうきゅう.', 'daku / youon / daku+youon', 'belum', 180),
('K5-0181', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十日（とおか）', '["tanggal 1", "sepuluh orang", "tanggal 10", "tanggal 9"]'::jsonb, 2, '十日 dibaca とおか, artinya "tanggal 10".', 'makna sekanji', 'belum', 181),
('K5-0182', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十日', '["とおうか", "どおうか", "どおか", "とおか"]'::jsonb, 3, '十日 artinya "tanggal 10", dibaca とおか.', 'daku / chouon+ / daku+chouon+', 'belum', 182),
('K5-0183', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十月（じゅうがつ）', '["bulan Juli", "bulan Oktober", "bulan September", "sepuluh kali"]'::jsonb, 1, '十月 dibaca じゅうがつ, artinya "bulan Oktober".', 'makna sekanji', 'belum', 183),
('K5-0184', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十月', '["じゅうがつ", "じゆうがつ", "しゅうがつ", "しゆうがつ"]'::jsonb, 0, '十月 artinya "bulan Oktober", dibaca じゅうがつ.', 'daku / youon / daku+youon', 'belum', 184),
('K5-0185', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十時（じゅうじ）', '["sepuluh menit", "sepuluh kali", "sepuluh orang", "pukul sepuluh"]'::jsonb, 3, '十時 dibaca じゅうじ, artinya "pukul sepuluh".', 'makna sekanji', 'belum', 185),
('K5-0186', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十時', '["じゆうじ", "しゆうじ", "じゅうじ", "しゅうじ"]'::jsonb, 2, '十時 artinya "pukul sepuluh", dibaca じゅうじ.', 'daku / youon / daku+youon', 'belum', 186),
('K5-0187', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十人（じゅうにん）', '["sepuluh orang", "sepuluh menit", "sepuluh tahun", "sepuluh kali"]'::jsonb, 0, '十人 dibaca じゅうにん, artinya "sepuluh orang".', 'makna sekanji', 'belum', 187),
('K5-0188', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十人', '["じゆうにん", "じゅうにん", "しゅうにん", "しゆうにん"]'::jsonb, 1, '十人 artinya "sepuluh orang", dibaca じゅうにん.', 'daku / youon / daku+youon', 'belum', 188),
('K5-0189', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十分（じゅっぷん）', '["sepuluh kali", "sepuluh tahun", "sepuluh orang", "sepuluh menit"]'::jsonb, 3, '十分 dibaca じゅっぷん, artinya "sepuluh menit".', 'makna sekanji', 'belum', 189),
('K5-0190', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十分', '["しゅうっぷん", "じゅうっぷん", "じゅっぷん", "しゅっぷん"]'::jsonb, 2, '十分 artinya "sepuluh menit", dibaca じゅっぷん.', 'daku / chouon+ / daku+chouon+', 'belum', 190),
('K5-0191', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十年（じゅうねん）', '["sepuluh kali", "sepuluh tahun", "sepuluh menit", "sepuluh orang"]'::jsonb, 1, '十年 dibaca じゅうねん, artinya "sepuluh tahun".', 'makna sekanji', 'belum', 191),
('K5-0192', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十年', '["じゅうねん", "しゆうねん", "じゆうねん", "しゅうねん"]'::jsonb, 0, '十年 artinya "sepuluh tahun", dibaca じゅうねん.', 'daku / youon / daku+youon', 'belum', 192),
('K5-0193', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十回（じゅっかい）', '["sepuluh tahun", "sepuluh kali", "sepuluh orang", "sepuluh menit"]'::jsonb, 1, '十回 dibaca じゅっかい, artinya "sepuluh kali".', 'makna sekanji', 'belum', 193),
('K5-0194', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十回', '["しゅっかい", "じゅうっかい", "じゅっかい", "しゅうっかい"]'::jsonb, 2, '十回 artinya "sepuluh kali", dibaca じゅっかい.', 'daku / chouon+ / daku+chouon+', 'belum', 194),
('K5-0195', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
二十歳（はたち）', '["sepuluh tahun", "lima belas menit", "tanda silang", "usia 20 tahun"]'::jsonb, 3, '二十歳 dibaca はたち, artinya "usia 20 tahun".', 'makna sekanji', 'belum', 195),
('K5-0196', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二十歳', '["はたち", "ばたち", "ばだち", "はだち"]'::jsonb, 0, '二十歳 artinya "usia 20 tahun", dibaca はたち.', 'daku / daku+daku', 'belum', 196),
('K5-0197', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十字（じゅうじ）', '["tanda silang", "sepuluh orang", "sepuluh menit", "sepuluh kali"]'::jsonb, 0, '十字 dibaca じゅうじ, artinya "tanda silang".', 'makna sekanji', 'belum', 197),
('K5-0198', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十字', '["しゅうじ", "じゅうじ", "じゆうじ", "しゆうじ"]'::jsonb, 1, '十字 artinya "tanda silang", dibaca じゅうじ.', 'daku / youon / daku+youon', 'belum', 198),
('K5-0199', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十五分（じゅうごふん）', '["usia 20 tahun", "lima yen", "lima belas menit", "sepuluh menit"]'::jsonb, 2, '十五分 dibaca じゅうごふん, artinya "lima belas menit".', 'makna sekanji', 'belum', 199),
('K5-0200', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十五分', '["じゆうごふん", "しゆうごふん", "しゅうごふん", "じゅうごふん"]'::jsonb, 3, '十五分 artinya "lima belas menit", dibaca じゅうごふん.', 'daku / youon / daku+youon', 'belum', 200)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-0201', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百（ひゃく）', '["yen", "seratus ribu", "seratus", "seribu"]'::jsonb, 2, '百 dibaca ひゃく, artinya "seratus".', 'makna sekanji', 'belum', 201),
('K5-0202', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百', '["ひゃく", "ひやく", "ひやぐ", "ひゃぐ"]'::jsonb, 0, '百 artinya "seratus", dibaca ひゃく.', 'youon / daku / youon+daku', 'belum', 202),
('K5-0203', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三百（さんびゃく）', '["seratus yen", "delapan ratus", "enam ratus", "tiga ratus"]'::jsonb, 3, '三百 dibaca さんびゃく, artinya "tiga ratus".', 'makna sekanji', 'belum', 203),
('K5-0204', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三百', '["さんぴゃく", "さんびゃく", "ざんぴゃく", "ざんびゃく"]'::jsonb, 1, '三百 artinya "tiga ratus", dibaca さんびゃく.', 'daku / daku+daku', 'belum', 204),
('K5-0205', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八百（はっぴゃく）', '["tiga ratus", "enam ratus", "delapan ratus", "delapan orang"]'::jsonb, 2, '八百 dibaca はっぴゃく, artinya "delapan ratus".', 'makna sekanji', 'belum', 205),
('K5-0206', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八百', '["はっぴゃく", "はぴやく", "はぴゃく", "はっぴやく"]'::jsonb, 0, '八百 artinya "delapan ratus", dibaca はっぴゃく.', 'sokuon- / youon / sokuon-+youon', 'belum', 206),
('K5-0207', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百円（ひゃくえん）', '["seratus tahun", "seratus yen", "nilai seratus", "seratus orang"]'::jsonb, 1, '百円 dibaca ひゃくえん, artinya "seratus yen".', 'makna sekanji', 'belum', 207),
('K5-0208', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百円', '["ひやくえん", "びゃくえん", "びやくえん", "ひゃくえん"]'::jsonb, 3, '百円 artinya "seratus yen", dibaca ひゃくえん.', 'daku / youon / daku+youon', 'belum', 208),
('K5-0209', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五百円（ごひゃくえん）', '["tiga ratus", "10.000 yen", "uang 1000 yen", "500 yen"]'::jsonb, 3, '五百円 dibaca ごひゃくえん, artinya "500 yen".', 'makna sekanji', 'belum', 209),
('K5-0210', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五百円', '["こひゃくえん", "ごぴゃくえん", "ごひゃくえん", "こぴゃくえん"]'::jsonb, 2, '五百円 artinya "500 yen", dibaca ごひゃくえん.', 'daku / daku+daku', 'belum', 210),
('K5-0211', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百人（ひゃくにん）', '["seratus orang", "seratus tahun", "seratus yen", "nilai seratus"]'::jsonb, 0, '百人 dibaca ひゃくにん, artinya "seratus orang".', 'makna sekanji', 'belum', 211),
('K5-0212', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百人', '["ひやくにん", "ひゃくにん", "ひゃぐにん", "ひやぐにん"]'::jsonb, 1, '百人 artinya "seratus orang", dibaca ひゃくにん.', 'youon / daku / youon+daku', 'belum', 212),
('K5-0213', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
何百（なんびゃく）', '["enam ratus", "beratus-ratus", "seratus orang", "delapan ratus"]'::jsonb, 1, '何百 dibaca なんびゃく, artinya "beratus-ratus".', 'makna sekanji', 'belum', 213),
('K5-0214', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何百', '["にんびゃく", "なんひゃく", "にんひゃく", "なんびゃく"]'::jsonb, 3, '何百 artinya "beratus-ratus", dibaca なんびゃく.', 'vowel / daku / vowel+daku', 'belum', 214),
('K5-0215', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百点（ひゃくてん）', '["nilai seratus", "seratus tahun", "seratus yen", "seratus orang"]'::jsonb, 0, '百点 dibaca ひゃくてん, artinya "nilai seratus".', 'makna sekanji', 'belum', 215),
('K5-0216', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百点', '["びゃくてん", "びやくてん", "ひゃくてん", "ひやくてん"]'::jsonb, 2, '百点 artinya "nilai seratus", dibaca ひゃくてん.', 'daku / youon / daku+youon', 'belum', 216),
('K5-0217', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百年（ひゃくねん）', '["nilai seratus", "seratus yen", "seratus tahun", "seratus orang"]'::jsonb, 2, '百年 dibaca ひゃくねん, artinya "seratus tahun".', 'makna sekanji', 'belum', 217),
('K5-0218', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百年', '["ひゃぐねん", "ひゃくねん", "ひやぐねん", "ひやくねん"]'::jsonb, 1, '百年 artinya "seratus tahun", dibaca ひゃくねん.', 'youon / daku / youon+daku', 'belum', 218),
('K5-0219', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
千（せん）', '["lima orang", "seratus", "yen", "seribu"]'::jsonb, 3, '千 dibaca せん, artinya "seribu".', 'makna se-ranah', 'belum', 219),
('K5-0220', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
千', '["せん", "さん", "ぜん", "そん"]'::jsonb, 0, '千 artinya "seribu", dibaca せん.', 'daku / vowel', 'belum', 220),
('K5-0221', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三千（さんぜん）', '["tiga ribu", "dua ribu", "delapan ribu", "lima ribu"]'::jsonb, 0, '三千 dibaca さんぜん, artinya "tiga ribu".', 'makna sekanji', 'belum', 221),
('K5-0222', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三千', '["さんせん", "ざんせん", "ざんぜん", "さんぜん"]'::jsonb, 3, '三千 artinya "tiga ribu", dibaca さんぜん.', 'daku / daku+daku', 'belum', 222),
('K5-0223', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五千（ごせん）', '["dua ribu", "delapan ribu", "lima ribu", "tiga ribu"]'::jsonb, 2, '五千 dibaca ごせん, artinya "lima ribu".', 'makna sekanji', 'belum', 223),
('K5-0224', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五千', '["こぜん", "ごせん", "ごぜん", "こせん"]'::jsonb, 1, '五千 artinya "lima ribu", dibaca ごせん.', 'daku / daku+daku', 'belum', 224),
('K5-0225', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
八千（はっせん）', '["delapan ribu", "dua ribu", "lima ribu", "tiga ribu"]'::jsonb, 0, '八千 dibaca はっせん, artinya "delapan ribu".', 'makna sekanji', 'belum', 225),
('K5-0226', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
八千', '["ばっせん", "はせん", "ばせん", "はっせん"]'::jsonb, 3, '八千 artinya "delapan ribu", dibaca はっせん.', 'daku / sokuon- / daku+sokuon-', 'belum', 226),
('K5-0227', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
千円（せんえん）', '["dua ribu", "seribu yen", "seribu orang", "seratus yen"]'::jsonb, 1, '千円 dibaca せんえん, artinya "seribu yen".', 'makna sekanji', 'belum', 227),
('K5-0228', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
千円', '["ぜんえん", "ぜんあん", "せんえん", "せんあん"]'::jsonb, 2, '千円 artinya "seribu yen", dibaca せんえん.', 'daku / vowel / daku+vowel', 'belum', 228),
('K5-0229', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
千円札（せんえんさつ）', '["beribu-ribu", "uang 1000 yen", "10.000 yen", "500 yen"]'::jsonb, 1, '千円札 dibaca せんえんさつ, artinya "uang 1000 yen".', 'makna sekanji', 'belum', 229),
('K5-0230', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
千円札', '["ぜんおんさつ", "せんおんさつ", "ぜんえんさつ", "せんえんさつ"]'::jsonb, 3, '千円札 artinya "uang 1000 yen", dibaca せんえんさつ.', 'daku / vowel / daku+vowel', 'belum', 230),
('K5-0231', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
千人（せんにん）', '["tujuh orang", "lima ribu", "seribu orang", "seribu yen"]'::jsonb, 2, '千人 dibaca せんにん, artinya "seribu orang".', 'makna sekanji', 'belum', 231),
('K5-0232', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
千人', '["せんにん", "ぜんぬん", "せんぬん", "ぜんにん"]'::jsonb, 0, '千人 artinya "seribu orang", dibaca せんにん.', 'daku / vowel / daku+vowel', 'belum', 232),
('K5-0233', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
何千（なんぜん）', '["seribu orang", "beribu-ribu", "tiga ribu", "lima ribu"]'::jsonb, 1, '何千 dibaca なんぜん, artinya "beribu-ribu".', 'makna sekanji', 'belum', 233),
('K5-0234', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何千', '["なんぜん", "なんせん", "ぬんせん", "ぬんぜん"]'::jsonb, 0, '何千 artinya "beribu-ribu", dibaca なんぜん.', 'vowel / daku / vowel+daku', 'belum', 234),
('K5-0235', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
千葉（ちば）', '["dua ribu", "beribu-ribu", "seribu orang", "Chiba"]'::jsonb, 3, '千葉 dibaca ちば, artinya "Chiba".', 'makna sekanji', 'belum', 235),
('K5-0236', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
千葉', '["つば", "つぱ", "ちば", "ちぱ"]'::jsonb, 2, '千葉 artinya "Chiba", dibaca ちば.', 'vowel / daku / vowel+daku', 'belum', 236),
('K5-0237', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一万（いちまん）', '["lima puluh ribu", "tiga puluh ribu", "seratus ribu", "sepuluh ribu"]'::jsonb, 3, '一万 dibaca いちまん, artinya "sepuluh ribu".', 'makna sekanji', 'belum', 237),
('K5-0238', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一万', '["いちまん", "いっちまん", "えちまん", "えっちまん"]'::jsonb, 0, '一万 artinya "sepuluh ribu", dibaca いちまん.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 238),
('K5-0239', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十万（じゅうまん）', '["lima puluh ribu", "seratus ribu", "tiga puluh ribu", "berpuluh ribu"]'::jsonb, 1, '十万 dibaca じゅうまん, artinya "seratus ribu".', 'makna sekanji', 'belum', 239),
('K5-0240', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十万', '["しゆうまん", "じゆうまん", "じゅうまん", "しゅうまん"]'::jsonb, 2, '十万 artinya "seratus ribu", dibaca じゅうまん.', 'daku / youon / daku+youon', 'belum', 240),
('K5-0241', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
百万（ひゃくまん）', '["satu juta", "seratus ribu", "berpuluh ribu", "sepuluh ribu"]'::jsonb, 0, '百万 dibaca ひゃくまん, artinya "satu juta".', 'makna sekanji', 'belum', 241),
('K5-0242', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
百万', '["びやくまん", "ひゃくまん", "びゃくまん", "ひやくまん"]'::jsonb, 1, '百万 artinya "satu juta", dibaca ひゃくまん.', 'daku / youon / daku+youon', 'belum', 242),
('K5-0243', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
一万円（いちまんえん）', '["pulpen", "500 yen", "uang 1000 yen", "10.000 yen"]'::jsonb, 3, '一万円 dibaca いちまんえん, artinya "10.000 yen".', 'makna sekanji', 'belum', 243),
('K5-0244', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一万円', '["いっちまんえん", "えちまんえん", "いちまんえん", "えっちまんえん"]'::jsonb, 2, '一万円 artinya "10.000 yen", dibaca いちまんえん.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 244),
('K5-0245', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
三万（さんまん）', '["berpuluh ribu", "sepuluh ribu", "tiga puluh ribu", "seratus ribu"]'::jsonb, 2, '三万 dibaca さんまん, artinya "tiga puluh ribu".', 'makna sekanji', 'belum', 245),
('K5-0246', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三万', '["さんむん", "さんまん", "ざんむん", "ざんまん"]'::jsonb, 1, '三万 artinya "tiga puluh ribu", dibaca さんまん.', 'daku / vowel / daku+vowel', 'belum', 246),
('K5-0247', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五万（ごまん）', '["seratus ribu", "berpuluh ribu", "tiga puluh ribu", "lima puluh ribu"]'::jsonb, 3, '五万 dibaca ごまん, artinya "lima puluh ribu".', 'makna sekanji', 'belum', 247),
('K5-0248', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五万', '["ごまん", "こまん", "ごもん", "こもん"]'::jsonb, 0, '五万 artinya "lima puluh ribu", dibaca ごまん.', 'daku / vowel / daku+vowel', 'belum', 248),
('K5-0249', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
万年筆（まんねんひつ）', '["10.000 yen", "pulpen", "tiga puluh ribu", "berpuluh ribu"]'::jsonb, 1, '万年筆 dibaca まんねんひつ, artinya "pulpen".', 'makna sekanji', 'belum', 249),
('K5-0250', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
万年筆', '["むんねんひつ", "まんのんひつ", "まんねんひつ", "むんのんひつ"]'::jsonb, 2, '万年筆 artinya "pulpen", dibaca まんねんひつ.', 'vowel / vowel+vowel', 'belum', 250),
('K5-0251', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
万一（まんいち）', '["seandainya", "satu juta", "seratus ribu", "berpuluh ribu"]'::jsonb, 0, '万一 dibaca まんいち, artinya "seandainya".', 'makna sekanji', 'belum', 251),
('K5-0252', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
万一', '["むんあち", "まんあち", "むんいち", "まんいち"]'::jsonb, 3, '万一 artinya "seandainya", dibaca まんいち.', 'vowel / vowel+vowel', 'belum', 252),
('K5-0253', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
万歳（ばんざい）', '["sorak hore", "seandainya", "sepuluh ribu", "lima puluh ribu"]'::jsonb, 0, '万歳 dibaca ばんざい, artinya "sorak hore".', 'makna sekanji', 'belum', 253),
('K5-0254', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
万歳', '["ばんさい", "はんさい", "ばんざい", "はんざい"]'::jsonb, 2, '万歳 artinya "sorak hore", dibaca ばんざい.', 'daku / daku+daku', 'belum', 254),
('K5-0255', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
何万（なんまん）', '["tiga puluh ribu", "seratus ribu", "lima puluh ribu", "berpuluh ribu"]'::jsonb, 3, '何万 dibaca なんまん, artinya "berpuluh ribu".', 'makna sekanji', 'belum', 255),
('K5-0256', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何万', '["にんめん", "なんまん", "にんまん", "なんめん"]'::jsonb, 1, '何万 artinya "berpuluh ribu", dibaca なんまん.', 'vowel / vowel+vowel', 'belum', 256),
('K5-0257', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
円（えん）', '["seribu", "seratus", "yen", "tiga puluh ribu"]'::jsonb, 2, '円 dibaca えん, artinya "yen".', 'makna se-ranah', 'belum', 257),
('K5-0258', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
円', '["えん", "うん", "まる", "いん"]'::jsonb, 0, '円 artinya "yen", dibaca えん. Membacanya まる adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 258),
('K5-0259', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
十円（じゅうえん）', '["seribu yen", "sepuluh yen", "seratus yen", "lima yen"]'::jsonb, 1, '十円 dibaca じゅうえん, artinya "sepuluh yen".', 'makna sekanji', 'belum', 259),
('K5-0260', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
十円', '["しゆうえん", "しゅうえん", "じゆうえん", "じゅうえん"]'::jsonb, 3, '十円 artinya "sepuluh yen", dibaca じゅうえん.', 'daku / youon / daku+youon', 'belum', 260),
('K5-0261', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
五円（ごえん）', '["seribu yen", "seratus yen", "sepuluh yen", "lima yen"]'::jsonb, 3, '五円 dibaca ごえん, artinya "lima yen".', 'makna sekanji', 'belum', 261),
('K5-0262', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
五円', '["こえん", "ごえん", "ごおん", "こおん"]'::jsonb, 1, '五円 artinya "lima yen", dibaca ごえん.', 'daku / vowel / daku+vowel', 'belum', 262),
('K5-0263', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
円い（まるい）', '["bulat", "seratus yen", "yen menguat", "yen melemah"]'::jsonb, 0, '円い dibaca まるい, artinya "bulat".', 'makna sekanji', 'belum', 263),
('K5-0264', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
円い', '["みるい", "えんい", "まるい", "まるうい"]'::jsonb, 2, '円い artinya "bulat", dibaca まるい. Membacanya えんい adalah kekeliruan yang umum.', 'on↔kun / vowel / chouon+', 'belum', 264),
('K5-0265', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
円形（えんけい）', '["bulat", "lima yen", "lingkaran", "yen melemah"]'::jsonb, 2, '円形 dibaca えんけい, artinya "lingkaran".', 'makna sekanji', 'belum', 265),
('K5-0266', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
円形', '["えんけい", "えんげい", "まるけい", "おんけい"]'::jsonb, 0, '円形 artinya "lingkaran", dibaca えんけい. Membacanya まるけい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 266),
('K5-0267', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
円安（えんやす）', '["seribu yen", "yen melemah", "yen menguat", "lima yen"]'::jsonb, 1, '円安 dibaca えんやす, artinya "yen melemah".', 'makna sekanji', 'belum', 267),
('K5-0268', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
円安', '["あんやす", "まるやす", "えんゆす", "えんやす"]'::jsonb, 3, '円安 artinya "yen melemah", dibaca えんやす. Membacanya まるやす adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 268),
('K5-0269', 'N5', 'kanji', 'Arti', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Apa arti kata berikut?
円高（えんだか）', '["seratus yen", "sepuluh yen", "yen melemah", "yen menguat"]'::jsonb, 3, '円高 dibaca えんだか, artinya "yen menguat".', 'makna sekanji', 'belum', 269),
('K5-0270', 'N5', 'kanji', 'Bacaan', 1, 'T01', 'Angka & Uang', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
円高', '["えんたか", "まるだか", "えんだか", "いんだか"]'::jsonb, 2, '円高 artinya "yen menguat", dibaca えんだか. Membacanya まるだか adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 270),
('K5-0271', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
日本（にほん）', '["Jepang", "sinar matahari", "besok", "hari ini"]'::jsonb, 0, '日本 dibaca にほん, artinya "Jepang".', 'makna sekanji', 'belum', 271),
('K5-0272', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日本', '["にぽん", "にほん", "のぽん", "のほん"]'::jsonb, 1, '日本 artinya "Jepang", dibaca にほん.', 'vowel / daku / vowel+daku', 'belum', 272),
('K5-0273', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
毎日（まいにち）', '["buku harian", "setiap hari", "hari ini", "setengah hari"]'::jsonb, 1, '毎日 dibaca まいにち, artinya "setiap hari".', 'makna sekanji', 'belum', 273),
('K5-0274', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎日', '["まえにち", "もいにち", "もえにち", "まいにち"]'::jsonb, 3, '毎日 artinya "setiap hari", dibaca まいにち.', 'vowel / vowel+vowel', 'belum', 274),
('K5-0275', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
今日（きょう）', '["hari ini", "setiap hari", "hari Minggu", "hari kerja"]'::jsonb, 0, '今日 dibaca きょう, artinya "hari ini".', 'makna sekanji', 'belum', 275),
('K5-0276', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今日', '["ぎよう", "ぎょう", "きょう", "きよう"]'::jsonb, 2, '今日 artinya "hari ini", dibaca きょう.', 'daku / youon / daku+youon', 'belum', 276),
('K5-0277', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
明日（あした）', '["setiap hari", "besok", "sinar matahari", "Jepang"]'::jsonb, 1, '明日 dibaca あした, artinya "besok".', 'makna sekanji', 'belum', 277),
('K5-0278', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
明日', '["あした", "うした", "あじた", "うじた"]'::jsonb, 0, '明日 artinya "besok", dibaca あした.', 'vowel / daku / vowel+daku', 'belum', 278),
('K5-0279', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
昨日（きのう）', '["hari ini", "Jepang", "kemarin", "sinar matahari"]'::jsonb, 2, '昨日 dibaca きのう, artinya "kemarin".', 'makna sekanji', 'belum', 279),
('K5-0280', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昨日', '["ぎのう", "きなう", "ぎなう", "きのう"]'::jsonb, 3, '昨日 artinya "kemarin", dibaca きのう.', 'daku / vowel / daku+vowel', 'belum', 280),
('K5-0281', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
日曜日（にちようび）', '["hari Minggu", "hari Selasa", "hari ini", "hari Jumat"]'::jsonb, 0, '日曜日 dibaca にちようび, artinya "hari Minggu".', 'makna sekanji', 'belum', 281),
('K5-0282', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日曜日', '["ねちようび", "ねっちようび", "にっちようび", "にちようび"]'::jsonb, 3, '日曜日 artinya "hari Minggu", dibaca にちようび.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 282),
('K5-0283', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
誕生日（たんじょうび）', '["hari Minggu", "matahari terbit", "ulang tahun", "setengah tahun"]'::jsonb, 2, '誕生日 dibaca たんじょうび, artinya "ulang tahun".', 'makna sekanji', 'belum', 283),
('K5-0284', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
誕生日', '["たんしょうび", "たんじょうび", "だんしょうび", "だんじょうび"]'::jsonb, 1, '誕生日 artinya "ulang tahun", dibaca たんじょうび.', 'daku / daku+daku', 'belum', 284),
('K5-0285', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
日記（にっき）', '["buku harian", "kemarin", "setiap hari", "Jepang"]'::jsonb, 0, '日記 dibaca にっき, artinya "buku harian".', 'makna sekanji', 'belum', 285),
('K5-0286', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日記', '["なき", "にっき", "なっき", "にき"]'::jsonb, 1, '日記 artinya "buku harian", dibaca にっき.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 286),
('K5-0287', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
日の出（ひので）', '["ulang tahun", "sinar matahari", "matahari terbit", "hari Minggu"]'::jsonb, 2, '日の出 dibaca ひので, artinya "matahari terbit".', 'makna sekanji', 'belum', 287),
('K5-0288', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日の出', '["ひのうで", "びので", "びのうで", "ひので"]'::jsonb, 3, '日の出 artinya "matahari terbit", dibaca ひので.', 'daku / chouon+ / daku+chouon+', 'belum', 288),
('K5-0289', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
日光（にっこう）', '["kemarin", "sinar matahari", "hari ini", "Jepang"]'::jsonb, 1, '日光 dibaca にっこう, artinya "sinar matahari".', 'makna sekanji', 'belum', 289),
('K5-0290', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日光', '["にこう", "ねこう", "ねっこう", "にっこう"]'::jsonb, 3, '日光 artinya "sinar matahari", dibaca にっこう.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 290),
('K5-0291', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
月曜日（げつようび）', '["hari Minggu", "hari Sabtu", "hari Senin", "tiga bulan"]'::jsonb, 2, '月曜日 dibaca げつようび, artinya "hari Senin".', 'makna sekanji', 'belum', 291),
('K5-0292', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
月曜日', '["げつようび", "けつようび", "げつうようび", "けつうようび"]'::jsonb, 0, '月曜日 artinya "hari Senin", dibaca げつようび.', 'daku / chouon+ / daku+chouon+', 'belum', 292),
('K5-0293', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
今月（こんげつ）', '["bulan Januari", "bulan lalu", "bulan ini", "bulan depan"]'::jsonb, 2, '今月 dibaca こんげつ, artinya "bulan ini".', 'makna sekanji', 'belum', 293),
('K5-0294', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今月', '["ごんげつ", "こんげつ", "こんけつ", "ごんけつ"]'::jsonb, 1, '今月 artinya "bulan ini", dibaca こんげつ.', 'daku / daku+daku', 'belum', 294),
('K5-0295', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
来月（らいげつ）', '["bulan depan", "bulan Januari", "bulan ini", "bulan purnama"]'::jsonb, 0, '来月 dibaca らいげつ, artinya "bulan depan".', 'makna sekanji', 'belum', 295),
('K5-0296', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来月', '["るいげつ", "らおげつ", "るおげつ", "らいげつ"]'::jsonb, 3, '来月 artinya "bulan depan", dibaca らいげつ.', 'vowel / vowel+vowel', 'belum', 296),
('K5-0297', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
先月（せんげつ）', '["bulan ini", "bulan purnama", "bulan depan", "bulan lalu"]'::jsonb, 3, '先月 dibaca せんげつ, artinya "bulan lalu".', 'makna sekanji', 'belum', 297),
('K5-0298', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先月', '["せんげつ", "せんけつ", "ぜんげつ", "ぜんけつ"]'::jsonb, 0, '先月 artinya "bulan lalu", dibaca せんげつ.', 'daku / daku+daku', 'belum', 298),
('K5-0299', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
毎月（まいつき）', '["melihat bulan", "bulan Januari", "setiap bulan", "bulan purnama"]'::jsonb, 2, '毎月 dibaca まいつき, artinya "setiap bulan".', 'makna sekanji', 'belum', 299),
('K5-0300', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎月', '["まえつき", "まいつき", "むいつき", "むえつき"]'::jsonb, 1, '毎月 artinya "setiap bulan", dibaca まいつき.', 'vowel / vowel+vowel', 'belum', 300),
('K5-0301', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
満月（まんげつ）', '["bulan Januari", "bulan lalu", "bulan purnama", "bulan ini"]'::jsonb, 2, '満月 dibaca まんげつ, artinya "bulan purnama".', 'makna sekanji', 'belum', 301),
('K5-0302', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
満月', '["まんげつ", "むんけつ", "まんけつ", "むんげつ"]'::jsonb, 0, '満月 artinya "bulan purnama", dibaca まんげつ.', 'vowel / daku / vowel+daku', 'belum', 302),
('K5-0303', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
月見（つきみ）', '["bulan purnama", "bulan ini", "setiap bulan", "melihat bulan"]'::jsonb, 3, '月見 dibaca つきみ, artinya "melihat bulan".', 'makna sekanji', 'belum', 303),
('K5-0304', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
月見', '["つぎみ", "つきみ", "つうぎみ", "つうきみ"]'::jsonb, 1, '月見 artinya "melihat bulan", dibaca つきみ.', 'chouon+ / daku / chouon++daku', 'belum', 304),
('K5-0305', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
三ヶ月（さんかげつ）', '["melihat bulan", "setiap bulan", "tiga bulan", "hari Senin"]'::jsonb, 2, '三ヶ月 dibaca さんかげつ, artinya "tiga bulan".', 'makna sekanji', 'belum', 305),
('K5-0306', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
三ヶ月', '["さんかげつ", "ざんがげつ", "ざんかげつ", "さんがげつ"]'::jsonb, 0, '三ヶ月 artinya "tiga bulan", dibaca さんかげつ.', 'daku / daku+daku', 'belum', 306),
('K5-0307', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
月給（げっきゅう）', '["bulan depan", "gaji bulanan", "melihat bulan", "setiap bulan"]'::jsonb, 1, '月給 dibaca げっきゅう, artinya "gaji bulanan".', 'makna sekanji', 'belum', 307),
('K5-0308', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
月給', '["けっきゅう", "げきゅう", "けきゅう", "げっきゅう"]'::jsonb, 3, '月給 artinya "gaji bulanan", dibaca げっきゅう.', 'daku / sokuon- / daku+sokuon-', 'belum', 308),
('K5-0309', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火曜日（かようび）', '["hari Senin", "hari Selasa", "hari Sabtu", "hari Kamis"]'::jsonb, 1, '火曜日 dibaca かようび, artinya "hari Selasa".', 'makna sekanji', 'belum', 309),
('K5-0310', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火曜日', '["がやうび", "かやうび", "がようび", "かようび"]'::jsonb, 3, '火曜日 artinya "hari Selasa", dibaca かようび.', 'daku / vowel / daku+vowel', 'belum', 310),
('K5-0311', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
花火（はなび）', '["kembang api", "menyalakan api", "tenaga api", "percikan api"]'::jsonb, 0, '花火 dibaca はなび, artinya "kembang api".', 'makna sekanji', 'belum', 311),
('K5-0312', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花火', '["はぬひ", "はなひ", "はなび", "はぬび"]'::jsonb, 2, '花火 artinya "kembang api", dibaca はなび.', 'vowel / daku / vowel+daku', 'belum', 312),
('K5-0313', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火事（かじ）', '["menyalakan api", "kembang api", "kebakaran", "planet Mars"]'::jsonb, 2, '火事 dibaca かじ, artinya "kebakaran".', 'makna sekanji', 'belum', 313),
('K5-0314', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火事', '["かじ", "がじ", "かし", "がし"]'::jsonb, 0, '火事 artinya "kebakaran", dibaca かじ.', 'daku / daku+daku', 'belum', 314),
('K5-0315', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火山（かざん）', '["menyalakan api", "gunung berapi", "tenaga api", "percikan api"]'::jsonb, 1, '火山 dibaca かざん, artinya "gunung berapi".', 'makna sekanji', 'belum', 315),
('K5-0316', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火山', '["がざん", "がさん", "かさん", "かざん"]'::jsonb, 3, '火山 artinya "gunung berapi", dibaca かざん.', 'daku / daku+daku', 'belum', 316),
('K5-0317', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
たき火（たきび）', '["kembang api", "api unggun", "alat pemadam", "hari Selasa"]'::jsonb, 1, 'たき火 dibaca たきび, artinya "api unggun".', 'makna sekanji', 'belum', 317),
('K5-0318', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
たき火', '["たぎび", "だぎび", "だきび", "たきび"]'::jsonb, 3, 'たき火 artinya "api unggun", dibaca たきび.', 'daku / daku+daku', 'belum', 318),
('K5-0319', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火力（かりょく）', '["tenaga api", "percikan api", "menyalakan api", "kembang api"]'::jsonb, 0, '火力 dibaca かりょく, artinya "tenaga api".', 'makna sekanji', 'belum', 319),
('K5-0320', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火力', '["がりょうく", "がりょく", "かりょく", "かりょうく"]'::jsonb, 2, '火力 artinya "tenaga api", dibaca かりょく.', 'daku / chouon+ / daku+chouon+', 'belum', 320),
('K5-0321', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
点火（てんか）', '["percikan api", "menyalakan api", "tenaga api", "kembang api"]'::jsonb, 1, '点火 dibaca てんか, artinya "menyalakan api".', 'makna sekanji', 'belum', 321),
('K5-0322', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
点火', '["てんか", "でんか", "でんが", "てんが"]'::jsonb, 0, '点火 artinya "menyalakan api", dibaca てんか.', 'daku / daku+daku', 'belum', 322),
('K5-0323', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
消火器（しょうかき）', '["menyalakan api", "api unggun", "hari Selasa", "alat pemadam"]'::jsonb, 3, '消火器 dibaca しょうかき, artinya "alat pemadam".', 'makna sekanji', 'belum', 323),
('K5-0324', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
消火器', '["じようかき", "しようかき", "しょうかき", "じょうかき"]'::jsonb, 2, '消火器 artinya "alat pemadam", dibaca しょうかき.', 'daku / youon / daku+youon', 'belum', 324),
('K5-0325', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火星（かせい）', '["gunung berapi", "tenaga api", "kebakaran", "planet Mars"]'::jsonb, 3, '火星 dibaca かせい, artinya "planet Mars".', 'makna sekanji', 'belum', 325),
('K5-0326', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火星', '["かぜい", "がぜい", "かせい", "がせい"]'::jsonb, 2, '火星 artinya "planet Mars", dibaca かせい.', 'daku / daku+daku', 'belum', 326),
('K5-0327', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
火花（ひばな）', '["percikan api", "tenaga api", "kembang api", "menyalakan api"]'::jsonb, 0, '火花 dibaca ひばな, artinya "percikan api".', 'makna sekanji', 'belum', 327),
('K5-0328', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
火花', '["ひはな", "ひばな", "ひはね", "ひばね"]'::jsonb, 1, '火花 artinya "percikan api", dibaca ひばな.', 'daku / vowel / daku+vowel', 'belum', 328),
('K5-0329', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水曜日（すいようび）', '["hari Rabu", "hari Minggu", "hari Jumat", "hari Kamis"]'::jsonb, 0, '水曜日 dibaca すいようび, artinya "hari Rabu".', 'makna sekanji', 'belum', 329),
('K5-0330', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水曜日', '["ずいようび", "ずえようび", "すえようび", "すいようび"]'::jsonb, 3, '水曜日 artinya "hari Rabu", dibaca すいようび.', 'daku / vowel / daku+vowel', 'belum', 330),
('K5-0331', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
お水（おみず）', '["air keran", "air minum", "air dingin", "air laut"]'::jsonb, 1, 'お水 dibaca おみず, artinya "air minum".', 'makna sekanji', 'belum', 331),
('K5-0332', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
お水', '["おうまず", "おまず", "おみず", "おうみず"]'::jsonb, 2, 'お水 artinya "air minum", dibaca おみず.', 'chouon+ / vowel / chouon++vowel', 'belum', 332),
('K5-0333', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水道（すいどう）', '["air dingin", "air minum", "air laut", "air keran"]'::jsonb, 3, '水道 dibaca すいどう, artinya "air keran".', 'makna sekanji', 'belum', 333),
('K5-0334', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水道', '["すあどう", "すいどう", "ずあどう", "ずいどう"]'::jsonb, 1, '水道 artinya "air keran", dibaca すいどう.', 'daku / vowel / daku+vowel', 'belum', 334),
('K5-0335', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水泳（すいえい）', '["baju renang", "kadar air", "renang", "air dingin"]'::jsonb, 2, '水泳 dibaca すいえい, artinya "renang".', 'makna sekanji', 'belum', 335),
('K5-0336', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水泳', '["すいえい", "ずええい", "ずいえい", "すええい"]'::jsonb, 0, '水泳 artinya "renang", dibaca すいえい.', 'daku / vowel / daku+vowel', 'belum', 336),
('K5-0337', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水着（みずぎ）', '["baju renang", "air keran", "air dingin", "renang"]'::jsonb, 0, '水着 dibaca みずぎ, artinya "baju renang".', 'makna sekanji', 'belum', 337),
('K5-0338', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水着', '["めすぎ", "めずぎ", "みずぎ", "みすぎ"]'::jsonb, 2, '水着 artinya "baju renang", dibaca みずぎ.', 'vowel / daku / vowel+daku', 'belum', 338),
('K5-0339', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
海水（かいすい）', '["air minum", "air keran", "air dingin", "air laut"]'::jsonb, 3, '海水 dibaca かいすい, artinya "air laut".', 'makna sekanji', 'belum', 339),
('K5-0340', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
海水', '["がいすい", "かいすい", "がえすい", "かえすい"]'::jsonb, 1, '海水 artinya "air laut", dibaca かいすい.', 'daku / vowel / daku+vowel', 'belum', 340),
('K5-0341', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
冷水（れいすい）', '["air keran", "air laut", "air minum", "air dingin"]'::jsonb, 3, '冷水 dibaca れいすい, artinya "air dingin".', 'makna sekanji', 'belum', 341),
('K5-0342', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
冷水', '["れいすい", "れすい", "りすい", "りいすい"]'::jsonb, 0, '冷水 artinya "air dingin", dibaca れいすい.', 'vowel / chouon- / vowel+chouon-', 'belum', 342),
('K5-0343', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水分（すいぶん）', '["air minum", "dalam air", "kadar air", "air laut"]'::jsonb, 2, '水分 dibaca すいぶん, artinya "kadar air".', 'makna sekanji', 'belum', 343),
('K5-0344', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水分', '["すあぶん", "すいぶん", "ずあぶん", "ずいぶん"]'::jsonb, 1, '水分 artinya "kadar air", dibaca すいぶん.', 'daku / vowel / daku+vowel', 'belum', 344),
('K5-0345', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
香水（こうすい）', '["parfum", "renang", "air keran", "kadar air"]'::jsonb, 0, '香水 dibaca こうすい, artinya "parfum".', 'makna sekanji', 'belum', 345),
('K5-0346', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
香水', '["ごすい", "ごうすい", "こすい", "こうすい"]'::jsonb, 3, '香水 artinya "parfum", dibaca こうすい.', 'daku / chouon- / daku+chouon-', 'belum', 346),
('K5-0347', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
水中（すいちゅう）', '["kadar air", "dalam air", "air dingin", "air laut"]'::jsonb, 1, '水中 dibaca すいちゅう, artinya "dalam air".', 'makna sekanji', 'belum', 347),
('K5-0348', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
水中', '["ずうちゅう", "すうちゅう", "すいちゅう", "ずいちゅう"]'::jsonb, 2, '水中 artinya "dalam air", dibaca すいちゅう.', 'daku / vowel / daku+vowel', 'belum', 348),
('K5-0349', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木曜日（もくようび）', '["daun pohon", "hari Selasa", "hari Kamis", "hari Minggu"]'::jsonb, 2, '木曜日 dibaca もくようび, artinya "hari Kamis".', 'makna sekanji', 'belum', 349),
('K5-0350', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木曜日', '["もぐようび", "もくようび", "もうくようび", "きようび"]'::jsonb, 1, '木曜日 artinya "hari Kamis", dibaca もくようび. Membacanya きようび adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 350),
('K5-0351', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木（き）', '["minggu ini", "tanah", "antara", "pohon"]'::jsonb, 3, '木 dibaca き, artinya "pohon".', 'makna se-ranah', 'belum', 351),
('K5-0352', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木', '["き", "か", "ぎ", "もく"]'::jsonb, 0, '木 artinya "pohon", dibaca き. Membacanya もく adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 352),
('K5-0353', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
大木（たいぼく）', '["deretan pohon", "berbahan kayu", "pohon besar", "sebagian besar"]'::jsonb, 2, '大木 dibaca たいぼく, artinya "pohon besar".', 'makna sekanji', 'belum', 353),
('K5-0354', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大木', '["だいぼく", "たいぼく", "たうぼく", "だうぼく"]'::jsonb, 1, '大木 artinya "pohon besar", dibaca たいぼく.', 'daku / vowel / daku+vowel', 'belum', 354),
('K5-0355', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木材（もくざい）', '["buatan kayu", "deretan pohon", "tanaman pot", "bahan kayu"]'::jsonb, 3, '木材 dibaca もくざい, artinya "bahan kayu".', 'makna sekanji', 'belum', 355),
('K5-0356', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木材', '["もくざい", "もうくざい", "きざい", "もぐざい"]'::jsonb, 0, '木材 artinya "bahan kayu", dibaca もくざい. Membacanya きざい adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 356),
('K5-0357', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
植木（うえき）', '["bahan kayu", "pohon besar", "tanaman pot", "berbahan kayu"]'::jsonb, 2, '植木 dibaca うえき, artinya "tanaman pot".', 'makna sekanji', 'belum', 357),
('K5-0358', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
植木', '["いおき", "うおき", "いえき", "うえき"]'::jsonb, 3, '植木 artinya "tanaman pot", dibaca うえき.', 'vowel / vowel+vowel', 'belum', 358),
('K5-0359', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木造（もくぞう）', '["berbahan kayu", "deretan pohon", "buatan kayu", "pohon besar"]'::jsonb, 0, '木造 dibaca もくぞう, artinya "berbahan kayu".', 'makna sekanji', 'belum', 359),
('K5-0360', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木造', '["もうくぞう", "もくぞう", "もぐぞう", "きぞう"]'::jsonb, 1, '木造 artinya "berbahan kayu", dibaca もくぞう. Membacanya きぞう adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 360),
('K5-0361', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
並木（なみき）', '["bahan kayu", "daun pohon", "pohon besar", "deretan pohon"]'::jsonb, 3, '並木 dibaca なみき, artinya "deretan pohon".', 'makna sekanji', 'belum', 361),
('K5-0362', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
並木', '["なもき", "にもき", "なみき", "にみき"]'::jsonb, 2, '並木 artinya "deretan pohon", dibaca なみき.', 'vowel / vowel+vowel', 'belum', 362),
('K5-0363', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木製（もくせい）', '["buatan kayu", "berbahan kayu", "kayu bahan", "bahan kayu"]'::jsonb, 0, '木製 dibaca もくせい, artinya "buatan kayu".', 'makna sekanji', 'belum', 363),
('K5-0364', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木製', '["もうくせい", "もくせい", "もぐせい", "きせい"]'::jsonb, 1, '木製 artinya "buatan kayu", dibaca もくせい. Membacanya きせい adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 364),
('K5-0365', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
材木（ざいもく）', '["kayu bahan", "tanaman pot", "buatan kayu", "pohon besar"]'::jsonb, 0, '材木 dibaca ざいもく, artinya "kayu bahan".', 'makna sekanji', 'belum', 365),
('K5-0366', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
材木', '["ざえもく", "さえもく", "ざいもく", "さいもく"]'::jsonb, 2, '材木 artinya "kayu bahan", dibaca ざいもく.', 'daku / vowel / daku+vowel', 'belum', 366),
('K5-0367', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
木の葉（このは）', '["deretan pohon", "daun pohon", "hari Kamis", "pohon besar"]'::jsonb, 1, '木の葉 dibaca このは, artinya "daun pohon".', 'makna sekanji', 'belum', 367),
('K5-0368', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
木の葉', '["このうは", "ごのは", "ごのうは", "このは"]'::jsonb, 3, '木の葉 artinya "daun pohon", dibaca このは.', 'daku / chouon+ / daku+chouon+', 'belum', 368),
('K5-0369', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
金曜日（きんようび）', '["hari Jumat", "hari Rabu", "hari Selasa", "orang kaya"]'::jsonb, 0, '金曜日 dibaca きんようび, artinya "hari Jumat".', 'makna sekanji', 'belum', 369),
('K5-0370', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
金曜日', '["ぎんやうび", "きんようび", "きんやうび", "ぎんようび"]'::jsonb, 1, '金曜日 artinya "hari Jumat", dibaca きんようび.', 'daku / vowel / daku+vowel', 'belum', 370),
('K5-0371', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
お金（おかね）', '["pajak", "uang tunai", "uang", "biaya / tarif"]'::jsonb, 2, 'お金 dibaca おかね, artinya "uang".', 'makna sekanji', 'belum', 371),
('K5-0372', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
お金', '["おがね", "おうかね", "おうがね", "おかね"]'::jsonb, 3, 'お金 artinya "uang", dibaca おかね.', 'chouon+ / daku / chouon++daku', 'belum', 372),
('K5-0373', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
金持ち（かねもち）', '["logam", "hari Jumat", "orang kaya", "ikan mas"]'::jsonb, 2, '金持ち dibaca かねもち, artinya "orang kaya".', 'makna sekanji', 'belum', 373),
('K5-0374', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
金持ち', '["がぬもち", "がねもち", "かぬもち", "かねもち"]'::jsonb, 3, '金持ち artinya "orang kaya", dibaca かねもち.', 'daku / vowel / daku+vowel', 'belum', 374),
('K5-0375', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
現金（げんきん）', '["logam", "uang tunai", "uang", "ikan mas"]'::jsonb, 1, '現金 dibaca げんきん, artinya "uang tunai".', 'makna sekanji', 'belum', 375),
('K5-0376', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
現金', '["げんきん", "けんきん", "けんぎん", "げんぎん"]'::jsonb, 0, '現金 artinya "uang tunai", dibaca げんきん.', 'daku / daku+daku', 'belum', 376),
('K5-0377', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
金魚（きんぎょ）', '["uang tunai", "tabungan", "ikan mas", "warna emas"]'::jsonb, 2, '金魚 dibaca きんぎょ, artinya "ikan mas".', 'makna sekanji', 'belum', 377),
('K5-0378', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
金魚', '["ぎんぎょ", "きんぎょ", "ぎんきょ", "きんきょ"]'::jsonb, 1, '金魚 artinya "ikan mas", dibaca きんぎょ.', 'daku / daku+daku', 'belum', 378),
('K5-0379', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
料金（りょうきん）', '["biaya / tarif", "ikan mas", "warna emas", "pajak"]'::jsonb, 0, '料金 dibaca りょうきん, artinya "biaya / tarif".', 'makna sekanji', 'belum', 379),
('K5-0380', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
料金', '["りようきん", "りょきん", "りよきん", "りょうきん"]'::jsonb, 3, '料金 artinya "biaya / tarif", dibaca りょうきん.', 'youon / chouon- / youon+chouon-', 'belum', 380),
('K5-0381', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
税金（ぜいきん）', '["ikan mas", "uang", "pajak", "logam"]'::jsonb, 2, '税金 dibaca ぜいきん, artinya "pajak".', 'makna sekanji', 'belum', 381),
('K5-0382', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
税金', '["せいきん", "ぜきん", "せきん", "ぜいきん"]'::jsonb, 3, '税金 artinya "pajak", dibaca ぜいきん.', 'daku / chouon- / daku+chouon-', 'belum', 382),
('K5-0383', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
金色（きんいろ）', '["warna emas", "tabungan", "ikan mas", "biaya / tarif"]'::jsonb, 0, '金色 dibaca きんいろ, artinya "warna emas".', 'makna sekanji', 'belum', 383),
('K5-0384', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
金色', '["きんうろ", "きんいろ", "ぎんいろ", "ぎんうろ"]'::jsonb, 1, '金色 artinya "warna emas", dibaca きんいろ.', 'daku / vowel / daku+vowel', 'belum', 384),
('K5-0385', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
貯金（ちょきん）', '["warna emas", "tabungan", "biaya / tarif", "uang tunai"]'::jsonb, 1, '貯金 dibaca ちょきん, artinya "tabungan".', 'makna sekanji', 'belum', 385),
('K5-0386', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
貯金', '["ちょぎん", "ちょうぎん", "ちょきん", "ちょうきん"]'::jsonb, 2, '貯金 artinya "tabungan", dibaca ちょきん.', 'chouon+ / daku / chouon++daku', 'belum', 386),
('K5-0387', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
金属（きんぞく）', '["logam", "pajak", "ikan mas", "warna emas"]'::jsonb, 0, '金属 dibaca きんぞく, artinya "logam".', 'makna sekanji', 'belum', 387),
('K5-0388', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
金属', '["ぎんぞく", "ぎんそく", "きんそく", "きんぞく"]'::jsonb, 3, '金属 artinya "logam", dibaca きんぞく.', 'daku / daku+daku', 'belum', 388),
('K5-0389', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
土曜日（どようび）', '["hari Sabtu", "oleh-oleh", "hari Kamis", "hari Senin"]'::jsonb, 0, '土曜日 dibaca どようび, artinya "hari Sabtu".', 'makna sekanji', 'belum', 389),
('K5-0390', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
土曜日', '["どゆうび", "どようび", "とゆうび", "とようび"]'::jsonb, 1, '土曜日 artinya "hari Sabtu", dibaca どようび.', 'daku / vowel / daku+vowel', 'belum', 390),
('K5-0391', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
土（つち）', '["antara", "daun pohon", "tanah", "pohon"]'::jsonb, 2, '土 dibaca つち, artinya "tanah".', 'makna se-ranah', 'belum', 391),
('K5-0392', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
土', '["つうち", "つっち", "つうっち", "つち"]'::jsonb, 3, '土 artinya "tanah", dibaca つち.', 'chouon+ / sokuon+ / chouon++sokuon+', 'belum', 392),
('K5-0393', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
土地（とち）', '["wilayah negara", "kampung halaman", "tanah merah", "lahan"]'::jsonb, 3, '土地 dibaca とち, artinya "lahan".', 'makna sekanji', 'belum', 393),
('K5-0394', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
土地', '["どっち", "とち", "どち", "とっち"]'::jsonb, 1, '土地 artinya "lahan", dibaca とち.', 'daku / sokuon+ / daku+sokuon+', 'belum', 394),
('K5-0395', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
国土（こくど）', '["tanah merah", "lahan", "wilayah negara", "teknik sipil"]'::jsonb, 2, '国土 dibaca こくど, artinya "wilayah negara".', 'makna sekanji', 'belum', 395),
('K5-0396', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国土', '["こくど", "こぐど", "ごぐど", "ごくど"]'::jsonb, 0, '国土 artinya "wilayah negara", dibaca こくど.', 'daku / daku+daku', 'belum', 396),
('K5-0397', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
お土産（おみやげ）', '["hari Sabtu", "oleh-oleh", "kampung halaman", "wilayah negara"]'::jsonb, 1, 'お土産 dibaca おみやげ, artinya "oleh-oleh".', 'makna sekanji', 'belum', 397),
('K5-0398', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
お土産', '["おめやげ", "おうめやげ", "おうみやげ", "おみやげ"]'::jsonb, 3, 'お土産 artinya "oleh-oleh", dibaca おみやげ.', 'chouon+ / vowel / chouon++vowel', 'belum', 398),
('K5-0399', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
粘土（ねんど）', '["tanah liat", "planet Saturnus", "kampung halaman", "tanah merah"]'::jsonb, 0, '粘土 dibaca ねんど, artinya "tanah liat".', 'makna sekanji', 'belum', 399),
('K5-0400', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
粘土', '["のんと", "のんど", "ねんど", "ねんと"]'::jsonb, 2, '粘土 artinya "tanah liat", dibaca ねんど.', 'vowel / daku / vowel+daku', 'belum', 400)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-0401', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
土木（どぼく）', '["planet Saturnus", "teknik sipil", "tanah liat", "lahan"]'::jsonb, 1, '土木 dibaca どぼく, artinya "teknik sipil".', 'makna sekanji', 'belum', 401),
('K5-0402', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
土木', '["どぼく", "とぼく", "とほく", "どほく"]'::jsonb, 0, '土木 artinya "teknik sipil", dibaca どぼく.', 'daku / daku+daku', 'belum', 402),
('K5-0403', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
土星（どせい）', '["lahan", "teknik sipil", "tanah merah", "planet Saturnus"]'::jsonb, 3, '土星 dibaca どせい, artinya "planet Saturnus".', 'makna sekanji', 'belum', 403),
('K5-0404', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
土星', '["どぜい", "とぜい", "どせい", "とせい"]'::jsonb, 2, '土星 artinya "planet Saturnus", dibaca どせい.', 'daku / daku+daku', 'belum', 404),
('K5-0405', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
郷土（きょうど）', '["wilayah negara", "kampung halaman", "tanah liat", "lahan"]'::jsonb, 1, '郷土 dibaca きょうど, artinya "kampung halaman".', 'makna sekanji', 'belum', 405),
('K5-0406', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
郷土', '["きょうど", "きようど", "ぎょうど", "ぎようど"]'::jsonb, 0, '郷土 artinya "kampung halaman", dibaca きょうど.', 'daku / youon / daku+youon', 'belum', 406),
('K5-0407', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
赤土（あかつち）', '["tanah liat", "planet Saturnus", "wilayah negara", "tanah merah"]'::jsonb, 3, '赤土 dibaca あかつち, artinya "tanah merah".', 'makna sekanji', 'belum', 407),
('K5-0408', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
赤土', '["うがつち", "あがつち", "あかつち", "うかつち"]'::jsonb, 2, '赤土 artinya "tanah merah", dibaca あかつち.', 'vowel / daku / vowel+daku', 'belum', 408),
('K5-0409', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
今年（ことし）', '["tahun depan", "tahun baru", "tahun ini", "tahun lalu"]'::jsonb, 2, '今年 dibaca ことし, artinya "tahun ini".', 'makna sekanji', 'belum', 409),
('K5-0410', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今年', '["こどし", "ことし", "ごとし", "ごどし"]'::jsonb, 1, '今年 artinya "tahun ini", dibaca ことし.', 'daku / daku+daku', 'belum', 410),
('K5-0411', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
去年（きょねん）', '["tahun ini", "tahun baru", "tahun depan", "tahun lalu"]'::jsonb, 3, '去年 dibaca きょねん, artinya "tahun lalu".', 'makna sekanji', 'belum', 411),
('K5-0412', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
去年', '["きょねん", "ぎょねん", "ぎょうねん", "きょうねん"]'::jsonb, 0, '去年 artinya "tahun lalu", dibaca きょねん.', 'daku / chouon+ / daku+chouon+', 'belum', 412),
('K5-0413', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
来年（らいねん）', '["tahun baru", "tahun ini", "tahun depan", "tahun lalu"]'::jsonb, 2, '来年 dibaca らいねん, artinya "tahun depan".', 'makna sekanji', 'belum', 413),
('K5-0414', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来年', '["らあねん", "らいねん", "れいねん", "れあねん"]'::jsonb, 1, '来年 artinya "tahun depan", dibaca らいねん.', 'vowel / vowel+vowel', 'belum', 414),
('K5-0415', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
毎年（まいとし）', '["setiap tahun", "tahun lalu", "tahun ini", "tahun baru"]'::jsonb, 0, '毎年 dibaca まいとし, artinya "setiap tahun".', 'makna sekanji', 'belum', 415),
('K5-0416', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎年', '["もいとし", "もえとし", "まえとし", "まいとし"]'::jsonb, 3, '毎年 artinya "setiap tahun", dibaca まいとし.', 'vowel / vowel+vowel', 'belum', 416),
('K5-0417', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
年齢（ねんれい）', '["tahun depan", "lebih tua", "usia", "setiap tahun"]'::jsonb, 2, '年齢 dibaca ねんれい, artinya "usia".', 'makna sekanji', 'belum', 417),
('K5-0418', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
年齢', '["のんろい", "ねんろい", "のんれい", "ねんれい"]'::jsonb, 3, '年齢 artinya "usia", dibaca ねんれい.', 'vowel / vowel+vowel', 'belum', 418),
('K5-0419', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
少年（しょうねん）', '["anak laki-laki", "lebih tua", "tingkat kelas", "usia"]'::jsonb, 0, '少年 dibaca しょうねん, artinya "anak laki-laki".', 'makna sekanji', 'belum', 419),
('K5-0420', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
少年', '["じょうねん", "しょうねん", "しようねん", "じようねん"]'::jsonb, 1, '少年 artinya "anak laki-laki", dibaca しょうねん.', 'daku / youon / daku+youon', 'belum', 420),
('K5-0421', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
年上（としうえ）', '["lebih tua", "tahun ini", "lebih muda", "usia"]'::jsonb, 0, '年上 dibaca としうえ, artinya "lebih tua".', 'makna sekanji', 'belum', 421),
('K5-0422', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
年上', '["どじうえ", "どしうえ", "としうえ", "とじうえ"]'::jsonb, 2, '年上 artinya "lebih tua", dibaca としうえ.', 'daku / daku+daku', 'belum', 422),
('K5-0423', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
学年（がくねん）', '["tahun ini", "tahun lalu", "usia", "tingkat kelas"]'::jsonb, 3, '学年 dibaca がくねん, artinya "tingkat kelas".', 'makna sekanji', 'belum', 423),
('K5-0424', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学年', '["かぐねん", "がくねん", "かくねん", "がぐねん"]'::jsonb, 1, '学年 artinya "tingkat kelas", dibaca がくねん.', 'daku / daku+daku', 'belum', 424),
('K5-0425', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
新年（しんねん）', '["tahun lalu", "tahun ini", "tahun baru", "tahun depan"]'::jsonb, 2, '新年 dibaca しんねん, artinya "tahun baru".', 'makna sekanji', 'belum', 425),
('K5-0426', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新年', '["じんねん", "しんねん", "しんなん", "じんなん"]'::jsonb, 1, '新年 artinya "tahun baru", dibaca しんねん.', 'daku / vowel / daku+vowel', 'belum', 426),
('K5-0427', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
年下（としした）', '["lebih muda", "tahun ini", "lebih tua", "anak laki-laki"]'::jsonb, 0, '年下 dibaca としした, artinya "lebih muda".', 'makna sekanji', 'belum', 427),
('K5-0428', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
年下', '["とじした", "どしした", "どじした", "としした"]'::jsonb, 3, '年下 artinya "lebih muda", dibaca としした.', 'daku / daku+daku', 'belum', 428),
('K5-0429', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時間（じかん）', '["jam (alat)", "waktu", "perbedaan waktu", "waktu itu"]'::jsonb, 1, '時間 dibaca じかん, artinya "waktu".', 'makna sekanji', 'belum', 429),
('K5-0430', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時間', '["じかん", "しがん", "じがん", "しかん"]'::jsonb, 0, '時間 artinya "waktu", dibaca じかん.', 'daku / daku+daku', 'belum', 430),
('K5-0431', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時計（とけい）', '["kadang-kadang", "kecepatan / jam", "jam berapa", "jam (alat)"]'::jsonb, 3, '時計 dibaca とけい, artinya "jam (alat)".', 'makna sekanji', 'belum', 431),
('K5-0432', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時計', '["どけい", "とげい", "とけい", "どげい"]'::jsonb, 2, '時計 artinya "jam (alat)", dibaca とけい.', 'daku / daku+daku', 'belum', 432),
('K5-0433', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
何時（なんじ）', '["kecepatan / jam", "bersamaan", "jam (alat)", "jam berapa"]'::jsonb, 3, '何時 dibaca なんじ, artinya "jam berapa".', 'makna sekanji', 'belum', 433),
('K5-0434', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何時', '["ぬんし", "なんし", "なんじ", "ぬんじ"]'::jsonb, 2, '何時 artinya "jam berapa", dibaca なんじ.', 'vowel / daku / vowel+daku', 'belum', 434),
('K5-0435', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時々（ときどき）', '["bersamaan", "kadang-kadang", "periode", "zaman"]'::jsonb, 1, '時々 dibaca ときどき, artinya "kadang-kadang".', 'makna sekanji', 'belum', 435),
('K5-0436', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時々', '["ときどき", "とぎどき", "どきどき", "どぎどき"]'::jsonb, 0, '時々 artinya "kadang-kadang", dibaca ときどき.', 'daku / daku+daku', 'belum', 436),
('K5-0437', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時代（じだい）', '["zaman", "jam (alat)", "waktu itu", "kecepatan / jam"]'::jsonb, 0, '時代 dibaca じだい, artinya "zaman".', 'makna sekanji', 'belum', 437),
('K5-0438', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時代', '["したい", "しだい", "じだい", "じたい"]'::jsonb, 2, '時代 artinya "zaman", dibaca じだい.', 'daku / daku+daku', 'belum', 438),
('K5-0439', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
同時（どうじ）', '["jam berapa", "bersamaan", "kadang-kadang", "jam (alat)"]'::jsonb, 1, '同時 dibaca どうじ, artinya "bersamaan".', 'makna sekanji', 'belum', 439),
('K5-0440', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
同時', '["どじ", "とじ", "とうじ", "どうじ"]'::jsonb, 3, '同時 artinya "bersamaan", dibaca どうじ.', 'daku / chouon- / daku+chouon-', 'belum', 440),
('K5-0441', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
当時（とうじ）', '["waktu", "bersamaan", "perbedaan waktu", "waktu itu"]'::jsonb, 3, '当時 dibaca とうじ, artinya "waktu itu".', 'makna sekanji', 'belum', 441),
('K5-0442', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
当時', '["とうじ", "とじ", "どじ", "どうじ"]'::jsonb, 0, '当時 artinya "waktu itu", dibaca とうじ.', 'daku / chouon- / daku+chouon-', 'belum', 442),
('K5-0443', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時差（じさ）', '["jangka waktu", "waktu", "perbedaan waktu", "waktu itu"]'::jsonb, 2, '時差 dibaca じさ, artinya "perbedaan waktu".', 'makna sekanji', 'belum', 443),
('K5-0444', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時差', '["しざ", "じさ", "じざ", "しさ"]'::jsonb, 1, '時差 artinya "perbedaan waktu", dibaca じさ.', 'daku / daku+daku', 'belum', 444),
('K5-0445', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時期（じき）', '["bersamaan", "jam berapa", "waktu itu", "periode"]'::jsonb, 3, '時期 dibaca じき, artinya "periode".', 'makna sekanji', 'belum', 445),
('K5-0446', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時期', '["じぎ", "しき", "じき", "しぎ"]'::jsonb, 2, '時期 artinya "periode", dibaca じき.', 'daku / daku+daku', 'belum', 446),
('K5-0447', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
時速（じそく）', '["jam berapa", "kecepatan / jam", "jam (alat)", "zaman"]'::jsonb, 1, '時速 dibaca じそく, artinya "kecepatan / jam".', 'makna sekanji', 'belum', 447),
('K5-0448', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
時速', '["じそく", "しぞく", "しそく", "じぞく"]'::jsonb, 0, '時速 artinya "kecepatan / jam", dibaca じそく.', 'daku / daku+daku', 'belum', 448),
('K5-0449', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
一分（いっぷん）', '["lima menit", "suasana hati", "satu menit", "berapa menit"]'::jsonb, 2, '一分 dibaca いっぷん, artinya "satu menit".', 'makna sekanji', 'belum', 449),
('K5-0450', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一分', '["いっぷん", "いぷん", "あっぷん", "あぷん"]'::jsonb, 0, '一分 artinya "satu menit", dibaca いっぷん.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 450),
('K5-0451', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
何分（なんぷん）', '["lima menit", "cukup", "satu menit", "berapa menit"]'::jsonb, 3, '何分 dibaca なんぷん, artinya "berapa menit".', 'makna sekanji', 'belum', 451),
('K5-0452', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何分', '["なんぶん", "なんぷん", "ねんぷん", "ねんぶん"]'::jsonb, 1, '何分 artinya "berapa menit", dibaca なんぷん.', 'vowel / daku / vowel+daku', 'belum', 452),
('K5-0453', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半分（はんぶん）', '["setengah hari", "setengah", "bagian", "berapa menit"]'::jsonb, 1, '半分 dibaca はんぶん, artinya "setengah".', 'makna sekanji', 'belum', 453),
('K5-0454', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半分', '["ばんぶん", "はんふん", "はんぶん", "ばんふん"]'::jsonb, 2, '半分 artinya "setengah", dibaca はんぶん.', 'daku / daku+daku', 'belum', 454),
('K5-0455', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
自分（じぶん）', '["cukup", "berapa menit", "suasana hati", "diri sendiri"]'::jsonb, 3, '自分 dibaca じぶん, artinya "diri sendiri".', 'makna sekanji', 'belum', 455),
('K5-0456', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
自分', '["じぶん", "しぶん", "しふん", "じふん"]'::jsonb, 0, '自分 artinya "diri sendiri", dibaca じぶん.', 'daku / daku+daku', 'belum', 456),
('K5-0457', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
分かる（わかる）', '["lima menit", "membagi", "mengerti", "cukup"]'::jsonb, 2, '分かる dibaca わかる, artinya "mengerti".', 'makna sekanji', 'belum', 457),
('K5-0458', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
分かる', '["わかるう", "わがる", "わがるう", "わかる"]'::jsonb, 3, '分かる artinya "mengerti", dibaca わかる.', 'daku / chouon+ / daku+chouon+', 'belum', 458),
('K5-0459', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
気分（きぶん）', '["bagian", "suasana hati", "berapa menit", "diri sendiri"]'::jsonb, 1, '気分 dibaca きぶん, artinya "suasana hati".', 'makna sekanji', 'belum', 459),
('K5-0460', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気分', '["きぶん", "きふん", "ぎぶん", "ぎふん"]'::jsonb, 0, '気分 artinya "suasana hati", dibaca きぶん.', 'daku / daku+daku', 'belum', 460),
('K5-0461', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
分ける（わける）', '["berapa menit", "membagi", "mengerti", "diri sendiri"]'::jsonb, 1, '分ける dibaca わける, artinya "membagi".', 'makna sekanji', 'belum', 461),
('K5-0462', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
分ける', '["わげるう", "わげる", "わける", "わけるう"]'::jsonb, 2, '分ける artinya "membagi", dibaca わける.', 'daku / chouon+ / daku+chouon+', 'belum', 462),
('K5-0463', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
部分（ぶぶん）', '["bagian", "setengah", "satu menit", "diri sendiri"]'::jsonb, 0, '部分 dibaca ぶぶん, artinya "bagian".', 'makna sekanji', 'belum', 463),
('K5-0464', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
部分', '["ぶぷん", "ぶふん", "ふぶん", "ぶぶん"]'::jsonb, 3, '部分 artinya "bagian", dibaca ぶぶん.', 'daku', 'belum', 464),
('K5-0465', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半年（はんとし）', '["setengah harga", "setengah", "setengah bulan", "setengah tahun"]'::jsonb, 3, '半年 dibaca はんとし, artinya "setengah tahun".', 'makna sekanji', 'belum', 465),
('K5-0466', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半年', '["ばんとし", "ばんどし", "はんとし", "はんどし"]'::jsonb, 2, '半年 artinya "setengah tahun", dibaca はんとし.', 'daku / daku+daku', 'belum', 466),
('K5-0467', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
一時半（いちじはん）', '["jam 1.30", "sebagian besar", "semenanjung", "jam (alat)"]'::jsonb, 0, '一時半 dibaca いちじはん, artinya "jam 1.30".', 'makna sekanji', 'belum', 467),
('K5-0468', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一時半', '["いっちじはん", "いちじはん", "えちじはん", "えっちじはん"]'::jsonb, 1, '一時半 artinya "jam 1.30", dibaca いちじはん.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 468),
('K5-0469', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半日（はんにち）', '["setengah bulan", "setengah hari", "setengah tahun", "setengah"]'::jsonb, 1, '半日 dibaca はんにち, artinya "setengah hari".', 'makna sekanji', 'belum', 469),
('K5-0470', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半日', '["はんねっち", "はんにっち", "はんにち", "はんねち"]'::jsonb, 2, '半日 artinya "setengah hari", dibaca はんにち.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 470),
('K5-0471', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
前半（ぜんはん）', '["setengah hari", "sebagian besar", "babak kedua", "babak pertama"]'::jsonb, 3, '前半 dibaca ぜんはん, artinya "babak pertama".', 'makna sekanji', 'belum', 471),
('K5-0472', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前半', '["ぜんはん", "せんぱん", "ぜんぱん", "せんはん"]'::jsonb, 0, '前半 artinya "babak pertama", dibaca ぜんはん.', 'daku / daku+daku', 'belum', 472),
('K5-0473', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
後半（こうはん）', '["babak kedua", "sebagian besar", "setengah hari", "babak pertama"]'::jsonb, 0, '後半 dibaca こうはん, artinya "babak kedua".', 'makna sekanji', 'belum', 473),
('K5-0474', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
後半', '["ごはん", "ごうはん", "こはん", "こうはん"]'::jsonb, 3, '後半 artinya "babak kedua", dibaca こうはん.', 'daku / chouon- / daku+chouon-', 'belum', 474),
('K5-0475', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半額（はんがく）', '["setengah tahun", "setengah", "setengah harga", "setengah bulan"]'::jsonb, 2, '半額 dibaca はんがく, artinya "setengah harga".', 'makna sekanji', 'belum', 475),
('K5-0476', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半額', '["ばんがく", "はんがく", "はんかく", "ばんかく"]'::jsonb, 1, '半額 artinya "setengah harga", dibaca はんがく.', 'daku / daku+daku', 'belum', 476),
('K5-0477', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半島（はんとう）', '["setengah hari", "semenanjung", "setengah harga", "babak pertama"]'::jsonb, 1, '半島 dibaca はんとう, artinya "semenanjung".', 'makna sekanji', 'belum', 477),
('K5-0478', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半島', '["はんとう", "はんどう", "はんど", "はんと"]'::jsonb, 0, '半島 artinya "semenanjung", dibaca はんとう.', 'daku / chouon- / daku+chouon-', 'belum', 478),
('K5-0479', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
大半（たいはん）', '["babak pertama", "babak kedua", "sebagian besar", "setengah"]'::jsonb, 2, '大半 dibaca たいはん, artinya "sebagian besar".', 'makna sekanji', 'belum', 479),
('K5-0480', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大半', '["たえはん", "だいはん", "だえはん", "たいはん"]'::jsonb, 3, '大半 artinya "sebagian besar", dibaca たいはん.', 'daku / vowel / daku+vowel', 'belum', 480),
('K5-0481', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
半月（はんつき）', '["setengah harga", "setengah tahun", "setengah hari", "setengah bulan"]'::jsonb, 3, '半月 dibaca はんつき, artinya "setengah bulan".', 'makna sekanji', 'belum', 481),
('K5-0482', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
半月', '["はんっつき", "はんつき", "ばんっつき", "ばんつき"]'::jsonb, 1, '半月 artinya "setengah bulan", dibaca はんつき.', 'daku / sokuon+ / daku+sokuon+', 'belum', 482),
('K5-0483', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
人間（にんげん）', '["manusia", "jangka waktu", "ruang tamu", "siang hari"]'::jsonb, 0, '人間 dibaca にんげん, artinya "manusia".', 'makna sekanji', 'belum', 483),
('K5-0484', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人間', '["にんけん", "ぬんげん", "にんげん", "ぬんけん"]'::jsonb, 2, '人間 artinya "manusia", dibaca にんげん.', 'vowel / daku / vowel+daku', 'belum', 484),
('K5-0485', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
間（あいだ）', '["libur mingguan", "tanah", "pohon", "antara"]'::jsonb, 3, '間 dibaca あいだ, artinya "antara".', 'makna se-ranah', 'belum', 485),
('K5-0486', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
間', '["あいだ", "あおだ", "うおだ", "ういだ"]'::jsonb, 0, '間 artinya "antara", dibaca あいだ.', 'vowel / vowel+vowel', 'belum', 486),
('K5-0487', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
間に合う（まにあう）', '["waktu", "jangka waktu", "tepat waktu", "kesalahan"]'::jsonb, 2, '間に合う dibaca まにあう, artinya "tepat waktu".', 'makna sekanji', 'belum', 487),
('K5-0488', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
間に合う', '["まなあう", "まにあう", "めにあう", "めなあう"]'::jsonb, 1, '間に合う artinya "tepat waktu", dibaca まにあう.', 'vowel / vowel+vowel', 'belum', 488),
('K5-0489', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
空間（くうかん）', '["ruang", "ruang tamu", "siang hari", "masyarakat"]'::jsonb, 0, '空間 dibaca くうかん, artinya "ruang".', 'makna sekanji', 'belum', 489),
('K5-0490', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空間', '["ぐかん", "くうかん", "ぐうかん", "くかん"]'::jsonb, 1, '空間 artinya "ruang", dibaca くうかん.', 'daku / chouon- / daku+chouon-', 'belum', 490),
('K5-0491', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
昼間（ひるま）', '["setiap hari", "manusia", "siang hari", "waktu"]'::jsonb, 2, '昼間 dibaca ひるま, artinya "siang hari".', 'makna sekanji', 'belum', 491),
('K5-0492', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昼間', '["ひるうみ", "ひるうま", "ひるみ", "ひるま"]'::jsonb, 3, '昼間 artinya "siang hari", dibaca ひるま.', 'chouon+ / vowel / chouon++vowel', 'belum', 492),
('K5-0493', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
期間（きかん）', '["jangka waktu", "waktu", "tepat waktu", "manusia"]'::jsonb, 0, '期間 dibaca きかん, artinya "jangka waktu".', 'makna sekanji', 'belum', 493),
('K5-0494', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
期間', '["ぎがん", "きかん", "きがん", "ぎかん"]'::jsonb, 1, '期間 artinya "jangka waktu", dibaca きかん.', 'daku / daku+daku', 'belum', 494),
('K5-0495', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
間違い（まちがい）', '["tepat waktu", "manusia", "kesalahan", "ruang tamu"]'::jsonb, 2, '間違い dibaca まちがい, artinya "kesalahan".', 'makna sekanji', 'belum', 495),
('K5-0496', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
間違い', '["めちがい", "まっちがい", "めっちがい", "まちがい"]'::jsonb, 3, '間違い artinya "kesalahan", dibaca まちがい.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 496),
('K5-0497', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
世間（せけん）', '["jangka waktu", "masyarakat", "waktu", "ruang"]'::jsonb, 1, '世間 dibaca せけん, artinya "masyarakat".', 'makna sekanji', 'belum', 497),
('K5-0498', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
世間', '["ぜげん", "せげん", "せけん", "ぜけん"]'::jsonb, 2, '世間 artinya "masyarakat", dibaca せけん.', 'daku / daku+daku', 'belum', 498),
('K5-0499', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
客間（きゃくま）', '["ruang tamu", "ruang", "jangka waktu", "masyarakat"]'::jsonb, 0, '客間 dibaca きゃくま, artinya "ruang tamu".', 'makna sekanji', 'belum', 499),
('K5-0500', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
客間', '["きやくま", "ぎやくま", "ぎゃくま", "きゃくま"]'::jsonb, 3, '客間 artinya "ruang tamu", dibaca きゃくま.', 'daku / youon / daku+youon', 'belum', 500),
('K5-0501', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
今週（こんしゅう）', '["minggu lalu", "minggu depan", "minggu ini", "setiap minggu"]'::jsonb, 2, '今週 dibaca こんしゅう, artinya "minggu ini".', 'makna sekanji', 'belum', 501),
('K5-0502', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今週', '["ごんしゅう", "ごんじゅう", "こんじゅう", "こんしゅう"]'::jsonb, 3, '今週 artinya "minggu ini", dibaca こんしゅう.', 'daku / daku+daku', 'belum', 502),
('K5-0503', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
来週（らいしゅう）', '["setiap minggu", "minggu depan", "minggu lalu", "minggu ini"]'::jsonb, 1, '来週 dibaca らいしゅう, artinya "minggu depan".', 'makna sekanji', 'belum', 503),
('K5-0504', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来週', '["らいしゅう", "らえしゅう", "ろいしゅう", "ろえしゅう"]'::jsonb, 0, '来週 artinya "minggu depan", dibaca らいしゅう.', 'vowel / vowel+vowel', 'belum', 504),
('K5-0505', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
先週（せんしゅう）', '["setiap minggu", "minggu lalu", "minggu ini", "minggu depan"]'::jsonb, 1, '先週 dibaca せんしゅう, artinya "minggu lalu".', 'makna sekanji', 'belum', 505),
('K5-0506', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先週', '["せんじゅう", "ぜんじゅう", "せんしゅう", "ぜんしゅう"]'::jsonb, 2, '先週 artinya "minggu lalu", dibaca せんしゅう.', 'daku / daku+daku', 'belum', 506),
('K5-0507', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
毎週（まいしゅう）', '["satu minggu", "minggu lalu", "minggu depan", "setiap minggu"]'::jsonb, 3, '毎週 dibaca まいしゅう, artinya "setiap minggu".', 'makna sekanji', 'belum', 507),
('K5-0508', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎週', '["まいしゅう", "もいしゅう", "もおしゅう", "まおしゅう"]'::jsonb, 0, '毎週 artinya "setiap minggu", dibaca まいしゅう.', 'vowel / vowel+vowel', 'belum', 508),
('K5-0509', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
週末（しゅうまつ）', '["akhir pekan", "minggu lalu", "hari kerja", "minggu ini"]'::jsonb, 0, '週末 dibaca しゅうまつ, artinya "akhir pekan".', 'makna sekanji', 'belum', 509),
('K5-0510', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
週末', '["じゅうまつ", "じゆうまつ", "しゅうまつ", "しゆうまつ"]'::jsonb, 2, '週末 artinya "akhir pekan", dibaca しゅうまつ.', 'daku / youon / daku+youon', 'belum', 510),
('K5-0511', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
週刊誌（しゅうかんし）', '["satu minggu", "majalah mingguan", "libur mingguan", "dua minggu"]'::jsonb, 1, '週刊誌 dibaca しゅうかんし, artinya "majalah mingguan".', 'makna sekanji', 'belum', 511),
('K5-0512', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
週刊誌', '["しゆうかんし", "じゅうかんし", "じゆうかんし", "しゅうかんし"]'::jsonb, 3, '週刊誌 artinya "majalah mingguan", dibaca しゅうかんし.', 'daku / youon / daku+youon', 'belum', 512),
('K5-0513', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
週休（しゅうきゅう）', '["minggu lalu", "libur mingguan", "majalah mingguan", "setiap minggu"]'::jsonb, 1, '週休 dibaca しゅうきゅう, artinya "libur mingguan".', 'makna sekanji', 'belum', 513),
('K5-0514', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
週休', '["しゆうきゅう", "じゅうきゅう", "しゅうきゅう", "じゆうきゅう"]'::jsonb, 2, '週休 artinya "libur mingguan", dibaca しゅうきゅう.', 'daku / youon / daku+youon', 'belum', 514),
('K5-0515', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
二週間（にしゅうかん）', '["dua minggu", "setiap minggu", "majalah mingguan", "satu minggu"]'::jsonb, 0, '二週間 dibaca にしゅうかん, artinya "dua minggu".', 'makna sekanji', 'belum', 515),
('K5-0516', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
二週間', '["ねしゅうかん", "ねじゅうかん", "にじゅうかん", "にしゅうかん"]'::jsonb, 3, '二週間 artinya "dua minggu", dibaca にしゅうかん.', 'vowel / daku / vowel+daku', 'belum', 516),
('K5-0517', 'N5', 'kanji', 'Arti', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Apa arti kata berikut?
週日（しゅうじつ）', '["hari ini", "minggu ini", "akhir pekan", "hari kerja"]'::jsonb, 3, '週日 dibaca しゅうじつ, artinya "hari kerja".', 'makna sekanji', 'belum', 517),
('K5-0518', 'N5', 'kanji', 'Bacaan', 2, 'T02', 'Waktu & Hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
週日', '["しゅうじつ", "じゆうじつ", "じゅうじつ", "しゆうじつ"]'::jsonb, 0, '週日 artinya "hari kerja", dibaca しゅうじつ.', 'daku / youon / daku+youon', 'belum', 518),
('K5-0519', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上（うえ）', '["barat", "atas", "timur", "bawah"]'::jsonb, 1, '上 dibaca うえ, artinya "atas".', 'makna se-ranah', 'belum', 519),
('K5-0520', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上', '["あえ", "うい", "うえ", "あい"]'::jsonb, 2, '上 artinya "atas", dibaca うえ.', 'vowel / vowel+vowel', 'belum', 520),
('K5-0521', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上手（じょうず）', '["atap gedung", "jaket", "pandai", "lebih dari"]'::jsonb, 2, '上手 dibaca じょうず, artinya "pandai".', 'makna sekanji', 'belum', 521),
('K5-0522', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上手', '["しようず", "じようず", "しょうず", "じょうず"]'::jsonb, 3, '上手 artinya "pandai", dibaca じょうず.', 'daku / youon / daku+youon', 'belum', 522),
('K5-0523', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
屋上（おくじょう）', '["mendaki", "atap gedung", "tingkat atas", "jaket"]'::jsonb, 1, '屋上 dibaca おくじょう, artinya "atap gedung".', 'makna sekanji', 'belum', 523),
('K5-0524', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
屋上', '["おくじょう", "おうくじょう", "おぐじょう", "おうぐじょう"]'::jsonb, 0, '屋上 artinya "atap gedung", dibaca おくじょう.', 'chouon+ / daku / chouon++daku', 'belum', 524),
('K5-0525', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上級（じょうきゅう）', '["atasan", "mendaki", "tingkat atas", "jaket"]'::jsonb, 2, '上級 dibaca じょうきゅう, artinya "tingkat atas".', 'makna sekanji', 'belum', 525),
('K5-0526', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上級', '["じようきゅう", "しょうきゅう", "しようきゅう", "じょうきゅう"]'::jsonb, 3, '上級 artinya "tingkat atas", dibaca じょうきゅう.', 'daku / youon / daku+youon', 'belum', 526),
('K5-0527', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上着（うわぎ）', '["tingkat atas", "jaket", "atasan", "lebih dari"]'::jsonb, 1, '上着 dibaca うわぎ, artinya "jaket".', 'makna sekanji', 'belum', 527),
('K5-0528', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上着', '["うわぎ", "いわき", "うわき", "いわぎ"]'::jsonb, 0, '上着 artinya "jaket", dibaca うわぎ.', 'vowel / daku / vowel+daku', 'belum', 528),
('K5-0529', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
以上（いじょう）', '["mendaki", "atasan", "tingkat atas", "lebih dari"]'::jsonb, 3, '以上 dibaca いじょう, artinya "lebih dari".', 'makna sekanji', 'belum', 529),
('K5-0530', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以上', '["あしょう", "あじょう", "いじょう", "いしょう"]'::jsonb, 2, '以上 artinya "lebih dari", dibaca いじょう.', 'vowel / daku / vowel+daku', 'belum', 530),
('K5-0531', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上がる（あがる）', '["naik", "jaket", "pandai", "permukaan tanah"]'::jsonb, 0, '上がる dibaca あがる, artinya "naik".', 'makna sekanji', 'belum', 531),
('K5-0532', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上がる', '["あかる", "あがる", "えがる", "えかる"]'::jsonb, 1, '上がる artinya "naik", dibaca あがる.', 'vowel / daku / vowel+daku', 'belum', 532),
('K5-0533', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
上る（のぼる）', '["tingkat atas", "lebih dari", "mendaki", "pandai"]'::jsonb, 2, '上る dibaca のぼる, artinya "mendaki".', 'makna sekanji', 'belum', 533),
('K5-0534', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上る', '["のぼる", "のうぼる", "のうぽる", "のぽる"]'::jsonb, 0, '上る artinya "mendaki", dibaca のぼる.', 'chouon+ / daku / chouon++daku', 'belum', 534),
('K5-0535', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
目上（めうえ）', '["pandai", "atasan", "mendaki", "tingkat atas"]'::jsonb, 1, '目上 dibaca めうえ, artinya "atasan".', 'makna sekanji', 'belum', 535),
('K5-0536', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目上', '["もうえ", "もあえ", "めあえ", "めうえ"]'::jsonb, 3, '目上 artinya "atasan", dibaca めうえ.', 'vowel / vowel+vowel', 'belum', 536),
('K5-0537', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
地上（ちじょう）', '["mendaki", "jaket", "permukaan tanah", "lebih dari"]'::jsonb, 2, '地上 dibaca ちじょう, artinya "permukaan tanah".', 'makna sekanji', 'belum', 537),
('K5-0538', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
地上', '["たじょう", "ちじょう", "たしょう", "ちしょう"]'::jsonb, 1, '地上 artinya "permukaan tanah", dibaca ちじょう.', 'vowel / daku / vowel+daku', 'belum', 538),
('K5-0539', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下（した）', '["bawah", "utara", "kiri", "timur"]'::jsonb, 0, '下 dibaca した, artinya "bawah".', 'makna se-ranah', 'belum', 539),
('K5-0540', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下', '["じた", "じだ", "しだ", "した"]'::jsonb, 3, '下 artinya "bawah", dibaca した.', 'daku / daku+daku', 'belum', 540),
('K5-0541', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下手（へた）', '["koridor", "bawah tanah", "turun kendaraan", "tidak pandai"]'::jsonb, 3, '下手 dibaca へた, artinya "tidak pandai".', 'makna sekanji', 'belum', 541),
('K5-0542', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下手', '["べた", "へた", "べだ", "へだ"]'::jsonb, 1, '下手 artinya "tidak pandai", dibaca へた.', 'daku / daku+daku', 'belum', 542),
('K5-0543', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
地下（ちか）', '["bawah tanah", "permukaan tanah", "tidak pandai", "pakaian dalam"]'::jsonb, 0, '地下 dibaca ちか, artinya "bawah tanah".', 'makna sekanji', 'belum', 543),
('K5-0544', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
地下', '["とが", "ちが", "ちか", "とか"]'::jsonb, 2, '地下 artinya "bawah tanah", dibaca ちか.', 'vowel / daku / vowel+daku', 'belum', 544),
('K5-0545', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
靴下（くつした）', '["bawah tanah", "kurang dari", "kaus kaki", "koridor"]'::jsonb, 2, '靴下 dibaca くつした, artinya "kaus kaki".', 'makna sekanji', 'belum', 545),
('K5-0546', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
靴下', '["くつした", "くつうした", "ぐつうした", "ぐつした"]'::jsonb, 0, '靴下 artinya "kaus kaki", dibaca くつした.', 'daku / chouon+ / daku+chouon+', 'belum', 546),
('K5-0547', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下着（したぎ）', '["bawah tanah", "koridor", "tidak pandai", "pakaian dalam"]'::jsonb, 3, '下着 dibaca したぎ, artinya "pakaian dalam".', 'makna sekanji', 'belum', 547),
('K5-0548', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下着', '["じだぎ", "したぎ", "じたぎ", "しだぎ"]'::jsonb, 1, '下着 artinya "pakaian dalam", dibaca したぎ.', 'daku / daku+daku', 'belum', 548),
('K5-0549', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
以下（いか）', '["pakaian dalam", "kurang dari", "bawah tanah", "turun kendaraan"]'::jsonb, 1, '以下 dibaca いか, artinya "kurang dari".', 'makna sekanji', 'belum', 549),
('K5-0550', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以下', '["あが", "いが", "いか", "あか"]'::jsonb, 2, '以下 artinya "kurang dari", dibaca いか.', 'vowel / daku / vowel+daku', 'belum', 550),
('K5-0551', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下がる（さがる）', '["turun", "turun kendaraan", "kaus kaki", "tolong"]'::jsonb, 0, '下がる dibaca さがる, artinya "turun".', 'makna sekanji', 'belum', 551),
('K5-0552', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下がる', '["さかる", "ざかる", "ざがる", "さがる"]'::jsonb, 3, '下がる artinya "turun", dibaca さがる.', 'daku / daku+daku', 'belum', 552),
('K5-0553', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
廊下（ろうか）', '["bawah tanah", "kurang dari", "koridor", "kaus kaki"]'::jsonb, 2, '廊下 dibaca ろうか, artinya "koridor".', 'makna sekanji', 'belum', 553),
('K5-0554', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
廊下', '["ろか", "ろうか", "るうか", "るか"]'::jsonb, 1, '廊下 artinya "koridor", dibaca ろうか.', 'vowel / chouon- / vowel+chouon-', 'belum', 554),
('K5-0555', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下車（げしゃ）', '["koridor", "kurang dari", "turun", "turun kendaraan"]'::jsonb, 3, '下車 dibaca げしゃ, artinya "turun kendaraan".', 'makna sekanji', 'belum', 555),
('K5-0556', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下車', '["げしゃ", "けしゃ", "げじゃ", "けじゃ"]'::jsonb, 0, '下車 artinya "turun kendaraan", dibaca げしゃ.', 'daku / daku+daku', 'belum', 556),
('K5-0557', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
下さい（ください）', '["tidak pandai", "turun", "tolong", "koridor"]'::jsonb, 2, '下さい dibaca ください, artinya "tolong".', 'makna sekanji', 'belum', 557),
('K5-0558', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下さい', '["ぐださい", "ください", "くたさい", "ぐたさい"]'::jsonb, 1, '下さい artinya "tolong", dibaca ください.', 'daku / daku+daku', 'belum', 558),
('K5-0559', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中（なか）', '["dalam", "pakaian dalam", "atas", "bawah"]'::jsonb, 0, '中 dibaca なか, artinya "dalam".', 'makna sekanji', 'belum', 559),
('K5-0560', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中', '["ぬか", "ちゅう", "なが", "なか"]'::jsonb, 3, '中 artinya "dalam", dibaca なか. Membacanya ちゅう adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 560),
('K5-0561', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中国（ちゅうごく）', '["bekas / second", "pembatalan", "pusat", "Tiongkok"]'::jsonb, 3, '中国 dibaca ちゅうごく, artinya "Tiongkok".', 'makna sekanji', 'belum', 561),
('K5-0562', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中国', '["ちゅうごく", "ちゅごく", "ちゆうごく", "なかごく"]'::jsonb, 0, '中国 artinya "Tiongkok", dibaca ちゅうごく. Membacanya なかごく adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 562),
('K5-0563', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中学校（ちゅうがっこう）', '["sepanjang pagi", "tepat tengah", "SMP", "seluruh dunia"]'::jsonb, 2, '中学校 dibaca ちゅうがっこう, artinya "SMP".', 'makna sekanji', 'belum', 563),
('K5-0564', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中学校', '["なかがっこう", "ちゅうがっこう", "ちゆうがっこう", "ちゅがっこう"]'::jsonb, 1, '中学校 artinya "SMP", dibaca ちゅうがっこう. Membacanya なかがっこう adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 564),
('K5-0565', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
真ん中（まんなか）', '["seluruh dunia", "sepanjang pagi", "SMP", "tepat tengah"]'::jsonb, 3, '真ん中 dibaca まんなか, artinya "tepat tengah".', 'makna sekanji', 'belum', 565),
('K5-0566', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
真ん中', '["みんにか", "みんなか", "まんなか", "まんにか"]'::jsonb, 2, '真ん中 artinya "tepat tengah", dibaca まんなか.', 'vowel / vowel+vowel', 'belum', 566),
('K5-0567', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
午前中（ごぜんちゅう）', '["sepanjang pagi", "seluruh dunia", "SMP", "tepat tengah"]'::jsonb, 0, '午前中 dibaca ごぜんちゅう, artinya "sepanjang pagi".', 'makna sekanji', 'belum', 567),
('K5-0568', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午前中', '["こせんちゅう", "ごぜんちゅう", "こぜんちゅう", "ごせんちゅう"]'::jsonb, 1, '午前中 artinya "sepanjang pagi", dibaca ごぜんちゅう.', 'daku / daku+daku', 'belum', 568),
('K5-0569', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中止（ちゅうし）', '["pusat", "konsentrasi", "pembatalan", "bekas / second"]'::jsonb, 2, '中止 dibaca ちゅうし, artinya "pembatalan".', 'makna sekanji', 'belum', 569),
('K5-0570', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中止', '["なかし", "ちゅし", "ちゆうし", "ちゅうし"]'::jsonb, 3, '中止 artinya "pembatalan", dibaca ちゅうし. Membacanya なかし adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 570),
('K5-0571', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中心（ちゅうしん）', '["pusat", "konsentrasi", "pembatalan", "Tiongkok"]'::jsonb, 0, '中心 dibaca ちゅうしん, artinya "pusat".', 'makna sekanji', 'belum', 571),
('K5-0572', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中心', '["なかしん", "ちゅうしん", "ちゅしん", "ちゆうしん"]'::jsonb, 1, '中心 artinya "pusat", dibaca ちゅうしん. Membacanya なかしん adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 572),
('K5-0573', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
世界中（せかいじゅう）', '["tepat tengah", "seluruh dunia", "sepanjang pagi", "SMP"]'::jsonb, 1, '世界中 dibaca せかいじゅう, artinya "seluruh dunia".', 'makna sekanji', 'belum', 573),
('K5-0574', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
世界中', '["ぜかいじゅう", "ぜがいじゅう", "せがいじゅう", "せかいじゅう"]'::jsonb, 3, '世界中 artinya "seluruh dunia", dibaca せかいじゅう.', 'daku / daku+daku', 'belum', 574),
('K5-0575', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中古（ちゅうこ）', '["Tiongkok", "pusat", "bekas / second", "pembatalan"]'::jsonb, 2, '中古 dibaca ちゅうこ, artinya "bekas / second".', 'makna sekanji', 'belum', 575),
('K5-0576', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中古', '["ちゅうこ", "ちゅこ", "なかこ", "ちゆうこ"]'::jsonb, 0, '中古 artinya "bekas / second", dibaca ちゅうこ. Membacanya なかこ adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 576),
('K5-0577', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
集中（しゅうちゅう）', '["Tiongkok", "pusat", "konsentrasi", "bekas / second"]'::jsonb, 2, '集中 dibaca しゅうちゅう, artinya "konsentrasi".', 'makna sekanji', 'belum', 577),
('K5-0578', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
集中', '["じゆうちゅう", "しゅうちゅう", "じゅうちゅう", "しゆうちゅう"]'::jsonb, 1, '集中 artinya "konsentrasi", dibaca しゅうちゅう.', 'daku / youon / daku+youon', 'belum', 578),
('K5-0579', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左（ひだり）', '["dalam", "selatan", "atas", "kiri"]'::jsonb, 3, '左 dibaca ひだり, artinya "kiri".', 'makna se-ranah', 'belum', 579),
('K5-0580', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左', '["ひだり", "ひたり", "びたり", "びだり"]'::jsonb, 0, '左 artinya "kiri", dibaca ひだり.', 'daku / daku+daku', 'belum', 580),
('K5-0581', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左手（ひだりて）', '["ujung kiri", "mata kiri", "kaki kiri", "tangan kiri"]'::jsonb, 3, '左手 dibaca ひだりて, artinya "tangan kiri".', 'makna sekanji', 'belum', 581),
('K5-0582', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左手', '["ひだれて", "ひたりて", "ひだりて", "ひたれて"]'::jsonb, 2, '左手 artinya "tangan kiri", dibaca ひだりて.', 'daku / vowel / daku+vowel', 'belum', 582),
('K5-0583', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左足（ひだりあし）', '["sisi kiri", "kaki kiri", "mata kiri", "belok kiri"]'::jsonb, 1, '左足 dibaca ひだりあし, artinya "kaki kiri".', 'makna sekanji', 'belum', 583),
('K5-0584', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左足', '["ひだりあし", "ひたらあし", "ひだらあし", "ひたりあし"]'::jsonb, 0, '左足 artinya "kaki kiri", dibaca ひだりあし.', 'daku / vowel / daku+vowel', 'belum', 584),
('K5-0585', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左側（ひだりがわ）', '["kaki kiri", "sisi kiri", "ujung kiri", "tangan kiri"]'::jsonb, 1, '左側 dibaca ひだりがわ, artinya "sisi kiri".', 'makna sekanji', 'belum', 585),
('K5-0586', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左側', '["ひだりがわ", "ひたりがわ", "びだりがわ", "びたりがわ"]'::jsonb, 0, '左側 artinya "sisi kiri", dibaca ひだりがわ.', 'daku / daku+daku', 'belum', 586),
('K5-0587', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左右（さゆう）', '["mata kiri", "ujung kiri", "kiri kanan", "tangan kiri"]'::jsonb, 2, '左右 dibaca さゆう, artinya "kiri kanan".', 'makna sekanji', 'belum', 587),
('K5-0588', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左右', '["ざゆう", "さよう", "ざよう", "さゆう"]'::jsonb, 3, '左右 artinya "kiri kanan", dibaca さゆう.', 'daku / vowel / daku+vowel', 'belum', 588),
('K5-0589', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左折（させつ）', '["belok kiri", "kaki kiri", "tangan kiri", "mata kiri"]'::jsonb, 0, '左折 dibaca させつ, artinya "belok kiri".', 'makna sekanji', 'belum', 589),
('K5-0590', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左折', '["さぜつ", "ざぜつ", "させつ", "ざせつ"]'::jsonb, 2, '左折 artinya "belok kiri", dibaca させつ.', 'daku / daku+daku', 'belum', 590),
('K5-0591', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左利き（ひだりきき）', '["putar kiri", "tidak kidal", "mata kiri", "kidal"]'::jsonb, 3, '左利き dibaca ひだりきき, artinya "kidal".', 'makna sekanji', 'belum', 591),
('K5-0592', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左利き', '["びたりきき", "ひだりきき", "ひたりきき", "びだりきき"]'::jsonb, 1, '左利き artinya "kidal", dibaca ひだりきき.', 'daku / daku+daku', 'belum', 592),
('K5-0593', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左目（ひだりめ）', '["tangan kiri", "mata kiri", "belok kiri", "ujung kiri"]'::jsonb, 1, '左目 dibaca ひだりめ, artinya "mata kiri".', 'makna sekanji', 'belum', 593),
('K5-0594', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左目', '["ひたりめ", "ひだろめ", "ひたろめ", "ひだりめ"]'::jsonb, 3, '左目 artinya "mata kiri", dibaca ひだりめ.', 'daku / vowel / daku+vowel', 'belum', 594),
('K5-0595', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左端（ひだりはし）', '["tangan kiri", "belok kiri", "ujung kiri", "kaki kiri"]'::jsonb, 2, '左端 dibaca ひだりはし, artinya "ujung kiri".', 'makna sekanji', 'belum', 595),
('K5-0596', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左端', '["ひだりはし", "ひたれはし", "ひだれはし", "ひたりはし"]'::jsonb, 0, '左端 artinya "ujung kiri", dibaca ひだりはし.', 'daku / vowel / daku+vowel', 'belum', 596),
('K5-0597', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
左回り（ひだりまわり）', '["belok kiri", "sisi kiri", "putar kiri", "ujung kiri"]'::jsonb, 2, '左回り dibaca ひだりまわり, artinya "putar kiri".', 'makna sekanji', 'belum', 597),
('K5-0598', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
左回り', '["びだりまわり", "びたりまわり", "ひたりまわり", "ひだりまわり"]'::jsonb, 3, '左回り artinya "putar kiri", dibaca ひだりまわり.', 'daku / daku+daku', 'belum', 598),
('K5-0599', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右（みぎ）', '["kanan", "bawah", "kiri", "atas"]'::jsonb, 0, '右 dibaca みぎ, artinya "kanan".', 'makna se-ranah', 'belum', 599),
('K5-0600', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右', '["まき", "みぎ", "みき", "まぎ"]'::jsonb, 1, '右 artinya "kanan", dibaca みぎ.', 'vowel / daku / vowel+daku', 'belum', 600)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-0601', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右手（みぎて）', '["sisi kanan", "kaki kanan", "belok kanan", "tangan kanan"]'::jsonb, 3, '右手 dibaca みぎて, artinya "tangan kanan".', 'makna sekanji', 'belum', 601),
('K5-0602', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右手', '["みきて", "むきて", "みぎて", "むぎて"]'::jsonb, 2, '右手 artinya "tangan kanan", dibaca みぎて.', 'vowel / daku / vowel+daku', 'belum', 602),
('K5-0603', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右足（みぎあし）', '["kaki kanan", "lengan kanan", "tangan kanan", "belok kanan"]'::jsonb, 0, '右足 dibaca みぎあし, artinya "kaki kanan".', 'makna sekanji', 'belum', 603),
('K5-0604', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右足', '["まきあし", "みぎあし", "みきあし", "まぎあし"]'::jsonb, 1, '右足 artinya "kaki kanan", dibaca みぎあし.', 'vowel / daku / vowel+daku', 'belum', 604),
('K5-0605', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右側（みぎがわ）', '["sisi kanan", "belok kanan", "lengan kanan", "kaki kanan"]'::jsonb, 0, '右側 dibaca みぎがわ, artinya "sisi kanan".', 'makna sekanji', 'belum', 605),
('K5-0606', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右側', '["まきがわ", "みぎがわ", "みきがわ", "まぎがわ"]'::jsonb, 1, '右側 artinya "sisi kanan", dibaca みぎがわ.', 'vowel / daku / vowel+daku', 'belum', 606),
('K5-0607', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右折（うせつ）', '["kaki kanan", "tangan kanan", "kiri kanan", "belok kanan"]'::jsonb, 3, '右折 dibaca うせつ, artinya "belok kanan".', 'makna sekanji', 'belum', 607),
('K5-0608', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右折', '["おぜつ", "うぜつ", "うせつ", "おせつ"]'::jsonb, 2, '右折 artinya "belok kanan", dibaca うせつ.', 'vowel / daku / vowel+daku', 'belum', 608),
('K5-0609', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右利き（みぎきき）', '["tidak kidal", "sisi kanan", "putar kanan", "kidal"]'::jsonb, 0, '右利き dibaca みぎきき, artinya "tidak kidal".', 'makna sekanji', 'belum', 609),
('K5-0610', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右利き', '["みぎぎき", "みぎきき", "めぎぎき", "めぎきき"]'::jsonb, 1, '右利き artinya "tidak kidal", dibaca みぎきき.', 'vowel / daku / vowel+daku', 'belum', 610),
('K5-0611', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右目（みぎめ）', '["kaki kanan", "kiri kanan", "mata kanan", "belok kanan"]'::jsonb, 2, '右目 dibaca みぎめ, artinya "mata kanan".', 'makna sekanji', 'belum', 611),
('K5-0612', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右目', '["むきめ", "むぎめ", "みきめ", "みぎめ"]'::jsonb, 3, '右目 artinya "mata kanan", dibaca みぎめ.', 'vowel / daku / vowel+daku', 'belum', 612),
('K5-0613', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右腕（みぎうで）', '["kiri kanan", "sisi kanan", "belok kanan", "lengan kanan"]'::jsonb, 3, '右腕 dibaca みぎうで, artinya "lengan kanan".', 'makna sekanji', 'belum', 613),
('K5-0614', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右腕', '["もぎうで", "もきうで", "みぎうで", "みきうで"]'::jsonb, 2, '右腕 artinya "lengan kanan", dibaca みぎうで.', 'vowel / daku / vowel+daku', 'belum', 614),
('K5-0615', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
右回り（みぎまわり）', '["putar kanan", "kiri kanan", "mata kanan", "belok kanan"]'::jsonb, 0, '右回り dibaca みぎまわり, artinya "putar kanan".', 'makna sekanji', 'belum', 615),
('K5-0616', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
右回り', '["みきまわり", "みぎまわり", "めきまわり", "めぎまわり"]'::jsonb, 1, '右回り artinya "putar kanan", dibaca みぎまわり.', 'vowel / daku / vowel+daku', 'belum', 616),
('K5-0617', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
前（まえ）', '["kiri", "depan", "luar", "dalam"]'::jsonb, 1, '前 dibaca まえ, artinya "depan".', 'makna se-ranah', 'belum', 617),
('K5-0618', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前', '["まえ", "ぜん", "まい", "むえ"]'::jsonb, 0, '前 artinya "depan", dibaca まえ. Membacanya ぜん adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 618),
('K5-0619', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
名前（なまえ）', '["hari sebelumnya", "depan stasiun", "nama", "maju"]'::jsonb, 2, '名前 dibaca なまえ, artinya "nama".', 'makna sekanji', 'belum', 619),
('K5-0620', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名前', '["なもえ", "のまえ", "のもえ", "なまえ"]'::jsonb, 3, '名前 artinya "nama", dibaca なまえ.', 'vowel / vowel+vowel', 'belum', 620),
('K5-0621', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
午前（ごぜん）', '["pagi (AM)", "sisi dekat", "sebelumnya", "maju"]'::jsonb, 0, '午前 dibaca ごぜん, artinya "pagi (AM)".', 'makna sekanji', 'belum', 621),
('K5-0622', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午前', '["こせん", "ごぜん", "こぜん", "ごせん"]'::jsonb, 1, '午前 artinya "pagi (AM)", dibaca ごぜん.', 'daku / daku+daku', 'belum', 622),
('K5-0623', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
以前（いぜん）', '["depan stasiun", "hari sebelumnya", "sebelumnya", "kali sebelumnya"]'::jsonb, 2, '以前 dibaca いぜん, artinya "sebelumnya".', 'makna sekanji', 'belum', 623),
('K5-0624', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以前', '["えせん", "いせん", "えぜん", "いぜん"]'::jsonb, 3, '以前 artinya "sebelumnya", dibaca いぜん.', 'vowel / daku / vowel+daku', 'belum', 624),
('K5-0625', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
駅前（えきまえ）', '["hari sebelumnya", "depan stasiun", "maju", "nama"]'::jsonb, 1, '駅前 dibaca えきまえ, artinya "depan stasiun".', 'makna sekanji', 'belum', 625),
('K5-0626', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅前', '["うぎまえ", "えぎまえ", "えきまえ", "うきまえ"]'::jsonb, 2, '駅前 artinya "depan stasiun", dibaca えきまえ.', 'vowel / daku / vowel+daku', 'belum', 626),
('K5-0627', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
前日（ぜんじつ）', '["depan stasiun", "kali sebelumnya", "sebelumnya", "hari sebelumnya"]'::jsonb, 3, '前日 dibaca ぜんじつ, artinya "hari sebelumnya".', 'makna sekanji', 'belum', 627),
('K5-0628', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前日', '["ぜんじつ", "ぜんしつ", "まえじつ", "せんじつ"]'::jsonb, 0, '前日 artinya "hari sebelumnya", dibaca ぜんじつ. Membacanya まえじつ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 628),
('K5-0629', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
手前（てまえ）', '["sisi timur", "sebelumnya", "sisi dekat", "sisi utara"]'::jsonb, 2, '手前 dibaca てまえ, artinya "sisi dekat".', 'makna sekanji', 'belum', 629),
('K5-0630', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手前', '["でむえ", "でまえ", "てむえ", "てまえ"]'::jsonb, 3, '手前 artinya "sisi dekat", dibaca てまえ.', 'daku / vowel / daku+vowel', 'belum', 630),
('K5-0631', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
前回（ぜんかい）', '["hari sebelumnya", "kali sebelumnya", "sebelumnya", "pagi (AM)"]'::jsonb, 1, '前回 dibaca ぜんかい, artinya "kali sebelumnya".', 'makna sekanji', 'belum', 631),
('K5-0632', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前回', '["ぜんかい", "まえかい", "せんかい", "ぜんがい"]'::jsonb, 0, '前回 artinya "kali sebelumnya", dibaca ぜんかい. Membacanya まえかい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 632),
('K5-0633', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
目の前（めのまえ）', '["di depan mata", "di luar dugaan", "depan stasiun", "pagi (AM)"]'::jsonb, 0, '目の前 dibaca めのまえ, artinya "di depan mata".', 'makna sekanji', 'belum', 633),
('K5-0634', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目の前', '["まのまえ", "めのうまえ", "まのうまえ", "めのまえ"]'::jsonb, 3, '目の前 artinya "di depan mata", dibaca めのまえ.', 'vowel / chouon+ / vowel+chouon+', 'belum', 634),
('K5-0635', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
前進（ぜんしん）', '["sisi dekat", "maju", "kali sebelumnya", "hari sebelumnya"]'::jsonb, 1, '前進 dibaca ぜんしん, artinya "maju".', 'makna sekanji', 'belum', 635),
('K5-0636', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前進', '["せんしん", "まえしん", "ぜんしん", "ぜんじん"]'::jsonb, 2, '前進 artinya "maju", dibaca ぜんしん. Membacanya まえしん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 636),
('K5-0637', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
後ろ（うしろ）', '["depan belakang", "terakhir", "belakang", "mulai sekarang"]'::jsonb, 2, '後ろ dibaca うしろ, artinya "belakang".', 'makna sekanji', 'belum', 637),
('K5-0638', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
後ろ', '["うしろ", "うじろ", "いしろ", "いじろ"]'::jsonb, 0, '後ろ artinya "belakang", dibaca うしろ.', 'vowel / daku / vowel+daku', 'belum', 638),
('K5-0639', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
午後（ごご）', '["sesudah ini", "junior", "depan belakang", "siang (PM)"]'::jsonb, 3, '午後 dibaca ごご, artinya "siang (PM)".', 'makna sekanji', 'belum', 639),
('K5-0640', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午後', '["ここ", "ごご", "ごこ", "こご"]'::jsonb, 1, '午後 artinya "siang (PM)", dibaca ごご.', 'daku / daku+daku', 'belum', 640),
('K5-0641', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
最後（さいご）', '["sesudah ini", "terakhir", "nanti", "belakang"]'::jsonb, 1, '最後 dibaca さいご, artinya "terakhir".', 'makna sekanji', 'belum', 641),
('K5-0642', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
最後', '["さいご", "ざあご", "ざいご", "さあご"]'::jsonb, 0, '最後 artinya "terakhir", dibaca さいご.', 'daku / vowel / daku+vowel', 'belum', 642),
('K5-0643', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
以後（いご）', '["nanti", "mulai sekarang", "tepat sesudah", "sesudah ini"]'::jsonb, 3, '以後 dibaca いご, artinya "sesudah ini".', 'makna sekanji', 'belum', 643),
('K5-0644', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以後', '["いこ", "おこ", "いご", "おご"]'::jsonb, 2, '以後 artinya "sesudah ini", dibaca いご.', 'vowel / daku / vowel+daku', 'belum', 644),
('K5-0645', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
後で（あとで）', '["sesudah ini", "junior", "nanti", "tepat sesudah"]'::jsonb, 2, '後で dibaca あとで, artinya "nanti".', 'makna sekanji', 'belum', 645),
('K5-0646', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
後で', '["あとで", "うどで", "うとで", "あどで"]'::jsonb, 0, '後で artinya "nanti", dibaca あとで.', 'vowel / daku / vowel+daku', 'belum', 646),
('K5-0647', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
後輩（こうはい）', '["nanti", "junior", "belakang", "tepat sesudah"]'::jsonb, 1, '後輩 dibaca こうはい, artinya "junior".', 'makna sekanji', 'belum', 647),
('K5-0648', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
後輩', '["ごはい", "こはい", "ごうはい", "こうはい"]'::jsonb, 3, '後輩 artinya "junior", dibaca こうはい.', 'daku / chouon- / daku+chouon-', 'belum', 648),
('K5-0649', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
前後（ぜんご）', '["terakhir", "belakang", "depan belakang", "tampak belakang"]'::jsonb, 2, '前後 dibaca ぜんご, artinya "depan belakang".', 'makna sekanji', 'belum', 649),
('K5-0650', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
前後', '["ぜんこ", "せんご", "せんこ", "ぜんご"]'::jsonb, 3, '前後 artinya "depan belakang", dibaca ぜんご.', 'daku / daku+daku', 'belum', 650),
('K5-0651', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
直後（ちょくご）', '["tepat sesudah", "nanti", "siang (PM)", "sesudah ini"]'::jsonb, 0, '直後 dibaca ちょくご, artinya "tepat sesudah".', 'makna sekanji', 'belum', 651),
('K5-0652', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
直後', '["ちょぐご", "ちょくご", "ちょうぐご", "ちょうくご"]'::jsonb, 1, '直後 artinya "tepat sesudah", dibaca ちょくご.', 'chouon+ / daku / chouon++daku', 'belum', 652),
('K5-0653', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
後ろ姿（うしろすがた）', '["junior", "tampak belakang", "depan belakang", "terakhir"]'::jsonb, 1, '後ろ姿 dibaca うしろすがた, artinya "tampak belakang".', 'makna sekanji', 'belum', 653),
('K5-0654', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
後ろ姿', '["おしろすがた", "おじろすがた", "うじろすがた", "うしろすがた"]'::jsonb, 3, '後ろ姿 artinya "tampak belakang", dibaca うしろすがた.', 'vowel / daku / vowel+daku', 'belum', 654),
('K5-0655', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
今後（こんご）', '["sesudah ini", "terakhir", "mulai sekarang", "belakang"]'::jsonb, 2, '今後 dibaca こんご, artinya "mulai sekarang".', 'makna sekanji', 'belum', 655),
('K5-0656', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今後', '["こんご", "ごんご", "ごんこ", "こんこ"]'::jsonb, 0, '今後 artinya "mulai sekarang", dibaca こんご.', 'daku / daku+daku', 'belum', 656),
('K5-0657', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外（そと）', '["bawah", "utara", "luar", "timur"]'::jsonb, 2, '外 dibaca そと, artinya "luar".', 'makna se-ranah', 'belum', 657),
('K5-0658', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外', '["がい", "そと", "ぞと", "そど"]'::jsonb, 1, '外 artinya "luar", dibaca そと. Membacanya がい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 658),
('K5-0659', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外国（がいこく）', '["sisi luar", "makan di luar", "di luar dugaan", "luar negeri"]'::jsonb, 3, '外国 dibaca がいこく, artinya "luar negeri".', 'makna sekanji', 'belum', 659),
('K5-0660', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外国', '["がいこく", "かいこく", "そとこく", "があこく"]'::jsonb, 0, '外国 artinya "luar negeri", dibaca がいこく. Membacanya そとこく adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 660),
('K5-0661', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外国人（がいこくじん）', '["orang asing", "selain", "sisi luar", "meleset"]'::jsonb, 0, '外国人 dibaca がいこくじん, artinya "orang asing".', 'makna sekanji', 'belum', 661),
('K5-0662', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外国人', '["かいこくじん", "がうこくじん", "がいこくじん", "そとこくじん"]'::jsonb, 2, '外国人 artinya "orang asing", dibaca がいこくじん. Membacanya そとこくじん adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 662),
('K5-0663', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
海外（かいがい）', '["luar negeri", "mancanegara", "makan di luar", "sisi luar"]'::jsonb, 1, '海外 dibaca かいがい, artinya "mancanegara".', 'makna sekanji', 'belum', 663),
('K5-0664', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
海外', '["かえがい", "がいがい", "がえがい", "かいがい"]'::jsonb, 3, '海外 artinya "mancanegara", dibaca かいがい.', 'daku / vowel / daku+vowel', 'belum', 664),
('K5-0665', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外出（がいしゅつ）', '["sisi luar", "luar negeri", "di luar dugaan", "keluar rumah"]'::jsonb, 3, '外出 dibaca がいしゅつ, artinya "keluar rumah".', 'makna sekanji', 'belum', 665),
('K5-0666', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外出', '["がえしゅつ", "そとしゅつ", "がいしゅつ", "かいしゅつ"]'::jsonb, 2, '外出 artinya "keluar rumah", dibaca がいしゅつ. Membacanya そとしゅつ adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 666),
('K5-0667', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
以外（いがい）', '["selain", "sisi luar", "di luar dugaan", "luar negeri"]'::jsonb, 0, '以外 dibaca いがい, artinya "selain".', 'makna sekanji', 'belum', 667),
('K5-0668', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以外', '["いかい", "いがい", "えがい", "えかい"]'::jsonb, 1, '以外 artinya "selain", dibaca いがい.', 'vowel / daku / vowel+daku', 'belum', 668),
('K5-0669', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外食（がいしょく）', '["di luar dugaan", "sisi luar", "luar negeri", "makan di luar"]'::jsonb, 3, '外食 dibaca がいしょく, artinya "makan di luar".', 'makna sekanji', 'belum', 669),
('K5-0670', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外食', '["そとしょく", "がうしょく", "がいしょく", "かいしょく"]'::jsonb, 2, '外食 artinya "makan di luar", dibaca がいしょく. Membacanya そとしょく adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 670),
('K5-0671', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外れる（はずれる）', '["di luar dugaan", "meleset", "orang asing", "keluar rumah"]'::jsonb, 1, '外れる dibaca はずれる, artinya "meleset".', 'makna sekanji', 'belum', 671),
('K5-0672', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外れる', '["はずれる", "はすれる", "がいれる", "ばずれる"]'::jsonb, 0, '外れる artinya "meleset", dibaca はずれる. Membacanya がいれる adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 672),
('K5-0673', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
案外（あんがい）', '["makan di luar", "di luar dugaan", "sisi luar", "luar negeri"]'::jsonb, 1, '案外 dibaca あんがい, artinya "di luar dugaan".', 'makna sekanji', 'belum', 673),
('K5-0674', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
案外', '["おんがい", "あんかい", "あんがい", "おんかい"]'::jsonb, 2, '案外 artinya "di luar dugaan", dibaca あんがい.', 'vowel / daku / vowel+daku', 'belum', 674),
('K5-0675', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
外側（そとがわ）', '["sisi luar", "di luar dugaan", "luar negeri", "makan di luar"]'::jsonb, 0, '外側 dibaca そとがわ, artinya "sisi luar".', 'makna sekanji', 'belum', 675),
('K5-0676', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
外側', '["がいがわ", "ぞとがわ", "そどがわ", "そとがわ"]'::jsonb, 3, '外側 artinya "sisi luar", dibaca そとがわ. Membacanya がいがわ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 676),
('K5-0677', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東（ひがし）', '["bawah", "timur", "kiri", "barat"]'::jsonb, 1, '東 dibaca ひがし, artinya "timur".', 'makna se-ranah', 'belum', 677),
('K5-0678', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東', '["ひがし", "びがし", "ひかし", "とう"]'::jsonb, 0, '東 artinya "timur", dibaca ひがし. Membacanya とう adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 678),
('K5-0679', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東京（とうきょう）', '["wilayah Kanto", "bagian timur", "Tokyo", "dunia Timur"]'::jsonb, 2, '東京 dibaca とうきょう, artinya "Tokyo".', 'makna sekanji', 'belum', 679),
('K5-0680', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東京', '["ときょう", "ひがしきょう", "どうきょう", "とうきょう"]'::jsonb, 3, '東京 artinya "Tokyo", dibaca とうきょう. Membacanya ひがしきょう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 680),
('K5-0681', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東口（ひがしぐち）', '["dunia Timur", "pintu timur", "sisi timur", "bagian timur"]'::jsonb, 1, '東口 dibaca ひがしぐち, artinya "pintu timur".', 'makna sekanji', 'belum', 681),
('K5-0682', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東口', '["ひがしぐち", "とうぐち", "ひかしぐち", "ひがじぐち"]'::jsonb, 0, '東口 artinya "pintu timur", dibaca ひがしぐち. Membacanya とうぐち adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 682),
('K5-0683', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東西（とうざい）', '["Timur Tengah", "dunia Timur", "pintu timur", "timur barat"]'::jsonb, 3, '東西 dibaca とうざい, artinya "timur barat".', 'makna sekanji', 'belum', 683),
('K5-0684', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東西', '["ひがしざい", "とざい", "とうざい", "どうざい"]'::jsonb, 2, '東西 artinya "timur barat", dibaca とうざい. Membacanya ひがしざい adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 684),
('K5-0685', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
中東（ちゅうとう）', '["bagian timur", "timur barat", "pintu timur", "Timur Tengah"]'::jsonb, 3, '中東 dibaca ちゅうとう, artinya "Timur Tengah".', 'makna sekanji', 'belum', 685),
('K5-0686', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中東', '["ちゆとう", "ちゆうとう", "ちゅうとう", "ちゅとう"]'::jsonb, 2, '中東 artinya "Timur Tengah", dibaca ちゅうとう.', 'youon / chouon- / youon+chouon-', 'belum', 686),
('K5-0687', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東部（とうぶ）', '["dunia Timur", "bagian timur", "pintu timur", "sisi timur"]'::jsonb, 1, '東部 dibaca とうぶ, artinya "bagian timur".', 'makna sekanji', 'belum', 687),
('K5-0688', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東部', '["とうぶ", "どうぶ", "ひがしぶ", "とぶ"]'::jsonb, 0, '東部 artinya "bagian timur", dibaca とうぶ. Membacanya ひがしぶ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 688),
('K5-0689', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
関東（かんとう）', '["timur barat", "wilayah Kansai", "wilayah Kanto", "pintu timur"]'::jsonb, 2, '関東 dibaca かんとう, artinya "wilayah Kanto".', 'makna sekanji', 'belum', 689),
('K5-0690', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
関東', '["がんどう", "がんとう", "かんどう", "かんとう"]'::jsonb, 3, '関東 artinya "wilayah Kanto", dibaca かんとう.', 'daku / daku+daku', 'belum', 690),
('K5-0691', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東側（ひがしがわ）', '["sisi timur", "dunia Timur", "bagian timur", "pintu timur"]'::jsonb, 0, '東側 dibaca ひがしがわ, artinya "sisi timur".', 'makna sekanji', 'belum', 691),
('K5-0692', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東側', '["とうがわ", "ひがしがわ", "びがしがわ", "ひかしがわ"]'::jsonb, 1, '東側 artinya "sisi timur", dibaca ひがしがわ. Membacanya とうがわ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 692),
('K5-0693', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東洋（とうよう）', '["pintu timur", "bagian timur", "dunia Timur", "sisi timur"]'::jsonb, 2, '東洋 dibaca とうよう, artinya "dunia Timur".', 'makna sekanji', 'belum', 693),
('K5-0694', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東洋', '["とうよう", "とよう", "ひがしよう", "どうよう"]'::jsonb, 0, '東洋 artinya "dunia Timur", dibaca とうよう. Membacanya ひがしよう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 694),
('K5-0695', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東京都（とうきょうと）', '["Timur Tengah", "dunia Timur", "bagian timur", "Kota Tokyo"]'::jsonb, 3, '東京都 dibaca とうきょうと, artinya "Kota Tokyo".', 'makna sekanji', 'belum', 695),
('K5-0696', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東京都', '["ひがしきょうと", "とうきょうと", "どうきょうと", "ときょうと"]'::jsonb, 1, '東京都 artinya "Kota Tokyo", dibaca とうきょうと. Membacanya ひがしきょうと adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 696),
('K5-0697', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西（にし）', '["utara", "kiri", "selatan", "barat"]'::jsonb, 3, '西 dibaca にし, artinya "barat".', 'makna se-ranah', 'belum', 697),
('K5-0698', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西', '["のし", "にし", "にじ", "せい"]'::jsonb, 1, '西 artinya "barat", dibaca にし. Membacanya せい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 698),
('K5-0699', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西口（にしぐち）', '["pintu barat", "dunia Barat", "sisi barat", "bagian barat"]'::jsonb, 0, '西口 dibaca にしぐち, artinya "pintu barat".', 'makna sekanji', 'belum', 699),
('K5-0700', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西口', '["ねしぐち", "せいぐち", "にしぐち", "にじぐち"]'::jsonb, 2, '西口 artinya "pintu barat", dibaca にしぐち. Membacanya せいぐち adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 700),
('K5-0701', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西洋（せいよう）', '["dunia Barat", "sisi barat", "bagian barat", "pintu barat"]'::jsonb, 0, '西洋 dibaca せいよう, artinya "dunia Barat".', 'makna sekanji', 'belum', 701),
('K5-0702', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西洋', '["にしよう", "せいよう", "せよう", "ぜいよう"]'::jsonb, 1, '西洋 artinya "dunia Barat", dibaca せいよう. Membacanya にしよう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 702),
('K5-0703', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
関西（かんさい）', '["sisi barat", "barat laut", "wilayah Tohoku", "wilayah Kansai"]'::jsonb, 3, '関西 dibaca かんさい, artinya "wilayah Kansai".', 'makna sekanji', 'belum', 703),
('K5-0704', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
関西', '["がんさい", "かんざい", "かんさい", "がんざい"]'::jsonb, 2, '関西 artinya "wilayah Kansai", dibaca かんさい.', 'daku / daku+daku', 'belum', 704),
('K5-0705', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西部（せいぶ）', '["timur barat", "bagian barat", "pintu barat", "dunia Barat"]'::jsonb, 1, '西部 dibaca せいぶ, artinya "bagian barat".', 'makna sekanji', 'belum', 705),
('K5-0706', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西部', '["せぶ", "ぜいぶ", "にしぶ", "せいぶ"]'::jsonb, 3, '西部 artinya "bagian barat", dibaca せいぶ. Membacanya にしぶ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 706),
('K5-0707', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西側（にしがわ）', '["timur barat", "pintu barat", "sisi barat", "bagian barat"]'::jsonb, 2, '西側 dibaca にしがわ, artinya "sisi barat".', 'makna sekanji', 'belum', 707),
('K5-0708', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西側', '["にしがわ", "にじがわ", "ぬしがわ", "せいがわ"]'::jsonb, 0, '西側 artinya "sisi barat", dibaca にしがわ. Membacanya せいがわ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 708),
('K5-0709', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北西（ほくせい）', '["bagian barat", "barat laut", "dunia Barat", "timur barat"]'::jsonb, 1, '北西 dibaca ほくせい, artinya "barat laut".', 'makna sekanji', 'belum', 709),
('K5-0710', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北西', '["ほくせい", "ほぐせい", "ほぐぜい", "ほくぜい"]'::jsonb, 0, '北西 artinya "barat laut", dibaca ほくせい.', 'daku / daku+daku', 'belum', 710),
('K5-0711', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西日（にしび）', '["wilayah Kansai", "timur barat", "bagian barat", "sinar sore"]'::jsonb, 3, '西日 dibaca にしび, artinya "sinar sore".', 'makna sekanji', 'belum', 711),
('K5-0712', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西日', '["せいび", "にじび", "にしび", "なしび"]'::jsonb, 2, '西日 artinya "sinar sore", dibaca にしび. Membacanya せいび adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 712),
('K5-0713', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
大西洋（たいせいよう）', '["sinar sore", "barat laut", "pintu barat", "Samudra Atlantik"]'::jsonb, 3, '大西洋 dibaca たいせいよう, artinya "Samudra Atlantik".', 'makna sekanji', 'belum', 713),
('K5-0714', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大西洋', '["たいせいよう", "だうせいよう", "たうせいよう", "だいせいよう"]'::jsonb, 0, '大西洋 artinya "Samudra Atlantik", dibaca たいせいよう.', 'daku / vowel / daku+vowel', 'belum', 714),
('K5-0715', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南（みなみ）', '["timur", "kiri", "selatan", "atas"]'::jsonb, 2, '南 dibaca みなみ, artinya "selatan".', 'makna se-ranah', 'belum', 715),
('K5-0716', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南', '["なん", "みなみ", "みにみ", "まなみ"]'::jsonb, 1, '南 artinya "selatan", dibaca みなみ. Membacanya なん adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 716),
('K5-0717', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南口（みなみぐち）', '["bagian selatan", "pintu selatan", "bergerak selatan", "sisi selatan"]'::jsonb, 1, '南口 dibaca みなみぐち, artinya "pintu selatan".', 'makna sekanji', 'belum', 717),
('K5-0718', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南口', '["なんぐち", "もなみぐち", "みなみぐち", "みにみぐち"]'::jsonb, 2, '南口 artinya "pintu selatan", dibaca みなみぐち. Membacanya なんぐち adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 718),
('K5-0719', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南米（なんべい）', '["Amerika Selatan", "pintu selatan", "sisi selatan", "bergerak selatan"]'::jsonb, 0, '南米 dibaca なんべい, artinya "Amerika Selatan".', 'makna sekanji', 'belum', 719),
('K5-0720', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南米', '["みなみべい", "ねんべい", "なんぺい", "なんべい"]'::jsonb, 3, '南米 artinya "Amerika Selatan", dibaca なんべい. Membacanya みなみべい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 720),
('K5-0721', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東南（とうなん）', '["bergerak selatan", "tenggara", "sisi selatan", "Kutub Selatan"]'::jsonb, 1, '東南 dibaca とうなん, artinya "tenggara".', 'makna sekanji', 'belum', 721),
('K5-0722', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東南', '["とうなん", "どうなん", "となん", "どなん"]'::jsonb, 0, '東南 artinya "tenggara", dibaca とうなん.', 'daku / chouon- / daku+chouon-', 'belum', 722),
('K5-0723', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南部（なんぶ）', '["Amerika Selatan", "sisi selatan", "Kutub Selatan", "bagian selatan"]'::jsonb, 3, '南部 dibaca なんぶ, artinya "bagian selatan".', 'makna sekanji', 'belum', 723),
('K5-0724', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南部', '["みなみぶ", "ねんぶ", "なんぶ", "なんぷ"]'::jsonb, 2, '南部 artinya "bagian selatan", dibaca なんぶ. Membacanya みなみぶ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 724),
('K5-0725', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南側（みなみがわ）', '["bergerak selatan", "sisi selatan", "bagian selatan", "Amerika Selatan"]'::jsonb, 1, '南側 dibaca みなみがわ, artinya "sisi selatan".', 'makna sekanji', 'belum', 725),
('K5-0726', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南側', '["みなみがわ", "なんがわ", "みのみがわ", "もなみがわ"]'::jsonb, 0, '南側 artinya "sisi selatan", dibaca みなみがわ. Membacanya なんがわ adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 726),
('K5-0727', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南極（なんきょく）', '["sisi selatan", "bagian selatan", "bergerak selatan", "Kutub Selatan"]'::jsonb, 3, '南極 dibaca なんきょく, artinya "Kutub Selatan".', 'makna sekanji', 'belum', 727),
('K5-0728', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南極', '["のんきょく", "なんぎょく", "なんきょく", "みなみきょく"]'::jsonb, 2, '南極 artinya "Kutub Selatan", dibaca なんきょく. Membacanya みなみきょく adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 728),
('K5-0729', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
西南（せいなん）', '["barat laut", "bergerak selatan", "Amerika Selatan", "barat daya"]'::jsonb, 3, '西南 dibaca せいなん, artinya "barat daya".', 'makna sekanji', 'belum', 729),
('K5-0730', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
西南', '["ぜいなん", "せなん", "せいなん", "ぜなん"]'::jsonb, 2, '西南 artinya "barat daya", dibaca せいなん.', 'daku / chouon- / daku+chouon-', 'belum', 730),
('K5-0731', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南下（なんか）', '["sisi selatan", "bergerak selatan", "bagian selatan", "pintu selatan"]'::jsonb, 1, '南下 dibaca なんか, artinya "bergerak selatan".', 'makna sekanji', 'belum', 731),
('K5-0732', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南下', '["なんか", "なんが", "みなみか", "ぬんか"]'::jsonb, 0, '南下 artinya "bergerak selatan", dibaca なんか. Membacanya みなみか adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 732),
('K5-0733', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南向き（みなみむき）', '["bergerak selatan", "Kutub Selatan", "menghadap selatan", "sisi selatan"]'::jsonb, 2, '南向き dibaca みなみむき, artinya "menghadap selatan".', 'makna sekanji', 'belum', 733),
('K5-0734', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南向き', '["もなみむき", "なんむき", "みのみむき", "みなみむき"]'::jsonb, 3, '南向き artinya "menghadap selatan", dibaca みなみむき. Membacanya なんむき adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 734),
('K5-0735', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北（きた）', '["luar", "utara", "kiri", "barat"]'::jsonb, 1, '北 dibaca きた, artinya "utara".', 'makna se-ranah', 'belum', 735),
('K5-0736', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北', '["きた", "きだ", "ぎだ", "ぎた"]'::jsonb, 0, '北 artinya "utara", dibaca きた.', 'daku / daku+daku', 'belum', 736),
('K5-0737', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北口（きたぐち）', '["sisi utara", "bagian utara", "pintu utara", "angin utara"]'::jsonb, 2, '北口 dibaca きたぐち, artinya "pintu utara".', 'makna sekanji', 'belum', 737),
('K5-0738', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北口', '["ぎたぐち", "ぎだぐち", "きだぐち", "きたぐち"]'::jsonb, 3, '北口 artinya "pintu utara", dibaca きたぐち.', 'daku / daku+daku', 'belum', 738),
('K5-0739', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
東北（とうほく）', '["wilayah Tohoku", "barat laut", "pintu utara", "sisi utara"]'::jsonb, 0, '東北 dibaca とうほく, artinya "wilayah Tohoku".', 'makna sekanji', 'belum', 739),
('K5-0740', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東北', '["どほく", "とうほく", "どうほく", "とほく"]'::jsonb, 1, '東北 artinya "wilayah Tohoku", dibaca とうほく.', 'daku / chouon- / daku+chouon-', 'belum', 740),
('K5-0741', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北海道（ほっかいどう）', '["bagian utara", "Hokkaido", "Kutub Utara", "angin utara"]'::jsonb, 1, '北海道 dibaca ほっかいどう, artinya "Hokkaido".', 'makna sekanji', 'belum', 741),
('K5-0742', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北海道', '["ほかいどう", "ほかうどう", "ほっかうどう", "ほっかいどう"]'::jsonb, 3, '北海道 artinya "Hokkaido", dibaca ほっかいどう.', 'sokuon- / vowel / sokuon-+vowel', 'belum', 742),
('K5-0743', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北部（ほくぶ）', '["bagian utara", "angin utara", "sisi utara", "Kutub Utara"]'::jsonb, 0, '北部 dibaca ほくぶ, artinya "bagian utara".', 'makna sekanji', 'belum', 743),
('K5-0744', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北部', '["ほくぷ", "ほぐぶ", "ほくぶ", "ほぐぷ"]'::jsonb, 2, '北部 artinya "bagian utara", dibaca ほくぶ.', 'daku / daku+daku', 'belum', 744),
('K5-0745', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北側（きたがわ）', '["bagian utara", "angin utara", "sisi utara", "Kutub Utara"]'::jsonb, 2, '北側 dibaca きたがわ, artinya "sisi utara".', 'makna sekanji', 'belum', 745),
('K5-0746', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北側', '["きだがわ", "ぎだがわ", "ぎたがわ", "きたがわ"]'::jsonb, 3, '北側 artinya "sisi utara", dibaca きたがわ.', 'daku / daku+daku', 'belum', 746),
('K5-0747', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北極（ほっきょく）', '["bagian utara", "Kutub Utara", "angin utara", "pintu utara"]'::jsonb, 1, '北極 dibaca ほっきょく, artinya "Kutub Utara".', 'makna sekanji', 'belum', 747),
('K5-0748', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北極', '["ほっきょく", "ぼっきょく", "ぼきょく", "ほきょく"]'::jsonb, 0, '北極 artinya "Kutub Utara", dibaca ほっきょく.', 'daku / sokuon- / daku+sokuon-', 'belum', 748),
('K5-0749', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
北風（きたかぜ）', '["sisi utara", "angin utara", "Kutub Utara", "bagian utara"]'::jsonb, 1, '北風 dibaca きたかぜ, artinya "angin utara".', 'makna sekanji', 'belum', 749),
('K5-0750', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
北風', '["ぎだかぜ", "きだかぜ", "ぎたかぜ", "きたかぜ"]'::jsonb, 3, '北風 artinya "angin utara", dibaca きたかぜ.', 'daku / daku+daku', 'belum', 750),
('K5-0751', 'N5', 'kanji', 'Arti', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Apa arti kata berikut?
南北（なんぼく）', '["sisi utara", "bagian utara", "utara selatan", "pintu utara"]'::jsonb, 2, '南北 dibaca なんぼく, artinya "utara selatan".', 'makna sekanji', 'belum', 751),
('K5-0752', 'N5', 'kanji', 'Bacaan', 3, 'T03', 'Arah & Posisi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
南北', '["なんぼく", "にんぽく", "なんぽく", "にんぼく"]'::jsonb, 0, '南北 artinya "utara selatan", dibaca なんぼく.', 'vowel / daku / vowel+daku', 'belum', 752),
('K5-0753', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
人（ひと）', '["orang", "anak", "orang tua murid", "laki-laki"]'::jsonb, 0, '人 dibaca ひと, artinya "orang".', 'makna sekanji', 'belum', 753),
('K5-0754', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人', '["ひとう", "びと", "ひと", "ひど"]'::jsonb, 2, '人 artinya "orang", dibaca ひと.', 'daku / chouon+', 'belum', 754),
('K5-0755', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
日本人（にほんじん）', '["orang dewasa", "orang Jepang", "suami / tuan", "populer"]'::jsonb, 1, '日本人 dibaca にほんじん, artinya "orang Jepang".', 'makna sekanji', 'belum', 755),
('K5-0756', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日本人', '["にぼんじん", "のほんじん", "のぼんじん", "にほんじん"]'::jsonb, 3, '日本人 artinya "orang Jepang", dibaca にほんじん.', 'vowel / daku / vowel+daku', 'belum', 756),
('K5-0757', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
大人（おとな）', '["populer", "kehidupan", "orang Jepang", "orang dewasa"]'::jsonb, 3, '大人 dibaca おとな, artinya "orang dewasa".', 'makna sekanji', 'belum', 757),
('K5-0758', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大人', '["おうどな", "おうとな", "おとな", "おどな"]'::jsonb, 2, '大人 artinya "orang dewasa", dibaca おとな.', 'chouon+ / daku / chouon++daku', 'belum', 758),
('K5-0759', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
人気（にんき）', '["populer", "kekasih", "orang dewasa", "teman"]'::jsonb, 0, '人気 dibaca にんき, artinya "populer".', 'makna sekanji', 'belum', 759),
('K5-0760', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人気', '["にんぎ", "にんき", "ぬんぎ", "ぬんき"]'::jsonb, 1, '人気 artinya "populer", dibaca にんき.', 'vowel / daku / vowel+daku', 'belum', 760),
('K5-0761', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
人口（じんこう）', '["populer", "orang dewasa", "jumlah penduduk", "boneka"]'::jsonb, 2, '人口 dibaca じんこう, artinya "jumlah penduduk".', 'makna sekanji', 'belum', 761),
('K5-0762', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人口', '["じんこう", "じんごう", "しんこう", "しんごう"]'::jsonb, 0, '人口 artinya "jumlah penduduk", dibaca じんこう.', 'daku / daku+daku', 'belum', 762),
('K5-0763', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
恋人（こいびと）', '["orang dewasa", "kekasih", "populer", "kehidupan"]'::jsonb, 1, '恋人 dibaca こいびと, artinya "kekasih".', 'makna sekanji', 'belum', 763),
('K5-0764', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
恋人', '["こおびと", "ごおびと", "ごいびと", "こいびと"]'::jsonb, 3, '恋人 artinya "kekasih", dibaca こいびと.', 'daku / vowel / daku+vowel', 'belum', 764),
('K5-0765', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
人形（にんぎょう）', '["kekasih", "jumlah penduduk", "boneka", "populer"]'::jsonb, 2, '人形 dibaca にんぎょう, artinya "boneka".', 'makna sekanji', 'belum', 765),
('K5-0766', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人形', '["のんぎょう", "にんきょう", "のんきょう", "にんぎょう"]'::jsonb, 3, '人形 artinya "boneka", dibaca にんぎょう.', 'vowel / daku / vowel+daku', 'belum', 766),
('K5-0767', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
主人（しゅじん）', '["suami / tuan", "orang dewasa", "teman", "populer"]'::jsonb, 0, '主人 dibaca しゅじん, artinya "suami / tuan".', 'makna sekanji', 'belum', 767),
('K5-0768', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
主人', '["じゅうじん", "しゅじん", "しゅうじん", "じゅじん"]'::jsonb, 1, '主人 artinya "suami / tuan", dibaca しゅじん.', 'daku / chouon+ / daku+chouon+', 'belum', 768),
('K5-0769', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
人生（じんせい）', '["boneka", "populer", "kekasih", "kehidupan"]'::jsonb, 3, '人生 dibaca じんせい, artinya "kehidupan".', 'makna sekanji', 'belum', 769),
('K5-0770', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
人生', '["しんぜい", "しんせい", "じんせい", "じんぜい"]'::jsonb, 2, '人生 artinya "kehidupan", dibaca じんせい.', 'daku / daku+daku', 'belum', 770),
('K5-0771', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
友人（ゆうじん）', '["teman sekolah", "teman", "populer", "suami / tuan"]'::jsonb, 1, '友人 dibaca ゆうじん, artinya "teman".', 'makna sekanji', 'belum', 771),
('K5-0772', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
友人', '["ゆうじん", "やうじん", "ゆじん", "やじん"]'::jsonb, 0, '友人 artinya "teman", dibaca ゆうじん.', 'vowel / chouon- / vowel+chouon-', 'belum', 772),
('K5-0773', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男（おとこ）', '["ayah (sendiri)", "laki-laki", "ibu (sendiri)", "perempuan"]'::jsonb, 1, '男 dibaca おとこ, artinya "laki-laki".', 'makna se-ranah', 'belum', 773),
('K5-0774', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男', '["おとこ", "だん", "おうとこ", "おどこ"]'::jsonb, 0, '男 artinya "laki-laki", dibaca おとこ. Membacanya だん adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 774),
('K5-0775', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男性（だんせい）', '["pria wanita", "pria rupawan", "pria", "anak sulung pria"]'::jsonb, 2, '男性 dibaca だんせい, artinya "pria".', 'makna sekanji', 'belum', 775),
('K5-0776', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男性', '["たんせい", "だんぜい", "おとこせい", "だんせい"]'::jsonb, 3, '男性 artinya "pria", dibaca だんせい. Membacanya おとこせい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 776),
('K5-0777', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男の子（おとこのこ）', '["anak sulung pria", "anak perempuan", "anak laki-laki", "anak kedua pria"]'::jsonb, 2, '男の子 dibaca おとこのこ, artinya "anak laki-laki".', 'makna sekanji', 'belum', 777),
('K5-0778', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男の子', '["だんのこ", "おうとこのこ", "おどこのこ", "おとこのこ"]'::jsonb, 3, '男の子 artinya "anak laki-laki", dibaca おとこのこ. Membacanya だんのこ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 778),
('K5-0779', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
長男（ちょうなん）', '["anak sulung pria", "anak kedua pria", "pria", "pemandian pria"]'::jsonb, 0, '長男 dibaca ちょうなん, artinya "anak sulung pria".', 'makna sekanji', 'belum', 779),
('K5-0780', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長男', '["ちよなん", "ちょうなん", "ちょなん", "ちようなん"]'::jsonb, 1, '長男 artinya "anak sulung pria", dibaca ちょうなん.', 'youon / chouon- / youon+chouon-', 'belum', 780),
('K5-0781', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男子（だんし）', '["pria rupawan", "siswa putra", "siswa putri", "anak sulung pria"]'::jsonb, 1, '男子 dibaca だんし, artinya "siswa putra".', 'makna sekanji', 'belum', 781),
('K5-0782', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男子', '["だんじ", "たんし", "だんし", "おとこし"]'::jsonb, 2, '男子 artinya "siswa putra", dibaca だんし. Membacanya おとこし adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 782),
('K5-0783', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
美男（びなん）', '["pria tampan", "pria rupawan", "pria", "pria wanita"]'::jsonb, 0, '美男 dibaca びなん, artinya "pria tampan".', 'makna sekanji', 'belum', 783),
('K5-0784', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
美男', '["ぼなん", "びにん", "ひなん", "びなん"]'::jsonb, 3, '美男 artinya "pria tampan", dibaca びなん.', 'daku / vowel', 'belum', 784),
('K5-0785', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男女（だんじょ）', '["pria tampan", "pria rupawan", "pria", "pria wanita"]'::jsonb, 3, '男女 dibaca だんじょ, artinya "pria wanita".', 'makna sekanji', 'belum', 785),
('K5-0786', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男女', '["だんじょ", "たんじょ", "おとこじょ", "だんしょ"]'::jsonb, 0, '男女 artinya "pria wanita", dibaca だんじょ. Membacanya おとこじょ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 786),
('K5-0787', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
次男（じなん）', '["pria", "anak kedua pria", "pemandian pria", "anak sulung pria"]'::jsonb, 1, '次男 dibaca じなん, artinya "anak kedua pria".', 'makna sekanji', 'belum', 787),
('K5-0788', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
次男', '["しなん", "しねん", "じなん", "じねん"]'::jsonb, 2, '次男 artinya "anak kedua pria", dibaca じなん.', 'daku / vowel / daku+vowel', 'belum', 788),
('K5-0789', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男湯（おとこゆ）', '["anak kedua pria", "pria", "anak sulung pria", "pemandian pria"]'::jsonb, 3, '男湯 dibaca おとこゆ, artinya "pemandian pria".', 'makna sekanji', 'belum', 789),
('K5-0790', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男湯', '["だんゆ", "おどこゆ", "おとこゆ", "おうとこゆ"]'::jsonb, 2, '男湯 artinya "pemandian pria", dibaca おとこゆ. Membacanya だんゆ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 790),
('K5-0791', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男前（おとこまえ）', '["pria rupawan", "pria", "pria tampan", "pria wanita"]'::jsonb, 0, '男前 dibaca おとこまえ, artinya "pria rupawan".', 'makna sekanji', 'belum', 791),
('K5-0792', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男前', '["だんまえ", "おとこまえ", "おどこまえ", "おうとこまえ"]'::jsonb, 1, '男前 artinya "pria rupawan", dibaca おとこまえ. Membacanya だんまえ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 792),
('K5-0793', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女（おんな）', '["perempuan", "lebih dulu", "orang", "laki-laki"]'::jsonb, 0, '女 dibaca おんな, artinya "perempuan".', 'makna se-ranah', 'belum', 793),
('K5-0794', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女', '["おうんな", "おんな", "おんの", "じょ"]'::jsonb, 1, '女 artinya "perempuan", dibaca おんな. Membacanya じょ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 794),
('K5-0795', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女性（じょせい）', '["pria wanita", "pemandian wanita", "putri sulung", "wanita"]'::jsonb, 3, '女性 dibaca じょせい, artinya "wanita".', 'makna sekanji', 'belum', 795),
('K5-0796', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女性', '["じょうせい", "しょせい", "じょせい", "おんなせい"]'::jsonb, 2, '女性 artinya "wanita", dibaca じょせい. Membacanya おんなせい adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 796),
('K5-0797', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女の子（おんなのこ）', '["anak laki-laki", "teman perempuan", "anak perempuan", "anak lelaki"]'::jsonb, 2, '女の子 dibaca おんなのこ, artinya "anak perempuan".', 'makna sekanji', 'belum', 797),
('K5-0798', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女の子', '["おんなのこ", "おんののこ", "じょのこ", "おうんなのこ"]'::jsonb, 0, '女の子 artinya "anak perempuan", dibaca おんなのこ. Membacanya じょのこ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 798),
('K5-0799', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
彼女（かのじょ）', '["putri sulung", "pacar / dia", "siswa putri", "pria wanita"]'::jsonb, 1, '彼女 dibaca かのじょ, artinya "pacar / dia".', 'makna sekanji', 'belum', 799),
('K5-0800', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
彼女', '["がのじょ", "がのうじょ", "かのうじょ", "かのじょ"]'::jsonb, 3, '彼女 artinya "pacar / dia", dibaca かのじょ.', 'daku / chouon+ / daku+chouon+', 'belum', 800)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-0801', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女子（じょし）', '["siswa putri", "putri sulung", "gadis", "pemandian wanita"]'::jsonb, 0, '女子 dibaca じょし, artinya "siswa putri".', 'makna sekanji', 'belum', 801),
('K5-0802', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女子', '["おんなし", "じょし", "しょし", "じょうし"]'::jsonb, 1, '女子 artinya "siswa putri", dibaca じょし. Membacanya おんなし adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 802),
('K5-0803', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
少女（しょうじょ）', '["pemandian wanita", "wanita", "ratu", "gadis"]'::jsonb, 3, '少女 dibaca しょうじょ, artinya "gadis".', 'makna sekanji', 'belum', 803),
('K5-0804', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
少女', '["じょうじょ", "しようじょ", "しょうじょ", "じようじょ"]'::jsonb, 2, '少女 artinya "gadis", dibaca しょうじょ.', 'daku / youon / daku+youon', 'belum', 804),
('K5-0805', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
長女（ちょうじょ）', '["putri sulung", "siswa putri", "gadis", "pemandian wanita"]'::jsonb, 0, '長女 dibaca ちょうじょ, artinya "putri sulung".', 'makna sekanji', 'belum', 805),
('K5-0806', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長女', '["ちよじょ", "ちょじょ", "ちようじょ", "ちょうじょ"]'::jsonb, 3, '長女 artinya "putri sulung", dibaca ちょうじょ.', 'youon / chouon- / youon+chouon-', 'belum', 806),
('K5-0807', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女王（じょおう）', '["pria wanita", "putri sulung", "ratu", "pemandian wanita"]'::jsonb, 2, '女王 dibaca じょおう, artinya "ratu".', 'makna sekanji', 'belum', 807),
('K5-0808', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女王', '["じょうおう", "じょおう", "おんなおう", "しょおう"]'::jsonb, 1, '女王 artinya "ratu", dibaca じょおう. Membacanya おんなおう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 808),
('K5-0809', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女湯（おんなゆ）', '["wanita", "pemandian wanita", "siswa putri", "pria wanita"]'::jsonb, 1, '女湯 dibaca おんなゆ, artinya "pemandian wanita".', 'makna sekanji', 'belum', 809),
('K5-0810', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女湯', '["じょゆ", "おんにゆ", "おんなゆ", "おうんなゆ"]'::jsonb, 2, '女湯 artinya "pemandian wanita", dibaca おんなゆ. Membacanya じょゆ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 810),
('K5-0811', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
子（こ）', '["anak", "anak sulung pria", "anak kedua pria", "ibu (sendiri)"]'::jsonb, 0, '子 dibaca こ, artinya "anak".', 'makna sekanji', 'belum', 811),
('K5-0812', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
子', '["こう", "か", "ご", "こ"]'::jsonb, 3, '子 artinya "anak", dibaca こ.', 'daku / chouon+ / vowel', 'belum', 812),
('K5-0813', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
子供（こども）', '["anak lelaki", "anak-anak", "kursi", "elektronik"]'::jsonb, 1, '子供 dibaca こども, artinya "anak-anak".', 'makna sekanji', 'belum', 813),
('K5-0814', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
子供', '["ごとも", "ことも", "ごども", "こども"]'::jsonb, 3, '子供 artinya "anak-anak", dibaca こども.', 'daku / daku+daku', 'belum', 814),
('K5-0815', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
息子（むすこ）', '["anak lelaki", "kursi", "anak hilang", "anak kembar"]'::jsonb, 0, '息子 dibaca むすこ, artinya "anak lelaki".', 'makna sekanji', 'belum', 815),
('K5-0816', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
息子', '["むうすこ", "むずこ", "むすこ", "むうずこ"]'::jsonb, 2, '息子 artinya "anak lelaki", dibaca むすこ.', 'chouon+ / daku / chouon++daku', 'belum', 816),
('K5-0817', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
帽子（ぼうし）', '["kursi", "topi", "anak lelaki", "elektronik"]'::jsonb, 1, '帽子 dibaca ぼうし, artinya "topi".', 'makna sekanji', 'belum', 817),
('K5-0818', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帽子', '["ぼし", "ほし", "ぼうし", "ほうし"]'::jsonb, 2, '帽子 artinya "topi", dibaca ぼうし.', 'daku / chouon- / daku+chouon-', 'belum', 818),
('K5-0819', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
椅子（いす）', '["kursi", "anak hilang", "anak lelaki", "topi"]'::jsonb, 0, '椅子 dibaca いす, artinya "kursi".', 'makna sekanji', 'belum', 819),
('K5-0820', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
椅子', '["うず", "いず", "うす", "いす"]'::jsonb, 3, '椅子 artinya "kursi", dibaca いす.', 'vowel / daku / vowel+daku', 'belum', 820),
('K5-0821', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
様子（ようす）', '["keadaan", "anak lelaki", "kondisi", "elektronik"]'::jsonb, 0, '様子 dibaca ようす, artinya "keadaan".', 'makna sekanji', 'belum', 821),
('K5-0822', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
様子', '["よす", "ようす", "やす", "やうす"]'::jsonb, 1, '様子 artinya "keadaan", dibaca ようす.', 'vowel / chouon- / vowel+chouon-', 'belum', 822),
('K5-0823', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
調子（ちょうし）', '["anak-anak", "keadaan", "anak hilang", "kondisi"]'::jsonb, 3, '調子 dibaca ちょうし, artinya "kondisi".', 'makna sekanji', 'belum', 823),
('K5-0824', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
調子', '["ちようし", "ちょし", "ちょうし", "ちよし"]'::jsonb, 2, '調子 artinya "kondisi", dibaca ちょうし.', 'youon / chouon- / youon+chouon-', 'belum', 824),
('K5-0825', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
双子（ふたご）', '["anak hilang", "anak lelaki", "anak kembar", "keadaan"]'::jsonb, 2, '双子 dibaca ふたご, artinya "anak kembar".', 'makna sekanji', 'belum', 825),
('K5-0826', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
双子', '["ふたご", "ぶたご", "ぶだご", "ふだご"]'::jsonb, 0, '双子 artinya "anak kembar", dibaca ふたご.', 'daku / daku+daku', 'belum', 826),
('K5-0827', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
迷子（まいご）', '["anak kembar", "anak hilang", "keadaan", "anak lelaki"]'::jsonb, 1, '迷子 dibaca まいご, artinya "anak hilang".', 'makna sekanji', 'belum', 827),
('K5-0828', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
迷子', '["もえご", "もいご", "まえご", "まいご"]'::jsonb, 3, '迷子 artinya "anak hilang", dibaca まいご.', 'vowel / vowel+vowel', 'belum', 828),
('K5-0829', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
電子（でんし）', '["elektronik", "kursi", "anak kembar", "anak-anak"]'::jsonb, 0, '電子 dibaca でんし, artinya "elektronik".', 'makna sekanji', 'belum', 829),
('K5-0830', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電子', '["てんし", "でんし", "てんじ", "でんじ"]'::jsonb, 1, '電子 artinya "elektronik", dibaca でんし.', 'daku / daku+daku', 'belum', 830),
('K5-0831', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父（ちち）', '["ibu (sendiri)", "anak", "lebih dulu", "ayah (sendiri)"]'::jsonb, 3, '父 dibaca ちち, artinya "ayah (sendiri)".', 'makna sekanji', 'belum', 831),
('K5-0832', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父', '["てち", "ちっち", "ちち", "てっち"]'::jsonb, 2, '父 artinya "ayah (sendiri)", dibaca ちち.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 832),
('K5-0833', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
お父さん（おとうさん）', '["ayah mertua", "Hari Ayah", "pihak ayah", "ayah"]'::jsonb, 3, 'お父さん dibaca おとうさん, artinya "ayah".', 'makna sekanji', 'belum', 833),
('K5-0834', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
お父さん', '["おとうさん", "おどうさん", "おうとうさん", "おうどうさん"]'::jsonb, 0, 'お父さん artinya "ayah", dibaca おとうさん.', 'chouon+ / daku / chouon++daku', 'belum', 834),
('K5-0835', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父親（ちちおや）', '["ayah", "ayah ibu", "sosok ayah", "pihak ayah"]'::jsonb, 2, '父親 dibaca ちちおや, artinya "sosok ayah".', 'makna sekanji', 'belum', 835),
('K5-0836', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父親', '["つっちおや", "ちちおや", "つちおや", "ちっちおや"]'::jsonb, 1, '父親 artinya "sosok ayah", dibaca ちちおや.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 836),
('K5-0837', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
祖父（そふ）', '["kakek", "pihak ayah", "pastor", "orang tua murid"]'::jsonb, 0, '祖父 dibaca そふ, artinya "kakek".', 'makna sekanji', 'belum', 837),
('K5-0838', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
祖父', '["そぷ", "ぞふ", "そふ", "ぞぷ"]'::jsonb, 2, '祖父 artinya "kakek", dibaca そふ.', 'daku / daku+daku', 'belum', 838),
('K5-0839', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父母（ふぼ）', '["pihak ayah", "ayah", "ayah mertua", "ayah ibu"]'::jsonb, 3, '父母 dibaca ふぼ, artinya "ayah ibu".', 'makna sekanji', 'belum', 839),
('K5-0840', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父母', '["ぶぼ", "ふぼ", "ふぽ", "ふほ"]'::jsonb, 1, '父母 artinya "ayah ibu", dibaca ふぼ.', 'daku', 'belum', 840),
('K5-0841', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
神父（しんぷ）', '["ayah ibu", "orang tua murid", "pastor", "kakek"]'::jsonb, 2, '神父 dibaca しんぷ, artinya "pastor".', 'makna sekanji', 'belum', 841),
('K5-0842', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
神父', '["じんぷ", "しんぶ", "じんぶ", "しんぷ"]'::jsonb, 3, '神父 artinya "pastor", dibaca しんぷ.', 'daku / daku+daku', 'belum', 842),
('K5-0843', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
義父（ぎふ）', '["sosok ayah", "ayah mertua", "pihak ayah", "ayah ibu"]'::jsonb, 1, '義父 dibaca ぎふ, artinya "ayah mertua".', 'makna sekanji', 'belum', 843),
('K5-0844', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
義父', '["ぎふ", "きぶ", "きふ", "ぎぶ"]'::jsonb, 0, '義父 artinya "ayah mertua", dibaca ぎふ.', 'daku / daku+daku', 'belum', 844),
('K5-0845', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父の日（ちちのひ）', '["pihak ayah", "ayah", "sosok ayah", "Hari Ayah"]'::jsonb, 3, '父の日 dibaca ちちのひ, artinya "Hari Ayah".', 'makna sekanji', 'belum', 845),
('K5-0846', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父の日', '["ちちのひ", "てっちのひ", "てちのひ", "ちっちのひ"]'::jsonb, 0, '父の日 artinya "Hari Ayah", dibaca ちちのひ.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 846),
('K5-0847', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父方（ちちかた）', '["Hari Ayah", "ayah ibu", "pihak ayah", "sosok ayah"]'::jsonb, 2, '父方 dibaca ちちかた, artinya "pihak ayah".', 'makna sekanji', 'belum', 847),
('K5-0848', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父方', '["とっちかた", "ちちかた", "とちかた", "ちっちかた"]'::jsonb, 1, '父方 artinya "pihak ayah", dibaca ちちかた.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 848),
('K5-0849', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
父兄（ふけい）', '["orang tua murid", "pihak ayah", "orang dewasa", "kakek"]'::jsonb, 0, '父兄 dibaca ふけい, artinya "orang tua murid".', 'makna sekanji', 'belum', 849),
('K5-0850', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
父兄', '["ふけ", "ふげい", "ふげ", "ふけい"]'::jsonb, 3, '父兄 artinya "orang tua murid", dibaca ふけい.', 'daku / chouon- / daku+chouon-', 'belum', 850),
('K5-0851', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母（はは）', '["ayah (sendiri)", "ibu (sendiri)", "laki-laki", "anak"]'::jsonb, 1, '母 dibaca はは, artinya "ibu (sendiri)".', 'makna sekanji', 'belum', 851),
('K5-0852', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母', '["はぱ", "ばは", "はは", "はば"]'::jsonb, 2, '母 artinya "ibu (sendiri)", dibaca はは.', 'daku', 'belum', 852),
('K5-0853', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
お母さん（おかあさん）', '["ibu", "pihak ibu", "bahasa ibu", "ibu mertua"]'::jsonb, 0, 'お母さん dibaca おかあさん, artinya "ibu".', 'makna sekanji', 'belum', 853),
('K5-0854', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
お母さん', '["おうかあさん", "おがあさん", "おかあさん", "おうがあさん"]'::jsonb, 2, 'お母さん artinya "ibu", dibaca おかあさん.', 'chouon+ / daku / chouon++daku', 'belum', 854),
('K5-0855', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母親（ははおや）', '["bahasa ibu", "sosok ibu", "ibu mertua", "pihak ibu"]'::jsonb, 1, '母親 dibaca ははおや, artinya "sosok ibu".', 'makna sekanji', 'belum', 855),
('K5-0856', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母親', '["はばおうや", "ははおうや", "はばおや", "ははおや"]'::jsonb, 3, '母親 artinya "sosok ibu", dibaca ははおや.', 'daku / chouon+ / daku+chouon+', 'belum', 856),
('K5-0857', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
祖母（そぼ）', '["sosok ibu", "bahasa ibu", "almamater", "nenek"]'::jsonb, 3, '祖母 dibaca そぼ, artinya "nenek".', 'makna sekanji', 'belum', 857),
('K5-0858', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
祖母', '["ぞほ", "ぞぼ", "そぼ", "そほ"]'::jsonb, 2, '祖母 artinya "nenek", dibaca そぼ.', 'daku / daku+daku', 'belum', 858),
('K5-0859', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母国（ぼこく）', '["nenek", "tanah air", "bahasa ibu", "pihak ibu"]'::jsonb, 1, '母国 dibaca ぼこく, artinya "tanah air".', 'makna sekanji', 'belum', 859),
('K5-0860', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母国', '["ぼこく", "ぼごぐ", "ぼごく", "ぼこぐ"]'::jsonb, 0, '母国 artinya "tanah air", dibaca ぼこく.', 'daku / daku+daku', 'belum', 860),
('K5-0861', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
義母（ぎぼ）', '["pihak ibu", "ibu mertua", "bahasa ibu", "ibu"]'::jsonb, 1, '義母 dibaca ぎぼ, artinya "ibu mertua".', 'makna sekanji', 'belum', 861),
('K5-0862', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
義母', '["ぎぼ", "きほ", "きぼ", "ぎほ"]'::jsonb, 0, '義母 artinya "ibu mertua", dibaca ぎぼ.', 'daku / daku+daku', 'belum', 862),
('K5-0863', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母の日（ははのひ）', '["sosok ibu", "pihak ibu", "ibu", "Hari Ibu"]'::jsonb, 3, '母の日 dibaca ははのひ, artinya "Hari Ibu".', 'makna sekanji', 'belum', 863),
('K5-0864', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母の日', '["ははのうひ", "はぱのひ", "ははのひ", "はぱのうひ"]'::jsonb, 2, '母の日 artinya "Hari Ibu", dibaca ははのひ.', 'daku / chouon+ / daku+chouon+', 'belum', 864),
('K5-0865', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母語（ぼご）', '["pihak ibu", "bahasa ibu", "sosok ibu", "ibu mertua"]'::jsonb, 1, '母語 dibaca ぼご, artinya "bahasa ibu".', 'makna sekanji', 'belum', 865),
('K5-0866', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母語', '["ぼこ", "ぼごう", "ほご", "ぼご"]'::jsonb, 3, '母語 artinya "bahasa ibu", dibaca ぼご.', 'daku / chouon+', 'belum', 866),
('K5-0867', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母方（ははかた）', '["pihak ibu", "ibu", "bahasa ibu", "sosok ibu"]'::jsonb, 0, '母方 dibaca ははかた, artinya "pihak ibu".', 'makna sekanji', 'belum', 867),
('K5-0868', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母方', '["ばはかた", "はぱかた", "ははかた", "ばぱかた"]'::jsonb, 2, '母方 artinya "pihak ibu", dibaca ははかた.', 'daku / daku+daku', 'belum', 868),
('K5-0869', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
母校（ぼこう）', '["bahasa ibu", "almamater", "ibu mertua", "pihak ibu"]'::jsonb, 1, '母校 dibaca ぼこう, artinya "almamater".', 'makna sekanji', 'belum', 869),
('K5-0870', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
母校', '["ぼこう", "ほごう", "ほこう", "ぼごう"]'::jsonb, 0, '母校 artinya "almamater", dibaca ぼこう.', 'daku / daku+daku', 'belum', 870),
('K5-0871', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
友達（ともだち）', '["teman sekolah", "teman lama", "teman", "teman nakal"]'::jsonb, 2, '友達 dibaca ともだち, artinya "teman".', 'makna sekanji', 'belum', 871),
('K5-0872', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
友達', '["どもうだち", "ともうだち", "どもだち", "ともだち"]'::jsonb, 3, '友達 artinya "teman", dibaca ともだち.', 'daku / chouon+ / daku+chouon+', 'belum', 872),
('K5-0873', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
親友（しんゆう）', '["sahabat karib", "alumni", "teman lama", "persahabatan"]'::jsonb, 0, '親友 dibaca しんゆう, artinya "sahabat karib".', 'makna sekanji', 'belum', 873),
('K5-0874', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
親友', '["じんゆう", "じんやう", "しんゆう", "しんやう"]'::jsonb, 2, '親友 artinya "sahabat karib", dibaca しんゆう.', 'daku / vowel / daku+vowel', 'belum', 874),
('K5-0875', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
友情（ゆうじょう）', '["teman lama", "persahabatan", "alumni", "teman"]'::jsonb, 1, '友情 dibaca ゆうじょう, artinya "persahabatan".', 'makna sekanji', 'belum', 875),
('K5-0876', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
友情', '["ゆじょう", "ようじょう", "よじょう", "ゆうじょう"]'::jsonb, 3, '友情 artinya "persahabatan", dibaca ゆうじょう.', 'vowel / chouon- / vowel+chouon-', 'belum', 876),
('K5-0877', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
学友（がくゆう）', '["teman lama", "teman", "teman nakal", "teman sekolah"]'::jsonb, 3, '学友 dibaca がくゆう, artinya "teman sekolah".', 'makna sekanji', 'belum', 877),
('K5-0878', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学友', '["がくゆう", "がぐゆう", "かくゆう", "かぐゆう"]'::jsonb, 0, '学友 artinya "teman sekolah", dibaca がくゆう.', 'daku / daku+daku', 'belum', 878),
('K5-0879', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
旧友（きゅうゆう）', '["teman sekolah", "teman nakal", "teman lama", "teman"]'::jsonb, 2, '旧友 dibaca きゅうゆう, artinya "teman lama".', 'makna sekanji', 'belum', 879),
('K5-0880', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
旧友', '["ぎゅうゆう", "きゅうゆう", "きゆうゆう", "ぎゆうゆう"]'::jsonb, 1, '旧友 artinya "teman lama", dibaca きゅうゆう.', 'daku / youon / daku+youon', 'belum', 880),
('K5-0881', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
女友達（おんなともだち）', '["teman perempuan", "teman nakal", "teman sekolah", "teman laki-laki"]'::jsonb, 0, '女友達 dibaca おんなともだち, artinya "teman perempuan".', 'makna sekanji', 'belum', 881),
('K5-0882', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
女友達', '["おうんなともだち", "おんなともだち", "おうんのともだち", "おんのともだち"]'::jsonb, 1, '女友達 artinya "teman perempuan", dibaca おんなともだち.', 'chouon+ / vowel / chouon++vowel', 'belum', 882),
('K5-0883', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
男友達（おとこともだち）', '["teman nakal", "teman perempuan", "teman lama", "teman laki-laki"]'::jsonb, 3, '男友達 dibaca おとこともだち, artinya "teman laki-laki".', 'makna sekanji', 'belum', 883),
('K5-0884', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
男友達', '["おうどこともだち", "おうとこともだち", "おとこともだち", "おどこともだち"]'::jsonb, 2, '男友達 artinya "teman laki-laki", dibaca おとこともだち.', 'chouon+ / daku / chouon++daku', 'belum', 884),
('K5-0885', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
友好（ゆうこう）', '["teman", "hubungan baik", "sahabat karib", "teman nakal"]'::jsonb, 1, '友好 dibaca ゆうこう, artinya "hubungan baik".', 'makna sekanji', 'belum', 885),
('K5-0886', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
友好', '["ゆうこう", "よこう", "ようこう", "ゆこう"]'::jsonb, 0, '友好 artinya "hubungan baik", dibaca ゆうこう.', 'vowel / chouon- / vowel+chouon-', 'belum', 886),
('K5-0887', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
悪友（あくゆう）', '["teman", "teman sekolah", "teman nakal", "teman lama"]'::jsonb, 2, '悪友 dibaca あくゆう, artinya "teman nakal".', 'makna sekanji', 'belum', 887),
('K5-0888', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
悪友', '["えぐゆう", "あぐゆう", "えくゆう", "あくゆう"]'::jsonb, 3, '悪友 artinya "teman nakal", dibaca あくゆう.', 'vowel / daku / vowel+daku', 'belum', 888),
('K5-0889', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
校友（こうゆう）', '["alumni", "teman", "teman sekolah", "teman lama"]'::jsonb, 0, '校友 dibaca こうゆう, artinya "alumni".', 'makna sekanji', 'belum', 889),
('K5-0890', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校友', '["ごゆう", "ごうゆう", "こゆう", "こうゆう"]'::jsonb, 3, '校友 artinya "alumni", dibaca こうゆう.', 'daku / chouon- / daku+chouon-', 'belum', 890),
('K5-0891', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先生（せんせい）', '["janji lebih dulu", "prioritas", "guru", "hari lalu"]'::jsonb, 2, '先生 dibaca せんせい, artinya "guru".', 'makna sekanji', 'belum', 891),
('K5-0892', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先生', '["ぜんせい", "せんせい", "さきせい", "せんぜい"]'::jsonb, 1, '先生 artinya "guru", dibaca せんせい. Membacanya さきせい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 892),
('K5-0893', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先（さき）', '["perempuan", "lebih dulu", "ibu (sendiri)", "ayah (sendiri)"]'::jsonb, 1, '先 dibaca さき, artinya "lebih dulu".', 'makna se-ranah', 'belum', 893),
('K5-0894', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先', '["さぎ", "せん", "ざき", "さき"]'::jsonb, 3, '先 artinya "lebih dulu", dibaca さき. Membacanya せん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 894),
('K5-0895', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先輩（せんぱい）', '["senior", "hari lalu", "prioritas", "guru"]'::jsonb, 0, '先輩 dibaca せんぱい, artinya "senior".', 'makna sekanji', 'belum', 895),
('K5-0896', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先輩', '["さきぱい", "ぜんぱい", "せんぱい", "せんばい"]'::jsonb, 2, '先輩 artinya "senior", dibaca せんぱい. Membacanya さきぱい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 896),
('K5-0897', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
行き先（いきさき）', '["tempat kerja", "senior", "barusan", "tujuan"]'::jsonb, 3, '行き先 dibaca いきさき, artinya "tujuan".', 'makna sekanji', 'belum', 897),
('K5-0898', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行き先', '["えぎさき", "いきさき", "いぎさき", "えきさき"]'::jsonb, 1, '行き先 artinya "tujuan", dibaca いきさき.', 'vowel / daku / vowel+daku', 'belum', 898),
('K5-0899', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先日（せんじつ）', '["hari lalu", "guru", "senior", "barisan depan"]'::jsonb, 0, '先日 dibaca せんじつ, artinya "hari lalu".', 'makna sekanji', 'belum', 899),
('K5-0900', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先日', '["ぜんじつ", "さきじつ", "せんじつ", "せんしつ"]'::jsonb, 2, '先日 artinya "hari lalu", dibaca せんじつ. Membacanya さきじつ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 900),
('K5-0901', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
優先（ゆうせん）', '["guru", "barusan", "prioritas", "janji lebih dulu"]'::jsonb, 2, '優先 dibaca ゆうせん, artinya "prioritas".', 'makna sekanji', 'belum', 901),
('K5-0902', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
優先', '["ようせん", "ゆせん", "よせん", "ゆうせん"]'::jsonb, 3, '優先 artinya "prioritas", dibaca ゆうせん.', 'vowel / chouon- / vowel+chouon-', 'belum', 902),
('K5-0903', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先頭（せんとう）', '["barisan depan", "guru", "hari lalu", "senior"]'::jsonb, 0, '先頭 dibaca せんとう, artinya "barisan depan".', 'makna sekanji', 'belum', 903),
('K5-0904', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先頭', '["ぜんとう", "せんとう", "さきとう", "せんどう"]'::jsonb, 1, '先頭 artinya "barisan depan", dibaca せんとう. Membacanya さきとう adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 904),
('K5-0905', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先程（さきほど）', '["prioritas", "hari lalu", "senior", "barusan"]'::jsonb, 3, '先程 dibaca さきほど, artinya "barusan".', 'makna sekanji', 'belum', 905),
('K5-0906', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先程', '["さぎほど", "さきほど", "ざきほど", "せんほど"]'::jsonb, 1, '先程 artinya "barusan", dibaca さきほど. Membacanya せんほど adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 906),
('K5-0907', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
勤め先（つとめさき）', '["senior", "tujuan", "tempat kerja", "guru"]'::jsonb, 2, '勤め先 dibaca つとめさき, artinya "tempat kerja".', 'makna sekanji', 'belum', 907),
('K5-0908', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
勤め先', '["つとめさき", "つうどめさき", "つどめさき", "つうとめさき"]'::jsonb, 0, '勤め先 artinya "tempat kerja", dibaca つとめさき.', 'chouon+ / daku / chouon++daku', 'belum', 908),
('K5-0909', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
先約（せんやく）', '["hari lalu", "janji lebih dulu", "senior", "barisan depan"]'::jsonb, 1, '先約 dibaca せんやく, artinya "janji lebih dulu".', 'makna sekanji', 'belum', 909),
('K5-0910', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
先約', '["せんゆく", "ぜんやく", "さきやく", "せんやく"]'::jsonb, 3, '先約 artinya "janji lebih dulu", dibaca せんやく. Membacanya さきやく adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 910),
('K5-0911', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
学生（がくせい）', '["guru", "telur mentah", "pelajar", "kehidupan"]'::jsonb, 2, '学生 dibaca がくせい, artinya "pelajar".', 'makna sekanji', 'belum', 911),
('K5-0912', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学生', '["がくせい", "かくせい", "かぐせい", "がぐせい"]'::jsonb, 0, '学生 artinya "pelajar", dibaca がくせい.', 'daku / daku+daku', 'belum', 912),
('K5-0913', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
生まれる（うまれる）', '["tanggal lahir", "telur mentah", "lahir", "hidup"]'::jsonb, 2, '生まれる dibaca うまれる, artinya "lahir".', 'makna sekanji', 'belum', 913),
('K5-0914', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
生まれる', '["うまれる", "うみれる", "せいまれる", "いまれる"]'::jsonb, 0, '生まれる artinya "lahir", dibaca うまれる. Membacanya せいまれる adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 914),
('K5-0915', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
生きる（いきる）', '["seumur hidup", "siswa SMA", "guru", "hidup"]'::jsonb, 3, '生きる dibaca いきる, artinya "hidup".', 'makna sekanji', 'belum', 915),
('K5-0916', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
生きる', '["おきる", "いきる", "せいきる", "いぎる"]'::jsonb, 1, '生きる artinya "hidup", dibaca いきる. Membacanya せいきる adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 916),
('K5-0917', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
生活（せいかつ）', '["seumur hidup", "telur mentah", "pelajar", "kehidupan"]'::jsonb, 3, '生活 dibaca せいかつ, artinya "kehidupan".', 'makna sekanji', 'belum', 917),
('K5-0918', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
生活', '["せかつ", "うかつ", "せいかつ", "ぜいかつ"]'::jsonb, 2, '生活 artinya "kehidupan", dibaca せいかつ. Membacanya うかつ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 918),
('K5-0919', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
一生（いっしょう）', '["kelahiran", "seumur hidup", "hidup", "guru"]'::jsonb, 1, '一生 dibaca いっしょう, artinya "seumur hidup".', 'makna sekanji', 'belum', 919),
('K5-0920', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一生', '["いっしょう", "あっしょう", "いしょう", "あしょう"]'::jsonb, 0, '一生 artinya "seumur hidup", dibaca いっしょう.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 920),
('K5-0921', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
生卵（なまたまご）', '["kelahiran", "telur mentah", "guru", "seumur hidup"]'::jsonb, 1, '生卵 dibaca なまたまご, artinya "telur mentah".', 'makna sekanji', 'belum', 921),
('K5-0922', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
生卵', '["なもたまご", "のまたまご", "なまたまご", "のもたまご"]'::jsonb, 2, '生卵 artinya "telur mentah", dibaca なまたまご.', 'vowel / vowel+vowel', 'belum', 922),
('K5-0923', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
高校生（こうこうせい）', '["telur mentah", "siswa putra", "hidup", "siswa SMA"]'::jsonb, 3, '高校生 dibaca こうこうせい, artinya "siswa SMA".', 'makna sekanji', 'belum', 923),
('K5-0924', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高校生', '["こうこうせい", "ごこうせい", "ここうせい", "ごうこうせい"]'::jsonb, 0, '高校生 artinya "siswa SMA", dibaca こうこうせい.', 'daku / chouon- / daku+chouon-', 'belum', 924),
('K5-0925', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
生年月日（せいねんがっぴ）', '["kehidupan", "hidup", "lahir", "tanggal lahir"]'::jsonb, 3, '生年月日 dibaca せいねんがっぴ, artinya "tanggal lahir".', 'makna sekanji', 'belum', 925),
('K5-0926', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
生年月日', '["せいねんがっぴ", "ぜいねんがっぴ", "せねんがっぴ", "うねんがっぴ"]'::jsonb, 0, '生年月日 artinya "tanggal lahir", dibaca せいねんがっぴ. Membacanya うねんがっぴ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 926),
('K5-0927', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
誕生（たんじょう）', '["kehidupan", "kelahiran", "guru", "telur mentah"]'::jsonb, 1, '誕生 dibaca たんじょう, artinya "kelahiran".', 'makna sekanji', 'belum', 927),
('K5-0928', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
誕生', '["たんしょう", "だんしょう", "たんじょう", "だんじょう"]'::jsonb, 2, '誕生 artinya "kelahiran", dibaca たんじょう.', 'daku / daku+daku', 'belum', 928),
('K5-0929', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
有名（ゆうめい）', '["papan nama", "tempat terkenal", "terkenal", "nama"]'::jsonb, 2, '有名 dibaca ゆうめい, artinya "terkenal".', 'makna sekanji', 'belum', 929),
('K5-0930', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
有名', '["ゆめい", "ようめい", "よめい", "ゆうめい"]'::jsonb, 3, '有名 artinya "terkenal", dibaca ゆうめい.', 'vowel / chouon- / vowel+chouon-', 'belum', 930),
('K5-0931', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
名字（みょうじ）', '["nama", "nama keluarga", "nama asli", "nama tempat"]'::jsonb, 1, '名字 dibaca みょうじ, artinya "nama keluarga".', 'makna sekanji', 'belum', 931),
('K5-0932', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名字', '["みょうじ", "みょじ", "みようじ", "みよじ"]'::jsonb, 0, '名字 artinya "nama keluarga", dibaca みょうじ.', 'youon / chouon- / youon+chouon-', 'belum', 932),
('K5-0933', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
氏名（しめい）', '["nama keluarga", "nama asli", "nama tempat", "nama lengkap"]'::jsonb, 3, '氏名 dibaca しめい, artinya "nama lengkap".', 'makna sekanji', 'belum', 933),
('K5-0934', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
氏名', '["じめい", "しもい", "しめい", "じもい"]'::jsonb, 2, '氏名 artinya "nama lengkap", dibaca しめい.', 'daku / vowel / daku+vowel', 'belum', 934),
('K5-0935', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
名人（めいじん）', '["ahli / master", "terkenal", "nama asli", "nama keluarga"]'::jsonb, 0, '名人 dibaca めいじん, artinya "ahli / master".', 'makna sekanji', 'belum', 935),
('K5-0936', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名人', '["めじん", "めいじん", "もいじん", "もじん"]'::jsonb, 1, '名人 artinya "ahli / master", dibaca めいじん.', 'vowel / chouon- / vowel+chouon-', 'belum', 936),
('K5-0937', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
地名（ちめい）', '["nama keluarga", "nama tempat", "nama", "nama asli"]'::jsonb, 1, '地名 dibaca ちめい, artinya "nama tempat".', 'makna sekanji', 'belum', 937),
('K5-0938', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
地名', '["ためい", "ちむい", "ちめい", "たむい"]'::jsonb, 2, '地名 artinya "nama tempat", dibaca ちめい.', 'vowel / vowel+vowel', 'belum', 938),
('K5-0939', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
署名（しょめい）', '["terkenal", "nama asli", "nama tempat", "tanda tangan"]'::jsonb, 3, '署名 dibaca しょめい, artinya "tanda tangan".', 'makna sekanji', 'belum', 939),
('K5-0940', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
署名', '["しょめい", "じょめい", "しょうめい", "じょうめい"]'::jsonb, 0, '署名 artinya "tanda tangan", dibaca しょめい.', 'daku / chouon+ / daku+chouon+', 'belum', 940),
('K5-0941', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
名札（なふだ）', '["nama tempat", "nama", "papan nama", "nama lengkap"]'::jsonb, 2, '名札 dibaca なふだ, artinya "papan nama".', 'makna sekanji', 'belum', 941),
('K5-0942', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名札', '["のふだ", "なふだ", "なぶだ", "のぶだ"]'::jsonb, 1, '名札 artinya "papan nama", dibaca なふだ.', 'vowel / daku / vowel+daku', 'belum', 942),
('K5-0943', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
名所（めいしょ）', '["nama tempat", "terkenal", "nama", "tempat terkenal"]'::jsonb, 3, '名所 dibaca めいしょ, artinya "tempat terkenal".', 'makna sekanji', 'belum', 943),
('K5-0944', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名所', '["めいしょ", "ましょ", "まいしょ", "めしょ"]'::jsonb, 0, '名所 artinya "tempat terkenal", dibaca めいしょ.', 'vowel / chouon- / vowel+chouon-', 'belum', 944),
('K5-0945', 'N5', 'kanji', 'Arti', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Apa arti kata berikut?
本名（ほんみょう）', '["nama keluarga", "nama lengkap", "nama", "nama asli"]'::jsonb, 3, '本名 dibaca ほんみょう, artinya "nama asli".', 'makna sekanji', 'belum', 945),
('K5-0946', 'N5', 'kanji', 'Bacaan', 4, 'T04', 'Orang & Keluarga', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本名', '["ほんみょう", "ほんみよ", "ほんみよう", "ほんみょ"]'::jsonb, 0, '本名 artinya "nama asli", dibaca ほんみょう.', 'youon / chouon- / youon+chouon-', 'belum', 946),
('K5-0947', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
口（くち）', '["langit", "mulut", "gunung", "kaki"]'::jsonb, 1, '口 dibaca くち, artinya "mulut".', 'makna se-ranah', 'belum', 947),
('K5-0948', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
口', '["ぐっち", "ぐち", "くち", "くっち"]'::jsonb, 2, '口 artinya "mulut", dibaca くち.', 'daku / sokuon+ / daku+sokuon+', 'belum', 948),
('K5-0949', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
入口（いりぐち）', '["pintu keluar", "lipstik", "pintu masuk", "omongan buruk"]'::jsonb, 2, '入口 dibaca いりぐち, artinya "pintu masuk".', 'makna sekanji', 'belum', 949),
('K5-0950', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入口', '["いろぐち", "うりぐち", "うろぐち", "いりぐち"]'::jsonb, 3, '入口 artinya "pintu masuk", dibaca いりぐち.', 'vowel / vowel+vowel', 'belum', 950),
('K5-0951', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
出口（でぐち）', '["pintu keluar", "pintu masuk", "muara sungai", "omongan buruk"]'::jsonb, 0, '出口 dibaca でぐち, artinya "pintu keluar".', 'makna sekanji', 'belum', 951),
('K5-0952', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出口', '["でくち", "でぐち", "てぐち", "てくち"]'::jsonb, 1, '出口 artinya "pintu keluar", dibaca でぐち.', 'daku / daku+daku', 'belum', 952),
('K5-0953', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
窓口（まどぐち）', '["lipstik", "rekening bank", "loket", "pintu keluar"]'::jsonb, 2, '窓口 dibaca まどぐち, artinya "loket".', 'makna sekanji', 'belum', 953),
('K5-0954', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
窓口', '["めどぐち", "めとぐち", "まとぐち", "まどぐち"]'::jsonb, 3, '窓口 artinya "loket", dibaca まどぐち.', 'vowel / daku / vowel+daku', 'belum', 954),
('K5-0955', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
早口（はやくち）', '["pintu keluar", "bicara cepat", "nada bicara", "rekening bank"]'::jsonb, 1, '早口 dibaca はやくち, artinya "bicara cepat".', 'makna sekanji', 'belum', 955),
('K5-0956', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
早口', '["はやくち", "はゆくち", "はやぐち", "はゆぐち"]'::jsonb, 0, '早口 artinya "bicara cepat", dibaca はやくち.', 'vowel / daku / vowel+daku', 'belum', 956),
('K5-0957', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
口紅（くちべに）', '["lipstik", "omongan buruk", "pintu keluar", "pintu masuk"]'::jsonb, 0, '口紅 dibaca くちべに, artinya "lipstik".', 'makna sekanji', 'belum', 957),
('K5-0958', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
口紅', '["くっちべに", "くちべに", "ぐちべに", "ぐっちべに"]'::jsonb, 1, '口紅 artinya "lipstik", dibaca くちべに.', 'daku / sokuon+ / daku+sokuon+', 'belum', 958),
('K5-0959', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
悪口（わるぐち）', '["nada bicara", "rekening bank", "pintu masuk", "omongan buruk"]'::jsonb, 3, '悪口 dibaca わるぐち, artinya "omongan buruk".', 'makna sekanji', 'belum', 959),
('K5-0960', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
悪口', '["わるくち", "わるうぐち", "わるぐち", "わるうくち"]'::jsonb, 2, '悪口 artinya "omongan buruk", dibaca わるぐち.', 'chouon+ / daku / chouon++daku', 'belum', 960),
('K5-0961', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
口調（くちょう）', '["bicara cepat", "omongan buruk", "pintu keluar", "nada bicara"]'::jsonb, 3, '口調 dibaca くちょう, artinya "nada bicara".', 'makna sekanji', 'belum', 961),
('K5-0962', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
口調', '["くちょう", "ぐちょう", "くっちょう", "ぐっちょう"]'::jsonb, 0, '口調 artinya "nada bicara", dibaca くちょう.', 'daku / sokuon+ / daku+sokuon+', 'belum', 962),
('K5-0963', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
口座（こうざ）', '["pintu masuk", "muara sungai", "rekening bank", "pintu keluar"]'::jsonb, 2, '口座 dibaca こうざ, artinya "rekening bank".', 'makna sekanji', 'belum', 963),
('K5-0964', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
口座', '["ござ", "こうざ", "ごうざ", "こざ"]'::jsonb, 1, '口座 artinya "rekening bank", dibaca こうざ.', 'daku / chouon- / daku+chouon-', 'belum', 964),
('K5-0965', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
河口（かこう）', '["nada bicara", "muara sungai", "pinggir sungai", "lebar sungai"]'::jsonb, 1, '河口 dibaca かこう, artinya "muara sungai".', 'makna sekanji', 'belum', 965),
('K5-0966', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
河口', '["かごう", "がごう", "がこう", "かこう"]'::jsonb, 3, '河口 artinya "muara sungai", dibaca かこう.', 'daku / daku+daku', 'belum', 966),
('K5-0967', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目（め）', '["bunga", "langit", "mata", "mulut"]'::jsonb, 2, '目 dibaca め, artinya "mata".', 'makna se-ranah', 'belum', 967),
('K5-0968', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目', '["め", "み", "もく", "ま"]'::jsonb, 0, '目 artinya "mata", dibaca め. Membacanya もく adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 968),
('K5-0969', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目薬（めぐすり）', '["daftar isi", "obat tetes mata", "mata pelajaran", "bola mata"]'::jsonb, 1, '目薬 dibaca めぐすり, artinya "obat tetes mata".', 'makna sekanji', 'belum', 969),
('K5-0970', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目薬', '["めくすり", "もくぐすり", "もぐすり", "めぐすり"]'::jsonb, 3, '目薬 artinya "obat tetes mata", dibaca めぐすり. Membacanya もくぐすり adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 970),
('K5-0971', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目標（もくひょう）', '["daftar isi", "mata pelajaran", "target", "perhatian"]'::jsonb, 2, '目標 dibaca もくひょう, artinya "target".', 'makna sekanji', 'belum', 971),
('K5-0972', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目標', '["もくひょう", "もぐひょう", "もうくひょう", "めひょう"]'::jsonb, 0, '目標 artinya "target", dibaca もくひょう. Membacanya めひょう adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 972),
('K5-0973', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
注目（ちゅうもく）', '["obat tetes mata", "daftar isi", "perhatian", "target"]'::jsonb, 2, '注目 dibaca ちゅうもく, artinya "perhatian".', 'makna sekanji', 'belum', 973),
('K5-0974', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
注目', '["ちゅうもく", "ちゆうもく", "ちゆもく", "ちゅもく"]'::jsonb, 0, '注目 artinya "perhatian", dibaca ちゅうもく.', 'youon / chouon- / youon+chouon-', 'belum', 974),
('K5-0975', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目次（もくじ）', '["target", "daftar isi", "bola mata", "tujuan"]'::jsonb, 1, '目次 dibaca もくじ, artinya "daftar isi".', 'makna sekanji', 'belum', 975),
('K5-0976', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目次', '["もうくじ", "めじ", "もぐじ", "もくじ"]'::jsonb, 3, '目次 artinya "daftar isi", dibaca もくじ. Membacanya めじ adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 976),
('K5-0977', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目覚まし（めざまし）', '["perhatian", "weker", "bola mata", "tujuan"]'::jsonb, 1, '目覚まし dibaca めざまし, artinya "weker".', 'makna sekanji', 'belum', 977),
('K5-0978', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目覚まし', '["めさまし", "まざまし", "もくざまし", "めざまし"]'::jsonb, 3, '目覚まし artinya "weker", dibaca めざまし. Membacanya もくざまし adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 978),
('K5-0979', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目立つ（めだつ）', '["weker", "obat tetes mata", "mencolok", "tujuan"]'::jsonb, 2, '目立つ dibaca めだつ, artinya "mencolok".', 'makna sekanji', 'belum', 979),
('K5-0980', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目立つ', '["めだつ", "もくだつ", "めたつ", "まだつ"]'::jsonb, 0, '目立つ artinya "mencolok", dibaca めだつ. Membacanya もくだつ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 980),
('K5-0981', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目的（もくてき）', '["tujuan", "perhatian", "daftar isi", "mata pelajaran"]'::jsonb, 0, '目的 dibaca もくてき, artinya "tujuan".', 'makna sekanji', 'belum', 981),
('K5-0982', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目的', '["もうくてき", "もぐてき", "もくてき", "めてき"]'::jsonb, 2, '目的 artinya "tujuan", dibaca もくてき. Membacanya めてき adalah kekeliruan yang umum.', 'on↔kun / chouon+ / daku', 'belum', 982),
('K5-0983', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
目玉（めだま）', '["obat tetes mata", "bola mata", "target", "mata pelajaran"]'::jsonb, 1, '目玉 dibaca めだま, artinya "bola mata".', 'makna sekanji', 'belum', 983),
('K5-0984', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
目玉', '["もくだま", "めたま", "みだま", "めだま"]'::jsonb, 3, '目玉 artinya "bola mata", dibaca めだま. Membacanya もくだま adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 984),
('K5-0985', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
科目（かもく）', '["obat tetes mata", "mata pelajaran", "target", "bola mata"]'::jsonb, 1, '科目 dibaca かもく, artinya "mata pelajaran".', 'makna sekanji', 'belum', 985),
('K5-0986', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
科目', '["かもく", "がもく", "かもうく", "がもうく"]'::jsonb, 0, '科目 artinya "mata pelajaran", dibaca かもく.', 'daku / chouon+ / daku+chouon+', 'belum', 986),
('K5-0987', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳（みみ）', '["hujan", "bunga", "tangan", "telinga"]'::jsonb, 3, '耳 dibaca みみ, artinya "telinga".', 'makna se-ranah', 'belum', 987),
('K5-0988', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳', '["まみ", "みむ", "みみ", "まむ"]'::jsonb, 2, '耳 artinya "telinga", dibaca みみ.', 'vowel / vowel+vowel', 'belum', 988),
('K5-0989', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳鼻科（じびか）', '["cuping telinga", "denging telinga", "bisikan", "THT"]'::jsonb, 3, '耳鼻科 dibaca じびか, artinya "THT".', 'makna sekanji', 'belum', 989),
('K5-0990', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳鼻科', '["じびか", "じぴか", "しびか", "しぴか"]'::jsonb, 0, '耳鼻科 artinya "THT", dibaca じびか.', 'daku / daku+daku', 'belum', 990),
('K5-0991', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
中耳炎（ちゅうじえん）', '["cuping telinga", "radang telinga", "bisikan", "denging telinga"]'::jsonb, 1, '中耳炎 dibaca ちゅうじえん, artinya "radang telinga".', 'makna sekanji', 'belum', 991),
('K5-0992', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中耳炎', '["ちゆじえん", "ちゆうじえん", "ちゅうじえん", "ちゅじえん"]'::jsonb, 2, '中耳炎 artinya "radang telinga", dibaca ちゅうじえん.', 'youon / chouon- / youon+chouon-', 'belum', 992),
('K5-0993', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳栓（みみせん）', '["salah dengar", "penyumbat kuping", "baru dengar", "cepat tahu kabar"]'::jsonb, 1, '耳栓 dibaca みみせん, artinya "penyumbat kuping".', 'makna sekanji', 'belum', 993),
('K5-0994', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳栓', '["みもせん", "もみせん", "みみせん", "ももせん"]'::jsonb, 2, '耳栓 artinya "penyumbat kuping", dibaca みみせん.', 'vowel / vowel+vowel', 'belum', 994),
('K5-0995', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳鳴り（みみなり）', '["THT", "cuping telinga", "radang telinga", "denging telinga"]'::jsonb, 3, '耳鳴り dibaca みみなり, artinya "denging telinga".', 'makna sekanji', 'belum', 995),
('K5-0996', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳鳴り', '["みみなり", "むみなり", "むめなり", "みめなり"]'::jsonb, 0, '耳鳴り artinya "denging telinga", dibaca みみなり.', 'vowel / vowel+vowel', 'belum', 996),
('K5-0997', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
早耳（はやみみ）', '["baru dengar", "cepat tahu kabar", "salah dengar", "penyumbat kuping"]'::jsonb, 1, '早耳 dibaca はやみみ, artinya "cepat tahu kabar".', 'makna sekanji', 'belum', 997),
('K5-0998', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
早耳', '["はよみみ", "ばよみみ", "ばやみみ", "はやみみ"]'::jsonb, 3, '早耳 artinya "cepat tahu kabar", dibaca はやみみ.', 'daku / vowel / daku+vowel', 'belum', 998),
('K5-0999', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳打ち（みみうち）', '["bisikan", "THT", "cuping telinga", "radang telinga"]'::jsonb, 0, '耳打ち dibaca みみうち, artinya "bisikan".', 'makna sekanji', 'belum', 999),
('K5-1000', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳打ち', '["もみうち", "もめうち", "みみうち", "みめうち"]'::jsonb, 2, '耳打ち artinya "bisikan", dibaca みみうち.', 'vowel / vowel+vowel', 'belum', 1000)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-1001', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空耳（そらみみ）', '["penyumbat kuping", "cepat tahu kabar", "salah dengar", "baru dengar"]'::jsonb, 2, '空耳 dibaca そらみみ, artinya "salah dengar".', 'makna sekanji', 'belum', 1001),
('K5-1002', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空耳', '["そらみみ", "ぞらみみ", "ぞるみみ", "そるみみ"]'::jsonb, 0, '空耳 artinya "salah dengar", dibaca そらみみ.', 'daku / vowel / daku+vowel', 'belum', 1002),
('K5-1003', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
耳たぶ（みみたぶ）', '["denging telinga", "bisikan", "radang telinga", "cuping telinga"]'::jsonb, 3, '耳たぶ dibaca みみたぶ, artinya "cuping telinga".', 'makna sekanji', 'belum', 1003),
('K5-1004', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
耳たぶ', '["みむたぶ", "みみたぶ", "まみたぶ", "まむたぶ"]'::jsonb, 1, '耳たぶ artinya "cuping telinga", dibaca みみたぶ.', 'vowel / vowel+vowel', 'belum', 1004),
('K5-1005', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
初耳（はつみみ）', '["cepat tahu kabar", "penyumbat kuping", "baru dengar", "salah dengar"]'::jsonb, 2, '初耳 dibaca はつみみ, artinya "baru dengar".', 'makna sekanji', 'belum', 1005),
('K5-1006', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
初耳', '["はつみみ", "はつうみみ", "ばつうみみ", "ばつみみ"]'::jsonb, 0, '初耳 artinya "baru dengar", dibaca はつみみ.', 'daku / chouon+ / daku+chouon+', 'belum', 1006),
('K5-1007', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
手（て）', '["telinga", "tangan", "bunga", "mulut"]'::jsonb, 1, '手 dibaca て, artinya "tangan".', 'makna se-ranah', 'belum', 1007),
('K5-1008', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手', '["と", "ち", "で", "て"]'::jsonb, 3, '手 artinya "tangan", dibaca て.', 'daku / vowel', 'belum', 1008),
('K5-1009', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
手紙（てがみ）', '["sarung tangan", "surat", "perangko", "tepuk tangan"]'::jsonb, 1, '手紙 dibaca てがみ, artinya "surat".', 'makna sekanji', 'belum', 1009),
('K5-1010', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手紙', '["でがみ", "てかみ", "でかみ", "てがみ"]'::jsonb, 3, '手紙 artinya "surat", dibaca てがみ.', 'daku / daku+daku', 'belum', 1010),
('K5-1011', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
切手（きって）', '["perangko", "surat", "sarung tangan", "jabat tangan"]'::jsonb, 0, '切手 dibaca きって, artinya "perangko".', 'makna sekanji', 'belum', 1011),
('K5-1012', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
切手', '["きて", "ぎって", "きって", "ぎて"]'::jsonb, 2, '切手 artinya "perangko", dibaca きって.', 'daku / sokuon- / daku+sokuon-', 'belum', 1012),
('K5-1013', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
握手（あくしゅ）', '["sarung tangan", "jabat tangan", "atlet", "tepuk tangan"]'::jsonb, 1, '握手 dibaca あくしゅ, artinya "jabat tangan".', 'makna sekanji', 'belum', 1013),
('K5-1014', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
握手', '["あくしゅ", "あぐしゅ", "おぐしゅ", "おくしゅ"]'::jsonb, 0, '握手 artinya "jabat tangan", dibaca あくしゅ.', 'vowel / daku / vowel+daku', 'belum', 1014),
('K5-1015', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
手伝う（てつだう）', '["sopir", "prosedur", "membantu", "jabat tangan"]'::jsonb, 2, '手伝う dibaca てつだう, artinya "membantu".', 'makna sekanji', 'belum', 1015),
('K5-1016', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手伝う', '["てつうだう", "でつだう", "でつうだう", "てつだう"]'::jsonb, 3, '手伝う artinya "membantu", dibaca てつだう.', 'daku / chouon+ / daku+chouon+', 'belum', 1016),
('K5-1017', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
選手（せんしゅ）', '["perangko", "surat", "atlet", "tepuk tangan"]'::jsonb, 2, '選手 dibaca せんしゅ, artinya "atlet".', 'makna sekanji', 'belum', 1017),
('K5-1018', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
選手', '["せんしゅ", "せんじゅ", "ぜんしゅ", "ぜんじゅ"]'::jsonb, 0, '選手 artinya "atlet", dibaca せんしゅ.', 'daku / daku+daku', 'belum', 1018),
('K5-1019', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
手袋（てぶくろ）', '["jabat tangan", "tepuk tangan", "atlet", "sarung tangan"]'::jsonb, 3, '手袋 dibaca てぶくろ, artinya "sarung tangan".', 'makna sekanji', 'belum', 1019),
('K5-1020', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手袋', '["てぷくろ", "てぶくろ", "でぷくろ", "でぶくろ"]'::jsonb, 1, '手袋 artinya "sarung tangan", dibaca てぶくろ.', 'daku / daku+daku', 'belum', 1020),
('K5-1021', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
拍手（はくしゅ）', '["tepuk tangan", "surat", "jabat tangan", "sarung tangan"]'::jsonb, 0, '拍手 dibaca はくしゅ, artinya "tepuk tangan".', 'makna sekanji', 'belum', 1021),
('K5-1022', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
拍手', '["ばくしゅ", "はくしゅ", "ばぐしゅ", "はぐしゅ"]'::jsonb, 1, '拍手 artinya "tepuk tangan", dibaca はくしゅ.', 'daku / daku+daku', 'belum', 1022),
('K5-1023', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
手続き（てつづき）', '["sarung tangan", "membantu", "sopir", "prosedur"]'::jsonb, 3, '手続き dibaca てつづき, artinya "prosedur".', 'makna sekanji', 'belum', 1023),
('K5-1024', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手続き', '["でつづき", "でっつづき", "てつづき", "てっつづき"]'::jsonb, 2, '手続き artinya "prosedur", dibaca てつづき.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1024),
('K5-1025', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
運転手（うんてんしゅ）', '["membantu", "prosedur", "sopir", "perangko"]'::jsonb, 2, '運転手 dibaca うんてんしゅ, artinya "sopir".', 'makna sekanji', 'belum', 1025),
('K5-1026', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
運転手', '["おんでんしゅ", "うんてんしゅ", "おんてんしゅ", "うんでんしゅ"]'::jsonb, 1, '運転手 artinya "sopir", dibaca うんてんしゅ.', 'vowel / daku / vowel+daku', 'belum', 1026),
('K5-1027', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
足（あし）', '["mulut", "sungai", "telinga", "kaki"]'::jsonb, 3, '足 dibaca あし, artinya "kaki".', 'makna se-ranah', 'belum', 1027),
('K5-1028', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
足', '["あし", "えじ", "えし", "あじ"]'::jsonb, 0, '足 artinya "kaki", dibaca あし.', 'vowel / daku / vowel+daku', 'belum', 1028),
('K5-1029', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
足りる（たりる）', '["tambahan", "kekurangan", "kaki telanjang", "cukup"]'::jsonb, 3, '足りる dibaca たりる, artinya "cukup".', 'makna sekanji', 'belum', 1029),
('K5-1030', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
足りる', '["たりる", "だれる", "たれる", "だりる"]'::jsonb, 0, '足りる artinya "cukup", dibaca たりる.', 'daku / vowel / daku+vowel', 'belum', 1030),
('K5-1031', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
満足（まんぞく）', '["suara langkah", "karyawisata", "puas", "pergelangan kaki"]'::jsonb, 2, '満足 dibaca まんぞく, artinya "puas".', 'makna sekanji', 'belum', 1031),
('K5-1032', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
満足', '["まんそく", "まんぞく", "もんぞく", "もんそく"]'::jsonb, 1, '満足 artinya "puas", dibaca まんぞく.', 'vowel / daku / vowel+daku', 'belum', 1032),
('K5-1033', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
不足（ふそく）', '["sepasang sepatu", "suara langkah", "kaki telanjang", "kekurangan"]'::jsonb, 3, '不足 dibaca ふそく, artinya "kekurangan".', 'makna sekanji', 'belum', 1033),
('K5-1034', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
不足', '["ふそく", "ふぞく", "ぶぞく", "ぶそく"]'::jsonb, 0, '不足 artinya "kekurangan", dibaca ふそく.', 'daku / daku+daku', 'belum', 1034),
('K5-1035', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
遠足（えんそく）', '["puas", "karyawisata", "suara langkah", "tambahan"]'::jsonb, 1, '遠足 dibaca えんそく, artinya "karyawisata".', 'makna sekanji', 'belum', 1035),
('K5-1036', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
遠足', '["えんぞく", "うんぞく", "えんそく", "うんそく"]'::jsonb, 2, '遠足 artinya "karyawisata", dibaca えんそく.', 'vowel / daku / vowel+daku', 'belum', 1036),
('K5-1037', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
足音（あしおと）', '["karyawisata", "puas", "pergelangan kaki", "suara langkah"]'::jsonb, 3, '足音 dibaca あしおと, artinya "suara langkah".', 'makna sekanji', 'belum', 1037),
('K5-1038', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
足音', '["おじおと", "おしおと", "あしおと", "あじおと"]'::jsonb, 2, '足音 artinya "suara langkah", dibaca あしおと.', 'vowel / daku / vowel+daku', 'belum', 1038),
('K5-1039', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
一足（いっそく）', '["tambahan", "sepasang sepatu", "puas", "kaki telanjang"]'::jsonb, 1, '一足 dibaca いっそく, artinya "sepasang sepatu".', 'makna sekanji', 'belum', 1039),
('K5-1040', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一足', '["いっそく", "おそく", "いそく", "おっそく"]'::jsonb, 0, '一足 artinya "sepasang sepatu", dibaca いっそく.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 1040),
('K5-1041', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
素足（すあし）', '["kaki telanjang", "kekurangan", "pergelangan kaki", "suara langkah"]'::jsonb, 0, '素足 dibaca すあし, artinya "kaki telanjang".', 'makna sekanji', 'belum', 1041),
('K5-1042', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
素足', '["すいし", "すあし", "ずいし", "ずあし"]'::jsonb, 1, '素足 artinya "kaki telanjang", dibaca すあし.', 'daku / vowel / daku+vowel', 'belum', 1042),
('K5-1043', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
足首（あしくび）', '["kaki telanjang", "kekurangan", "pergelangan kaki", "tambahan"]'::jsonb, 2, '足首 dibaca あしくび, artinya "pergelangan kaki".', 'makna sekanji', 'belum', 1043),
('K5-1044', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
足首', '["えしくび", "えじくび", "あじくび", "あしくび"]'::jsonb, 3, '足首 artinya "pergelangan kaki", dibaca あしくび.', 'vowel / daku / vowel+daku', 'belum', 1044),
('K5-1045', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
補足（ほそく）', '["suara langkah", "karyawisata", "tambahan", "kekurangan"]'::jsonb, 2, '補足 dibaca ほそく, artinya "tambahan".', 'makna sekanji', 'belum', 1045),
('K5-1046', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
補足', '["ほそく", "ほそぐ", "ほぞく", "ほぞぐ"]'::jsonb, 0, '補足 artinya "tambahan", dibaca ほそく.', 'daku / daku+daku', 'belum', 1046),
('K5-1047', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山（やま）', '["kaki", "gunung", "langit", "hujan"]'::jsonb, 1, '山 dibaca やま, artinya "gunung".', 'makna se-ranah', 'belum', 1047),
('K5-1048', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山', '["さん", "やも", "よま", "やま"]'::jsonb, 3, '山 artinya "gunung", dibaca やま. Membacanya さん adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1048),
('K5-1049', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
富士山（ふじさん）', '["kebakaran hutan", "gunung tinggi", "menumpuk", "Gunung Fuji"]'::jsonb, 3, '富士山 dibaca ふじさん, artinya "Gunung Fuji".', 'makna sekanji', 'belum', 1049),
('K5-1050', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
富士山', '["ふじざん", "ふしさん", "ふじさん", "ふしざん"]'::jsonb, 2, '富士山 artinya "Gunung Fuji", dibaca ふじさん.', 'daku / daku+daku', 'belum', 1050),
('K5-1051', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
登山（とざん）', '["mendaki gunung", "jalan gunung", "sayur gunung", "puncak gunung"]'::jsonb, 0, '登山 dibaca とざん, artinya "mendaki gunung".', 'makna sekanji', 'belum', 1051),
('K5-1052', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
登山', '["どざん", "とざん", "どさん", "とさん"]'::jsonb, 1, '登山 artinya "mendaki gunung", dibaca とざん.', 'daku / daku+daku', 'belum', 1052),
('K5-1053', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山道（やまみち）', '["jalan gunung", "sayur gunung", "puncak gunung", "mendaki gunung"]'::jsonb, 0, '山道 dibaca やまみち, artinya "jalan gunung".', 'makna sekanji', 'belum', 1053),
('K5-1054', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山道', '["やみみち", "やまみち", "ゆまみち", "さんみち"]'::jsonb, 1, '山道 artinya "jalan gunung", dibaca やまみち. Membacanya さんみち adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1054),
('K5-1055', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山登り（やまのぼり）', '["Gunung Fuji", "kebakaran hutan", "menumpuk", "pendakian"]'::jsonb, 3, '山登り dibaca やまのぼり, artinya "pendakian".', 'makna sekanji', 'belum', 1055),
('K5-1056', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山登り', '["やみのぼり", "さんのぼり", "やまのぼり", "ゆまのぼり"]'::jsonb, 2, '山登り artinya "pendakian", dibaca やまのぼり. Membacanya さんのぼり adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1056),
('K5-1057', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山頂（さんちょう）', '["jalan gunung", "puncak gunung", "mendaki gunung", "sayur gunung"]'::jsonb, 1, '山頂 dibaca さんちょう, artinya "puncak gunung".', 'makna sekanji', 'belum', 1057),
('K5-1058', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山頂', '["ざんちょう", "さんっちょう", "さんちょう", "やまちょう"]'::jsonb, 2, '山頂 artinya "puncak gunung", dibaca さんちょう. Membacanya やまちょう adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 1058),
('K5-1059', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山火事（やまかじ）', '["kebakaran hutan", "menumpuk", "Gunung Fuji", "pendakian"]'::jsonb, 0, '山火事 dibaca やまかじ, artinya "kebakaran hutan".', 'makna sekanji', 'belum', 1059),
('K5-1060', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山火事', '["よまかじ", "やもかじ", "さんかじ", "やまかじ"]'::jsonb, 3, '山火事 artinya "kebakaran hutan", dibaca やまかじ. Membacanya さんかじ adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1060),
('K5-1061', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
高山（こうざん）', '["mendaki gunung", "Gunung Fuji", "jalan gunung", "gunung tinggi"]'::jsonb, 3, '高山 dibaca こうざん, artinya "gunung tinggi".', 'makna sekanji', 'belum', 1061),
('K5-1062', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高山', '["ござん", "こうざん", "こざん", "ごうざん"]'::jsonb, 1, '高山 artinya "gunung tinggi", dibaca こうざん.', 'daku / chouon- / daku+chouon-', 'belum', 1062),
('K5-1063', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山菜（さんさい）', '["sayur gunung", "mendaki gunung", "jalan gunung", "puncak gunung"]'::jsonb, 0, '山菜 dibaca さんさい, artinya "sayur gunung".', 'makna sekanji', 'belum', 1063),
('K5-1064', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山菜', '["やまさい", "ざんさい", "さんさい", "さんざい"]'::jsonb, 2, '山菜 artinya "sayur gunung", dibaca さんさい. Membacanya やまさい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1064),
('K5-1065', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
山積み（やまづみ）', '["Gunung Fuji", "kebakaran hutan", "menumpuk", "pendakian"]'::jsonb, 2, '山積み dibaca やまづみ, artinya "menumpuk".', 'makna sekanji', 'belum', 1065),
('K5-1066', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山積み', '["ゆまづみ", "やむづみ", "さんづみ", "やまづみ"]'::jsonb, 3, '山積み artinya "menumpuk", dibaca やまづみ. Membacanya さんづみ adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1066),
('K5-1067', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川（かわ）', '["sungai", "langit", "muara sungai", "telinga"]'::jsonb, 0, '川 dibaca かわ, artinya "sungai".', 'makna sekanji', 'belum', 1067),
('K5-1068', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川', '["けわ", "かわ", "がわ", "くわ"]'::jsonb, 1, '川 artinya "sungai", dibaca かわ.', 'daku / vowel', 'belum', 1068),
('K5-1069', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
小川（おがわ）', '["sungai (istilah)", "sungai kecil", "pinggir sungai", "tepi sungai"]'::jsonb, 1, '小川 dibaca おがわ, artinya "sungai kecil".', 'makna sekanji', 'belum', 1069),
('K5-1070', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小川', '["おかわ", "おうかわ", "おがわ", "おうがわ"]'::jsonb, 2, '小川 artinya "sungai kecil", dibaca おがわ.', 'chouon+ / daku / chouon++daku', 'belum', 1070),
('K5-1071', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川岸（かわぎし）', '["tepi sungai", "hilir sungai", "pinggir sungai", "hulu sungai"]'::jsonb, 0, '川岸 dibaca かわぎし, artinya "tepi sungai".', 'makna sekanji', 'belum', 1071),
('K5-1072', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川岸', '["がわぎし", "かわきし", "がわきし", "かわぎし"]'::jsonb, 3, '川岸 artinya "tepi sungai", dibaca かわぎし.', 'daku / daku+daku', 'belum', 1072),
('K5-1073', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
河川（かせん）', '["lebar sungai", "sungai (istilah)", "pinggir sungai", "sungai kecil"]'::jsonb, 1, '河川 dibaca かせん, artinya "sungai (istilah)".', 'makna sekanji', 'belum', 1073),
('K5-1074', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
河川', '["がぜん", "かぜん", "かせん", "がせん"]'::jsonb, 2, '河川 artinya "sungai (istilah)", dibaca かせん.', 'daku / daku+daku', 'belum', 1074),
('K5-1075', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川上（かわかみ）', '["hulu sungai", "pinggir sungai", "hilir sungai", "tepi sungai"]'::jsonb, 0, '川上 dibaca かわかみ, artinya "hulu sungai".', 'makna sekanji', 'belum', 1075),
('K5-1076', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川上', '["がわがみ", "がわかみ", "かわがみ", "かわかみ"]'::jsonb, 3, '川上 artinya "hulu sungai", dibaca かわかみ.', 'daku / daku+daku', 'belum', 1076),
('K5-1077', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川下（かわしも）', '["pinggir sungai", "tepi sungai", "hilir sungai", "hulu sungai"]'::jsonb, 2, '川下 dibaca かわしも, artinya "hilir sungai".', 'makna sekanji', 'belum', 1077),
('K5-1078', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川下', '["かわじも", "かわしも", "がわしも", "がわじも"]'::jsonb, 1, '川下 artinya "hilir sungai", dibaca かわしも.', 'daku / daku+daku', 'belum', 1078),
('K5-1079', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川辺（かわべ）', '["pinggir sungai", "hulu sungai", "tepi sungai", "hilir sungai"]'::jsonb, 0, '川辺 dibaca かわべ, artinya "pinggir sungai".', 'makna sekanji', 'belum', 1079),
('K5-1080', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川辺', '["がわぺ", "かわぺ", "がわべ", "かわべ"]'::jsonb, 3, '川辺 artinya "pinggir sungai", dibaca かわべ.', 'daku / daku+daku', 'belum', 1080),
('K5-1081', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川幅（かわはば）', '["hilir sungai", "lebar sungai", "tepi sungai", "hulu sungai"]'::jsonb, 1, '川幅 dibaca かわはば, artinya "lebar sungai".', 'makna sekanji', 'belum', 1081),
('K5-1082', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川幅', '["かわばば", "がわはば", "がわばば", "かわはば"]'::jsonb, 3, '川幅 artinya "lebar sungai", dibaca かわはば.', 'daku / daku+daku', 'belum', 1082),
('K5-1083', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川柳（せんりゅう）', '["sungai (istilah)", "sungai kecil", "puisi senryu", "hulu sungai"]'::jsonb, 2, '川柳 dibaca せんりゅう, artinya "puisi senryu".', 'makna sekanji', 'belum', 1083),
('K5-1084', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川柳', '["せんりゅう", "せんりゆう", "ぜんりゅう", "ぜんりゆう"]'::jsonb, 0, '川柳 artinya "puisi senryu", dibaca せんりゅう.', 'daku / youon / daku+youon', 'belum', 1084),
('K5-1085', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
川沿い（かわぞい）', '["hulu sungai", "sepanjang sungai", "tepi sungai", "hilir sungai"]'::jsonb, 1, '川沿い dibaca かわぞい, artinya "sepanjang sungai".', 'makna sekanji', 'belum', 1085),
('K5-1086', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
川沿い', '["かわぞい", "がわぞい", "がわそい", "かわそい"]'::jsonb, 0, '川沿い artinya "sepanjang sungai", dibaca かわぞい.', 'daku / daku+daku', 'belum', 1086),
('K5-1087', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天気（てんき）', '["cuaca cerah", "cuaca hujan", "cuaca", "langit-langit"]'::jsonb, 2, '天気 dibaca てんき, artinya "cuaca".', 'makna sekanji', 'belum', 1087),
('K5-1088', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天気', '["でんぎ", "てんぎ", "でんき", "てんき"]'::jsonb, 3, '天気 artinya "cuaca", dibaca てんき.', 'daku / daku+daku', 'belum', 1088),
('K5-1089', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天国（てんごく）', '["cuaca", "surga", "langit-langit", "jenius"]'::jsonb, 1, '天国 dibaca てんごく, artinya "surga".', 'makna sekanji', 'belum', 1089),
('K5-1090', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天国', '["てんごく", "でんごく", "てんこく", "でんこく"]'::jsonb, 0, '天国 artinya "surga", dibaca てんごく.', 'daku / daku+daku', 'belum', 1090),
('K5-1091', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天才（てんさい）', '["cuaca hujan", "alami", "surga", "jenius"]'::jsonb, 3, '天才 dibaca てんさい, artinya "jenius".', 'makna sekanji', 'belum', 1091),
('K5-1092', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天才', '["てんざい", "でんさい", "てんさい", "でんざい"]'::jsonb, 2, '天才 artinya "jenius", dibaca てんさい.', 'daku / daku+daku', 'belum', 1092),
('K5-1093', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天井（てんじょう）', '["seluruh dunia", "cuaca cerah", "surga", "langit-langit"]'::jsonb, 3, '天井 dibaca てんじょう, artinya "langit-langit".', 'makna sekanji', 'belum', 1093),
('K5-1094', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天井', '["でんじょう", "てんじょう", "でんしょう", "てんしょう"]'::jsonb, 1, '天井 artinya "langit-langit", dibaca てんじょう.', 'daku / daku+daku', 'belum', 1094),
('K5-1095', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨天（うてん）', '["cuaca hujan", "langit-langit", "cuaca cerah", "cuaca"]'::jsonb, 0, '雨天 dibaca うてん, artinya "cuaca hujan".', 'makna sekanji', 'belum', 1095),
('K5-1096', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨天', '["あでん", "あてん", "うてん", "うでん"]'::jsonb, 2, '雨天 artinya "cuaca hujan", dibaca うてん.', 'vowel / daku / vowel+daku', 'belum', 1096),
('K5-1097', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天ぷら（てんぷら）', '["alami", "Bima Sakti", "seluruh dunia", "tempura"]'::jsonb, 3, '天ぷら dibaca てんぷら, artinya "tempura".', 'makna sekanji', 'belum', 1097),
('K5-1098', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天ぷら', '["でんぷら", "てんぷら", "てんふら", "でんふら"]'::jsonb, 1, '天ぷら artinya "tempura", dibaca てんぷら.', 'daku / daku+daku', 'belum', 1098),
('K5-1099', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
晴天（せいてん）', '["langit-langit", "cuaca", "cuaca cerah", "cuaca hujan"]'::jsonb, 2, '晴天 dibaca せいてん, artinya "cuaca cerah".', 'makna sekanji', 'belum', 1099),
('K5-1100', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
晴天', '["せいてん", "せてん", "ぜてん", "ぜいてん"]'::jsonb, 0, '晴天 artinya "cuaca cerah", dibaca せいてん.', 'daku / chouon- / daku+chouon-', 'belum', 1100),
('K5-1101', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天の川（あまのがわ）', '["jenius", "Bima Sakti", "tempura", "surga"]'::jsonb, 1, '天の川 dibaca あまのがわ, artinya "Bima Sakti".', 'makna sekanji', 'belum', 1101),
('K5-1102', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天の川', '["うみのがわ", "うまのがわ", "あまのがわ", "あみのがわ"]'::jsonb, 2, '天の川 artinya "Bima Sakti", dibaca あまのがわ.', 'vowel / vowel+vowel', 'belum', 1102),
('K5-1103', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天然（てんねん）', '["alami", "langit-langit", "cuaca hujan", "seluruh dunia"]'::jsonb, 0, '天然 dibaca てんねん, artinya "alami".', 'makna sekanji', 'belum', 1103),
('K5-1104', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天然', '["でんねん", "でんなん", "てんなん", "てんねん"]'::jsonb, 3, '天然 artinya "alami", dibaca てんねん.', 'daku / vowel / daku+vowel', 'belum', 1104),
('K5-1105', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
天下（てんか）', '["cuaca hujan", "jenius", "seluruh dunia", "langit-langit"]'::jsonb, 2, '天下 dibaca てんか, artinya "seluruh dunia".', 'makna sekanji', 'belum', 1105),
('K5-1106', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
天下', '["でんが", "てんか", "てんが", "でんか"]'::jsonb, 1, '天下 artinya "seluruh dunia", dibaca てんか.', 'daku / daku+daku', 'belum', 1106),
('K5-1107', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨（あめ）', '["hujan", "gunung", "mulut", "langit"]'::jsonb, 0, '雨 dibaca あめ, artinya "hujan".', 'makna se-ranah', 'belum', 1107),
('K5-1108', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨', '["あみ", "おめ", "おみ", "あめ"]'::jsonb, 3, '雨 artinya "hujan", dibaca あめ.', 'vowel / vowel+vowel', 'belum', 1108),
('K5-1109', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
大雨（おおあめ）', '["cuaca hujan", "payung hujan", "hujan lebat", "hujan deras"]'::jsonb, 3, '大雨 dibaca おおあめ, artinya "hujan deras".', 'makna sekanji', 'belum', 1109),
('K5-1110', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大雨', '["おおあめ", "おうおあめ", "おうおうあめ", "おおうあめ"]'::jsonb, 0, '大雨 artinya "hujan deras", dibaca おおあめ.', 'chouon+ / chouon++chouon+', 'belum', 1110),
('K5-1111', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
小雨（こさめ）', '["hujan lebat", "gerimis", "air hujan", "daun jendela"]'::jsonb, 1, '小雨 dibaca こさめ, artinya "gerimis".', 'makna sekanji', 'belum', 1111),
('K5-1112', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小雨', '["ござめ", "ごさめ", "こさめ", "こざめ"]'::jsonb, 2, '小雨 artinya "gerimis", dibaca こさめ.', 'daku / daku+daku', 'belum', 1112),
('K5-1113', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
梅雨（つゆ）', '["musim hujan", "payung hujan", "cuaca hujan", "air hujan"]'::jsonb, 0, '梅雨 dibaca つゆ, artinya "musim hujan".', 'makna sekanji', 'belum', 1113),
('K5-1114', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
梅雨', '["つうゆ", "つゆ", "つうゆう", "つゆう"]'::jsonb, 1, '梅雨 artinya "musim hujan", dibaca つゆ.', 'chouon+ / chouon++chouon+', 'belum', 1114),
('K5-1115', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨傘（あまがさ）', '["cuaca hujan", "air hujan", "payung hujan", "musim hujan"]'::jsonb, 2, '雨傘 dibaca あまがさ, artinya "payung hujan".', 'makna sekanji', 'belum', 1115),
('K5-1116', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨傘', '["あみがさ", "うまがさ", "うみがさ", "あまがさ"]'::jsonb, 3, '雨傘 artinya "payung hujan", dibaca あまがさ.', 'vowel / vowel+vowel', 'belum', 1116),
('K5-1117', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨戸（あまど）', '["payung hujan", "daun jendela", "hujan deras", "gerimis"]'::jsonb, 1, '雨戸 dibaca あまど, artinya "daun jendela".', 'makna sekanji', 'belum', 1117),
('K5-1118', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨戸', '["あむど", "いむど", "いまど", "あまど"]'::jsonb, 3, '雨戸 artinya "daun jendela", dibaca あまど.', 'vowel / vowel+vowel', 'belum', 1118),
('K5-1119', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
豪雨（ごうう）', '["hujan deras", "musim hujan", "hujan lebat", "cuaca hujan"]'::jsonb, 2, '豪雨 dibaca ごうう, artinya "hujan lebat".', 'makna sekanji', 'belum', 1119),
('K5-1120', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
豪雨', '["ごうう", "こう", "ごう", "こうう"]'::jsonb, 0, '豪雨 artinya "hujan lebat", dibaca ごうう.', 'daku / chouon- / daku+chouon-', 'belum', 1120),
('K5-1121', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨水（あまみず）', '["cuaca hujan", "air hujan", "payung hujan", "musim hujan"]'::jsonb, 1, '雨水 dibaca あまみず, artinya "air hujan".', 'makna sekanji', 'belum', 1121),
('K5-1122', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨水', '["うみみず", "うまみず", "あまみず", "あみみず"]'::jsonb, 2, '雨水 artinya "air hujan", dibaca あまみず.', 'vowel / vowel+vowel', 'belum', 1122),
('K5-1123', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
雨降り（あめふり）', '["air hujan", "cuaca hujan", "payung hujan", "hari hujan"]'::jsonb, 3, '雨降り dibaca あめふり, artinya "hari hujan".', 'makna sekanji', 'belum', 1123),
('K5-1124', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
雨降り', '["あめふり", "えみふり", "あみふり", "えめふり"]'::jsonb, 0, '雨降り artinya "hari hujan", dibaca あめふり.', 'vowel / vowel+vowel', 'belum', 1124),
('K5-1125', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花（はな）', '["tangan", "bunga", "hujan", "telinga"]'::jsonb, 1, '花 dibaca はな, artinya "bunga".', 'makna se-ranah', 'belum', 1125),
('K5-1126', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花', '["はな", "ばの", "はの", "ばな"]'::jsonb, 0, '花 artinya "bunga", dibaca はな.', 'daku / vowel / daku+vowel', 'belum', 1126),
('K5-1127', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花見（はなみ）', '["ladang bunga", "vas bunga", "buket bunga", "melihat bunga"]'::jsonb, 3, '花見 dibaca はなみ, artinya "melihat bunga".', 'makna sekanji', 'belum', 1127),
('K5-1128', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花見', '["ばなみ", "はねみ", "はなみ", "ばねみ"]'::jsonb, 2, '花見 artinya "melihat bunga", dibaca はなみ.', 'daku / vowel / daku+vowel', 'belum', 1128),
('K5-1129', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花屋（はなや）', '["melihat bunga", "toko bunga", "ladang bunga", "mekarnya bunga"]'::jsonb, 1, '花屋 dibaca はなや, artinya "toko bunga".', 'makna sekanji', 'belum', 1129),
('K5-1130', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花屋', '["ばにや", "はにや", "はなや", "ばなや"]'::jsonb, 2, '花屋 artinya "toko bunga", dibaca はなや.', 'daku / vowel / daku+vowel', 'belum', 1130),
('K5-1131', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花嫁（はなよめ）', '["melihat bunga", "toko bunga", "mekarnya bunga", "pengantin wanita"]'::jsonb, 3, '花嫁 dibaca はなよめ, artinya "pengantin wanita".', 'makna sekanji', 'belum', 1131),
('K5-1132', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花嫁', '["はなよめ", "ばなよめ", "ばのよめ", "はのよめ"]'::jsonb, 0, '花嫁 artinya "pengantin wanita", dibaca はなよめ.', 'daku / vowel / daku+vowel', 'belum', 1132),
('K5-1133', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花瓶（かびん）', '["vas bunga", "mekarnya bunga", "buket bunga", "ladang bunga"]'::jsonb, 0, '花瓶 dibaca かびん, artinya "vas bunga".', 'makna sekanji', 'belum', 1133),
('K5-1134', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花瓶', '["かひん", "がひん", "かびん", "がびん"]'::jsonb, 2, '花瓶 artinya "vas bunga", dibaca かびん.', 'daku / daku+daku', 'belum', 1134),
('K5-1135', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花束（はなたば）', '["melihat bunga", "ladang bunga", "toko bunga", "buket bunga"]'::jsonb, 3, '花束 dibaca はなたば, artinya "buket bunga".', 'makna sekanji', 'belum', 1135),
('K5-1136', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花束', '["ばぬたば", "はなたば", "ばなたば", "はぬたば"]'::jsonb, 1, '花束 artinya "buket bunga", dibaca はなたば.', 'daku / vowel / daku+vowel', 'belum', 1136),
('K5-1137', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
開花（かいか）', '["vas bunga", "buket bunga", "melihat bunga", "mekarnya bunga"]'::jsonb, 3, '開花 dibaca かいか, artinya "mekarnya bunga".', 'makna sekanji', 'belum', 1137),
('K5-1138', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
開花', '["かいか", "かうか", "がいか", "がうか"]'::jsonb, 0, '開花 artinya "mekarnya bunga", dibaca かいか.', 'daku / vowel / daku+vowel', 'belum', 1138),
('K5-1139', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花粉（かふん）', '["ladang bunga", "serbuk sari", "mekarnya bunga", "toko bunga"]'::jsonb, 1, '花粉 dibaca かふん, artinya "serbuk sari".', 'makna sekanji', 'belum', 1139),
('K5-1140', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花粉', '["がふん", "がぷん", "かふん", "かぷん"]'::jsonb, 2, '花粉 artinya "serbuk sari", dibaca かふん.', 'daku / daku+daku', 'belum', 1140),
('K5-1141', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
草花（くさばな）', '["buket bunga", "bunga rumput", "mekarnya bunga", "toko bunga"]'::jsonb, 1, '草花 dibaca くさばな, artinya "bunga rumput".', 'makna sekanji', 'belum', 1141),
('K5-1142', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
草花', '["くざばな", "ぐざばな", "ぐさばな", "くさばな"]'::jsonb, 3, '草花 artinya "bunga rumput", dibaca くさばな.', 'daku / daku+daku', 'belum', 1142),
('K5-1143', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
花畑（はなばたけ）', '["ladang bunga", "mekarnya bunga", "melihat bunga", "vas bunga"]'::jsonb, 0, '花畑 dibaca はなばたけ, artinya "ladang bunga".', 'makna sekanji', 'belum', 1143),
('K5-1144', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
花畑', '["はぬばたけ", "はなはたけ", "はなばたけ", "はぬはたけ"]'::jsonb, 2, '花畑 artinya "ladang bunga", dibaca はなばたけ.', 'vowel / daku / vowel+daku', 'belum', 1144),
('K5-1145', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空（そら）', '["langit", "sungai", "kaki", "hujan"]'::jsonb, 0, '空 dibaca そら, artinya "langit".', 'makna se-ranah', 'belum', 1145),
('K5-1146', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空', '["ぞら", "くう", "そる", "そら"]'::jsonb, 3, '空 artinya "langit", dibaca そら. Membacanya くう adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1146),
('K5-1147', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空港（くうこう）', '["kursi kosong", "lapar", "bandara", "taksi kosong"]'::jsonb, 2, '空港 dibaca くうこう, artinya "bandara".', 'makna sekanji', 'belum', 1147),
('K5-1148', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空港', '["そらこう", "くうこう", "くこう", "ぐうこう"]'::jsonb, 1, '空港 artinya "bandara", dibaca くうこう. Membacanya そらこう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1148),
('K5-1149', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空気（くうき）', '["taksi kosong", "udara", "langit biru", "angkasa"]'::jsonb, 1, '空気 dibaca くうき, artinya "udara".', 'makna sekanji', 'belum', 1149),
('K5-1150', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空気', '["くうき", "ぐうき", "くき", "そらき"]'::jsonb, 0, '空気 artinya "udara", dibaca くうき. Membacanya そらき adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1150),
('K5-1151', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空手（からて）', '["lapar", "udara", "bandara", "karate"]'::jsonb, 3, '空手 dibaca からて, artinya "karate".', 'makna sekanji', 'belum', 1151),
('K5-1152', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空手', '["かろて", "がろて", "からて", "がらて"]'::jsonb, 2, '空手 artinya "karate", dibaca からて.', 'daku / vowel / daku+vowel', 'belum', 1152),
('K5-1153', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
青空（あおぞら）', '["taksi kosong", "angkasa", "langit biru", "udara"]'::jsonb, 2, '青空 dibaca あおぞら, artinya "langit biru".', 'makna sekanji', 'belum', 1153),
('K5-1154', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
青空', '["えおうぞら", "あおぞら", "えおぞら", "あおうぞら"]'::jsonb, 1, '青空 artinya "langit biru", dibaca あおぞら.', 'vowel / chouon+ / vowel+chouon+', 'belum', 1154),
('K5-1155', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空車（くうしゃ）', '["karate", "kursi kosong", "angkasa", "taksi kosong"]'::jsonb, 3, '空車 dibaca くうしゃ, artinya "taksi kosong".', 'makna sekanji', 'belum', 1155),
('K5-1156', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空車', '["くうしゃ", "くしゃ", "ぐうしゃ", "そらしゃ"]'::jsonb, 0, '空車 artinya "taksi kosong", dibaca くうしゃ. Membacanya そらしゃ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1156),
('K5-1157', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空席（くうせき）', '["kursi kosong", "lapar", "taksi kosong", "angkasa"]'::jsonb, 0, '空席 dibaca くうせき, artinya "kursi kosong".', 'makna sekanji', 'belum', 1157),
('K5-1158', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空席', '["くせき", "くうせき", "そらせき", "ぐうせき"]'::jsonb, 1, '空席 artinya "kursi kosong", dibaca くうせき. Membacanya そらせき adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1158),
('K5-1159', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空っぽ（からっぽ）', '["kursi kosong", "bandara", "taksi kosong", "kosong melompong"]'::jsonb, 3, '空っぽ dibaca からっぽ, artinya "kosong melompong".', 'makna sekanji', 'belum', 1159),
('K5-1160', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空っぽ', '["くうっぽ", "がらっぽ", "からっぽ", "かりっぽ"]'::jsonb, 2, '空っぽ artinya "kosong melompong", dibaca からっぽ. Membacanya くうっぽ adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1160),
('K5-1161', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
上空（じょうくう）', '["kursi kosong", "bandara", "angkasa", "lapar"]'::jsonb, 2, '上空 dibaca じょうくう, artinya "angkasa".', 'makna sekanji', 'belum', 1161),
('K5-1162', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
上空', '["じようくう", "じょうくう", "しようくう", "しょうくう"]'::jsonb, 1, '上空 artinya "angkasa", dibaca じょうくう.', 'daku / youon / daku+youon', 'belum', 1162),
('K5-1163', 'N5', 'kanji', 'Arti', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Apa arti kata berikut?
空腹（くうふく）', '["lapar", "langit biru", "bandara", "kursi kosong"]'::jsonb, 0, '空腹 dibaca くうふく, artinya "lapar".', 'makna sekanji', 'belum', 1163),
('K5-1164', 'N5', 'kanji', 'Bacaan', 5, 'T05', 'Tubuh & Alam', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空腹', '["ぐうふく", "くふく", "そらふく", "くうふく"]'::jsonb, 3, '空腹 artinya "lapar", dibaca くうふく. Membacanya そらふく adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1164),
('K5-1165', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大きい（おおきい）', '["sangat suka", "jalan besar", "kedutaan", "besar"]'::jsonb, 3, '大きい dibaca おおきい, artinya "besar".', 'makna sekanji', 'belum', 1165),
('K5-1166', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大きい', '["おうおうきい", "おおきい", "おうおきい", "おおうきい"]'::jsonb, 1, '大きい artinya "besar", dibaca おおきい.', 'chouon+ / chouon++chouon+', 'belum', 1166),
('K5-1167', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大学（だいがく）', '["penting", "berat / sangat", "universitas", "banyak orang"]'::jsonb, 2, '大学 dibaca だいがく, artinya "universitas".', 'makna sekanji', 'belum', 1167),
('K5-1168', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大学', '["だいがく", "だおがく", "たおがく", "たいがく"]'::jsonb, 0, '大学 artinya "universitas", dibaca だいがく.', 'daku / vowel / daku+vowel', 'belum', 1168),
('K5-1169', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大丈夫（だいじょうぶ）', '["besar", "jalan besar", "kedutaan", "tidak apa-apa"]'::jsonb, 3, '大丈夫 dibaca だいじょうぶ, artinya "tidak apa-apa".', 'makna sekanji', 'belum', 1169),
('K5-1170', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大丈夫', '["たいじょうぶ", "たおじょうぶ", "だいじょうぶ", "だおじょうぶ"]'::jsonb, 2, '大丈夫 artinya "tidak apa-apa", dibaca だいじょうぶ.', 'daku / vowel / daku+vowel', 'belum', 1170),
('K5-1171', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大切（たいせつ）', '["berat / sangat", "penting", "banyak orang", "universitas"]'::jsonb, 1, '大切 dibaca たいせつ, artinya "penting".', 'makna sekanji', 'belum', 1171),
('K5-1172', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大切', '["たいせつ", "たうせつ", "だいせつ", "だうせつ"]'::jsonb, 0, '大切 artinya "penting", dibaca たいせつ.', 'daku / vowel / daku+vowel', 'belum', 1172),
('K5-1173', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大変（たいへん）', '["berat / sangat", "penting", "perbesaran", "universitas"]'::jsonb, 0, '大変 dibaca たいへん, artinya "berat / sangat".', 'makna sekanji', 'belum', 1173),
('K5-1174', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大変', '["だいへん", "たおへん", "たいへん", "だおへん"]'::jsonb, 2, '大変 artinya "berat / sangat", dibaca たいへん.', 'daku / vowel / daku+vowel', 'belum', 1174),
('K5-1175', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大好き（だいすき）', '["tidak apa-apa", "sangat suka", "jalan besar", "kedutaan"]'::jsonb, 1, '大好き dibaca だいすき, artinya "sangat suka".', 'makna sekanji', 'belum', 1175),
('K5-1176', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大好き', '["だおすき", "たおすき", "たいすき", "だいすき"]'::jsonb, 3, '大好き artinya "sangat suka", dibaca だいすき.', 'daku / vowel / daku+vowel', 'belum', 1176),
('K5-1177', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大勢（おおぜい）', '["universitas", "penting", "berat / sangat", "banyak orang"]'::jsonb, 3, '大勢 dibaca おおぜい, artinya "banyak orang".', 'makna sekanji', 'belum', 1177),
('K5-1178', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大勢', '["おおぜい", "おおうぜい", "おうおぜい", "おうおうぜい"]'::jsonb, 0, '大勢 artinya "banyak orang", dibaca おおぜい.', 'chouon+ / chouon++chouon+', 'belum', 1178),
('K5-1179', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大使館（たいしかん）', '["jalan besar", "tidak apa-apa", "kedutaan", "sangat suka"]'::jsonb, 2, '大使館 dibaca たいしかん, artinya "kedutaan".', 'makna sekanji', 'belum', 1179),
('K5-1180', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大使館', '["だいしかん", "たいしかん", "たうしかん", "だうしかん"]'::jsonb, 1, '大使館 artinya "kedutaan", dibaca たいしかん.', 'daku / vowel / daku+vowel', 'belum', 1180),
('K5-1181', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大通り（おおどおり）', '["sangat suka", "besar", "jalan besar", "kedutaan"]'::jsonb, 2, '大通り dibaca おおどおり, artinya "jalan besar".', 'makna sekanji', 'belum', 1181),
('K5-1182', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大通り', '["おうおどおり", "おうおうどおり", "おおうどおり", "おおどおり"]'::jsonb, 3, '大通り artinya "jalan besar", dibaca おおどおり.', 'chouon+ / chouon++chouon+', 'belum', 1182),
('K5-1183', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
拡大（かくだい）', '["banyak orang", "perbesaran", "universitas", "berat / sangat"]'::jsonb, 1, '拡大 dibaca かくだい, artinya "perbesaran".', 'makna sekanji', 'belum', 1183),
('K5-1184', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
拡大', '["かくだい", "がくだい", "かぐだい", "がぐだい"]'::jsonb, 0, '拡大 artinya "perbesaran", dibaca かくだい.', 'daku / daku+daku', 'belum', 1184),
('K5-1185', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小さい（ちいさい）', '["besar kecil", "burung kecil", "kecil", "siswa SD"]'::jsonb, 2, '小さい dibaca ちいさい, artinya "kecil".', 'makna sekanji', 'belum', 1185),
('K5-1186', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小さい', '["といさい", "ちいさい", "しょうさい", "ちうさい"]'::jsonb, 1, '小さい artinya "kecil", dibaca ちいさい. Membacanya しょうさい adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1186),
('K5-1187', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小学校（しょうがっこう）', '["SD", "kecil", "siswa SD", "jari kelingking"]'::jsonb, 0, '小学校 dibaca しょうがっこう, artinya "SD".', 'makna sekanji', 'belum', 1187),
('K5-1188', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小学校', '["ちいがっこう", "しようがっこう", "じょうがっこう", "しょうがっこう"]'::jsonb, 3, '小学校 artinya "SD", dibaca しょうがっこう. Membacanya ちいがっこう adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1188),
('K5-1189', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小学生（しょうがくせい）', '["siswa SD", "kecil", "penyusutan", "SD"]'::jsonb, 0, '小学生 dibaca しょうがくせい, artinya "siswa SD".', 'makna sekanji', 'belum', 1189),
('K5-1190', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小学生', '["じょうがくせい", "ちいがくせい", "しょうがくせい", "しようがくせい"]'::jsonb, 2, '小学生 artinya "siswa SD", dibaca しょうがくせい. Membacanya ちいがくせい adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1190),
('K5-1191', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小説（しょうせつ）', '["burung kecil", "paket", "penyusutan", "novel"]'::jsonb, 3, '小説 dibaca しょうせつ, artinya "novel".', 'makna sekanji', 'belum', 1191),
('K5-1192', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小説', '["ちいせつ", "しょうせつ", "しようせつ", "じょうせつ"]'::jsonb, 1, '小説 artinya "novel", dibaca しょうせつ. Membacanya ちいせつ adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1192),
('K5-1193', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小鳥（ことり）', '["paket", "besar kecil", "kecil", "burung kecil"]'::jsonb, 3, '小鳥 dibaca ことり, artinya "burung kecil".', 'makna sekanji', 'belum', 1193),
('K5-1194', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小鳥', '["こどり", "ことり", "ごどり", "ごとり"]'::jsonb, 1, '小鳥 artinya "burung kecil", dibaca ことり.', 'daku / daku+daku', 'belum', 1194),
('K5-1195', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小包（こづつみ）', '["uang receh", "novel", "paket", "besar kecil"]'::jsonb, 2, '小包 dibaca こづつみ, artinya "paket".', 'makna sekanji', 'belum', 1195),
('K5-1196', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小包', '["こづつみ", "こつつみ", "ごづつみ", "ごつつみ"]'::jsonb, 0, '小包 artinya "paket", dibaca こづつみ.', 'daku / daku+daku', 'belum', 1196),
('K5-1197', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
大小（だいしょう）', '["kecil", "besar kecil", "burung kecil", "paket"]'::jsonb, 1, '大小 dibaca だいしょう, artinya "besar kecil".', 'makna sekanji', 'belum', 1197),
('K5-1198', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大小', '["だえしょう", "たえしょう", "たいしょう", "だいしょう"]'::jsonb, 3, '大小 artinya "besar kecil", dibaca だいしょう.', 'daku / vowel / daku+vowel', 'belum', 1198),
('K5-1199', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
縮小（しゅくしょう）', '["jari kelingking", "besar kecil", "penyusutan", "uang receh"]'::jsonb, 2, '縮小 dibaca しゅくしょう, artinya "penyusutan".', 'makna sekanji', 'belum', 1199),
('K5-1200', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
縮小', '["しゅくしょう", "じゅくしょう", "じゅうくしょう", "しゅうくしょう"]'::jsonb, 0, '縮小 artinya "penyusutan", dibaca しゅくしょう.', 'daku / chouon+ / daku+chouon+', 'belum', 1200)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-1201', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小指（こゆび）', '["besar kecil", "jari kelingking", "novel", "penyusutan"]'::jsonb, 1, '小指 dibaca こゆび, artinya "jari kelingking".', 'makna sekanji', 'belum', 1201),
('K5-1202', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小指', '["ごゆび", "ごゆうび", "こゆうび", "こゆび"]'::jsonb, 3, '小指 artinya "jari kelingking", dibaca こゆび.', 'daku / chouon+ / daku+chouon+', 'belum', 1202),
('K5-1203', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
小銭（こぜに）', '["uang receh", "jari kelingking", "penyusutan", "burung kecil"]'::jsonb, 0, '小銭 dibaca こぜに, artinya "uang receh".', 'makna sekanji', 'belum', 1203),
('K5-1204', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
小銭', '["ごせに", "ごぜに", "こぜに", "こせに"]'::jsonb, 2, '小銭 artinya "uang receh", dibaca こぜに.', 'daku / daku+daku', 'belum', 1204),
('K5-1205', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高い（たかい）', '["harga tinggi", "tinggi / mahal", "mahal", "demam tinggi"]'::jsonb, 1, '高い dibaca たかい, artinya "tinggi / mahal".', 'makna sekanji', 'belum', 1205),
('K5-1206', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高い', '["だかい", "こうい", "たかい", "たがい"]'::jsonb, 2, '高い artinya "tinggi / mahal", dibaca たかい. Membacanya こうい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1206),
('K5-1207', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高校（こうこう）', '["SMA", "kelas atas", "ketinggian", "tinggi / mahal"]'::jsonb, 0, '高校 dibaca こうこう, artinya "SMA".', 'makna sekanji', 'belum', 1207),
('K5-1208', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高校', '["ごうこう", "たかこう", "ここう", "こうこう"]'::jsonb, 3, '高校 artinya "SMA", dibaca こうこう. Membacanya たかこう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1208),
('K5-1209', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
最高（さいこう）', '["mahal", "demam tinggi", "kecepatan tinggi", "terbaik"]'::jsonb, 3, '最高 dibaca さいこう, artinya "terbaik".', 'makna sekanji', 'belum', 1209),
('K5-1210', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
最高', '["さいこう", "ざいこう", "さうこう", "ざうこう"]'::jsonb, 0, '最高 artinya "terbaik", dibaca さいこう.', 'daku / vowel / daku+vowel', 'belum', 1210),
('K5-1211', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高価（こうか）', '["kelas atas", "SMA", "mahal", "tinggi / mahal"]'::jsonb, 2, '高価 dibaca こうか, artinya "mahal".', 'makna sekanji', 'belum', 1211),
('K5-1212', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高価', '["たかか", "こうか", "こか", "ごうか"]'::jsonb, 1, '高価 artinya "mahal", dibaca こうか. Membacanya たかか adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1212),
('K5-1213', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高さ（たかさ）', '["terbaik", "bertingkat tinggi", "kecepatan tinggi", "ketinggian"]'::jsonb, 3, '高さ dibaca たかさ, artinya "ketinggian".', 'makna sekanji', 'belum', 1213),
('K5-1214', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高さ', '["だかさ", "たがさ", "たかさ", "こうさ"]'::jsonb, 2, '高さ artinya "ketinggian", dibaca たかさ. Membacanya こうさ adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1214),
('K5-1215', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高速（こうそく）', '["kecepatan tinggi", "bertingkat tinggi", "harga tinggi", "demam tinggi"]'::jsonb, 0, '高速 dibaca こうそく, artinya "kecepatan tinggi".', 'makna sekanji', 'belum', 1215),
('K5-1216', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高速', '["ごうそく", "こうそく", "たかそく", "こそく"]'::jsonb, 1, '高速 artinya "kecepatan tinggi", dibaca こうそく. Membacanya たかそく adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1216),
('K5-1217', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高級（こうきゅう）', '["terbaik", "kelas atas", "harga tinggi", "mahal"]'::jsonb, 1, '高級 dibaca こうきゅう, artinya "kelas atas".', 'makna sekanji', 'belum', 1217),
('K5-1218', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高級', '["ごうきゅう", "たかきゅう", "こうきゅう", "こきゅう"]'::jsonb, 2, '高級 artinya "kelas atas", dibaca こうきゅう. Membacanya たかきゅう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1218),
('K5-1219', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高熱（こうねつ）', '["demam tinggi", "harga tinggi", "bertingkat tinggi", "kecepatan tinggi"]'::jsonb, 0, '高熱 dibaca こうねつ, artinya "demam tinggi".', 'makna sekanji', 'belum', 1219),
('K5-1220', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高熱', '["ごうねつ", "たかねつ", "こねつ", "こうねつ"]'::jsonb, 3, '高熱 artinya "demam tinggi", dibaca こうねつ. Membacanya たかねつ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1220),
('K5-1221', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高値（たかね）', '["demam tinggi", "kecepatan tinggi", "harga tinggi", "bertingkat tinggi"]'::jsonb, 2, '高値 dibaca たかね, artinya "harga tinggi".', 'makna sekanji', 'belum', 1221),
('K5-1222', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高値', '["たがね", "だかね", "こうね", "たかね"]'::jsonb, 3, '高値 artinya "harga tinggi", dibaca たかね. Membacanya こうね adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1222),
('K5-1223', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
高層（こうそう）', '["bertingkat tinggi", "kecepatan tinggi", "demam tinggi", "harga tinggi"]'::jsonb, 0, '高層 dibaca こうそう, artinya "bertingkat tinggi".', 'makna sekanji', 'belum', 1223),
('K5-1224', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
高層', '["こそう", "こうそう", "ごうそう", "たかそう"]'::jsonb, 1, '高層 artinya "bertingkat tinggi", dibaca こうそう. Membacanya たかそう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1224),
('K5-1225', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安い（やすい）', '["yen melemah", "murah", "barang murah", "sangat murah"]'::jsonb, 1, '安い dibaca やすい, artinya "murah".', 'makna sekanji', 'belum', 1225),
('K5-1226', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安い', '["やすい", "ゆすい", "あんい", "やずい"]'::jsonb, 0, '安い artinya "murah", dibaca やすい. Membacanya あんい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1226),
('K5-1227', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安全（あんぜん）', '["sangat murah", "murah", "stabil", "aman"]'::jsonb, 3, '安全 dibaca あんぜん, artinya "aman".', 'makna sekanji', 'belum', 1227),
('K5-1228', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安全', '["うんぜん", "あんせん", "あんぜん", "やすぜん"]'::jsonb, 2, '安全 artinya "aman", dibaca あんぜん. Membacanya やすぜん adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1228),
('K5-1229', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安心（あんしん）', '["cemas", "yen melemah", "aman", "lega / tenang"]'::jsonb, 3, '安心 dibaca あんしん, artinya "lega / tenang".', 'makna sekanji', 'belum', 1229),
('K5-1230', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安心', '["やすしん", "あんしん", "うんしん", "あんじん"]'::jsonb, 1, '安心 artinya "lega / tenang", dibaca あんしん. Membacanya やすしん adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1230),
('K5-1231', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
不安（ふあん）', '["cemas", "barang murah", "yen melemah", "lega / tenang"]'::jsonb, 0, '不安 dibaca ふあん, artinya "cemas".', 'makna sekanji', 'belum', 1231),
('K5-1232', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
不安', '["ふうあん", "はあん", "ふあん", "ぶあん"]'::jsonb, 2, '不安 artinya "cemas", dibaca ふあん.', 'daku / chouon+ / vowel', 'belum', 1232),
('K5-1233', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安定（あんてい）', '["yen melemah", "cemas", "keamanan", "stabil"]'::jsonb, 3, '安定 dibaca あんてい, artinya "stabil".', 'makna sekanji', 'belum', 1233),
('K5-1234', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安定', '["あんでい", "あんてい", "いんてい", "やすてい"]'::jsonb, 1, '安定 artinya "stabil", dibaca あんてい. Membacanya やすてい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1234),
('K5-1235', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
格安（かくやす）', '["murah", "barang murah", "sangat murah", "lega / tenang"]'::jsonb, 2, '格安 dibaca かくやす, artinya "sangat murah".', 'makna sekanji', 'belum', 1235),
('K5-1236', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
格安', '["かくやす", "がぐやす", "かぐやす", "がくやす"]'::jsonb, 0, '格安 artinya "sangat murah", dibaca かくやす.', 'daku / daku+daku', 'belum', 1236),
('K5-1237', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安売り（やすうり）', '["keamanan", "aman", "stabil", "obral"]'::jsonb, 3, '安売り dibaca やすうり, artinya "obral".', 'makna sekanji', 'belum', 1237),
('K5-1238', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安売り', '["よすうり", "やずうり", "やすうり", "あんうり"]'::jsonb, 2, '安売り artinya "obral", dibaca やすうり. Membacanya あんうり adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1238),
('K5-1239', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
治安（ちあん）', '["lega / tenang", "keamanan", "cemas", "yen melemah"]'::jsonb, 1, '治安 dibaca ちあん, artinya "keamanan".', 'makna sekanji', 'belum', 1239),
('K5-1240', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
治安', '["ちあん", "てえん", "てあん", "ちえん"]'::jsonb, 0, '治安 artinya "keamanan", dibaca ちあん.', 'vowel / vowel+vowel', 'belum', 1240),
('K5-1241', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
安物（やすもの）', '["sangat murah", "barang murah", "murah", "aman"]'::jsonb, 1, '安物 dibaca やすもの, artinya "barang murah".', 'makna sekanji', 'belum', 1241),
('K5-1242', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
安物', '["ゆすもの", "あんもの", "やずもの", "やすもの"]'::jsonb, 3, '安物 artinya "barang murah", dibaca やすもの. Membacanya あんもの adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1242),
('K5-1243', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新しい（あたらしい）', '["orang baru", "barang baru", "baru", "baru (formal)"]'::jsonb, 2, '新しい dibaca あたらしい, artinya "baru".', 'makna sekanji', 'belum', 1243),
('K5-1244', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新しい', '["あたらしい", "しんしい", "うたらしい", "あだらしい"]'::jsonb, 0, '新しい artinya "baru", dibaca あたらしい. Membacanya しんしい adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1244),
('K5-1245', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新聞（しんぶん）', '["pembaruan", "baru (formal)", "pengantin baru", "koran"]'::jsonb, 3, '新聞 dibaca しんぶん, artinya "koran".', 'makna sekanji', 'belum', 1245),
('K5-1246', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新聞', '["じんぶん", "しんぷん", "しんぶん", "あたらぶん"]'::jsonb, 2, '新聞 artinya "koran", dibaca しんぶん. Membacanya あたらぶん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1246),
('K5-1247', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新幹線（しんかんせん）', '["baru (formal)", "Shinkansen", "baru", "orang baru"]'::jsonb, 1, '新幹線 dibaca しんかんせん, artinya "Shinkansen".', 'makna sekanji', 'belum', 1247),
('K5-1248', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新幹線', '["しんかんせん", "じんかんせん", "しんがんせん", "あたらかんせん"]'::jsonb, 0, '新幹線 artinya "Shinkansen", dibaca しんかんせん. Membacanya あたらかんせん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1248),
('K5-1249', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
最新（さいしん）', '["segar", "orang baru", "pengantin baru", "terbaru"]'::jsonb, 3, '最新 dibaca さいしん, artinya "terbaru".', 'makna sekanji', 'belum', 1249),
('K5-1250', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
最新', '["さいしん", "ざあしん", "ざいしん", "さあしん"]'::jsonb, 0, '最新 artinya "terbaru", dibaca さいしん.', 'daku / vowel / daku+vowel', 'belum', 1250),
('K5-1251', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新品（しんぴん）', '["orang baru", "pengantin baru", "barang baru", "baru (formal)"]'::jsonb, 2, '新品 dibaca しんぴん, artinya "barang baru".', 'makna sekanji', 'belum', 1251),
('K5-1252', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新品', '["じんぴん", "しんぴん", "あたらぴん", "しんひん"]'::jsonb, 1, '新品 artinya "barang baru", dibaca しんぴん. Membacanya あたらぴん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1252),
('K5-1253', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新人（しんじん）', '["orang baru", "barang baru", "pengantin baru", "baru"]'::jsonb, 0, '新人 dibaca しんじん, artinya "orang baru".', 'makna sekanji', 'belum', 1253),
('K5-1254', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新人', '["あたらじん", "しんしん", "しんじん", "じんじん"]'::jsonb, 2, '新人 artinya "orang baru", dibaca しんじん. Membacanya あたらじん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1254),
('K5-1255', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新婚（しんこん）', '["barang baru", "baru (formal)", "orang baru", "pengantin baru"]'::jsonb, 3, '新婚 dibaca しんこん, artinya "pengantin baru".', 'makna sekanji', 'belum', 1255),
('K5-1256', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新婚', '["じんこん", "しんこん", "あたらこん", "しんごん"]'::jsonb, 1, '新婚 artinya "pengantin baru", dibaca しんこん. Membacanya あたらこん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1256),
('K5-1257', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
更新（こうしん）', '["terbaru", "orang baru", "pembaruan", "segar"]'::jsonb, 2, '更新 dibaca こうしん, artinya "pembaruan".', 'makna sekanji', 'belum', 1257),
('K5-1258', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
更新', '["こしん", "ごしん", "ごうしん", "こうしん"]'::jsonb, 3, '更新 artinya "pembaruan", dibaca こうしん.', 'daku / chouon- / daku+chouon-', 'belum', 1258),
('K5-1259', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新鮮（しんせん）', '["koran", "segar", "orang baru", "terbaru"]'::jsonb, 1, '新鮮 dibaca しんせん, artinya "segar".', 'makna sekanji', 'belum', 1259),
('K5-1260', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新鮮', '["しんせん", "しんぜん", "じんせん", "あたらせん"]'::jsonb, 0, '新鮮 artinya "segar", dibaca しんせん. Membacanya あたらせん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1260),
('K5-1261', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
新た（あらた）', '["pengantin baru", "orang baru", "baru (formal)", "baru"]'::jsonb, 2, '新た dibaca あらた, artinya "baru (formal)".', 'makna sekanji', 'belum', 1261),
('K5-1262', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新た', '["しんた", "あらた", "あるた", "えらた"]'::jsonb, 1, '新た artinya "baru (formal)", dibaca あらた. Membacanya しんた adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1262),
('K5-1263', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古い（ふるい）', '["lama", "karya klasik", "luka lama", "kota tua"]'::jsonb, 0, '古い dibaca ふるい, artinya "lama".', 'makna sekanji', 'belum', 1263),
('K5-1264', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古い', '["ふるお", "ふるうお", "ふるうい", "ふるい"]'::jsonb, 3, '古い artinya "lama", dibaca ふるい.', 'chouon+ / vowel / chouon++vowel', 'belum', 1264),
('K5-1265', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古着（ふるぎ）', '["karya klasik", "baju bekas", "buku bekas", "kota tua"]'::jsonb, 1, '古着 dibaca ふるぎ, artinya "baju bekas".', 'makna sekanji', 'belum', 1265),
('K5-1266', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古着', '["ふるぎ", "ふるき", "ふるうき", "ふるうぎ"]'::jsonb, 0, '古着 artinya "baju bekas", dibaca ふるぎ.', 'chouon+ / daku / chouon++daku', 'belum', 1266),
('K5-1267', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古本（ふるほん）', '["lama", "baju bekas", "buku bekas", "karya klasik"]'::jsonb, 2, '古本 dibaca ふるほん, artinya "buku bekas".', 'makna sekanji', 'belum', 1267),
('K5-1268', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古本', '["ふるうほん", "ふるぽん", "ふるうぽん", "ふるほん"]'::jsonb, 3, '古本 artinya "buku bekas", dibaca ふるほん.', 'chouon+ / daku / chouon++daku', 'belum', 1268),
('K5-1269', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古代（こだい）', '["luka lama", "baju bekas", "buku bekas", "zaman kuno"]'::jsonb, 3, '古代 dibaca こだい, artinya "zaman kuno".', 'makna sekanji', 'belum', 1269),
('K5-1270', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古代', '["ごだい", "こだい", "ごたい", "こたい"]'::jsonb, 1, '古代 artinya "zaman kuno", dibaca こだい.', 'daku / daku+daku', 'belum', 1270),
('K5-1271', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
考古学（こうこがく）', '["kota tua", "Nagoya", "arkeologi", "zaman kuno"]'::jsonb, 2, '考古学 dibaca こうこがく, artinya "arkeologi".', 'makna sekanji', 'belum', 1271),
('K5-1272', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
考古学', '["こうこがく", "ごこがく", "ごうこがく", "ここがく"]'::jsonb, 0, '考古学 artinya "arkeologi", dibaca こうこがく.', 'daku / chouon- / daku+chouon-', 'belum', 1272),
('K5-1273', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古典（こてん）', '["luka lama", "karya klasik", "buku bekas", "lama"]'::jsonb, 1, '古典 dibaca こてん, artinya "karya klasik".', 'makna sekanji', 'belum', 1273),
('K5-1274', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古典', '["こでん", "ごでん", "こてん", "ごてん"]'::jsonb, 2, '古典 artinya "karya klasik", dibaca こてん.', 'daku / daku+daku', 'belum', 1274),
('K5-1275', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古都（こと）', '["kota tua", "latihan", "lama", "buku bekas"]'::jsonb, 0, '古都 dibaca こと, artinya "kota tua".', 'makna sekanji', 'belum', 1275),
('K5-1276', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古都', '["ごと", "こど", "ごど", "こと"]'::jsonb, 3, '古都 artinya "kota tua", dibaca こと.', 'daku / daku+daku', 'belum', 1276),
('K5-1277', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
名古屋（なごや）', '["Nagoya", "karya klasik", "arkeologi", "lama"]'::jsonb, 0, '名古屋 dibaca なごや, artinya "Nagoya".', 'makna sekanji', 'belum', 1277),
('K5-1278', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
名古屋', '["なこや", "ぬごや", "なごや", "ぬこや"]'::jsonb, 2, '名古屋 artinya "Nagoya", dibaca なごや.', 'vowel / daku / vowel+daku', 'belum', 1278),
('K5-1279', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
古傷（ふるきず）', '["lama", "luka lama", "kota tua", "karya klasik"]'::jsonb, 1, '古傷 dibaca ふるきず, artinya "luka lama".', 'makna sekanji', 'belum', 1279),
('K5-1280', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
古傷', '["ふるうぎず", "ふるぎず", "ふるうきず", "ふるきず"]'::jsonb, 3, '古傷 artinya "luka lama", dibaca ふるきず.', 'chouon+ / daku / chouon++daku', 'belum', 1280),
('K5-1281', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
稽古（けいこ）', '["zaman kuno", "karya klasik", "latihan", "lama"]'::jsonb, 2, '稽古 dibaca けいこ, artinya "latihan".', 'makna sekanji', 'belum', 1281),
('K5-1282', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
稽古', '["げいこ", "けいこ", "けこ", "げこ"]'::jsonb, 1, '稽古 artinya "latihan", dibaca けいこ.', 'daku / chouon- / daku+chouon-', 'belum', 1282),
('K5-1283', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
長い（ながい）', '["panjang", "sepatu bot", "pertumbuhan", "wali kota"]'::jsonb, 0, '長い dibaca ながい, artinya "panjang".', 'makna sekanji', 'belum', 1283),
('K5-1284', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長い', '["にかい", "なかい", "にがい", "ながい"]'::jsonb, 3, '長い artinya "panjang", dibaca ながい.', 'vowel / daku / vowel+daku', 'belum', 1284),
('K5-1285', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
社長（しゃちょう）', '["kepala bagian", "pertumbuhan", "panjang", "direktur"]'::jsonb, 3, '社長 dibaca しゃちょう, artinya "direktur".', 'makna sekanji', 'belum', 1285),
('K5-1286', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
社長', '["じやちょう", "しやちょう", "しゃちょう", "じゃちょう"]'::jsonb, 2, '社長 artinya "direktur", dibaca しゃちょう.', 'daku / youon / daku+youon', 'belum', 1286),
('K5-1287', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
校長（こうちょう）', '["kepala sekolah", "direktur", "panjang", "kepala bagian"]'::jsonb, 0, '校長 dibaca こうちょう, artinya "kepala sekolah".', 'makna sekanji', 'belum', 1287),
('K5-1288', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校長', '["ごちょう", "こうちょう", "ごうちょう", "こちょう"]'::jsonb, 1, '校長 artinya "kepala sekolah", dibaca こうちょう.', 'daku / chouon- / daku+chouon-', 'belum', 1288),
('K5-1289', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
部長（ぶちょう）', '["panjang", "kepala bagian", "kepala sekolah", "sepatu bot"]'::jsonb, 1, '部長 dibaca ぶちょう, artinya "kepala bagian".', 'makna sekanji', 'belum', 1289),
('K5-1290', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
部長', '["ふっちょう", "ふちょう", "ぶっちょう", "ぶちょう"]'::jsonb, 3, '部長 artinya "kepala bagian", dibaca ぶちょう.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1290),
('K5-1291', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
身長（しんちょう）', '["tinggi badan", "panjang", "kelebihan", "direktur"]'::jsonb, 0, '身長 dibaca しんちょう, artinya "tinggi badan".', 'makna sekanji', 'belum', 1291),
('K5-1292', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
身長', '["じんちょう", "しんっちょう", "しんちょう", "じんっちょう"]'::jsonb, 2, '身長 artinya "tinggi badan", dibaca しんちょう.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1292),
('K5-1293', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
長所（ちょうしょ）', '["kelebihan", "kepala sekolah", "panjang", "direktur"]'::jsonb, 0, '長所 dibaca ちょうしょ, artinya "kelebihan".', 'makna sekanji', 'belum', 1293),
('K5-1294', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長所', '["ちょしょ", "ちよしょ", "ちようしょ", "ちょうしょ"]'::jsonb, 3, '長所 artinya "kelebihan", dibaca ちょうしょ.', 'youon / chouon- / youon+chouon-', 'belum', 1294),
('K5-1295', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
長さ（ながさ）', '["pertumbuhan", "panjangnya", "direktur", "kepala bagian"]'::jsonb, 1, '長さ dibaca ながさ, artinya "panjangnya".', 'makna sekanji', 'belum', 1295),
('K5-1296', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長さ', '["なかさ", "ねかさ", "ながさ", "ねがさ"]'::jsonb, 2, '長さ artinya "panjangnya", dibaca ながさ.', 'vowel / daku / vowel+daku', 'belum', 1296),
('K5-1297', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
成長（せいちょう）', '["tinggi badan", "sepatu bot", "pertumbuhan", "kepala bagian"]'::jsonb, 2, '成長 dibaca せいちょう, artinya "pertumbuhan".', 'makna sekanji', 'belum', 1297),
('K5-1298', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
成長', '["せちょう", "せいちょう", "ぜちょう", "ぜいちょう"]'::jsonb, 1, '成長 artinya "pertumbuhan", dibaca せいちょう.', 'daku / chouon- / daku+chouon-', 'belum', 1298),
('K5-1299', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
市長（しちょう）', '["kepala sekolah", "kelebihan", "pertumbuhan", "wali kota"]'::jsonb, 3, '市長 dibaca しちょう, artinya "wali kota".', 'makna sekanji', 'belum', 1299),
('K5-1300', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
市長', '["しちょう", "しっちょう", "じっちょう", "じちょう"]'::jsonb, 0, '市長 artinya "wali kota", dibaca しちょう.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1300),
('K5-1301', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
長靴（ながぐつ）', '["panjang", "kepala sekolah", "kelebihan", "sepatu bot"]'::jsonb, 3, '長靴 dibaca ながぐつ, artinya "sepatu bot".', 'makna sekanji', 'belum', 1301),
('K5-1302', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
長靴', '["ながぐつ", "ねかぐつ", "なかぐつ", "ねがぐつ"]'::jsonb, 0, '長靴 artinya "sepatu bot", dibaca ながぐつ.', 'vowel / daku / vowel+daku', 'belum', 1302),
('K5-1303', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白い（しろい）', '["hitam putih", "putih", "jelas", "angsa"]'::jsonb, 1, '白い dibaca しろい, artinya "putih".', 'makna sekanji', 'belum', 1303),
('K5-1304', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白い', '["はくい", "しろうい", "しろい", "じろい"]'::jsonb, 2, '白い artinya "putih", dibaca しろい. Membacanya はくい adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1304),
('K5-1305', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白（しろ）', '["obral", "lega / tenang", "warna putih", "kota tua"]'::jsonb, 2, '白 dibaca しろ, artinya "warna putih".', 'makna selevel', 'belum', 1305),
('K5-1306', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白', '["しろう", "しろ", "じろ", "はく"]'::jsonb, 1, '白 artinya "warna putih", dibaca しろ. Membacanya はく adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1306),
('K5-1307', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
面白い（おもしろい）', '["menarik", "jelas", "kertas kosong", "hitam putih"]'::jsonb, 0, '面白い dibaca おもしろい, artinya "menarik".', 'makna sekanji', 'belum', 1307),
('K5-1308', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
面白い', '["おうもしろい", "おもうしろい", "おうもうしろい", "おもしろい"]'::jsonb, 3, '面白い artinya "menarik", dibaca おもしろい.', 'chouon+ / chouon++chouon+', 'belum', 1308),
('K5-1309', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白紙（はくし）', '["jelas", "putih", "ruang kosong", "kertas kosong"]'::jsonb, 3, '白紙 dibaca はくし, artinya "kertas kosong".', 'makna sekanji', 'belum', 1309),
('K5-1310', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白紙', '["はくし", "はくじ", "しろし", "はぐし"]'::jsonb, 0, '白紙 artinya "kertas kosong", dibaca はくし. Membacanya しろし adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1310),
('K5-1311', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
空白（くうはく）', '["uban", "hitam putih", "ruang kosong", "kertas kosong"]'::jsonb, 2, '空白 dibaca くうはく, artinya "ruang kosong".', 'makna sekanji', 'belum', 1311),
('K5-1312', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
空白', '["ぐうはく", "くうはく", "くはく", "ぐはく"]'::jsonb, 1, '空白 artinya "ruang kosong", dibaca くうはく.', 'daku / chouon- / daku+chouon-', 'belum', 1312),
('K5-1313', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白鳥（はくちょう）', '["angsa", "hitam putih", "pernyataan cinta", "kertas kosong"]'::jsonb, 0, '白鳥 dibaca はくちょう, artinya "angsa".', 'makna sekanji', 'belum', 1313),
('K5-1314', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白鳥', '["はくっちょう", "はくちょう", "はぐちょう", "しろちょう"]'::jsonb, 1, '白鳥 artinya "angsa", dibaca はくちょう. Membacanya しろちょう adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 1314),
('K5-1315', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
告白（こくはく）', '["jelas", "putih", "pernyataan cinta", "kertas kosong"]'::jsonb, 2, '告白 dibaca こくはく, artinya "pernyataan cinta".', 'makna sekanji', 'belum', 1315),
('K5-1316', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
告白', '["こぐはく", "ごぐはく", "ごくはく", "こくはく"]'::jsonb, 3, '告白 artinya "pernyataan cinta", dibaca こくはく.', 'daku / daku+daku', 'belum', 1316),
('K5-1317', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白髪（しらが）', '["pernyataan cinta", "uban", "putih", "hitam putih"]'::jsonb, 1, '白髪 dibaca しらが, artinya "uban".', 'makna sekanji', 'belum', 1317),
('K5-1318', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白髪', '["しらが", "じれが", "じらが", "しれが"]'::jsonb, 0, '白髪 artinya "uban", dibaca しらが.', 'daku / vowel / daku+vowel', 'belum', 1318),
('K5-1319', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
白黒（しろくろ）', '["putih", "ruang kosong", "kertas kosong", "hitam putih"]'::jsonb, 3, '白黒 dibaca しろくろ, artinya "hitam putih".', 'makna sekanji', 'belum', 1319),
('K5-1320', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
白黒', '["はくくろ", "しろうくろ", "しろくろ", "じろくろ"]'::jsonb, 2, '白黒 artinya "hitam putih", dibaca しろくろ. Membacanya はくくろ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1320),
('K5-1321', 'N5', 'kanji', 'Arti', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Apa arti kata berikut?
明白（めいはく）', '["uban", "angsa", "jelas", "kertas kosong"]'::jsonb, 2, '明白 dibaca めいはく, artinya "jelas".', 'makna sekanji', 'belum', 1321),
('K5-1322', 'N5', 'kanji', 'Bacaan', 6, 'T06', 'Sifat & Ukuran', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
明白', '["みはく", "めいはく", "めはく", "みいはく"]'::jsonb, 1, '明白 artinya "jelas", dibaca めいはく.', 'vowel / chouon- / vowel+chouon-', 'belum', 1322),
('K5-1323', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
学ぶ（まなぶ）', '["semester", "kunjungan belajar", "sains", "belajar"]'::jsonb, 3, '学ぶ dibaca まなぶ, artinya "belajar".', 'makna sekanji', 'belum', 1323),
('K5-1324', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学ぶ', '["まなぶ", "みにぶ", "みなぶ", "まにぶ"]'::jsonb, 0, '学ぶ artinya "belajar", dibaca まなぶ.', 'vowel / vowel+vowel', 'belum', 1324),
('K5-1325', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
学校（がっこう）', '["sekolah", "pulang sekolah", "masuk sekolah", "gerbang sekolah"]'::jsonb, 0, '学校 dibaca がっこう, artinya "sekolah".', 'makna sekanji', 'belum', 1325),
('K5-1326', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学校', '["かこう", "かっこう", "がっこう", "がこう"]'::jsonb, 2, '学校 artinya "sekolah", dibaca がっこう.', 'daku / sokuon- / daku+sokuon-', 'belum', 1326),
('K5-1327', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
留学生（りゅうがくせい）', '["sekolah", "semester", "sains", "mahasiswa asing"]'::jsonb, 3, '留学生 dibaca りゅうがくせい, artinya "mahasiswa asing".', 'makna sekanji', 'belum', 1327),
('K5-1328', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
留学生', '["りゆうがくせい", "りゅうがくせい", "りゆがくせい", "りゅがくせい"]'::jsonb, 1, '留学生 artinya "mahasiswa asing", dibaca りゅうがくせい.', 'youon / chouon- / youon+chouon-', 'belum', 1328),
('K5-1329', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
数学（すうがく）', '["semester", "matematika", "ilmuwan", "sekolah"]'::jsonb, 1, '数学 dibaca すうがく, artinya "matematika".', 'makna sekanji', 'belum', 1329),
('K5-1330', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
数学', '["ずうがく", "すがく", "ずがく", "すうがく"]'::jsonb, 3, '数学 artinya "matematika", dibaca すうがく.', 'daku / chouon- / daku+chouon-', 'belum', 1330),
('K5-1331', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
科学（かがく）', '["sains", "belajar", "semester", "kunjungan belajar"]'::jsonb, 0, '科学 dibaca かがく, artinya "sains".', 'makna sekanji', 'belum', 1331),
('K5-1332', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
科学', '["がかく", "かかく", "かがく", "ががく"]'::jsonb, 2, '科学 artinya "sains", dibaca かがく.', 'daku / daku+daku', 'belum', 1332),
('K5-1333', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
医学（いがく）', '["ilmu bahasa", "sekolah", "ilmu kedokteran", "belajar"]'::jsonb, 2, '医学 dibaca いがく, artinya "ilmu kedokteran".', 'makna sekanji', 'belum', 1333),
('K5-1334', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
医学', '["あがく", "いかく", "あかく", "いがく"]'::jsonb, 3, '医学 artinya "ilmu kedokteran", dibaca いがく.', 'vowel / daku / vowel+daku', 'belum', 1334),
('K5-1335', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
学期（がっき）', '["semester", "sains", "ilmu kedokteran", "kunjungan belajar"]'::jsonb, 0, '学期 dibaca がっき, artinya "semester".', 'makna sekanji', 'belum', 1335),
('K5-1336', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学期', '["がき", "がっき", "かっき", "かき"]'::jsonb, 1, '学期 artinya "semester", dibaca がっき.', 'daku / sokuon- / daku+sokuon-', 'belum', 1336),
('K5-1337', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
入学（にゅうがく）', '["masuk sekolah", "matematika", "gerbang sekolah", "sekolah"]'::jsonb, 0, '入学 dibaca にゅうがく, artinya "masuk sekolah".', 'makna sekanji', 'belum', 1337),
('K5-1338', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入学', '["にゆうがく", "にゅがく", "にゅうがく", "にゆがく"]'::jsonb, 2, '入学 artinya "masuk sekolah", dibaca にゅうがく.', 'youon / chouon- / youon+chouon-', 'belum', 1338),
('K5-1339', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見学（けんがく）', '["matematika", "belajar", "masuk sekolah", "kunjungan belajar"]'::jsonb, 3, '見学 dibaca けんがく, artinya "kunjungan belajar".', 'makna sekanji', 'belum', 1339),
('K5-1340', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見学', '["げんがく", "けんがく", "けんかく", "げんかく"]'::jsonb, 1, '見学 artinya "kunjungan belajar", dibaca けんがく.', 'daku / daku+daku', 'belum', 1340),
('K5-1341', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
学者（がくしゃ）', '["ilmuwan", "belajar", "sains", "semester"]'::jsonb, 0, '学者 dibaca がくしゃ, artinya "ilmuwan".', 'makna sekanji', 'belum', 1341),
('K5-1342', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
学者', '["がぐしゃ", "がくしゃ", "かぐしゃ", "かくしゃ"]'::jsonb, 1, '学者 artinya "ilmuwan", dibaca がくしゃ.', 'daku / daku+daku', 'belum', 1342),
('K5-1343', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
校門（こうもん）', '["halaman sekolah", "pindah sekolah", "aturan sekolah", "gerbang sekolah"]'::jsonb, 3, '校門 dibaca こうもん, artinya "gerbang sekolah".', 'makna sekanji', 'belum', 1343),
('K5-1344', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校門', '["ごうもん", "ごもん", "こうもん", "こもん"]'::jsonb, 2, '校門 artinya "gerbang sekolah", dibaca こうもん.', 'daku / chouon- / daku+chouon-', 'belum', 1344),
('K5-1345', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
校庭（こうてい）', '["sekolah", "gedung sekolah", "pulang sekolah", "halaman sekolah"]'::jsonb, 3, '校庭 dibaca こうてい, artinya "halaman sekolah".', 'makna sekanji', 'belum', 1345),
('K5-1346', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校庭', '["ごてい", "ごうてい", "こうてい", "こてい"]'::jsonb, 2, '校庭 artinya "halaman sekolah", dibaca こうてい.', 'daku / chouon- / daku+chouon-', 'belum', 1346),
('K5-1347', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
転校（てんこう）', '["pindah sekolah", "halaman sekolah", "aturan sekolah", "sekolah"]'::jsonb, 0, '転校 dibaca てんこう, artinya "pindah sekolah".', 'makna sekanji', 'belum', 1347),
('K5-1348', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
転校', '["てんごう", "てんこう", "でんごう", "でんこう"]'::jsonb, 1, '転校 artinya "pindah sekolah", dibaca てんこう.', 'daku / daku+daku', 'belum', 1348),
('K5-1349', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
登校（とうこう）', '["pindah sekolah", "berangkat sekolah", "gerbang sekolah", "gedung sekolah"]'::jsonb, 1, '登校 dibaca とうこう, artinya "berangkat sekolah".', 'makna sekanji', 'belum', 1349),
('K5-1350', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
登校', '["どこう", "とこう", "どうこう", "とうこう"]'::jsonb, 3, '登校 artinya "berangkat sekolah", dibaca とうこう.', 'daku / chouon- / daku+chouon-', 'belum', 1350),
('K5-1351', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
下校（げこう）', '["aturan sekolah", "gerbang sekolah", "pulang sekolah", "halaman sekolah"]'::jsonb, 2, '下校 dibaca げこう, artinya "pulang sekolah".', 'makna sekanji', 'belum', 1351),
('K5-1352', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
下校', '["げこう", "げごう", "けこう", "けごう"]'::jsonb, 0, '下校 artinya "pulang sekolah", dibaca げこう.', 'daku / daku+daku', 'belum', 1352),
('K5-1353', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
校舎（こうしゃ）', '["pindah sekolah", "aturan sekolah", "gedung sekolah", "pulang sekolah"]'::jsonb, 2, '校舎 dibaca こうしゃ, artinya "gedung sekolah".', 'makna sekanji', 'belum', 1353),
('K5-1354', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校舎', '["ごうしゃ", "こしゃ", "ごしゃ", "こうしゃ"]'::jsonb, 3, '校舎 artinya "gedung sekolah", dibaca こうしゃ.', 'daku / chouon- / daku+chouon-', 'belum', 1354),
('K5-1355', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
予備校（よびこう）', '["aturan sekolah", "bimbel", "sekolah", "halaman sekolah"]'::jsonb, 1, '予備校 dibaca よびこう, artinya "bimbel".', 'makna sekanji', 'belum', 1355),
('K5-1356', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
予備校', '["よびこう", "ようひこう", "よひこう", "ようびこう"]'::jsonb, 0, '予備校 artinya "bimbel", dibaca よびこう.', 'chouon+ / daku / chouon++daku', 'belum', 1356),
('K5-1357', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
校則（こうそく）', '["halaman sekolah", "aturan sekolah", "pindah sekolah", "sekolah"]'::jsonb, 1, '校則 dibaca こうそく, artinya "aturan sekolah".', 'makna sekanji', 'belum', 1357),
('K5-1358', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
校則', '["こうそく", "こそく", "ごそく", "ごうそく"]'::jsonb, 0, '校則 artinya "aturan sekolah", dibaca こうそく.', 'daku / chouon- / daku+chouon-', 'belum', 1358),
('K5-1359', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
休校（きゅうこう）', '["aturan sekolah", "berangkat sekolah", "sekolah libur", "sekolah"]'::jsonb, 2, '休校 dibaca きゅうこう, artinya "sekolah libur".', 'makna sekanji', 'belum', 1359),
('K5-1360', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休校', '["ぎゆうこう", "ぎゅうこう", "きゆうこう", "きゅうこう"]'::jsonb, 3, '休校 artinya "sekolah libur", dibaca きゅうこう.', 'daku / youon / daku+youon', 'belum', 1360),
('K5-1361', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
本（ほん）', '["kalimat", "buku", "buku pelajaran", "membaca buku"]'::jsonb, 1, '本 dibaca ほん, artinya "buku".', 'makna sekanji', 'belum', 1361),
('K5-1362', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本', '["ぼん", "ほうん", "ほん", "へん"]'::jsonb, 2, '本 artinya "buku", dibaca ほん.', 'daku / chouon+ / vowel', 'belum', 1362),
('K5-1363', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
本屋（ほんや）', '["toko buku", "buku bergambar", "dasar", "nama Yamamoto"]'::jsonb, 0, '本屋 dibaca ほんや, artinya "toko buku".', 'makna sekanji', 'belum', 1363),
('K5-1364', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本屋', '["ぼんよ", "ぼんや", "ほんよ", "ほんや"]'::jsonb, 3, '本屋 artinya "toko buku", dibaca ほんや.', 'daku / vowel / daku+vowel', 'belum', 1364),
('K5-1365', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
本当（ほんとう）', '["sungguh", "toko buku", "nama Yamamoto", "dasar"]'::jsonb, 0, '本当 dibaca ほんとう, artinya "sungguh".', 'makna sekanji', 'belum', 1365),
('K5-1366', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本当', '["ぼんとう", "ぼんどう", "ほんどう", "ほんとう"]'::jsonb, 3, '本当 artinya "sungguh", dibaca ほんとう.', 'daku / daku+daku', 'belum', 1366),
('K5-1367', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
絵本（えほん）', '["satu batang", "buku bergambar", "toko buku", "dasar"]'::jsonb, 1, '絵本 dibaca えほん, artinya "buku bergambar".', 'makna sekanji', 'belum', 1367),
('K5-1368', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
絵本', '["えぽん", "あぽん", "えほん", "あほん"]'::jsonb, 2, '絵本 artinya "buku bergambar", dibaca えほん.', 'vowel / daku / vowel+daku', 'belum', 1368),
('K5-1369', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
本社（ほんしゃ）', '["toko buku", "serius", "dasar", "kantor pusat"]'::jsonb, 3, '本社 dibaca ほんしゃ, artinya "kantor pusat".', 'makna sekanji', 'belum', 1369),
('K5-1370', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本社', '["ほんじゃ", "ほんしゃ", "ぼんしゃ", "ぼんじゃ"]'::jsonb, 1, '本社 artinya "kantor pusat", dibaca ほんしゃ.', 'daku / daku+daku', 'belum', 1370),
('K5-1371', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
一本（いっぽん）', '["nama Yamamoto", "serius", "satu batang", "sungguh"]'::jsonb, 2, '一本 dibaca いっぽん, artinya "satu batang".', 'makna sekanji', 'belum', 1371),
('K5-1372', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一本', '["いっぽん", "おぽん", "おっぽん", "いぽん"]'::jsonb, 0, '一本 artinya "satu batang", dibaca いっぽん.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 1372),
('K5-1373', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
基本（きほん）', '["dasar", "buku bergambar", "nama Yamamoto", "sungguh"]'::jsonb, 0, '基本 dibaca きほん, artinya "dasar".', 'makna sekanji', 'belum', 1373),
('K5-1374', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
基本', '["ぎぽん", "ぎほん", "きほん", "きぽん"]'::jsonb, 2, '基本 artinya "dasar", dibaca きほん.', 'daku / daku+daku', 'belum', 1374),
('K5-1375', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
本気（ほんき）', '["dasar", "satu batang", "kantor pusat", "serius"]'::jsonb, 3, '本気 dibaca ほんき, artinya "serius".', 'makna sekanji', 'belum', 1375),
('K5-1376', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本気', '["ほんっき", "ほんき", "ほんぎ", "ぼんき"]'::jsonb, 1, '本気 artinya "serius", dibaca ほんき.', 'daku / sokuon+', 'belum', 1376),
('K5-1377', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
手本（てほん）', '["toko buku", "satu batang", "teladan", "serius"]'::jsonb, 2, '手本 dibaca てほん, artinya "teladan".', 'makna sekanji', 'belum', 1377),
('K5-1378', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
手本', '["でほん", "てほん", "てぽん", "でぽん"]'::jsonb, 1, '手本 artinya "teladan", dibaca てほん.', 'daku / daku+daku', 'belum', 1378),
('K5-1379', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
山本（やまもと）', '["nama Yamamoto", "kantor pusat", "sungguh", "satu batang"]'::jsonb, 0, '山本 dibaca やまもと, artinya "nama Yamamoto".', 'makna sekanji', 'belum', 1379),
('K5-1380', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
山本', '["ゆまもと", "やむもと", "ゆむもと", "やまもと"]'::jsonb, 3, '山本 artinya "nama Yamamoto", dibaca やまもと.', 'vowel / vowel+vowel', 'belum', 1380),
('K5-1381', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
日本語（にほんご）', '["bahasa Mandarin", "bahasa hormat", "bahasa Jepang", "bahasa Inggris"]'::jsonb, 2, '日本語 dibaca にほんご, artinya "bahasa Jepang".', 'makna sekanji', 'belum', 1381),
('K5-1382', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日本語', '["にぽんご", "にほんご", "なぽんご", "なほんご"]'::jsonb, 1, '日本語 artinya "bahasa Jepang", dibaca にほんご.', 'vowel / daku / vowel+daku', 'belum', 1382),
('K5-1383', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
英語（えいご）', '["bahasa", "bahasa Jepang", "bahasa hormat", "bahasa Inggris"]'::jsonb, 3, '英語 dibaca えいご, artinya "bahasa Inggris".', 'makna sekanji', 'belum', 1383),
('K5-1384', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
英語', '["えいご", "おご", "おいご", "えご"]'::jsonb, 0, '英語 artinya "bahasa Inggris", dibaca えいご.', 'vowel / chouon- / vowel+chouon-', 'belum', 1384),
('K5-1385', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
単語（たんご）', '["bercerita", "bahasa", "kosakata", "bahasa hormat"]'::jsonb, 2, '単語 dibaca たんご, artinya "kosakata".', 'makna sekanji', 'belum', 1385),
('K5-1386', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
単語', '["たんこ", "たんご", "だんご", "だんこ"]'::jsonb, 1, '単語 artinya "kosakata", dibaca たんご.', 'daku / daku+daku', 'belum', 1386),
('K5-1387', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
語る（かたる）', '["ilmu bahasa", "bahasa", "bahasa Inggris", "bercerita"]'::jsonb, 3, '語る dibaca かたる, artinya "bercerita".', 'makna sekanji', 'belum', 1387),
('K5-1388', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
語る', '["かたる", "がたる", "かだる", "がだる"]'::jsonb, 0, '語る artinya "bercerita", dibaca かたる.', 'daku / daku+daku', 'belum', 1388),
('K5-1389', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
言語（げんご）', '["bahasa Inggris", "bahasa", "bahasa hormat", "ilmu bahasa"]'::jsonb, 1, '言語 dibaca げんご, artinya "bahasa".', 'makna sekanji', 'belum', 1389),
('K5-1390', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
言語', '["げんご", "けんこ", "けんご", "げんこ"]'::jsonb, 0, '言語 artinya "bahasa", dibaca げんご.', 'daku / daku+daku', 'belum', 1390),
('K5-1391', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
物語（ものがたり）', '["bahasa Inggris", "bahasa hormat", "kosakata", "cerita"]'::jsonb, 3, '物語 dibaca ものがたり, artinya "cerita".', 'makna sekanji', 'belum', 1391),
('K5-1392', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
物語', '["ものうがたり", "もうのうがたり", "ものがたり", "もうのがたり"]'::jsonb, 2, '物語 artinya "cerita", dibaca ものがたり.', 'chouon+ / chouon++chouon+', 'belum', 1392),
('K5-1393', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
敬語（けいご）', '["bahasa Mandarin", "bahasa Inggris", "bahasa", "bahasa hormat"]'::jsonb, 3, '敬語 dibaca けいご, artinya "bahasa hormat".', 'makna sekanji', 'belum', 1393),
('K5-1394', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
敬語', '["けいご", "げいご", "けご", "げご"]'::jsonb, 0, '敬語 artinya "bahasa hormat", dibaca けいご.', 'daku / chouon- / daku+chouon-', 'belum', 1394),
('K5-1395', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
中国語（ちゅうごくご）', '["bahasa Inggris", "bahasa Jepang", "bahasa Mandarin", "bahasa"]'::jsonb, 2, '中国語 dibaca ちゅうごくご, artinya "bahasa Mandarin".', 'makna sekanji', 'belum', 1395),
('K5-1396', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中国語', '["ちゆごくご", "ちゅうごくご", "ちゆうごくご", "ちゅごくご"]'::jsonb, 1, '中国語 artinya "bahasa Mandarin", dibaca ちゅうごくご.', 'youon / chouon- / youon+chouon-', 'belum', 1396),
('K5-1397', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
語学（ごがく）', '["ilmu bahasa", "bahasa hormat", "bahasa Inggris", "bahasa"]'::jsonb, 0, '語学 dibaca ごがく, artinya "ilmu bahasa".', 'makna sekanji', 'belum', 1397),
('K5-1398', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
語学', '["ごかく", "こかく", "こがく", "ごがく"]'::jsonb, 3, '語学 artinya "ilmu bahasa", dibaca ごがく.', 'daku / daku+daku', 'belum', 1398),
('K5-1399', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
用語（ようご）', '["bercerita", "istilah", "bahasa Inggris", "kosakata"]'::jsonb, 1, '用語 dibaca ようご, artinya "istilah".', 'makna sekanji', 'belum', 1399),
('K5-1400', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
用語', '["よご", "やうご", "ようご", "やご"]'::jsonb, 2, '用語 artinya "istilah", dibaca ようご.', 'vowel / chouon- / vowel+chouon-', 'belum', 1400)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-1401', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文（ぶん）', '["kalimat", "kabar burung", "buku", "huruf"]'::jsonb, 0, '文 dibaca ぶん, artinya "kalimat".', 'makna se-ranah', 'belum', 1401),
('K5-1402', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文', '["ぶうん", "びん", "ふん", "ぶん"]'::jsonb, 3, '文 artinya "kalimat", dibaca ぶん.', 'daku / chouon+ / vowel', 'belum', 1402),
('K5-1403', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文字（もじ）', '["huruf tebal", "karangan", "huruf tulisan", "tulisan"]'::jsonb, 2, '文字 dibaca もじ, artinya "huruf tulisan".', 'makna sekanji', 'belum', 1403),
('K5-1404', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文字', '["もうし", "もじ", "もうじ", "もし"]'::jsonb, 1, '文字 artinya "huruf tulisan", dibaca もじ.', 'chouon+ / daku / chouon++daku', 'belum', 1404),
('K5-1405', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文化（ぶんか）', '["makalah", "keluhan", "budaya", "tulisan"]'::jsonb, 2, '文化 dibaca ぶんか, artinya "budaya".', 'makna sekanji', 'belum', 1405),
('K5-1406', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文化', '["ぶんか", "ふんか", "ぶんが", "ぶんっか"]'::jsonb, 0, '文化 artinya "budaya", dibaca ぶんか.', 'daku / sokuon+', 'belum', 1406),
('K5-1407', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
作文（さくぶん）', '["huruf tulisan", "karangan", "tulisan", "makalah"]'::jsonb, 1, '作文 dibaca さくぶん, artinya "karangan".', 'makna sekanji', 'belum', 1407),
('K5-1408', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
作文', '["さぐぶん", "ざぐぶん", "ざくぶん", "さくぶん"]'::jsonb, 3, '作文 artinya "karangan", dibaca さくぶん.', 'daku / daku+daku', 'belum', 1408),
('K5-1409', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文法（ぶんぽう）', '["keluhan", "tata bahasa", "kata / bahasa", "tulisan"]'::jsonb, 1, '文法 dibaca ぶんぽう, artinya "tata bahasa".', 'makna sekanji', 'belum', 1409),
('K5-1410', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文法', '["ぶんほう", "ふんほう", "ふんぽう", "ぶんぽう"]'::jsonb, 3, '文法 artinya "tata bahasa", dibaca ぶんぽう.', 'daku / daku+daku', 'belum', 1410),
('K5-1411', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文章（ぶんしょう）', '["tata bahasa", "karangan", "tulisan", "huruf tulisan"]'::jsonb, 2, '文章 dibaca ぶんしょう, artinya "tulisan".', 'makna sekanji', 'belum', 1411),
('K5-1412', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文章', '["ぶんしょう", "ふんじょう", "ぶんじょう", "ふんしょう"]'::jsonb, 0, '文章 artinya "tulisan", dibaca ぶんしょう.', 'daku / daku+daku', 'belum', 1412),
('K5-1413', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
論文（ろんぶん）', '["makalah", "karangan", "budaya", "huruf tulisan"]'::jsonb, 0, '論文 dibaca ろんぶん, artinya "makalah".', 'makna sekanji', 'belum', 1413),
('K5-1414', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
論文', '["ろうんぶん", "ろうんふん", "ろんぶん", "ろんふん"]'::jsonb, 2, '論文 artinya "makalah", dibaca ろんぶん.', 'chouon+ / daku / chouon++daku', 'belum', 1414),
('K5-1415', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
注文（ちゅうもん）', '["huruf tulisan", "pesanan", "makalah", "budaya"]'::jsonb, 1, '注文 dibaca ちゅうもん, artinya "pesanan".', 'makna sekanji', 'belum', 1415),
('K5-1416', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
注文', '["ちゅもん", "ちゆうもん", "ちゆもん", "ちゅうもん"]'::jsonb, 3, '注文 artinya "pesanan", dibaca ちゅうもん.', 'youon / chouon- / youon+chouon-', 'belum', 1416),
('K5-1417', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文句（もんく）', '["pesanan", "karangan", "keluhan", "budaya"]'::jsonb, 2, '文句 dibaca もんく, artinya "keluhan".', 'makna sekanji', 'belum', 1417),
('K5-1418', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文句', '["もんく", "もうんぐ", "もんぐ", "もうんく"]'::jsonb, 0, '文句 artinya "keluhan", dibaca もんく.', 'chouon+ / daku / chouon++daku', 'belum', 1418),
('K5-1419', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
文房具（ぶんぼうぐ）', '["pesanan", "alat tulis", "tulisan", "makalah"]'::jsonb, 1, '文房具 dibaca ぶんぼうぐ, artinya "alat tulis".', 'makna sekanji', 'belum', 1419),
('K5-1420', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
文房具', '["ぶんぽうぐ", "ぶんぼぐ", "ぶんぽぐ", "ぶんぼうぐ"]'::jsonb, 3, '文房具 artinya "alat tulis", dibaca ぶんぼうぐ.', 'daku / chouon- / daku+chouon-', 'belum', 1420),
('K5-1421', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
字（じ）', '["buku", "cara bicara", "huruf", "kalimat"]'::jsonb, 2, '字 dibaca じ, artinya "huruf".', 'makna se-ranah', 'belum', 1421),
('K5-1422', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
字', '["し", "ぜ", "ざ", "じ"]'::jsonb, 3, '字 artinya "huruf", dibaca じ.', 'daku / vowel', 'belum', 1422),
('K5-1423', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
漢字（かんじ）', '["angka", "kanji", "huruf cetak", "latihan menulis"]'::jsonb, 1, '漢字 dibaca かんじ, artinya "kanji".', 'makna sekanji', 'belum', 1423),
('K5-1424', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
漢字', '["かんじ", "がんじ", "かんし", "がんし"]'::jsonb, 0, '漢字 artinya "kanji", dibaca かんじ.', 'daku / daku+daku', 'belum', 1424),
('K5-1425', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
数字（すうじ）', '["defisit", "huruf tebal", "surplus", "angka"]'::jsonb, 3, '数字 dibaca すうじ, artinya "angka".', 'makna sekanji', 'belum', 1425),
('K5-1426', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
数字', '["すうじ", "すじ", "ずじ", "ずうじ"]'::jsonb, 0, '数字 artinya "angka", dibaca すうじ.', 'daku / chouon- / daku+chouon-', 'belum', 1426),
('K5-1427', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
字幕（じまく）', '["angka", "kanji", "subtitle", "surplus"]'::jsonb, 2, '字幕 dibaca じまく, artinya "subtitle".', 'makna sekanji', 'belum', 1427),
('K5-1428', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
字幕', '["しめく", "じまく", "じめく", "しまく"]'::jsonb, 1, '字幕 artinya "subtitle", dibaca じまく.', 'daku / vowel / daku+vowel', 'belum', 1428),
('K5-1429', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
習字（しゅうじ）', '["kanji", "angka", "latihan menulis", "defisit"]'::jsonb, 2, '習字 dibaca しゅうじ, artinya "latihan menulis".', 'makna sekanji', 'belum', 1429),
('K5-1430', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
習字', '["しゅうじ", "じゅうじ", "しゆうじ", "じゆうじ"]'::jsonb, 0, '習字 artinya "latihan menulis", dibaca しゅうじ.', 'daku / youon / daku+youon', 'belum', 1430),
('K5-1431', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
赤字（あかじ）', '["angka", "defisit", "kanji", "huruf tebal"]'::jsonb, 1, '赤字 dibaca あかじ, artinya "defisit".', 'makna sekanji', 'belum', 1431),
('K5-1432', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
赤字', '["えがじ", "えかじ", "あがじ", "あかじ"]'::jsonb, 3, '赤字 artinya "defisit", dibaca あかじ.', 'vowel / daku / vowel+daku', 'belum', 1432),
('K5-1433', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
黒字（くろじ）', '["defisit", "huruf cetak", "kanji", "surplus"]'::jsonb, 3, '黒字 dibaca くろじ, artinya "surplus".', 'makna sekanji', 'belum', 1433),
('K5-1434', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
黒字', '["くろうじ", "くろじ", "ぐろうじ", "ぐろじ"]'::jsonb, 1, '黒字 artinya "surplus", dibaca くろじ.', 'daku / chouon+ / daku+chouon+', 'belum', 1434),
('K5-1435', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
活字（かつじ）', '["huruf cetak", "huruf tebal", "surplus", "huruf tulisan"]'::jsonb, 0, '活字 dibaca かつじ, artinya "huruf cetak".', 'makna sekanji', 'belum', 1435),
('K5-1436', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
活字', '["かっつじ", "がつじ", "かつじ", "がっつじ"]'::jsonb, 2, '活字 artinya "huruf cetak", dibaca かつじ.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1436),
('K5-1437', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
太字（ふとじ）', '["angka", "huruf tebal", "huruf cetak", "huruf tulisan"]'::jsonb, 1, '太字 dibaca ふとじ, artinya "huruf tebal".', 'makna sekanji', 'belum', 1437),
('K5-1438', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
太字', '["ふとじ", "ふどじ", "ふどし", "ふとし"]'::jsonb, 0, '太字 artinya "huruf tebal", dibaca ふとじ.', 'daku / daku+daku', 'belum', 1438),
('K5-1439', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
話す（はなす）', '["telepon", "cerita rakyat", "berbicara", "percakapan"]'::jsonb, 2, '話す dibaca はなす, artinya "berbicara".', 'makna sekanji', 'belum', 1439),
('K5-1440', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
話す', '["はねす", "ばなす", "ばねす", "はなす"]'::jsonb, 3, '話す artinya "berbicara", dibaca はなす.', 'daku / vowel / daku+vowel', 'belum', 1440),
('K5-1441', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
話（はなし）', '["cerita", "buku", "huruf", "kalimat"]'::jsonb, 0, '話 dibaca はなし, artinya "cerita".', 'makna se-ranah', 'belum', 1441),
('K5-1442', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
話', '["はにし", "はなし", "ばにし", "ばなし"]'::jsonb, 1, '話 artinya "cerita", dibaca はなし.', 'daku / vowel / daku+vowel', 'belum', 1442),
('K5-1443', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
電話（でんわ）', '["cerita rakyat", "dongeng", "berbicara", "telepon"]'::jsonb, 3, '電話 dibaca でんわ, artinya "telepon".', 'makna sekanji', 'belum', 1443),
('K5-1444', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電話', '["てんわ", "どんわ", "でんわ", "だんわ"]'::jsonb, 2, '電話 artinya "telepon", dibaca でんわ.', 'daku / vowel', 'belum', 1444),
('K5-1445', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
会話（かいわ）', '["topik", "percakapan", "berbicara", "cerita rakyat"]'::jsonb, 1, '会話 dibaca かいわ, artinya "percakapan".', 'makna sekanji', 'belum', 1445),
('K5-1446', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会話', '["があわ", "がいわ", "かあわ", "かいわ"]'::jsonb, 3, '会話 artinya "percakapan", dibaca かいわ.', 'daku / vowel / daku+vowel', 'belum', 1446),
('K5-1447', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
世話（せわ）', '["perawatan", "berbicara", "topik", "percakapan"]'::jsonb, 0, '世話 dibaca せわ, artinya "perawatan".', 'makna sekanji', 'belum', 1447),
('K5-1448', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
世話', '["ぜわ", "そわ", "せわ", "さわ"]'::jsonb, 2, '世話 artinya "perawatan", dibaca せわ.', 'daku / vowel', 'belum', 1448),
('K5-1449', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
童話（どうわ）', '["topik", "telepon", "dongeng", "percakapan"]'::jsonb, 2, '童話 dibaca どうわ, artinya "dongeng".', 'makna sekanji', 'belum', 1449),
('K5-1450', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
童話', '["どわ", "とわ", "とうわ", "どうわ"]'::jsonb, 3, '童話 artinya "dongeng", dibaca どうわ.', 'daku / chouon- / daku+chouon-', 'belum', 1450),
('K5-1451', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
話題（わだい）', '["topik", "perawatan", "dongeng", "telepon"]'::jsonb, 0, '話題 dibaca わだい, artinya "topik".', 'makna sekanji', 'belum', 1451),
('K5-1452', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
話題', '["わたお", "わだい", "わだお", "わたい"]'::jsonb, 1, '話題 artinya "topik", dibaca わだい.', 'daku / vowel / daku+vowel', 'belum', 1452),
('K5-1453', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
通話（つうわ）', '["topik", "dongeng", "berbicara", "panggilan"]'::jsonb, 3, '通話 dibaca つうわ, artinya "panggilan".', 'makna sekanji', 'belum', 1453),
('K5-1454', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
通話', '["つうわ", "とうわ", "とわ", "つわ"]'::jsonb, 0, '通話 artinya "panggilan", dibaca つうわ.', 'vowel / chouon- / vowel+chouon-', 'belum', 1454),
('K5-1455', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
立ち話（たちばなし）', '["topik", "ngobrol berdiri", "percakapan", "telepon"]'::jsonb, 1, '立ち話 dibaca たちばなし, artinya "ngobrol berdiri".', 'makna sekanji', 'belum', 1455),
('K5-1456', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立ち話', '["だっちばなし", "たっちばなし", "たちばなし", "だちばなし"]'::jsonb, 2, '立ち話 artinya "ngobrol berdiri", dibaca たちばなし.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1456),
('K5-1457', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
昔話（むかしばなし）', '["cerita rakyat", "panggilan", "berbicara", "cerita"]'::jsonb, 0, '昔話 dibaca むかしばなし, artinya "cerita rakyat".', 'makna sekanji', 'belum', 1457),
('K5-1458', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昔話', '["むうがしばなし", "むうかしばなし", "むかしばなし", "むがしばなし"]'::jsonb, 2, '昔話 artinya "cerita rakyat", dibaca むかしばなし.', 'chouon+ / daku / chouon++daku', 'belum', 1458),
('K5-1459', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
読む（よむ）', '["membaca buku", "membaca", "gemar membaca", "koma"]'::jsonb, 1, '読む dibaca よむ, artinya "membaca".', 'makna sekanji', 'belum', 1459),
('K5-1460', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
読む', '["よむう", "ようむ", "ようむう", "よむ"]'::jsonb, 3, '読む artinya "membaca", dibaca よむ.', 'chouon+ / chouon++chouon+', 'belum', 1460),
('K5-1461', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
読書（どくしょ）', '["gemar membaca", "membaca", "toko buku", "membaca buku"]'::jsonb, 3, '読書 dibaca どくしょ, artinya "membaca buku".', 'makna sekanji', 'belum', 1461),
('K5-1462', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
読書', '["とくしょ", "どぐしょ", "どくしょ", "とぐしょ"]'::jsonb, 2, '読書 artinya "membaca buku", dibaca どくしょ.', 'daku / daku+daku', 'belum', 1462),
('K5-1463', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
音読み（おんよみ）', '["bacaan on", "pembacaan", "bacaan kun", "cara baca"]'::jsonb, 0, '音読み dibaca おんよみ, artinya "bacaan on".', 'makna sekanji', 'belum', 1463),
('K5-1464', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
音読み', '["おうんよみ", "おんよみ", "おうんようみ", "おんようみ"]'::jsonb, 1, '音読み artinya "bacaan on", dibaca おんよみ.', 'chouon+ / chouon++chouon+', 'belum', 1464),
('K5-1465', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
訓読み（くんよみ）', '["cara baca", "bacaan on", "bacaan kun", "baca cepat"]'::jsonb, 2, '訓読み dibaca くんよみ, artinya "bacaan kun".', 'makna sekanji', 'belum', 1465),
('K5-1466', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
訓読み', '["くんようみ", "くんよみ", "ぐんようみ", "ぐんよみ"]'::jsonb, 1, '訓読み artinya "bacaan kun", dibaca くんよみ.', 'daku / chouon+ / daku+chouon+', 'belum', 1466),
('K5-1467', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
読者（どくしゃ）', '["baca cepat", "koma", "membaca buku", "pembaca"]'::jsonb, 3, '読者 dibaca どくしゃ, artinya "pembaca".', 'makna sekanji', 'belum', 1467),
('K5-1468', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
読者', '["どくしゃ", "とぐしゃ", "とくしゃ", "どぐしゃ"]'::jsonb, 0, '読者 artinya "pembaca", dibaca どくしゃ.', 'daku / daku+daku', 'belum', 1468),
('K5-1469', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
朗読（ろうどく）', '["membaca", "baca cepat", "koma", "pembacaan"]'::jsonb, 3, '朗読 dibaca ろうどく, artinya "pembacaan".', 'makna sekanji', 'belum', 1469),
('K5-1470', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
朗読', '["ろどく", "ろうどく", "るどく", "るうどく"]'::jsonb, 1, '朗読 artinya "pembacaan", dibaca ろうどく.', 'vowel / chouon- / vowel+chouon-', 'belum', 1470),
('K5-1471', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
読み方（よみかた）', '["cara baca", "bacaan on", "bacaan kun", "cara menulis"]'::jsonb, 0, '読み方 dibaca よみかた, artinya "cara baca".', 'makna sekanji', 'belum', 1471),
('K5-1472', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
読み方', '["ようめかた", "よめかた", "よみかた", "ようみかた"]'::jsonb, 2, '読み方 artinya "cara baca", dibaca よみかた.', 'chouon+ / vowel / chouon++vowel', 'belum', 1472),
('K5-1473', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
愛読（あいどく）', '["pembaca", "membaca buku", "membaca", "gemar membaca"]'::jsonb, 3, '愛読 dibaca あいどく, artinya "gemar membaca".', 'makna sekanji', 'belum', 1473),
('K5-1474', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
愛読', '["おうどく", "あうどく", "あいどく", "おいどく"]'::jsonb, 2, '愛読 artinya "gemar membaca", dibaca あいどく.', 'vowel / vowel+vowel', 'belum', 1474),
('K5-1475', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
速読（そくどく）', '["koma", "baca cepat", "membaca", "pembacaan"]'::jsonb, 1, '速読 dibaca そくどく, artinya "baca cepat".', 'makna sekanji', 'belum', 1475),
('K5-1476', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
速読', '["そくどく", "ぞくどく", "ぞぐどく", "そぐどく"]'::jsonb, 0, '速読 artinya "baca cepat", dibaca そくどく.', 'daku / daku+daku', 'belum', 1476),
('K5-1477', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
読点（とうてん）', '["baca cepat", "pembaca", "koma", "gemar membaca"]'::jsonb, 2, '読点 dibaca とうてん, artinya "koma".', 'makna sekanji', 'belum', 1477),
('K5-1478', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
読点', '["とうてん", "どうてん", "とてん", "どてん"]'::jsonb, 0, '読点 artinya "koma", dibaca とうてん.', 'daku / chouon- / daku+chouon-', 'belum', 1478),
('K5-1479', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
書く（かく）', '["membaca buku", "cara menulis", "kartu pos", "menulis"]'::jsonb, 3, '書く dibaca かく, artinya "menulis".', 'makna sekanji', 'belum', 1479),
('K5-1480', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
書く', '["がく", "かく", "かぐ", "しょく"]'::jsonb, 1, '書く artinya "menulis", dibaca かく. Membacanya しょく adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1480),
('K5-1481', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
辞書（じしょ）', '["kartu pos", "kamus", "dokumen", "seni kaligrafi"]'::jsonb, 1, '辞書 dibaca じしょ, artinya "kamus".', 'makna sekanji', 'belum', 1481),
('K5-1482', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
辞書', '["しじょ", "じじょ", "じしょ", "ししょ"]'::jsonb, 2, '辞書 artinya "kamus", dibaca じしょ.', 'daku / daku+daku', 'belum', 1482),
('K5-1483', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
教科書（きょうかしょ）', '["membaca buku", "cara menulis", "perpustakaan", "buku pelajaran"]'::jsonb, 3, '教科書 dibaca きょうかしょ, artinya "buku pelajaran".', 'makna sekanji', 'belum', 1483),
('K5-1484', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
教科書', '["きょうかしょ", "きようかしょ", "ぎょうかしょ", "ぎようかしょ"]'::jsonb, 0, '教科書 artinya "buku pelajaran", dibaca きょうかしょ.', 'daku / youon / daku+youon', 'belum', 1484),
('K5-1485', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
書類（しょるい）', '["kamus", "seni kaligrafi", "membaca buku", "dokumen"]'::jsonb, 3, '書類 dibaca しょるい, artinya "dokumen".', 'makna sekanji', 'belum', 1485),
('K5-1486', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
書類', '["しょるい", "じょるい", "しょうるい", "かるい"]'::jsonb, 0, '書類 artinya "dokumen", dibaca しょるい. Membacanya かるい adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1486),
('K5-1487', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
図書館（としょかん）', '["kartu pos", "perpustakaan", "cara menulis", "buku pelajaran"]'::jsonb, 1, '図書館 dibaca としょかん, artinya "perpustakaan".', 'makna sekanji', 'belum', 1487),
('K5-1488', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
図書館', '["とじょかん", "どじょかん", "としょかん", "どしょかん"]'::jsonb, 2, '図書館 artinya "perpustakaan", dibaca としょかん.', 'daku / daku+daku', 'belum', 1488),
('K5-1489', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
書道（しょどう）', '["seni kaligrafi", "kamus", "dokumen", "membaca buku"]'::jsonb, 0, '書道 dibaca しょどう, artinya "seni kaligrafi".', 'makna sekanji', 'belum', 1489),
('K5-1490', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
書道', '["かどう", "じょどう", "しょうどう", "しょどう"]'::jsonb, 3, '書道 artinya "seni kaligrafi", dibaca しょどう. Membacanya かどう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1490),
('K5-1491', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
葉書（はがき）', '["sekretaris", "kartu pos", "seni kaligrafi", "menulis"]'::jsonb, 1, '葉書 dibaca はがき, artinya "kartu pos".', 'makna sekanji', 'belum', 1491),
('K5-1492', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
葉書', '["ばがき", "ばかき", "はがき", "はかき"]'::jsonb, 2, '葉書 artinya "kartu pos", dibaca はがき.', 'daku / daku+daku', 'belum', 1492),
('K5-1493', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
書き方（かきかた）', '["menulis", "cara bicara", "cara baca", "cara menulis"]'::jsonb, 3, '書き方 dibaca かきかた, artinya "cara menulis".', 'makna sekanji', 'belum', 1493),
('K5-1494', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
書き方', '["かきかた", "しょきかた", "がきかた", "かぎかた"]'::jsonb, 0, '書き方 artinya "cara menulis", dibaca かきかた. Membacanya しょきかた adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1494),
('K5-1495', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
秘書（ひしょ）', '["kartu pos", "sekretaris", "kamus", "seni kaligrafi"]'::jsonb, 1, '秘書 dibaca ひしょ, artinya "sekretaris".', 'makna sekanji', 'belum', 1495),
('K5-1496', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
秘書', '["ひじょ", "ひじょう", "ひしょ", "ひしょう"]'::jsonb, 2, '秘書 artinya "sekretaris", dibaca ひしょ.', 'daku / chouon+ / daku+chouon+', 'belum', 1496),
('K5-1497', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
聞く（きく）', '["kabar burung", "pengalaman", "desas-desus", "mendengar"]'::jsonb, 3, '聞く dibaca きく, artinya "mendengar".', 'makna sekanji', 'belum', 1497),
('K5-1498', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
聞く', '["ぎぐ", "きく", "ぎく", "きぐ"]'::jsonb, 1, '聞く artinya "mendengar", dibaca きく.', 'daku / daku+daku', 'belum', 1498),
('K5-1499', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
聞こえる（きこえる）', '["menguping", "kabar burung", "terdengar", "menyimak"]'::jsonb, 2, '聞こえる dibaca きこえる, artinya "terdengar".', 'makna sekanji', 'belum', 1499),
('K5-1500', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
聞こえる', '["きこえる", "きごえる", "ぎこえる", "ぎごえる"]'::jsonb, 0, '聞こえる artinya "terdengar", dibaca きこえる.', 'daku / daku+daku', 'belum', 1500),
('K5-1501', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
新聞紙（しんぶんし）', '["pengalaman", "kertas koran", "dengar dari orang", "pendengar"]'::jsonb, 1, '新聞紙 dibaca しんぶんし, artinya "kertas koran".', 'makna sekanji', 'belum', 1501),
('K5-1502', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
新聞紙', '["しんぷんし", "じんぷんし", "じんぶんし", "しんぶんし"]'::jsonb, 3, '新聞紙 artinya "kertas koran", dibaca しんぶんし.', 'daku / daku+daku', 'belum', 1502),
('K5-1503', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見聞（けんぶん）', '["pengalaman", "mendengar", "kabar burung", "desas-desus"]'::jsonb, 0, '見聞 dibaca けんぶん, artinya "pengalaman".', 'makna sekanji', 'belum', 1503),
('K5-1504', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見聞', '["げんぶん", "けんふん", "けんぶん", "げんふん"]'::jsonb, 2, '見聞 artinya "pengalaman", dibaca けんぶん.', 'daku / daku+daku', 'belum', 1504),
('K5-1505', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
聞き手（ききて）', '["dengar dari orang", "pendengar", "menguping", "kertas koran"]'::jsonb, 1, '聞き手 dibaca ききて, artinya "pendengar".', 'makna sekanji', 'belum', 1505),
('K5-1506', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
聞き手', '["きぎて", "ぎきて", "ぎぎて", "ききて"]'::jsonb, 3, '聞き手 artinya "pendengar", dibaca ききて.', 'daku / daku+daku', 'belum', 1506),
('K5-1507', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
聞き取り（ききとり）', '["pendengar", "menguping", "menyimak", "terdengar"]'::jsonb, 2, '聞き取り dibaca ききとり, artinya "menyimak".', 'makna sekanji', 'belum', 1507),
('K5-1508', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
聞き取り', '["ききとり", "ぎきとり", "ぎぎとり", "きぎとり"]'::jsonb, 0, '聞き取り artinya "menyimak", dibaca ききとり.', 'daku / daku+daku', 'belum', 1508),
('K5-1509', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
立ち聞き（たちぎき）', '["pendengar", "menyimak", "menguping", "terdengar"]'::jsonb, 2, '立ち聞き dibaca たちぎき, artinya "menguping".', 'makna sekanji', 'belum', 1509),
('K5-1510', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立ち聞き', '["だちぎき", "たちぎき", "だっちぎき", "たっちぎき"]'::jsonb, 1, '立ち聞き artinya "menguping", dibaca たちぎき.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1510),
('K5-1511', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
伝聞（でんぶん）', '["pengalaman", "desas-desus", "mendengar", "kabar burung"]'::jsonb, 3, '伝聞 dibaca でんぶん, artinya "kabar burung".', 'makna sekanji', 'belum', 1511),
('K5-1512', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
伝聞', '["でんぶん", "てんぶん", "てんふん", "でんふん"]'::jsonb, 0, '伝聞 artinya "kabar burung", dibaca でんぶん.', 'daku / daku+daku', 'belum', 1512),
('K5-1513', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
風聞（ふうぶん）', '["mendengar", "kabar burung", "desas-desus", "pengalaman"]'::jsonb, 2, '風聞 dibaca ふうぶん, artinya "desas-desus".', 'makna sekanji', 'belum', 1513),
('K5-1514', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
風聞', '["ふうぷん", "ふぷん", "ふぶん", "ふうぶん"]'::jsonb, 3, '風聞 artinya "desas-desus", dibaca ふうぶん.', 'chouon- / daku / chouon-+daku', 'belum', 1514),
('K5-1515', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
又聞き（またぎき）', '["dengar dari orang", "kertas koran", "pendengar", "menyimak"]'::jsonb, 0, '又聞き dibaca またぎき, artinya "dengar dari orang".', 'makna sekanji', 'belum', 1515),
('K5-1516', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
又聞き', '["もたぎき", "またぎき", "まだぎき", "もだぎき"]'::jsonb, 1, '又聞き artinya "dengar dari orang", dibaca またぎき.', 'vowel / daku / vowel+daku', 'belum', 1516),
('K5-1517', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見る（みる）', '["penemuan", "tamasya", "melihat (hormat)", "melihat"]'::jsonb, 3, '見る dibaca みる, artinya "melihat".', 'makna sekanji', 'belum', 1517),
('K5-1518', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見る', '["みる", "まる", "まるう", "みるう"]'::jsonb, 0, '見る artinya "melihat", dibaca みる.', 'vowel / chouon+ / vowel+chouon+', 'belum', 1518),
('K5-1519', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見せる（みせる）', '["terlihat", "mengantar pergi", "memperlihatkan", "melihat"]'::jsonb, 2, '見せる dibaca みせる, artinya "memperlihatkan".', 'makna sekanji', 'belum', 1519),
('K5-1520', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見せる', '["みぜる", "みせる", "むせる", "むぜる"]'::jsonb, 1, '見せる artinya "memperlihatkan", dibaca みせる.', 'vowel / daku / vowel+daku', 'belum', 1520),
('K5-1521', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
意見（いけん）', '["pendapat", "melihat (hormat)", "contoh barang", "melihat"]'::jsonb, 0, '意見 dibaca いけん, artinya "pendapat".', 'makna sekanji', 'belum', 1521),
('K5-1522', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
意見', '["いげん", "おけん", "いけん", "おげん"]'::jsonb, 2, '意見 artinya "pendapat", dibaca いけん.', 'vowel / daku / vowel+daku', 'belum', 1522),
('K5-1523', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見物（けんぶつ）', '["melihat (hormat)", "tamasya", "penemuan", "contoh barang"]'::jsonb, 1, '見物 dibaca けんぶつ, artinya "tamasya".', 'makna sekanji', 'belum', 1523),
('K5-1524', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見物', '["けんふつ", "げんふつ", "げんぶつ", "けんぶつ"]'::jsonb, 3, '見物 artinya "tamasya", dibaca けんぶつ.', 'daku / daku+daku', 'belum', 1524),
('K5-1525', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
発見（はっけん）', '["melihat (hormat)", "penemuan", "cara pandang", "pendapat"]'::jsonb, 1, '発見 dibaca はっけん, artinya "penemuan".', 'makna sekanji', 'belum', 1525),
('K5-1526', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
発見', '["はけん", "ばけん", "ばっけん", "はっけん"]'::jsonb, 3, '発見 artinya "penemuan", dibaca はっけん.', 'daku / sokuon- / daku+sokuon-', 'belum', 1526),
('K5-1527', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見える（みえる）', '["terlihat", "penemuan", "memperlihatkan", "mengantar pergi"]'::jsonb, 0, '見える dibaca みえる, artinya "terlihat".', 'makna sekanji', 'belum', 1527),
('K5-1528', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見える', '["むえる", "むうる", "みえる", "みうる"]'::jsonb, 2, '見える artinya "terlihat", dibaca みえる.', 'vowel / vowel+vowel', 'belum', 1528),
('K5-1529', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見本（みほん）', '["penemuan", "cara pandang", "melihat", "contoh barang"]'::jsonb, 3, '見本 dibaca みほん, artinya "contoh barang".', 'makna sekanji', 'belum', 1529),
('K5-1530', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見本', '["みぽん", "みほん", "むほん", "むぽん"]'::jsonb, 1, '見本 artinya "contoh barang", dibaca みほん.', 'vowel / daku / vowel+daku', 'belum', 1530),
('K5-1531', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見方（みかた）', '["penemuan", "contoh barang", "cara pandang", "pendapat"]'::jsonb, 2, '見方 dibaca みかた, artinya "cara pandang".', 'makna sekanji', 'belum', 1531),
('K5-1532', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見方', '["みかた", "もかた", "もがた", "みがた"]'::jsonb, 0, '見方 artinya "cara pandang", dibaca みかた.', 'vowel / daku / vowel+daku', 'belum', 1532),
('K5-1533', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
拝見（はいけん）', '["melihat", "melihat (hormat)", "contoh barang", "cara pandang"]'::jsonb, 1, '拝見 dibaca はいけん, artinya "melihat (hormat)".', 'makna sekanji', 'belum', 1533),
('K5-1534', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
拝見', '["はえげん", "はえけん", "はいけん", "はいげん"]'::jsonb, 2, '拝見 artinya "melihat (hormat)", dibaca はいけん.', 'vowel / daku / vowel+daku', 'belum', 1534),
('K5-1535', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
見送り（みおくり）', '["memperlihatkan", "pendapat", "terlihat", "mengantar pergi"]'::jsonb, 3, '見送り dibaca みおくり, artinya "mengantar pergi".', 'makna sekanji', 'belum', 1535),
('K5-1536', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
見送り', '["みおくり", "もおうくり", "みおうくり", "もおくり"]'::jsonb, 0, '見送り artinya "mengantar pergi", dibaca みおくり.', 'vowel / chouon+ / vowel+chouon+', 'belum', 1536),
('K5-1537', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
言う（いう）', '["dialek", "nasihat", "pernyataan", "berkata"]'::jsonb, 3, '言う dibaca いう, artinya "berkata".', 'makna sekanji', 'belum', 1537),
('K5-1538', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
言う', '["いい", "いう", "おい", "おう"]'::jsonb, 1, '言う artinya "berkata", dibaca いう.', 'vowel / vowel+vowel', 'belum', 1538),
('K5-1539', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
言葉（ことば）', '["pesan", "ilmu bahasa", "kata / bahasa", "sepatah kata"]'::jsonb, 2, '言葉 dibaca ことば, artinya "kata / bahasa".', 'makna sekanji', 'belum', 1539),
('K5-1540', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
言葉', '["ことば", "こどば", "ごとば", "ごどば"]'::jsonb, 0, '言葉 artinya "kata / bahasa", dibaca ことば.', 'daku / daku+daku', 'belum', 1540),
('K5-1541', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
方言（ほうげん）', '["dialek", "berkata", "nasihat", "pesan"]'::jsonb, 0, '方言 dibaca ほうげん, artinya "dialek".', 'makna sekanji', 'belum', 1541),
('K5-1542', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
方言', '["ぼげん", "ほげん", "ぼうげん", "ほうげん"]'::jsonb, 3, '方言 artinya "dialek", dibaca ほうげん.', 'daku / chouon- / daku+chouon-', 'belum', 1542),
('K5-1543', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
伝言（でんごん）', '["dialek", "pesan", "sepatah kata", "kata / bahasa"]'::jsonb, 1, '伝言 dibaca でんごん, artinya "pesan".', 'makna sekanji', 'belum', 1543),
('K5-1544', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
伝言', '["てんこん", "てんごん", "でんごん", "でんこん"]'::jsonb, 2, '伝言 artinya "pesan", dibaca でんごん.', 'daku / daku+daku', 'belum', 1544),
('K5-1545', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
発言（はつげん）', '["nasihat", "deklarasi", "pesan", "pernyataan"]'::jsonb, 3, '発言 dibaca はつげん, artinya "pernyataan".', 'makna sekanji', 'belum', 1545),
('K5-1546', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
発言', '["ばっつげん", "はつげん", "はっつげん", "ばつげん"]'::jsonb, 1, '発言 artinya "pernyataan", dibaca はつげん.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1546),
('K5-1547', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
言い方（いいかた）', '["bicara sendiri", "cara baca", "cara bicara", "cara menulis"]'::jsonb, 2, '言い方 dibaca いいかた, artinya "cara bicara".', 'makna sekanji', 'belum', 1547),
('K5-1548', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
言い方', '["いいかた", "うえかた", "いえかた", "ういかた"]'::jsonb, 0, '言い方 artinya "cara bicara", dibaca いいかた.', 'vowel / vowel+vowel', 'belum', 1548),
('K5-1549', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
一言（ひとこと）', '["kata / bahasa", "sepatah kata", "pesan", "pernyataan"]'::jsonb, 1, '一言 dibaca ひとこと, artinya "sepatah kata".', 'makna sekanji', 'belum', 1549),
('K5-1550', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一言', '["ひとこと", "ひとごと", "ひどこと", "ひどごと"]'::jsonb, 0, '一言 artinya "sepatah kata", dibaca ひとこと.', 'daku / daku+daku', 'belum', 1550),
('K5-1551', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
助言（じょげん）', '["deklarasi", "dialek", "kata / bahasa", "nasihat"]'::jsonb, 3, '助言 dibaca じょげん, artinya "nasihat".', 'makna sekanji', 'belum', 1551),
('K5-1552', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
助言', '["じょうげん", "しょげん", "じょげん", "しょうげん"]'::jsonb, 2, '助言 artinya "nasihat", dibaca じょげん.', 'daku / chouon+ / daku+chouon+', 'belum', 1552),
('K5-1553', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
宣言（せんげん）', '["dialek", "deklarasi", "pernyataan", "nasihat"]'::jsonb, 1, '宣言 dibaca せんげん, artinya "deklarasi".', 'makna sekanji', 'belum', 1553),
('K5-1554', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
宣言', '["ぜんげん", "せんけん", "せんげん", "ぜんけん"]'::jsonb, 2, '宣言 artinya "deklarasi", dibaca せんげん.', 'daku / daku+daku', 'belum', 1554),
('K5-1555', 'N5', 'kanji', 'Arti', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Apa arti kata berikut?
独り言（ひとりごと）', '["bicara sendiri", "cara bicara", "sepatah kata", "nasihat"]'::jsonb, 0, '独り言 dibaca ひとりごと, artinya "bicara sendiri".', 'makna sekanji', 'belum', 1555),
('K5-1556', 'N5', 'kanji', 'Bacaan', 7, 'T07', 'Belajar & Bahasa', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
独り言', '["びとりごと", "びどりごと", "ひどりごと", "ひとりごと"]'::jsonb, 3, '独り言 artinya "bicara sendiri", dibaca ひとりごと.', 'daku / daku+daku', 'belum', 1556),
('K5-1557', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
行く（いく）', '["pergi", "perjalanan", "cara pergi", "satu baris"]'::jsonb, 0, '行く dibaca いく, artinya "pergi".', 'makna sekanji', 'belum', 1557),
('K5-1558', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行く', '["うぐ", "いぐ", "うく", "いく"]'::jsonb, 3, '行く artinya "pergi", dibaca いく.', 'vowel / daku / vowel+daku', 'belum', 1558),
('K5-1559', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
旅行（りょこう）', '["antrean", "perjalanan", "perjalanan pulang", "pergi"]'::jsonb, 1, '旅行 dibaca りょこう, artinya "perjalanan".', 'makna sekanji', 'belum', 1559),
('K5-1560', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
旅行', '["りょごう", "りょうこう", "りょこう", "りょうごう"]'::jsonb, 2, '旅行 artinya "perjalanan", dibaca りょこう.', 'chouon+ / daku / chouon++daku', 'belum', 1560),
('K5-1561', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
銀行（ぎんこう）', '["satu baris", "perjalanan", "tren", "bank"]'::jsonb, 3, '銀行 dibaca ぎんこう, artinya "bank".', 'makna sekanji', 'belum', 1561),
('K5-1562', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
銀行', '["きんごう", "きんこう", "ぎんこう", "ぎんごう"]'::jsonb, 2, '銀行 artinya "bank", dibaca ぎんこう.', 'daku / daku+daku', 'belum', 1562),
('K5-1563', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
急行（きゅうこう）', '["melaksanakan", "kereta ekspres", "perjalanan", "tren"]'::jsonb, 1, '急行 dibaca きゅうこう, artinya "kereta ekspres".', 'makna sekanji', 'belum', 1563),
('K5-1564', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
急行', '["きゅうこう", "きゆうこう", "ぎゆうこう", "ぎゅうこう"]'::jsonb, 0, '急行 artinya "kereta ekspres", dibaca きゅうこう.', 'daku / youon / daku+youon', 'belum', 1564),
('K5-1565', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
行う（おこなう）', '["melaksanakan", "satu baris", "tren", "perjalanan"]'::jsonb, 0, '行う dibaca おこなう, artinya "melaksanakan".', 'makna sekanji', 'belum', 1565),
('K5-1566', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行う', '["おうごなう", "おこなう", "おごなう", "おうこなう"]'::jsonb, 1, '行う artinya "melaksanakan", dibaca おこなう.', 'chouon+ / daku / chouon++daku', 'belum', 1566),
('K5-1567', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
一行（いちぎょう）', '["tren", "melaksanakan", "antrean", "satu baris"]'::jsonb, 3, '一行 dibaca いちぎょう, artinya "satu baris".', 'makna sekanji', 'belum', 1567),
('K5-1568', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
一行', '["あっちぎょう", "あちぎょう", "いちぎょう", "いっちぎょう"]'::jsonb, 2, '一行 artinya "satu baris", dibaca いちぎょう.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 1568),
('K5-1569', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飛行機（ひこうき）', '["cara pergi", "satu baris", "antrean", "pesawat"]'::jsonb, 3, '飛行機 dibaca ひこうき, artinya "pesawat".', 'makna sekanji', 'belum', 1569),
('K5-1570', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飛行機', '["びこうき", "びごうき", "ひこうき", "ひごうき"]'::jsonb, 2, '飛行機 artinya "pesawat", dibaca ひこうき.', 'daku / daku+daku', 'belum', 1570),
('K5-1571', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
行列（ぎょうれつ）', '["tren", "antrean", "melaksanakan", "kereta ekspres"]'::jsonb, 1, '行列 dibaca ぎょうれつ, artinya "antrean".', 'makna sekanji', 'belum', 1571),
('K5-1572', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行列', '["ぎょうれつ", "きょうれつ", "ぎようれつ", "きようれつ"]'::jsonb, 0, '行列 artinya "antrean", dibaca ぎょうれつ.', 'daku / youon / daku+youon', 'belum', 1572),
('K5-1573', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
行き方（いきかた）', '["pergi", "cara beli", "pesawat", "cara pergi"]'::jsonb, 3, '行き方 dibaca いきかた, artinya "cara pergi".', 'makna sekanji', 'belum', 1573),
('K5-1574', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行き方', '["いきかた", "いぎかた", "うきかた", "うぎかた"]'::jsonb, 0, '行き方 artinya "cara pergi", dibaca いきかた.', 'vowel / daku / vowel+daku', 'belum', 1574),
('K5-1575', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
流行（りゅうこう）', '["pergi", "tren", "bank", "satu baris"]'::jsonb, 1, '流行 dibaca りゅうこう, artinya "tren".', 'makna sekanji', 'belum', 1575),
('K5-1576', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
流行', '["りゆこう", "りゅこう", "りゅうこう", "りゆうこう"]'::jsonb, 2, '流行 artinya "tren", dibaca りゅうこう.', 'youon / chouon- / youon+chouon-', 'belum', 1576),
('K5-1577', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
来る（くる）', '["kelak", "datang", "aslinya", "datang ke Jepang"]'::jsonb, 1, '来る dibaca くる, artinya "datang".', 'makna sekanji', 'belum', 1577),
('K5-1578', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来る', '["くるう", "らいる", "くる", "ぐる"]'::jsonb, 2, '来る artinya "datang", dibaca くる. Membacanya らいる adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1578),
('K5-1579', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
未来（みらい）', '["masa depan", "sejak", "pengikut", "tamu"]'::jsonb, 0, '未来 dibaca みらい, artinya "masa depan".', 'makna sekanji', 'belum', 1579),
('K5-1580', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
未来', '["みろい", "めらい", "めろい", "みらい"]'::jsonb, 3, '未来 artinya "masa depan", dibaca みらい.', 'vowel / vowel+vowel', 'belum', 1580),
('K5-1581', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
将来（しょうらい）', '["aslinya", "tamu", "masa depan", "kelak"]'::jsonb, 3, '将来 dibaca しょうらい, artinya "kelak".', 'makna sekanji', 'belum', 1581),
('K5-1582', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
将来', '["しょうらい", "しようらい", "じょうらい", "じようらい"]'::jsonb, 0, '将来 artinya "kelak", dibaca しょうらい.', 'daku / youon / daku+youon', 'belum', 1582),
('K5-1583', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
以来（いらい）', '["tamu", "sejak", "pengikut", "datang"]'::jsonb, 1, '以来 dibaca いらい, artinya "sejak".', 'makna sekanji', 'belum', 1583),
('K5-1584', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
以来', '["えれい", "えらい", "いらい", "いれい"]'::jsonb, 2, '以来 artinya "sejak", dibaca いらい.', 'vowel / vowel+vowel', 'belum', 1584),
('K5-1585', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
来日（らいにち）', '["datang ke Jepang", "masa depan", "masakan Jepang", "datang"]'::jsonb, 0, '来日 dibaca らいにち, artinya "datang ke Jepang".', 'makna sekanji', 'belum', 1585),
('K5-1586', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来日', '["れいにち", "くにち", "らいにち", "らあにち"]'::jsonb, 2, '来日 artinya "datang ke Jepang", dibaca らいにち. Membacanya くにち adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1586),
('K5-1587', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出来る（できる）', '["lalu lalang", "bisa", "kelak", "tamu"]'::jsonb, 1, '出来る dibaca できる, artinya "bisa".', 'makna sekanji', 'belum', 1587),
('K5-1588', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出来る', '["でぎる", "てぎる", "てきる", "できる"]'::jsonb, 3, '出来る artinya "bisa", dibaca できる.', 'daku / daku+daku', 'belum', 1588),
('K5-1589', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
来客（らいきゃく）', '["tamu", "kelak", "sejak", "pengikut"]'::jsonb, 0, '来客 dibaca らいきゃく, artinya "tamu".', 'makna sekanji', 'belum', 1589),
('K5-1590', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
来客', '["くきゃく", "ろいきゃく", "らいきゃく", "らうきゃく"]'::jsonb, 2, '来客 artinya "tamu", dibaca らいきゃく. Membacanya くきゃく adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1590),
('K5-1591', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
本来（ほんらい）', '["tamu", "kelak", "sejak", "aslinya"]'::jsonb, 3, '本来 dibaca ほんらい, artinya "aslinya".', 'makna sekanji', 'belum', 1591),
('K5-1592', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
本来', '["ほんれい", "ほんらい", "ほんれえ", "ほんらえ"]'::jsonb, 1, '本来 artinya "aslinya", dibaca ほんらい.', 'vowel / vowel+vowel', 'belum', 1592),
('K5-1593', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
行き来（いきき）', '["kelak", "datang ke Jepang", "lalu lalang", "bisa"]'::jsonb, 2, '行き来 dibaca いきき, artinya "lalu lalang".', 'makna sekanji', 'belum', 1593),
('K5-1594', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
行き来', '["うぎき", "いきき", "うきき", "いぎき"]'::jsonb, 1, '行き来 artinya "lalu lalang", dibaca いきき.', 'vowel / daku / vowel+daku', 'belum', 1594),
('K5-1595', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
家来（けらい）', '["kelak", "aslinya", "datang", "pengikut"]'::jsonb, 3, '家来 dibaca けらい, artinya "pengikut".', 'makna sekanji', 'belum', 1595),
('K5-1596', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
家来', '["けらい", "けるい", "げらい", "げるい"]'::jsonb, 0, '家来 artinya "pengikut", dibaca けらい.', 'daku / vowel / daku+vowel', 'belum', 1596),
('K5-1597', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出る（でる）', '["keberangkatan", "asal daerah", "keluar", "penyerahan"]'::jsonb, 2, '出る dibaca でる, artinya "keluar".', 'makna sekanji', 'belum', 1597),
('K5-1598', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出る', '["てるう", "でる", "てる", "でるう"]'::jsonb, 1, '出る artinya "keluar", dibaca でる.', 'daku / chouon+ / daku+chouon+', 'belum', 1598),
('K5-1599', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出す（だす）', '["mengeluarkan", "dinas luar kota", "asal daerah", "ekspor"]'::jsonb, 0, '出す dibaca だす, artinya "mengeluarkan".', 'makna sekanji', 'belum', 1599),
('K5-1600', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出す', '["たず", "だず", "たす", "だす"]'::jsonb, 3, '出す artinya "mengeluarkan", dibaca だす.', 'daku / daku+daku', 'belum', 1600)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-1601', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出発（しゅっぱつ）', '["mengeluarkan", "asal daerah", "keberangkatan", "penyerahan"]'::jsonb, 2, '出発 dibaca しゅっぱつ, artinya "keberangkatan".', 'makna sekanji', 'belum', 1601),
('K5-1602', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出発', '["しゅっぱつ", "しゅうっぱつ", "じゅっぱつ", "じゅうっぱつ"]'::jsonb, 0, '出発 artinya "keberangkatan", dibaca しゅっぱつ.', 'daku / chouon+ / daku+chouon+', 'belum', 1602),
('K5-1603', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出席（しゅっせき）', '["penyerahan", "asal daerah", "ekspor", "kehadiran"]'::jsonb, 3, '出席 dibaca しゅっせき, artinya "kehadiran".', 'makna sekanji', 'belum', 1603),
('K5-1604', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出席', '["じゅうっせき", "しゅっせき", "しゅうっせき", "じゅっせき"]'::jsonb, 1, '出席 artinya "kehadiran", dibaca しゅっせき.', 'daku / chouon+ / daku+chouon+', 'belum', 1604),
('K5-1605', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
提出（ていしゅつ）', '["penyerahan", "keluar", "kehadiran", "dinas luar kota"]'::jsonb, 0, '提出 dibaca ていしゅつ, artinya "penyerahan".', 'makna sekanji', 'belum', 1605),
('K5-1606', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
提出', '["でいしゅつ", "ていしゅつ", "でしゅつ", "てしゅつ"]'::jsonb, 1, '提出 artinya "penyerahan", dibaca ていしゅつ.', 'daku / chouon- / daku+chouon-', 'belum', 1606),
('K5-1607', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出張（しゅっちょう）', '["keberangkatan", "mengeluarkan", "dinas luar kota", "kehadiran"]'::jsonb, 2, '出張 dibaca しゅっちょう, artinya "dinas luar kota".', 'makna sekanji', 'belum', 1607),
('K5-1608', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出張', '["じゅっちょう", "しゅうっちょう", "じゅうっちょう", "しゅっちょう"]'::jsonb, 3, '出張 artinya "dinas luar kota", dibaca しゅっちょう.', 'daku / chouon+ / daku+chouon+', 'belum', 1608),
('K5-1609', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
思い出（おもいで）', '["perjumpaan", "kenangan", "asal daerah", "penyerahan"]'::jsonb, 1, '思い出 dibaca おもいで, artinya "kenangan".', 'makna sekanji', 'belum', 1609),
('K5-1610', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
思い出', '["おうもういで", "おうもいで", "おもいで", "おもういで"]'::jsonb, 2, '思い出 artinya "kenangan", dibaca おもいで.', 'chouon+ / chouon++chouon+', 'belum', 1610),
('K5-1611', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出身（しゅっしん）', '["keberangkatan", "kehadiran", "ekspor", "asal daerah"]'::jsonb, 3, '出身 dibaca しゅっしん, artinya "asal daerah".', 'makna sekanji', 'belum', 1611),
('K5-1612', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出身', '["しゅっしん", "じゅっしん", "しゅうっしん", "じゅうっしん"]'::jsonb, 0, '出身 artinya "asal daerah", dibaca しゅっしん.', 'daku / chouon+ / daku+chouon+', 'belum', 1612),
('K5-1613', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
出会い（であい）', '["perjumpaan", "asal daerah", "kenangan", "mengeluarkan"]'::jsonb, 0, '出会い dibaca であい, artinya "perjumpaan".', 'makna sekanji', 'belum', 1613),
('K5-1614', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出会い', '["てあい", "てうい", "でうい", "であい"]'::jsonb, 3, '出会い artinya "perjumpaan", dibaca であい.', 'daku / vowel / daku+vowel', 'belum', 1614),
('K5-1615', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
輸出（ゆしゅつ）', '["asal daerah", "keberangkatan", "ekspor", "mengeluarkan"]'::jsonb, 2, '輸出 dibaca ゆしゅつ, artinya "ekspor".', 'makna sekanji', 'belum', 1615),
('K5-1616', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
輸出', '["ゆじゅつ", "ゆしゅつ", "ゆうしゅつ", "ゆうじゅつ"]'::jsonb, 1, '輸出 artinya "ekspor", dibaca ゆしゅつ.', 'chouon+ / daku / chouon++daku', 'belum', 1616),
('K5-1617', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
入る（はいる）', '["masuk tempat", "masuk", "pengisian", "masuk negara"]'::jsonb, 1, '入る dibaca はいる, artinya "masuk".', 'makna sekanji', 'belum', 1617),
('K5-1618', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入る', '["はいる", "にゅうる", "ばいる", "はえる"]'::jsonb, 0, '入る artinya "masuk", dibaca はいる. Membacanya にゅうる adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1618),
('K5-1619', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
入れる（いれる）', '["masuk tempat", "rawat inap", "masuk negara", "memasukkan"]'::jsonb, 3, '入れる dibaca いれる, artinya "memasukkan".', 'makna sekanji', 'belum', 1619),
('K5-1620', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入れる', '["にゅうれる", "えれる", "いれる", "いるる"]'::jsonb, 2, '入れる artinya "memasukkan", dibaca いれる. Membacanya にゅうれる adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1620),
('K5-1621', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
入院（にゅういん）', '["pendapatan", "rawat inap", "masuk tempat", "pengisian"]'::jsonb, 1, '入院 dibaca にゅういん, artinya "rawat inap".', 'makna sekanji', 'belum', 1621),
('K5-1622', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入院', '["にゅういん", "にゆういん", "はいいん", "にゅいん"]'::jsonb, 0, '入院 artinya "rawat inap", dibaca にゅういん. Membacanya はいいん adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 1622),
('K5-1623', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
記入（きにゅう）', '["impor", "masuk negara", "masuk tempat", "pengisian"]'::jsonb, 3, '記入 dibaca きにゅう, artinya "pengisian".', 'makna sekanji', 'belum', 1623),
('K5-1624', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
記入', '["ぎにゅう", "きにゆう", "きにゅう", "ぎにゆう"]'::jsonb, 2, '記入 artinya "pengisian", dibaca きにゅう.', 'daku / youon / daku+youon', 'belum', 1624),
('K5-1625', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
収入（しゅうにゅう）', '["pengisian", "rawat inap", "masuk negara", "pendapatan"]'::jsonb, 3, '収入 dibaca しゅうにゅう, artinya "pendapatan".', 'makna sekanji', 'belum', 1625),
('K5-1626', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
収入', '["じゅうにゅう", "しゅうにゅう", "しゆうにゅう", "じゆうにゅう"]'::jsonb, 1, '収入 artinya "pendapatan", dibaca しゅうにゅう.', 'daku / youon / daku+youon', 'belum', 1626),
('K5-1627', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
輸入（ゆにゅう）', '["impor", "rawat inap", "pengisian", "masuk tempat"]'::jsonb, 0, '輸入 dibaca ゆにゅう, artinya "impor".', 'makna sekanji', 'belum', 1627),
('K5-1628', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
輸入', '["ゆうにゅう", "ゆうにゆう", "ゆにゅう", "ゆにゆう"]'::jsonb, 2, '輸入 artinya "impor", dibaca ゆにゅう.', 'chouon+ / youon / chouon++youon', 'belum', 1628),
('K5-1629', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
入場（にゅうじょう）', '["masuk negara", "masuk", "masuk tempat", "impor"]'::jsonb, 2, '入場 dibaca にゅうじょう, artinya "masuk tempat".', 'makna sekanji', 'belum', 1629),
('K5-1630', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入場', '["はいじょう", "にゅじょう", "にゆうじょう", "にゅうじょう"]'::jsonb, 3, '入場 artinya "masuk tempat", dibaca にゅうじょう. Membacanya はいじょう adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 1630),
('K5-1631', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
気に入る（きにいる）', '["rawat inap", "suka", "lemari futon", "masuk tempat"]'::jsonb, 1, '気に入る dibaca きにいる, artinya "suka".', 'makna sekanji', 'belum', 1631),
('K5-1632', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気に入る', '["きにいる", "ぎないる", "ぎにいる", "きないる"]'::jsonb, 0, '気に入る artinya "suka", dibaca きにいる.', 'daku / vowel / daku+vowel', 'belum', 1632),
('K5-1633', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
入国（にゅうこく）', '["masuk", "masuk tempat", "masuk negara", "pendapatan"]'::jsonb, 2, '入国 dibaca にゅうこく, artinya "masuk negara".', 'makna sekanji', 'belum', 1633),
('K5-1634', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入国', '["にゅうこく", "にゅこく", "はいこく", "にゆうこく"]'::jsonb, 0, '入国 artinya "masuk negara", dibaca にゅうこく. Membacanya はいこく adalah kekeliruan yang umum.', 'on↔kun / youon / chouon-', 'belum', 1634),
('K5-1635', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
押し入れ（おしいれ）', '["suka", "masuk", "memasukkan", "lemari futon"]'::jsonb, 3, '押し入れ dibaca おしいれ, artinya "lemari futon".', 'makna sekanji', 'belum', 1635),
('K5-1636', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
押し入れ', '["おうじいれ", "おしいれ", "おうしいれ", "おじいれ"]'::jsonb, 1, '押し入れ artinya "lemari futon", dibaca おしいれ.', 'chouon+ / daku / chouon++daku', 'belum', 1636),
('K5-1637', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰る（かえる）', '["perjalanan pulang", "rute pulang", "pulang", "pulang ke rumah"]'::jsonb, 2, '帰る dibaca かえる, artinya "pulang".', 'makna sekanji', 'belum', 1637),
('K5-1638', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰る', '["がおる", "かえる", "がえる", "かおる"]'::jsonb, 1, '帰る artinya "pulang", dibaca かえる.', 'daku / vowel / daku+vowel', 'belum', 1638),
('K5-1639', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰国（きこく）', '["pulang", "pulang ke rumah", "pulang ke ortu", "pulang ke negara"]'::jsonb, 3, '帰国 dibaca きこく, artinya "pulang ke negara".', 'makna sekanji', 'belum', 1639),
('K5-1640', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰国', '["きこく", "ぎごく", "きごく", "ぎこく"]'::jsonb, 0, '帰国 artinya "pulang ke negara", dibaca きこく.', 'daku / daku+daku', 'belum', 1640),
('K5-1641', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰宅（きたく）', '["pulang", "pulang ke ortu", "pulang ke rumah", "pulang ke negara"]'::jsonb, 2, '帰宅 dibaca きたく, artinya "pulang ke rumah".', 'makna sekanji', 'belum', 1641),
('K5-1642', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰宅', '["きたく", "ぎだく", "きだく", "ぎたく"]'::jsonb, 0, '帰宅 artinya "pulang ke rumah", dibaca きたく.', 'daku / daku+daku', 'belum', 1642),
('K5-1643', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰り（かえり）', '["pulang ke rumah", "rute pulang", "pulang", "perjalanan pulang"]'::jsonb, 3, '帰り dibaca かえり, artinya "perjalanan pulang".', 'makna sekanji', 'belum', 1643),
('K5-1644', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰り', '["かいり", "かえり", "がいり", "がえり"]'::jsonb, 1, '帰り artinya "perjalanan pulang", dibaca かえり.', 'daku / vowel / daku+vowel', 'belum', 1644),
('K5-1645', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰省（きせい）', '["mudik", "perjalanan pulang", "kembali bertugas", "pulang ke rumah"]'::jsonb, 0, '帰省 dibaca きせい, artinya "mudik".', 'makna sekanji', 'belum', 1645),
('K5-1646', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰省', '["きぜい", "ぎせい", "ぎぜい", "きせい"]'::jsonb, 3, '帰省 artinya "mudik", dibaca きせい.', 'daku / daku+daku', 'belum', 1646),
('K5-1647', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰路（きろ）', '["perjalanan pulang", "pulang", "rute pulang", "pulang ke negara"]'::jsonb, 2, '帰路 dibaca きろ, artinya "rute pulang".', 'makna sekanji', 'belum', 1647),
('K5-1648', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰路', '["ぎろう", "きろ", "きろう", "ぎろ"]'::jsonb, 1, '帰路 artinya "rute pulang", dibaca きろ.', 'daku / chouon+ / daku+chouon+', 'belum', 1648),
('K5-1649', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
日帰り（ひがえり）', '["pulang ke rumah", "pulang hari itu", "pulang ke negara", "pulang ke ortu"]'::jsonb, 1, '日帰り dibaca ひがえり, artinya "pulang hari itu".', 'makna sekanji', 'belum', 1649),
('K5-1650', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
日帰り', '["ひがえり", "ひかえり", "びかえり", "びがえり"]'::jsonb, 0, '日帰り artinya "pulang hari itu", dibaca ひがえり.', 'daku / daku+daku', 'belum', 1650),
('K5-1651', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
帰り道（かえりみち）', '["rute pulang", "pulang", "jalan pulang", "pulang hari itu"]'::jsonb, 2, '帰り道 dibaca かえりみち, artinya "jalan pulang".', 'makna sekanji', 'belum', 1651),
('K5-1652', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
帰り道', '["がえりみち", "がありみち", "かありみち", "かえりみち"]'::jsonb, 3, '帰り道 artinya "jalan pulang", dibaca かえりみち.', 'daku / vowel / daku+vowel', 'belum', 1652),
('K5-1653', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
復帰（ふっき）', '["perjalanan pulang", "kembali bertugas", "mudik", "rute pulang"]'::jsonb, 1, '復帰 dibaca ふっき, artinya "kembali bertugas".', 'makna sekanji', 'belum', 1653),
('K5-1654', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
復帰', '["ふっき", "ふき", "ぶき", "ぶっき"]'::jsonb, 0, '復帰 artinya "kembali bertugas", dibaca ふっき.', 'daku / sokuon- / daku+sokuon-', 'belum', 1654),
('K5-1655', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
里帰り（さとがえり）', '["pulang ke rumah", "pulang hari itu", "pulang ke ortu", "jalan pulang"]'::jsonb, 2, '里帰り dibaca さとがえり, artinya "pulang ke ortu".', 'makna sekanji', 'belum', 1655),
('K5-1656', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
里帰り', '["ざとがえり", "さどがえり", "ざどがえり", "さとがえり"]'::jsonb, 3, '里帰り artinya "pulang ke ortu", dibaca さとがえり.', 'daku / daku+daku', 'belum', 1656),
('K5-1657', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立つ（たつ）', '["aba-aba berdiri", "posisi", "kemerdekaan", "berdiri"]'::jsonb, 3, '立つ dibaca たつ, artinya "berdiri".', 'makna sekanji', 'belum', 1657),
('K5-1658', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立つ', '["たつ", "だっつ", "だつ", "たっつ"]'::jsonb, 0, '立つ artinya "berdiri", dibaca たつ.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1658),
('K5-1659', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
国立（こくりつ）', '["posisi", "milik negara", "masuk negara", "kemerdekaan"]'::jsonb, 1, '国立 dibaca こくりつ, artinya "milik negara".', 'makna sekanji', 'belum', 1659),
('K5-1660', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国立', '["ごくりつ", "こぐりつ", "こくりつ", "ごぐりつ"]'::jsonb, 2, '国立 artinya "milik negara", dibaca こくりつ.', 'daku / daku+daku', 'belum', 1660),
('K5-1661', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
私立（しりつ）', '["milik negara", "pendirian", "swasta", "posisi"]'::jsonb, 2, '私立 dibaca しりつ, artinya "swasta".', 'makna sekanji', 'belum', 1661),
('K5-1662', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
私立', '["じるつ", "じりつ", "しるつ", "しりつ"]'::jsonb, 3, '私立 artinya "swasta", dibaca しりつ.', 'daku / vowel / daku+vowel', 'belum', 1662),
('K5-1663', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
独立（どくりつ）', '["swasta", "kemerdekaan", "pendirian", "posisi"]'::jsonb, 1, '独立 dibaca どくりつ, artinya "kemerdekaan".', 'makna sekanji', 'belum', 1663),
('K5-1664', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
独立', '["どくりつ", "とくりつ", "どぐりつ", "とぐりつ"]'::jsonb, 0, '独立 artinya "kemerdekaan", dibaca どくりつ.', 'daku / daku+daku', 'belum', 1664),
('K5-1665', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立てる（たてる）', '["milik negara", "kemerdekaan", "pendirian", "mendirikan"]'::jsonb, 3, '立てる dibaca たてる, artinya "mendirikan".', 'makna sekanji', 'belum', 1665),
('K5-1666', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立てる', '["だでる", "たてる", "たでる", "だてる"]'::jsonb, 1, '立てる artinya "mendirikan", dibaca たてる.', 'daku / daku+daku', 'belum', 1666),
('K5-1667', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立場（たちば）', '["posisi", "berdiri", "legislasi", "milik negara"]'::jsonb, 0, '立場 dibaca たちば, artinya "posisi".', 'makna sekanji', 'belum', 1667),
('K5-1668', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立場', '["たっちば", "だちば", "たちば", "だっちば"]'::jsonb, 2, '立場 artinya "posisi", dibaca たちば.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1668),
('K5-1669', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
設立（せつりつ）', '["kemerdekaan", "legislasi", "aba-aba berdiri", "pendirian"]'::jsonb, 3, '設立 dibaca せつりつ, artinya "pendirian".', 'makna sekanji', 'belum', 1669),
('K5-1670', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
設立', '["ぜつうりつ", "せつうりつ", "せつりつ", "ぜつりつ"]'::jsonb, 2, '設立 artinya "pendirian", dibaca せつりつ.', 'daku / chouon+ / daku+chouon+', 'belum', 1670),
('K5-1671', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立ち入り（たちいり）', '["milik negara", "masuk area", "pendirian", "posisi"]'::jsonb, 1, '立ち入り dibaca たちいり, artinya "masuk area".', 'makna sekanji', 'belum', 1671),
('K5-1672', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立ち入り', '["たちいり", "だっちいり", "たっちいり", "だちいり"]'::jsonb, 0, '立ち入り artinya "masuk area", dibaca たちいり.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1672),
('K5-1673', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立法（りっぽう）', '["legislasi", "berdiri", "swasta", "posisi"]'::jsonb, 0, '立法 dibaca りっぽう, artinya "legislasi".', 'makna sekanji', 'belum', 1673),
('K5-1674', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立法', '["れぽう", "れっぽう", "りぽう", "りっぽう"]'::jsonb, 3, '立法 artinya "legislasi", dibaca りっぽう.', 'vowel / sokuon- / vowel+sokuon-', 'belum', 1674),
('K5-1675', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
起立（きりつ）', '["pendirian", "aba-aba berdiri", "swasta", "berdiri"]'::jsonb, 1, '起立 dibaca きりつ, artinya "aba-aba berdiri".', 'makna sekanji', 'belum', 1675),
('K5-1676', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
起立', '["きるつ", "ぎりつ", "きりつ", "ぎるつ"]'::jsonb, 2, '起立 artinya "aba-aba berdiri", dibaca きりつ.', 'daku / vowel / daku+vowel', 'belum', 1676),
('K5-1677', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休む（やすむ）', '["libur panjang", "hari libur", "istirahat", "istirahat siang"]'::jsonb, 2, '休む dibaca やすむ, artinya "istirahat".', 'makna sekanji', 'belum', 1677),
('K5-1678', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休む', '["やすむ", "きゅうむ", "ゆすむ", "やずむ"]'::jsonb, 0, '休む artinya "istirahat", dibaca やすむ. Membacanya きゅうむ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1678),
('K5-1679', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休み（やすみ）', '["kuliah libur", "libur panjang", "hari libur", "libur"]'::jsonb, 3, '休み dibaca やすみ, artinya "libur".', 'makna sekanji', 'belum', 1679),
('K5-1680', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休み', '["よすみ", "やすみ", "やずみ", "きゅうみ"]'::jsonb, 1, '休み artinya "libur", dibaca やすみ. Membacanya きゅうみ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1680),
('K5-1681', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休日（きゅうじつ）', '["hari libur", "kuliah libur", "libur", "libur panjang"]'::jsonb, 0, '休日 dibaca きゅうじつ, artinya "hari libur".', 'makna sekanji', 'belum', 1681),
('K5-1682', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休日', '["やすじつ", "きゆうじつ", "きゅうじつ", "ぎゅうじつ"]'::jsonb, 2, '休日 artinya "hari libur", dibaca きゅうじつ. Membacanya やすじつ adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1682),
('K5-1683', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
夏休み（なつやすみ）', '["hari tutup tetap", "libur panjang", "istirahat siang", "libur musim panas"]'::jsonb, 3, '夏休み dibaca なつやすみ, artinya "libur musim panas".', 'makna sekanji', 'belum', 1683),
('K5-1684', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
夏休み', '["ぬつやすみ", "なつやすみ", "ぬっつやすみ", "なっつやすみ"]'::jsonb, 1, '夏休み artinya "libur musim panas", dibaca なつやすみ.', 'vowel / sokuon+ / vowel+sokuon+', 'belum', 1684),
('K5-1685', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
昼休み（ひるやすみ）', '["hari tutup tetap", "libur musim panas", "istirahat siang", "istirahat"]'::jsonb, 2, '昼休み dibaca ひるやすみ, artinya "istirahat siang".', 'makna sekanji', 'belum', 1685),
('K5-1686', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昼休み', '["ひるうやすみ", "ひるやすみ", "びるうやすみ", "びるやすみ"]'::jsonb, 1, '昼休み artinya "istirahat siang", dibaca ひるやすみ.', 'daku / chouon+ / daku+chouon+', 'belum', 1686),
('K5-1687', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休憩（きゅうけい）', '["istirahat", "beristirahat", "libur panjang", "rehat"]'::jsonb, 3, '休憩 dibaca きゅうけい, artinya "rehat".', 'makna sekanji', 'belum', 1687),
('K5-1688', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休憩', '["きゅうけい", "きゆうけい", "やすけい", "ぎゅうけい"]'::jsonb, 0, '休憩 artinya "rehat", dibaca きゅうけい. Membacanya やすけい adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1688),
('K5-1689', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
定休日（ていきゅうび）', '["pulang hari itu", "libur musim panas", "istirahat siang", "hari tutup tetap"]'::jsonb, 3, '定休日 dibaca ていきゅうび, artinya "hari tutup tetap".', 'makna sekanji', 'belum', 1689),
('K5-1690', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
定休日', '["でいきゅうび", "ていきゅうび", "てきゅうび", "できゅうび"]'::jsonb, 1, '定休日 artinya "hari tutup tetap", dibaca ていきゅうび.', 'daku / chouon- / daku+chouon-', 'belum', 1690),
('K5-1691', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
連休（れんきゅう）', '["libur", "kuliah libur", "libur panjang", "hari libur"]'::jsonb, 2, '連休 dibaca れんきゅう, artinya "libur panjang".', 'makna sekanji', 'belum', 1691),
('K5-1692', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
連休', '["れんきゅう", "らんぎゅう", "れんぎゅう", "らんきゅう"]'::jsonb, 0, '連休 artinya "libur panjang", dibaca れんきゅう.', 'vowel / daku / vowel+daku', 'belum', 1692),
('K5-1693', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休講（きゅうこう）', '["libur", "hari libur", "libur panjang", "kuliah libur"]'::jsonb, 3, '休講 dibaca きゅうこう, artinya "kuliah libur".', 'makna sekanji', 'belum', 1693),
('K5-1694', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休講', '["きゆうこう", "ぎゅうこう", "きゅうこう", "やすこう"]'::jsonb, 2, '休講 artinya "kuliah libur", dibaca きゅうこう. Membacanya やすこう adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1694),
('K5-1695', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
休息（きゅうそく）', '["hari libur", "beristirahat", "libur panjang", "rehat"]'::jsonb, 1, '休息 dibaca きゅうそく, artinya "beristirahat".', 'makna sekanji', 'belum', 1695),
('K5-1696', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
休息', '["きゅうそく", "ぎゅうそく", "きゆうそく", "やすそく"]'::jsonb, 0, '休息 artinya "beristirahat", dibaca きゅうそく. Membacanya やすそく adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1696),
('K5-1697', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食べる（たべる）', '["makan siang", "makan malam", "makan", "santap / makan"]'::jsonb, 2, '食べる dibaca たべる, artinya "makan".', 'makna sekanji', 'belum', 1697),
('K5-1698', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食べる', '["たべる", "たぺる", "しょくべる", "だべる"]'::jsonb, 0, '食べる artinya "makan", dibaca たべる. Membacanya しょくべる adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1698),
('K5-1699', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食事（しょくじ）', '["makan", "santap / makan", "makan siang", "nafsu makan"]'::jsonb, 1, '食事 dibaca しょくじ, artinya "santap / makan".', 'makna sekanji', 'belum', 1699),
('K5-1700', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食事', '["じょくじ", "たじ", "しょうくじ", "しょくじ"]'::jsonb, 3, '食事 artinya "santap / makan", dibaca しょくじ. Membacanya たじ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1700),
('K5-1701', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
朝食（ちょうしょく）', '["kantin", "santap / makan", "sarapan", "produk pangan"]'::jsonb, 2, '朝食 dibaca ちょうしょく, artinya "sarapan".', 'makna sekanji', 'belum', 1701),
('K5-1702', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
朝食', '["ちよしょく", "ちょうしょく", "ちょしょく", "ちようしょく"]'::jsonb, 1, '朝食 artinya "sarapan", dibaca ちょうしょく.', 'youon / chouon- / youon+chouon-', 'belum', 1702),
('K5-1703', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
昼食（ちゅうしょく）', '["makan siang", "makan malam", "nafsu makan", "makan"]'::jsonb, 0, '昼食 dibaca ちゅうしょく, artinya "makan siang".', 'makna sekanji', 'belum', 1703),
('K5-1704', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昼食', '["ちゅしょく", "ちゆうしょく", "ちゆしょく", "ちゅうしょく"]'::jsonb, 3, '昼食 artinya "makan siang", dibaca ちゅうしょく.', 'youon / chouon- / youon+chouon-', 'belum', 1704),
('K5-1705', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
夕食（ゆうしょく）', '["nafsu makan", "makan", "makan malam", "makan siang"]'::jsonb, 2, '夕食 dibaca ゆうしょく, artinya "makan malam".', 'makna sekanji', 'belum', 1705),
('K5-1706', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
夕食', '["やうしょく", "やしょく", "ゆしょく", "ゆうしょく"]'::jsonb, 3, '夕食 artinya "makan malam", dibaca ゆうしょく.', 'vowel / chouon- / vowel+chouon-', 'belum', 1706),
('K5-1707', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食堂（しょくどう）', '["sarapan", "kantin", "produk pangan", "makan siang"]'::jsonb, 1, '食堂 dibaca しょくどう, artinya "kantin".', 'makna sekanji', 'belum', 1707),
('K5-1708', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食堂', '["しょくどう", "じょくどう", "しょうくどう", "たどう"]'::jsonb, 0, '食堂 artinya "kantin", dibaca しょくどう. Membacanya たどう adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1708),
('K5-1709', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食欲（しょくよく）', '["santap / makan", "nafsu makan", "makan malam", "makan siang"]'::jsonb, 1, '食欲 dibaca しょくよく, artinya "nafsu makan".', 'makna sekanji', 'belum', 1709),
('K5-1710', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食欲', '["たよく", "じょくよく", "しょうくよく", "しょくよく"]'::jsonb, 3, '食欲 artinya "nafsu makan", dibaca しょくよく. Membacanya たよく adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1710),
('K5-1711', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食べ物（たべもの）', '["makanan", "produk pangan", "santap / makan", "makan siang"]'::jsonb, 0, '食べ物 dibaca たべもの, artinya "makanan".', 'makna sekanji', 'belum', 1711),
('K5-1712', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食べ物', '["しょくべもの", "たぺもの", "たべもの", "だべもの"]'::jsonb, 2, '食べ物 artinya "makanan", dibaca たべもの. Membacanya しょくべもの adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1712),
('K5-1713', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
和食（わしょく）', '["masakan Jepang", "makan siang", "kantin", "makan malam"]'::jsonb, 0, '和食 dibaca わしょく, artinya "masakan Jepang".', 'makna sekanji', 'belum', 1713),
('K5-1714', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
和食', '["わじょうく", "わしょく", "わじょく", "わしょうく"]'::jsonb, 1, '和食 artinya "masakan Jepang", dibaca わしょく.', 'daku / chouon+ / daku+chouon+', 'belum', 1714),
('K5-1715', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
食品（しょくひん）', '["sarapan", "makan malam", "kantin", "produk pangan"]'::jsonb, 3, '食品 dibaca しょくひん, artinya "produk pangan".', 'makna sekanji', 'belum', 1715),
('K5-1716', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
食品', '["たひん", "じょくひん", "しょくひん", "しょうくひん"]'::jsonb, 2, '食品 artinya "produk pangan", dibaca しょくひん. Membacanya たひん adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1716),
('K5-1717', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲む（のむ）', '["makan minum", "gemar minum", "minum alkohol", "minum"]'::jsonb, 3, '飲む dibaca のむ, artinya "minum".', 'makna sekanji', 'belum', 1717),
('K5-1718', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲む', '["のむ", "のむう", "のうむ", "いんむ"]'::jsonb, 0, '飲む artinya "minum", dibaca のむ. Membacanya いんむ adalah kekeliruan yang umum.', 'on↔kun / chouon+', 'belum', 1718),
('K5-1719', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲み物（のみもの）', '["minuman (istilah)", "minuman", "pesta minum", "air untuk minum"]'::jsonb, 1, '飲み物 dibaca のみもの, artinya "minuman".', 'makna sekanji', 'belum', 1719),
('K5-1720', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲み物', '["いんみもの", "のまもの", "のみもの", "のうみもの"]'::jsonb, 2, '飲み物 artinya "minuman", dibaca のみもの. Membacanya いんみもの adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 1720),
('K5-1721', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲食（いんしょく）', '["minum", "pesta minum", "makan minum", "gemar minum"]'::jsonb, 2, '飲食 dibaca いんしょく, artinya "makan minum".', 'makna sekanji', 'belum', 1721),
('K5-1722', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲食', '["いんしょく", "のしょく", "あんしょく", "いんじょく"]'::jsonb, 0, '飲食 artinya "makan minum", dibaca いんしょく. Membacanya のしょく adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1722),
('K5-1723', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲料（いんりょう）', '["minuman", "minum", "gemar minum", "minuman (istilah)"]'::jsonb, 3, '飲料 dibaca いんりょう, artinya "minuman (istilah)".', 'makna sekanji', 'belum', 1723),
('K5-1724', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲料', '["いんりよう", "いんりょう", "のりょう", "あんりょう"]'::jsonb, 1, '飲料 artinya "minuman (istilah)", dibaca いんりょう. Membacanya のりょう adalah kekeliruan yang umum.', 'on↔kun / vowel / youon', 'belum', 1724),
('K5-1725', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲み会（のみかい）', '["makan minum", "pesta minum", "minum", "air untuk minum"]'::jsonb, 1, '飲み会 dibaca のみかい, artinya "pesta minum".', 'makna sekanji', 'belum', 1725),
('K5-1726', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲み会', '["いんみかい", "のめかい", "のうみかい", "のみかい"]'::jsonb, 3, '飲み会 artinya "pesta minum", dibaca のみかい. Membacanya いんみかい adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 1726),
('K5-1727', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲酒（いんしゅ）', '["minum berdiri", "gemar minum", "minum alkohol", "minum"]'::jsonb, 2, '飲酒 dibaca いんしゅ, artinya "minum alkohol".', 'makna sekanji', 'belum', 1727),
('K5-1728', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲酒', '["いんしゅ", "いんじゅ", "えんしゅ", "のしゅ"]'::jsonb, 0, '飲酒 artinya "minum alkohol", dibaca いんしゅ. Membacanya のしゅ adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1728),
('K5-1729', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲み水（のみみず）', '["air untuk minum", "pesta minum", "makan minum", "minum"]'::jsonb, 0, '飲み水 dibaca のみみず, artinya "air untuk minum".', 'makna sekanji', 'belum', 1729),
('K5-1730', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲み水', '["のまみず", "いんみみず", "のみみず", "のうみみず"]'::jsonb, 2, '飲み水 artinya "air untuk minum", dibaca のみみず. Membacanya いんみみず adalah kekeliruan yang umum.', 'on↔kun / chouon+ / vowel', 'belum', 1730),
('K5-1731', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
立ち飲み（たちのみ）', '["gemar minum", "minum", "minum alkohol", "minum berdiri"]'::jsonb, 3, '立ち飲み dibaca たちのみ, artinya "minum berdiri".', 'makna sekanji', 'belum', 1731),
('K5-1732', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
立ち飲み', '["だっちのみ", "たちのみ", "だちのみ", "たっちのみ"]'::jsonb, 1, '立ち飲み artinya "minum berdiri", dibaca たちのみ.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1732),
('K5-1733', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
飲食店（いんしょくてん）', '["makan", "air untuk minum", "minuman", "rumah makan"]'::jsonb, 3, '飲食店 dibaca いんしょくてん, artinya "rumah makan".', 'makna sekanji', 'belum', 1733),
('K5-1734', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
飲食店', '["いんじょくてん", "のしょくてん", "いんしょくてん", "うんしょくてん"]'::jsonb, 2, '飲食店 artinya "rumah makan", dibaca いんしょくてん. Membacanya のしょくてん adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1734),
('K5-1735', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
愛飲（あいいん）', '["makan minum", "gemar minum", "minum", "pesta minum"]'::jsonb, 1, '愛飲 dibaca あいいん, artinya "gemar minum".', 'makna sekanji', 'belum', 1735),
('K5-1736', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
愛飲', '["あいいん", "えいいん", "ああいん", "えあいん"]'::jsonb, 0, '愛飲 artinya "gemar minum", dibaca あいいん.', 'vowel / vowel+vowel', 'belum', 1736),
('K5-1737', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買う（かう）', '["boikot beli", "membeli", "pembelian", "jual beli"]'::jsonb, 1, '買う dibaca かう, artinya "membeli".', 'makna sekanji', 'belum', 1737),
('K5-1738', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買う', '["かう", "がえ", "かえ", "がう"]'::jsonb, 0, '買う artinya "membeli", dibaca かう.', 'daku / vowel / daku+vowel', 'belum', 1738),
('K5-1739', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買い物（かいもの）', '["cara beli", "borong besar", "belanja", "stok belanja"]'::jsonb, 2, '買い物 dibaca かいもの, artinya "belanja".', 'makna sekanji', 'belum', 1739),
('K5-1740', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買い物', '["がいもの", "かうもの", "がうもの", "かいもの"]'::jsonb, 3, '買い物 artinya "belanja", dibaca かいもの.', 'daku / vowel / daku+vowel', 'belum', 1740),
('K5-1741', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
売買（ばいばい）', '["akuisisi", "boikot beli", "cara beli", "jual beli"]'::jsonb, 3, '売買 dibaca ばいばい, artinya "jual beli".', 'makna sekanji', 'belum', 1741),
('K5-1742', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
売買', '["はおばい", "ばいばい", "はいばい", "ばおばい"]'::jsonb, 1, '売買 artinya "jual beli", dibaca ばいばい.', 'daku / vowel / daku+vowel', 'belum', 1742),
('K5-1743', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買い手（かいて）', '["pembeli", "borong besar", "belanja", "cara beli"]'::jsonb, 0, '買い手 dibaca かいて, artinya "pembeli".', 'makna sekanji', 'belum', 1743),
('K5-1744', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買い手', '["があて", "がいて", "かいて", "かあて"]'::jsonb, 2, '買い手 artinya "pembeli", dibaca かいて.', 'daku / vowel / daku+vowel', 'belum', 1744),
('K5-1745', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
購買（こうばい）', '["pembelian", "jual beli", "boikot beli", "akuisisi"]'::jsonb, 0, '購買 dibaca こうばい, artinya "pembelian".', 'makna sekanji', 'belum', 1745),
('K5-1746', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
購買', '["ごばい", "こばい", "こうばい", "ごうばい"]'::jsonb, 2, '購買 artinya "pembelian", dibaca こうばい.', 'daku / chouon- / daku+chouon-', 'belum', 1746),
('K5-1747', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買い方（かいかた）', '["jual beli", "cara beli", "borong besar", "boikot beli"]'::jsonb, 1, '買い方 dibaca かいかた, artinya "cara beli".', 'makna sekanji', 'belum', 1747),
('K5-1748', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買い方', '["かえかた", "がえかた", "がいかた", "かいかた"]'::jsonb, 3, '買い方 artinya "cara beli", dibaca かいかた.', 'daku / vowel / daku+vowel', 'belum', 1748),
('K5-1749', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
爆買い（ばくがい）', '["borong besar", "pembeli", "cara beli", "belanja"]'::jsonb, 0, '爆買い dibaca ばくがい, artinya "borong besar".', 'makna sekanji', 'belum', 1749),
('K5-1750', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
爆買い', '["はぐがい", "ばぐがい", "ばくがい", "はくがい"]'::jsonb, 2, '爆買い artinya "borong besar", dibaca ばくがい.', 'daku / daku+daku', 'belum', 1750),
('K5-1751', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買収（ばいしゅう）', '["boikot beli", "akuisisi", "jual beli", "membeli"]'::jsonb, 1, '買収 dibaca ばいしゅう, artinya "akuisisi".', 'makna sekanji', 'belum', 1751),
('K5-1752', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買収', '["はいしゅう", "ばうしゅう", "はうしゅう", "ばいしゅう"]'::jsonb, 3, '買収 artinya "akuisisi", dibaca ばいしゅう.', 'daku / vowel / daku+vowel', 'belum', 1752),
('K5-1753', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
買い置き（かいおき）', '["stok belanja", "belanja", "borong besar", "membeli"]'::jsonb, 0, '買い置き dibaca かいおき, artinya "stok belanja".', 'makna sekanji', 'belum', 1753),
('K5-1754', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
買い置き', '["があおき", "がいおき", "かいおき", "かあおき"]'::jsonb, 2, '買い置き artinya "stok belanja", dibaca かいおき.', 'daku / vowel / daku+vowel', 'belum', 1754),
('K5-1755', 'N5', 'kanji', 'Arti', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Apa arti kata berikut?
不買（ふばい）', '["cara beli", "boikot beli", "membeli", "jual beli"]'::jsonb, 1, '不買 dibaca ふばい, artinya "boikot beli".', 'makna sekanji', 'belum', 1755),
('K5-1756', 'N5', 'kanji', 'Bacaan', 8, 'T08', 'Kegiatan Harian', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
不買', '["ふばう", "ふぱう", "ふぱい", "ふばい"]'::jsonb, 3, '不買 artinya "boikot beli", dibaca ふばい.', 'daku / vowel / daku+vowel', 'belum', 1756),
('K5-1757', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会う（あう）', '["bertemu", "anggota", "tempat acara", "masyarakat"]'::jsonb, 0, '会う dibaca あう, artinya "bertemu".', 'makna sekanji', 'belum', 1757),
('K5-1758', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会う', '["かいう", "いう", "あう", "あえ"]'::jsonb, 2, '会う artinya "bertemu", dibaca あう. Membacanya かいう adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1758),
('K5-1759', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会社（かいしゃ）', '["pembayaran", "masyarakat", "gereja", "perusahaan"]'::jsonb, 3, '会社 dibaca かいしゃ, artinya "perusahaan".', 'makna sekanji', 'belum', 1759),
('K5-1760', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会社', '["がいしゃ", "かいしゃ", "あしゃ", "かあしゃ"]'::jsonb, 1, '会社 artinya "perusahaan", dibaca かいしゃ. Membacanya あしゃ adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1760),
('K5-1761', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会議（かいぎ）', '["masyarakat", "perusahaan", "bertemu", "rapat"]'::jsonb, 3, '会議 dibaca かいぎ, artinya "rapat".', 'makna sekanji', 'belum', 1761),
('K5-1762', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会議', '["あぎ", "かいぎ", "かあぎ", "がいぎ"]'::jsonb, 1, '会議 artinya "rapat", dibaca かいぎ. Membacanya あぎ adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1762),
('K5-1763', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
大会（たいかい）', '["perusahaan", "masyarakat", "turnamen", "rapat"]'::jsonb, 2, '大会 dibaca たいかい, artinya "turnamen".', 'makna sekanji', 'belum', 1763),
('K5-1764', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
大会', '["たいかい", "だいかい", "たうかい", "だうかい"]'::jsonb, 0, '大会 artinya "turnamen", dibaca たいかい.', 'daku / vowel / daku+vowel', 'belum', 1764),
('K5-1765', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
社会（しゃかい）', '["gereja", "turnamen", "tempat acara", "masyarakat"]'::jsonb, 3, '社会 dibaca しゃかい, artinya "masyarakat".', 'makna sekanji', 'belum', 1765),
('K5-1766', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
社会', '["じゃかい", "しゃかい", "しやかい", "じやかい"]'::jsonb, 1, '社会 artinya "masyarakat", dibaca しゃかい.', 'daku / youon / daku+youon', 'belum', 1766),
('K5-1767', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会員（かいいん）', '["rapat", "pembayaran", "anggota", "bertemu"]'::jsonb, 2, '会員 dibaca かいいん, artinya "anggota".', 'makna sekanji', 'belum', 1767),
('K5-1768', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会員', '["かいいん", "がいいん", "かえいん", "あいん"]'::jsonb, 0, '会員 artinya "anggota", dibaca かいいん. Membacanya あいん adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1768),
('K5-1769', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
教会（きょうかい）', '["perusahaan", "pembayaran", "bertemu", "gereja"]'::jsonb, 3, '教会 dibaca きょうかい, artinya "gereja".', 'makna sekanji', 'belum', 1769),
('K5-1770', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
教会', '["ぎょうかい", "きようかい", "きょうかい", "ぎようかい"]'::jsonb, 2, '教会 artinya "gereja", dibaca きょうかい.', 'daku / youon / daku+youon', 'belum', 1770),
('K5-1771', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会場（かいじょう）', '["tempat acara", "bertemu", "masyarakat", "gereja"]'::jsonb, 0, '会場 dibaca かいじょう, artinya "tempat acara".', 'makna sekanji', 'belum', 1771),
('K5-1772', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会場', '["あじょう", "かいじょう", "がいじょう", "かおじょう"]'::jsonb, 1, '会場 artinya "tempat acara", dibaca かいじょう. Membacanya あじょう adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1772),
('K5-1773', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
面会（めんかい）', '["gereja", "kunjungan", "turnamen", "pembayaran"]'::jsonb, 1, '面会 dibaca めんかい, artinya "kunjungan".', 'makna sekanji', 'belum', 1773),
('K5-1774', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
面会', '["もんかい", "めんがい", "めんかい", "もんがい"]'::jsonb, 2, '面会 artinya "kunjungan", dibaca めんかい.', 'vowel / daku / vowel+daku', 'belum', 1774),
('K5-1775', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
会計（かいけい）', '["pembayaran", "kunjungan", "anggota", "perusahaan"]'::jsonb, 0, '会計 dibaca かいけい, artinya "pembayaran".', 'makna sekanji', 'belum', 1775),
('K5-1776', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
会計', '["がいけい", "かえけい", "あけい", "かいけい"]'::jsonb, 3, '会計 artinya "pembayaran", dibaca かいけい. Membacanya あけい adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1776),
('K5-1777', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
神社（じんじゃ）', '["kuil Shinto", "perusahaan dagang", "masuk kantor", "kantor cabang"]'::jsonb, 0, '神社 dibaca じんじゃ, artinya "kuil Shinto".', 'makna sekanji', 'belum', 1777),
('K5-1778', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
神社', '["じんしゃ", "しんしゃ", "じんじゃ", "しんじゃ"]'::jsonb, 2, '神社 artinya "kuil Shinto", dibaca じんじゃ.', 'daku / daku+daku', 'belum', 1778),
('K5-1779', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
社員（しゃいん）', '["masuk kantor", "karyawan", "kantor cabang", "masyarakat"]'::jsonb, 1, '社員 dibaca しゃいん, artinya "karyawan".', 'makna sekanji', 'belum', 1779),
('K5-1780', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
社員', '["じやいん", "しやいん", "じゃいん", "しゃいん"]'::jsonb, 3, '社員 artinya "karyawan", dibaca しゃいん.', 'daku / youon / daku+youon', 'belum', 1780),
('K5-1781', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
支社（ししゃ）', '["dalam perusahaan", "pulang kantor", "masuk kantor", "kantor cabang"]'::jsonb, 3, '支社 dibaca ししゃ, artinya "kantor cabang".', 'makna sekanji', 'belum', 1781),
('K5-1782', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
支社', '["ししゃ", "しじゃ", "じしゃ", "じじゃ"]'::jsonb, 0, '支社 artinya "kantor cabang", dibaca ししゃ.', 'daku / daku+daku', 'belum', 1782),
('K5-1783', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
出社（しゅっしゃ）', '["pulang kantor", "masuk perusahaan", "masuk kantor", "kantor cabang"]'::jsonb, 2, '出社 dibaca しゅっしゃ, artinya "masuk kantor".', 'makna sekanji', 'belum', 1783),
('K5-1784', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
出社', '["じゅっしゃ", "しゅっしゃ", "じゅうっしゃ", "しゅうっしゃ"]'::jsonb, 1, '出社 artinya "masuk kantor", dibaca しゅっしゃ.', 'daku / chouon+ / daku+chouon+', 'belum', 1784),
('K5-1785', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
退社（たいしゃ）', '["pulang kantor", "masuk kantor", "kantor cabang", "dalam perusahaan"]'::jsonb, 0, '退社 dibaca たいしゃ, artinya "pulang kantor".', 'makna sekanji', 'belum', 1785),
('K5-1786', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
退社', '["だあしゃ", "たあしゃ", "だいしゃ", "たいしゃ"]'::jsonb, 3, '退社 artinya "pulang kantor", dibaca たいしゃ.', 'daku / vowel / daku+vowel', 'belum', 1786),
('K5-1787', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
社内（しゃない）', '["masuk perusahaan", "perusahaan dagang", "dalam perusahaan", "perusahaan"]'::jsonb, 2, '社内 dibaca しゃない, artinya "dalam perusahaan".', 'makna sekanji', 'belum', 1787),
('K5-1788', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
社内', '["じゃない", "しゃない", "しやない", "じやない"]'::jsonb, 1, '社内 artinya "dalam perusahaan", dibaca しゃない.', 'daku / youon / daku+youon', 'belum', 1788),
('K5-1789', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
商社（しょうしゃ）', '["perusahaan dagang", "dalam perusahaan", "masuk perusahaan", "perusahaan"]'::jsonb, 0, '商社 dibaca しょうしゃ, artinya "perusahaan dagang".', 'makna sekanji', 'belum', 1789),
('K5-1790', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
商社', '["しようしゃ", "じようしゃ", "じょうしゃ", "しょうしゃ"]'::jsonb, 3, '商社 artinya "perusahaan dagang", dibaca しょうしゃ.', 'daku / youon / daku+youon', 'belum', 1790),
('K5-1791', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
入社（にゅうしゃ）', '["perusahaan", "dalam perusahaan", "masuk perusahaan", "masuk kantor"]'::jsonb, 2, '入社 dibaca にゅうしゃ, artinya "masuk perusahaan".', 'makna sekanji', 'belum', 1791),
('K5-1792', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
入社', '["にゆしゃ", "にゅうしゃ", "にゆうしゃ", "にゅしゃ"]'::jsonb, 1, '入社 artinya "masuk perusahaan", dibaca にゅうしゃ.', 'youon / chouon- / youon+chouon-', 'belum', 1792),
('K5-1793', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
店（みせ）', '["jalan", "stasiun", "negara", "toko"]'::jsonb, 3, '店 dibaca みせ, artinya "toko".', 'makna se-ranah', 'belum', 1793),
('K5-1794', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
店', '["てん", "みぜ", "みせ", "もせ"]'::jsonb, 2, '店 artinya "toko", dibaca みせ. Membacanya てん adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1794),
('K5-1795', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
書店（しょてん）', '["toko buku", "cabang toko", "toko dagang", "depan toko"]'::jsonb, 0, '書店 dibaca しょてん, artinya "toko buku".', 'makna sekanji', 'belum', 1795),
('K5-1796', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
書店', '["しょうてん", "しょてん", "じょうてん", "じょてん"]'::jsonb, 1, '書店 artinya "toko buku", dibaca しょてん.', 'daku / chouon+ / daku+chouon+', 'belum', 1796),
('K5-1797', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
店員（てんいん）', '["pramuniaga", "kepala toko", "depan toko", "toko buku"]'::jsonb, 0, '店員 dibaca てんいん, artinya "pramuniaga".', 'makna sekanji', 'belum', 1797),
('K5-1798', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
店員', '["みせいん", "でんいん", "てんいん", "てんうん"]'::jsonb, 2, '店員 artinya "pramuniaga", dibaca てんいん. Membacanya みせいん adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1798),
('K5-1799', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
売店（ばいてん）', '["cabang toko", "buka toko", "toko dagang", "kios"]'::jsonb, 3, '売店 dibaca ばいてん, artinya "kios".', 'makna sekanji', 'belum', 1799),
('K5-1800', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
売店', '["ばおてん", "ばいてん", "ばおでん", "ばいでん"]'::jsonb, 1, '売店 artinya "kios", dibaca ばいてん.', 'vowel / daku / vowel+daku', 'belum', 1800)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-1801', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
商店（しょうてん）', '["toko buku", "cabang toko", "toko dagang", "buka toko"]'::jsonb, 2, '商店 dibaca しょうてん, artinya "toko dagang".', 'makna sekanji', 'belum', 1801),
('K5-1802', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
商店', '["しようてん", "じょうてん", "じようてん", "しょうてん"]'::jsonb, 3, '商店 artinya "toko dagang", dibaca しょうてん.', 'daku / youon / daku+youon', 'belum', 1802),
('K5-1803', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
支店（してん）', '["depan toko", "cabang toko", "kepala toko", "buka toko"]'::jsonb, 1, '支店 dibaca してん, artinya "cabang toko".', 'makna sekanji', 'belum', 1803),
('K5-1804', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
支店', '["してん", "じてん", "じでん", "しでん"]'::jsonb, 0, '支店 artinya "cabang toko", dibaca してん.', 'daku / daku+daku', 'belum', 1804),
('K5-1805', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
開店（かいてん）', '["buka toko", "kepala toko", "cabang toko", "depan toko"]'::jsonb, 0, '開店 dibaca かいてん, artinya "buka toko".', 'makna sekanji', 'belum', 1805),
('K5-1806', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
開店', '["かうてん", "がうてん", "かいてん", "がいてん"]'::jsonb, 2, '開店 artinya "buka toko", dibaca かいてん.', 'daku / vowel / daku+vowel', 'belum', 1806),
('K5-1807', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
閉店（へいてん）', '["cabang toko", "tutup toko", "buka toko", "depan toko"]'::jsonb, 1, '閉店 dibaca へいてん, artinya "tutup toko".', 'makna sekanji', 'belum', 1807),
('K5-1808', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
閉店', '["べてん", "べいてん", "へてん", "へいてん"]'::jsonb, 3, '閉店 artinya "tutup toko", dibaca へいてん.', 'daku / chouon- / daku+chouon-', 'belum', 1808),
('K5-1809', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
店長（てんちょう）', '["buka toko", "tutup toko", "kepala toko", "depan toko"]'::jsonb, 2, '店長 dibaca てんちょう, artinya "kepala toko".', 'makna sekanji', 'belum', 1809),
('K5-1810', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
店長', '["てんちょう", "でんちょう", "てんっちょう", "みせちょう"]'::jsonb, 0, '店長 artinya "kepala toko", dibaca てんちょう. Membacanya みせちょう adalah kekeliruan yang umum.', 'on↔kun / daku / sokuon+', 'belum', 1810),
('K5-1811', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
店先（みせさき）', '["tutup toko", "cabang toko", "kepala toko", "depan toko"]'::jsonb, 3, '店先 dibaca みせさき, artinya "depan toko".', 'makna sekanji', 'belum', 1811),
('K5-1812', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
店先', '["めせさき", "みせさき", "てんさき", "みぜさき"]'::jsonb, 1, '店先 artinya "depan toko", dibaca みせさき. Membacanya てんさき adalah kekeliruan yang umum.', 'on↔kun / vowel / daku', 'belum', 1812),
('K5-1813', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅（えき）', '["toko", "negara", "mobil", "stasiun"]'::jsonb, 3, '駅 dibaca えき, artinya "stasiun".', 'makna se-ranah', 'belum', 1813),
('K5-1814', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅', '["えぎ", "えき", "うぎ", "うき"]'::jsonb, 1, '駅 artinya "stasiun", dibaca えき.', 'vowel / daku / vowel+daku', 'belum', 1814),
('K5-1815', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅員（えきいん）', '["petugas stasiun", "tiap stasiun", "kepala stasiun", "bekal stasiun"]'::jsonb, 0, '駅員 dibaca えきいん, artinya "petugas stasiun".', 'makna sekanji', 'belum', 1815),
('K5-1816', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅員', '["うぎいん", "えぎいん", "えきいん", "うきいん"]'::jsonb, 2, '駅員 artinya "petugas stasiun", dibaca えきいん.', 'vowel / daku / vowel+daku', 'belum', 1816),
('K5-1817', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
東京駅（とうきょうえき）', '["Stasiun Tokyo", "stasiun otomatis", "stasiun akhir", "nama stasiun"]'::jsonb, 0, '東京駅 dibaca とうきょうえき, artinya "Stasiun Tokyo".', 'makna sekanji', 'belum', 1817),
('K5-1818', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
東京駅', '["ときょうえき", "どきょうえき", "どうきょうえき", "とうきょうえき"]'::jsonb, 3, '東京駅 artinya "Stasiun Tokyo", dibaca とうきょうえき.', 'daku / chouon- / daku+chouon-', 'belum', 1818),
('K5-1819', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅名（えきめい）', '["kepala stasiun", "nama stasiun", "petugas stasiun", "bekal stasiun"]'::jsonb, 1, '駅名 dibaca えきめい, artinya "nama stasiun".', 'makna sekanji', 'belum', 1819),
('K5-1820', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅名', '["うきめい", "うぎめい", "えきめい", "えぎめい"]'::jsonb, 2, '駅名 artinya "nama stasiun", dibaca えきめい.', 'vowel / daku / vowel+daku', 'belum', 1820),
('K5-1821', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
各駅（かくえき）', '["petugas stasiun", "nama stasiun", "bekal stasiun", "tiap stasiun"]'::jsonb, 3, '各駅 dibaca かくえき, artinya "tiap stasiun".', 'makna sekanji', 'belum', 1821),
('K5-1822', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
各駅', '["かくえき", "がくえき", "がぐえき", "かぐえき"]'::jsonb, 0, '各駅 artinya "tiap stasiun", dibaca かくえき.', 'daku / daku+daku', 'belum', 1822),
('K5-1823', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
終着駅（しゅうちゃくえき）', '["bekal stasiun", "Stasiun Tokyo", "stasiun akhir", "stasiun otomatis"]'::jsonb, 2, '終着駅 dibaca しゅうちゃくえき, artinya "stasiun akhir".', 'makna sekanji', 'belum', 1823),
('K5-1824', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
終着駅', '["じゆうちゃくえき", "しゅうちゃくえき", "じゅうちゃくえき", "しゆうちゃくえき"]'::jsonb, 1, '終着駅 artinya "stasiun akhir", dibaca しゅうちゃくえき.', 'daku / youon / daku+youon', 'belum', 1824),
('K5-1825', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅弁（えきべん）', '["petugas stasiun", "tiap stasiun", "bekal stasiun", "kepala stasiun"]'::jsonb, 2, '駅弁 dibaca えきべん, artinya "bekal stasiun".', 'makna sekanji', 'belum', 1825),
('K5-1826', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅弁', '["えきべん", "あぎべん", "えぎべん", "あきべん"]'::jsonb, 0, '駅弁 artinya "bekal stasiun", dibaca えきべん.', 'vowel / daku / vowel+daku', 'belum', 1826),
('K5-1827', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅長（えきちょう）', '["bekal stasiun", "petugas stasiun", "tiap stasiun", "kepala stasiun"]'::jsonb, 3, '駅長 dibaca えきちょう, artinya "kepala stasiun".', 'makna sekanji', 'belum', 1827),
('K5-1828', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅長', '["あぎちょう", "えきちょう", "えぎちょう", "あきちょう"]'::jsonb, 1, '駅長 artinya "kepala stasiun", dibaca えきちょう.', 'vowel / daku / vowel+daku', 'belum', 1828),
('K5-1829', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
無人駅（むじんえき）', '["tiap stasiun", "stasiun otomatis", "stasiun akhir", "Stasiun Tokyo"]'::jsonb, 1, '無人駅 dibaca むじんえき, artinya "stasiun otomatis".', 'makna sekanji', 'belum', 1829),
('K5-1830', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
無人駅', '["むうじんえき", "むしんえき", "むじんえき", "むうしんえき"]'::jsonb, 2, '無人駅 artinya "stasiun otomatis", dibaca むじんえき.', 'chouon+ / daku / chouon++daku', 'belum', 1830),
('K5-1831', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駅伝（えきでん）', '["lari estafet", "nama stasiun", "tiap stasiun", "kepala stasiun"]'::jsonb, 0, '駅伝 dibaca えきでん, artinya "lari estafet".', 'makna sekanji', 'belum', 1831),
('K5-1832', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駅伝', '["あきでん", "えぎでん", "あぎでん", "えきでん"]'::jsonb, 3, '駅伝 artinya "lari estafet", dibaca えきでん.', 'vowel / daku / vowel+daku', 'belum', 1832),
('K5-1833', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国（くに）', '["jalan", "mobil", "negara", "stasiun"]'::jsonb, 2, '国 dibaca くに, artinya "negara".', 'makna se-ranah', 'belum', 1833),
('K5-1834', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国', '["くの", "くに", "ぐに", "ぐの"]'::jsonb, 1, '国 artinya "negara", dibaca くに.', 'daku / vowel / daku+vowel', 'belum', 1834),
('K5-1835', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国内（こくない）', '["produksi lokal", "negara kepulauan", "seluruh negeri", "dalam negeri"]'::jsonb, 3, '国内 dibaca こくない, artinya "dalam negeri".', 'makna sekanji', 'belum', 1835),
('K5-1836', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国内', '["こくない", "ごくない", "こぐない", "ごぐない"]'::jsonb, 0, '国内 artinya "dalam negeri", dibaca こくない.', 'daku / daku+daku', 'belum', 1836),
('K5-1837', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国際（こくさい）', '["rakyat", "produksi lokal", "bahasa nasional", "internasional"]'::jsonb, 3, '国際 dibaca こくさい, artinya "internasional".', 'makna sekanji', 'belum', 1837),
('K5-1838', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国際', '["こくさい", "ごくさい", "ごぐさい", "こぐさい"]'::jsonb, 0, '国際 artinya "internasional", dibaca こくさい.', 'daku / daku+daku', 'belum', 1838),
('K5-1839', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国語（こくご）', '["perbatasan", "produksi lokal", "bahasa nasional", "seluruh negeri"]'::jsonb, 2, '国語 dibaca こくご, artinya "bahasa nasional".', 'makna sekanji', 'belum', 1839),
('K5-1840', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国語', '["ごくご", "こくご", "こぐご", "ごぐご"]'::jsonb, 1, '国語 artinya "bahasa nasional", dibaca こくご.', 'daku / daku+daku', 'belum', 1840),
('K5-1841', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国民（こくみん）', '["rakyat", "perbatasan", "bendera negara", "dalam negeri"]'::jsonb, 0, '国民 dibaca こくみん, artinya "rakyat".', 'makna sekanji', 'belum', 1841),
('K5-1842', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国民', '["こぐみん", "ごくみん", "ごぐみん", "こくみん"]'::jsonb, 3, '国民 artinya "rakyat", dibaca こくみん.', 'daku / daku+daku', 'belum', 1842),
('K5-1843', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
全国（ぜんこく）', '["bahasa nasional", "seluruh negeri", "bendera negara", "dalam negeri"]'::jsonb, 1, '全国 dibaca ぜんこく, artinya "seluruh negeri".', 'makna sekanji', 'belum', 1843),
('K5-1844', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
全国', '["ぜんごく", "せんこく", "ぜんこく", "せんごく"]'::jsonb, 2, '全国 artinya "seluruh negeri", dibaca ぜんこく.', 'daku / daku+daku', 'belum', 1844),
('K5-1845', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国旗（こっき）', '["internasional", "perbatasan", "negara kepulauan", "bendera negara"]'::jsonb, 3, '国旗 dibaca こっき, artinya "bendera negara".', 'makna sekanji', 'belum', 1845),
('K5-1846', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国旗', '["こっき", "ごき", "ごっき", "こき"]'::jsonb, 0, '国旗 artinya "bendera negara", dibaca こっき.', 'daku / sokuon- / daku+sokuon-', 'belum', 1846),
('K5-1847', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
島国（しまぐに）', '["produksi lokal", "negara kepulauan", "internasional", "bendera negara"]'::jsonb, 1, '島国 dibaca しまぐに, artinya "negara kepulauan".', 'makna sekanji', 'belum', 1847),
('K5-1848', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
島国', '["じまぐに", "しむぐに", "しまぐに", "じむぐに"]'::jsonb, 2, '島国 artinya "negara kepulauan", dibaca しまぐに.', 'daku / vowel / daku+vowel', 'belum', 1848),
('K5-1849', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国境（こっきょう）', '["rakyat", "dalam negeri", "seluruh negeri", "perbatasan"]'::jsonb, 3, '国境 dibaca こっきょう, artinya "perbatasan".', 'makna sekanji', 'belum', 1849),
('K5-1850', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国境', '["こっきょう", "こきょう", "ごっきょう", "ごきょう"]'::jsonb, 0, '国境 artinya "perbatasan", dibaca こっきょう.', 'daku / sokuon- / daku+sokuon-', 'belum', 1850),
('K5-1851', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
国産（こくさん）', '["perbatasan", "produksi lokal", "internasional", "bahasa nasional"]'::jsonb, 1, '国産 dibaca こくさん, artinya "produksi lokal".', 'makna sekanji', 'belum', 1851),
('K5-1852', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
国産', '["ごくさん", "こぐさん", "こくさん", "ごぐさん"]'::jsonb, 2, '国産 artinya "produksi lokal", dibaca こくさん.', 'daku / daku+daku', 'belum', 1852),
('K5-1853', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
車（くるま）', '["negara", "mobil", "jalan", "stasiun"]'::jsonb, 1, '車 dibaca くるま, artinya "mobil".', 'makna se-ranah', 'belum', 1853),
('K5-1854', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
車', '["くるま", "ぐるま", "しゃ", "くるうま"]'::jsonb, 0, '車 artinya "mobil", dibaca くるま. Membacanya しゃ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon+', 'belum', 1854),
('K5-1855', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電車（でんしゃ）', '["tenaga listrik", "naik kendaraan", "kereta listrik", "roda"]'::jsonb, 2, '電車 dibaca でんしゃ, artinya "kereta listrik".', 'makna sekanji', 'belum', 1855),
('K5-1856', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電車', '["てんじゃ", "でんじゃ", "てんしゃ", "でんしゃ"]'::jsonb, 3, '電車 artinya "kereta listrik", dibaca でんしゃ.', 'daku / daku+daku', 'belum', 1856),
('K5-1857', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
自転車（じてんしゃ）', '["mobil (istilah)", "mobil bekas", "tempat parkir", "sepeda"]'::jsonb, 3, '自転車 dibaca じてんしゃ, artinya "sepeda".', 'makna sekanji', 'belum', 1857),
('K5-1858', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
自転車', '["じてんしゃ", "じでんしゃ", "してんしゃ", "しでんしゃ"]'::jsonb, 0, '自転車 artinya "sepeda", dibaca じてんしゃ.', 'daku / daku+daku', 'belum', 1858),
('K5-1859', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
自動車（じどうしゃ）', '["sepeda", "tempat parkir", "mobil (istilah)", "mobil bekas"]'::jsonb, 2, '自動車 dibaca じどうしゃ, artinya "mobil (istilah)".', 'makna sekanji', 'belum', 1859),
('K5-1860', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
自動車', '["しどうしゃ", "じどうしゃ", "じとうしゃ", "しとうしゃ"]'::jsonb, 1, '自動車 artinya "mobil (istilah)", dibaca じどうしゃ.', 'daku / daku+daku', 'belum', 1860),
('K5-1861', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
駐車場（ちゅうしゃじょう）', '["mobil bekas", "sepeda", "tempat parkir", "mobil (istilah)"]'::jsonb, 2, '駐車場 dibaca ちゅうしゃじょう, artinya "tempat parkir".', 'makna sekanji', 'belum', 1861),
('K5-1862', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
駐車場', '["ちゆうしゃじょう", "ちゆしゃじょう", "ちゅしゃじょう", "ちゅうしゃじょう"]'::jsonb, 3, '駐車場 artinya "tempat parkir", dibaca ちゅうしゃじょう.', 'youon / chouon- / youon+chouon-', 'belum', 1862),
('K5-1863', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
車庫（しゃこ）', '["garasi", "jalur kendaraan", "roda", "naik kendaraan"]'::jsonb, 0, '車庫 dibaca しゃこ, artinya "garasi".', 'makna sekanji', 'belum', 1863),
('K5-1864', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
車庫', '["しやこ", "しゃこ", "じゃこ", "くるまこ"]'::jsonb, 1, '車庫 artinya "garasi", dibaca しゃこ. Membacanya くるまこ adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1864),
('K5-1865', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
乗車（じょうしゃ）', '["kereta listrik", "jalur kendaraan", "naik kendaraan", "garasi"]'::jsonb, 2, '乗車 dibaca じょうしゃ, artinya "naik kendaraan".', 'makna sekanji', 'belum', 1865),
('K5-1866', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
乗車', '["じょうしゃ", "しようしゃ", "しょうしゃ", "じようしゃ"]'::jsonb, 0, '乗車 artinya "naik kendaraan", dibaca じょうしゃ.', 'daku / youon / daku+youon', 'belum', 1866),
('K5-1867', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
車輪（しゃりん）', '["naik kendaraan", "roda", "kereta listrik", "jalur kendaraan"]'::jsonb, 1, '車輪 dibaca しゃりん, artinya "roda".', 'makna sekanji', 'belum', 1867),
('K5-1868', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
車輪', '["じゃりん", "くるまりん", "しやりん", "しゃりん"]'::jsonb, 3, '車輪 artinya "roda", dibaca しゃりん. Membacanya くるまりん adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1868),
('K5-1869', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
中古車（ちゅうこしゃ）', '["tempat parkir", "mobil bekas", "sepeda", "mobil (istilah)"]'::jsonb, 1, '中古車 dibaca ちゅうこしゃ, artinya "mobil bekas".', 'makna sekanji', 'belum', 1869),
('K5-1870', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
中古車', '["ちゅうこしゃ", "ちゅこしゃ", "ちゆうこしゃ", "ちゆこしゃ"]'::jsonb, 0, '中古車 artinya "mobil bekas", dibaca ちゅうこしゃ.', 'youon / chouon- / youon+chouon-', 'belum', 1870),
('K5-1871', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
車道（しゃどう）', '["garasi", "roda", "jalur kendaraan", "naik kendaraan"]'::jsonb, 2, '車道 dibaca しゃどう, artinya "jalur kendaraan".', 'makna sekanji', 'belum', 1871),
('K5-1872', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
車道', '["しやどう", "くるまどう", "じゃどう", "しゃどう"]'::jsonb, 3, '車道 artinya "jalur kendaraan", dibaca しゃどう. Membacanya くるまどう adalah kekeliruan yang umum.', 'on↔kun / daku / youon', 'belum', 1872),
('K5-1873', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電気（でんき）', '["listrik", "mati listrik", "tenaga listrik", "kereta listrik"]'::jsonb, 0, '電気 dibaca でんき, artinya "listrik".', 'makna sekanji', 'belum', 1873),
('K5-1874', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電気', '["てんき", "てんぎ", "でんき", "でんぎ"]'::jsonb, 2, '電気 artinya "listrik", dibaca でんき.', 'daku / daku+daku', 'belum', 1874),
('K5-1875', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電池（でんち）', '["bohlam", "tenaga listrik", "elektronik rumah", "baterai"]'::jsonb, 3, '電池 dibaca でんち, artinya "baterai".', 'makna sekanji', 'belum', 1875),
('K5-1876', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電池', '["でんっち", "でんち", "てんっち", "てんち"]'::jsonb, 1, '電池 artinya "baterai", dibaca でんち.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1876),
('K5-1877', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電源（でんげん）', '["tenaga listrik", "sumber daya", "mengisi daya", "bohlam"]'::jsonb, 1, '電源 dibaca でんげん, artinya "sumber daya".', 'makna sekanji', 'belum', 1877),
('K5-1878', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電源', '["てんげん", "でんけん", "てんけん", "でんげん"]'::jsonb, 3, '電源 artinya "sumber daya", dibaca でんげん.', 'daku / daku+daku', 'belum', 1878),
('K5-1879', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
停電（ていでん）', '["mati listrik", "listrik", "kereta listrik", "tenaga listrik"]'::jsonb, 0, '停電 dibaca ていでん, artinya "mati listrik".', 'makna sekanji', 'belum', 1879),
('K5-1880', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
停電', '["てでん", "でいでん", "ていでん", "ででん"]'::jsonb, 2, '停電 artinya "mati listrik", dibaca ていでん.', 'daku / chouon- / daku+chouon-', 'belum', 1880),
('K5-1881', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電力（でんりょく）', '["listrik", "tenaga listrik", "kereta listrik", "mati listrik"]'::jsonb, 1, '電力 dibaca でんりょく, artinya "tenaga listrik".', 'makna sekanji', 'belum', 1881),
('K5-1882', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電力', '["でんりょく", "てんりょうく", "でんりょうく", "てんりょく"]'::jsonb, 0, '電力 artinya "tenaga listrik", dibaca でんりょく.', 'daku / chouon+ / daku+chouon+', 'belum', 1882),
('K5-1883', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
家電（かでん）', '["mati listrik", "sumber daya", "baterai", "elektronik rumah"]'::jsonb, 3, '家電 dibaca かでん, artinya "elektronik rumah".', 'makna sekanji', 'belum', 1883),
('K5-1884', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
家電', '["かてん", "がでん", "かでん", "がてん"]'::jsonb, 2, '家電 artinya "elektronik rumah", dibaca かでん.', 'daku / daku+daku', 'belum', 1884),
('K5-1885', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電球（でんきゅう）', '["tenaga listrik", "bohlam", "baterai", "telegram"]'::jsonb, 1, '電球 dibaca でんきゅう, artinya "bohlam".', 'makna sekanji', 'belum', 1885),
('K5-1886', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電球', '["てんきゅう", "でんぎゅう", "でんきゅう", "てんぎゅう"]'::jsonb, 2, '電球 artinya "bohlam", dibaca でんきゅう.', 'daku / daku+daku', 'belum', 1886),
('K5-1887', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
電報（でんぽう）', '["bohlam", "listrik", "elektronik rumah", "telegram"]'::jsonb, 3, '電報 dibaca でんぽう, artinya "telegram".', 'makna sekanji', 'belum', 1887),
('K5-1888', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
電報', '["でんぽう", "てんぼう", "てんぽう", "でんぼう"]'::jsonb, 0, '電報 artinya "telegram", dibaca でんぽう.', 'daku / daku+daku', 'belum', 1888),
('K5-1889', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
充電（じゅうでん）', '["baterai", "sumber daya", "mengisi daya", "elektronik rumah"]'::jsonb, 2, '充電 dibaca じゅうでん, artinya "mengisi daya".', 'makna sekanji', 'belum', 1889),
('K5-1890', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
充電', '["じゆうでん", "しゆうでん", "しゅうでん", "じゅうでん"]'::jsonb, 3, '充電 artinya "mengisi daya", dibaca じゅうでん.', 'daku / youon / daku+youon', 'belum', 1890),
('K5-1891', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
元気（げんき）', '["pemarah", "sehat bugar", "santai saja", "sakit"]'::jsonb, 1, '元気 dibaca げんき, artinya "sehat bugar".', 'makna sekanji', 'belum', 1891),
('K5-1892', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
元気', '["げんき", "げんぎ", "けんき", "けんぎ"]'::jsonb, 0, '元気 artinya "sehat bugar", dibaca げんき.', 'daku / daku+daku', 'belum', 1892),
('K5-1893', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
病気（びょうき）', '["sakit", "iklim", "pemarah", "kelembapan"]'::jsonb, 0, '病気 dibaca びょうき, artinya "sakit".', 'makna sekanji', 'belum', 1893),
('K5-1894', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
病気', '["ひょうき", "びょうき", "びようき", "ひようき"]'::jsonb, 1, '病気 artinya "sakit", dibaca びょうき.', 'daku / youon / daku+youon', 'belum', 1894),
('K5-1895', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
気持ち（きもち）', '["semangat", "sakit", "listrik", "perasaan"]'::jsonb, 3, '気持ち dibaca きもち, artinya "perasaan".', 'makna sekanji', 'belum', 1895),
('K5-1896', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気持ち', '["きもうち", "ぎもうち", "きもち", "ぎもち"]'::jsonb, 2, '気持ち artinya "perasaan", dibaca きもち.', 'daku / chouon+ / daku+chouon+', 'belum', 1896),
('K5-1897', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
気温（きおん）', '["sakit", "kelembapan", "iklim", "suhu udara"]'::jsonb, 3, '気温 dibaca きおん, artinya "suhu udara".', 'makna sekanji', 'belum', 1897),
('K5-1898', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気温', '["きおうん", "きおん", "ぎおうん", "ぎおん"]'::jsonb, 1, '気温 artinya "suhu udara", dibaca きおん.', 'daku / chouon+ / daku+chouon+', 'belum', 1898),
('K5-1899', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
湿気（しっけ）', '["kelembapan", "iklim", "pemarah", "sakit"]'::jsonb, 0, '湿気 dibaca しっけ, artinya "kelembapan".', 'makna sekanji', 'belum', 1899),
('K5-1900', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
湿気', '["じっけ", "しけ", "しっけ", "じけ"]'::jsonb, 2, '湿気 artinya "kelembapan", dibaca しっけ.', 'daku / sokuon- / daku+sokuon-', 'belum', 1900),
('K5-1901', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
気候（きこう）', '["suhu udara", "sakit", "iklim", "kelembapan"]'::jsonb, 2, '気候 dibaca きこう, artinya "iklim".', 'makna sekanji', 'belum', 1901),
('K5-1902', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気候', '["きごう", "きこう", "ぎこう", "ぎごう"]'::jsonb, 1, '気候 artinya "iklim", dibaca きこう.', 'daku / daku+daku', 'belum', 1902),
('K5-1903', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
平気（へいき）', '["listrik", "suhu udara", "pemarah", "santai saja"]'::jsonb, 3, '平気 dibaca へいき, artinya "santai saja".', 'makna sekanji', 'belum', 1903),
('K5-1904', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
平気', '["へいき", "へき", "へぎ", "へいぎ"]'::jsonb, 0, '平気 artinya "santai saja", dibaca へいき.', 'chouon- / daku / chouon-+daku', 'belum', 1904),
('K5-1905', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
気合い（きあい）', '["iklim", "pemarah", "semangat", "perasaan"]'::jsonb, 2, '気合い dibaca きあい, artinya "semangat".', 'makna sekanji', 'belum', 1905),
('K5-1906', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
気合い', '["ぎあい", "きあい", "ぎえい", "きえい"]'::jsonb, 1, '気合い artinya "semangat", dibaca きあい.', 'daku / vowel / daku+vowel', 'belum', 1906),
('K5-1907', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
短気（たんき）', '["pemarah", "iklim", "santai saja", "listrik"]'::jsonb, 0, '短気 dibaca たんき, artinya "pemarah".', 'makna sekanji', 'belum', 1907),
('K5-1908', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
短気', '["だんぎ", "だんき", "たんぎ", "たんき"]'::jsonb, 3, '短気 artinya "pemarah", dibaca たんき.', 'daku / daku+daku', 'belum', 1908),
('K5-1909', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
道（みち）', '["mobil", "jalan", "toko", "stasiun"]'::jsonb, 1, '道 dibaca みち, artinya "jalan".', 'makna se-ranah', 'belum', 1909),
('K5-1910', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
道', '["みち", "みっち", "まち", "どう"]'::jsonb, 0, '道 artinya "jalan", dibaca みち. Membacanya どう adalah kekeliruan yang umum.', 'on↔kun / vowel / sokuon+', 'belum', 1910),
('K5-1911', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
道路（どうろ）', '["upacara teh", "sekali jalan", "jalan raya", "jalan pintas"]'::jsonb, 2, '道路 dibaca どうろ, artinya "jalan raya".', 'makna sekanji', 'belum', 1911),
('K5-1912', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
道路', '["どろ", "みちろ", "とうろ", "どうろ"]'::jsonb, 3, '道路 artinya "jalan raya", dibaca どうろ. Membacanya みちろ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1912),
('K5-1913', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
歩道（ほどう）', '["trotoar", "sekali jalan", "moral", "jalan pintas"]'::jsonb, 0, '歩道 dibaca ほどう, artinya "trotoar".', 'makna sekanji', 'belum', 1913),
('K5-1914', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
歩道', '["ほと", "ほとう", "ほどう", "ほど"]'::jsonb, 2, '歩道 artinya "trotoar", dibaca ほどう.', 'daku / chouon- / daku+chouon-', 'belum', 1914),
('K5-1915', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
鉄道（てつどう）', '["kereta listrik", "trotoar", "sekali jalan", "kereta api"]'::jsonb, 3, '鉄道 dibaca てつどう, artinya "kereta api".', 'makna sekanji', 'belum', 1915),
('K5-1916', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
鉄道', '["でっつどう", "てつどう", "てっつどう", "でつどう"]'::jsonb, 1, '鉄道 artinya "kereta api", dibaca てつどう.', 'daku / sokuon+ / daku+sokuon+', 'belum', 1916),
('K5-1917', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
柔道（じゅうどう）', '["moral", "jalan raya", "judo", "sekali jalan"]'::jsonb, 2, '柔道 dibaca じゅうどう, artinya "judo".', 'makna sekanji', 'belum', 1917),
('K5-1918', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
柔道', '["しゅうどう", "じゅうどう", "しゆうどう", "じゆうどう"]'::jsonb, 1, '柔道 artinya "judo", dibaca じゅうどう.', 'daku / youon / daku+youon', 'belum', 1918),
('K5-1919', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
茶道（さどう）', '["trotoar", "moral", "kereta api", "upacara teh"]'::jsonb, 3, '茶道 dibaca さどう, artinya "upacara teh".', 'makna sekanji', 'belum', 1919),
('K5-1920', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
茶道', '["さどう", "ざとう", "さとう", "ざどう"]'::jsonb, 0, '茶道 artinya "upacara teh", dibaca さどう.', 'daku / daku+daku', 'belum', 1920),
('K5-1921', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
道具（どうぐ）', '["moral", "jalan raya", "alat", "judo"]'::jsonb, 2, '道具 dibaca どうぐ, artinya "alat".', 'makna sekanji', 'belum', 1921),
('K5-1922', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
道具', '["どぐ", "みちぐ", "とうぐ", "どうぐ"]'::jsonb, 3, '道具 artinya "alat", dibaca どうぐ. Membacanya みちぐ adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1922),
('K5-1923', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
近道（ちかみち）', '["jalan pintas", "jalan raya", "sekali jalan", "moral"]'::jsonb, 0, '近道 dibaca ちかみち, artinya "jalan pintas".', 'makna sekanji', 'belum', 1923),
('K5-1924', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
近道', '["たがみち", "ちかみち", "たかみち", "ちがみち"]'::jsonb, 1, '近道 artinya "jalan pintas", dibaca ちかみち.', 'vowel / daku / vowel+daku', 'belum', 1924),
('K5-1925', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
片道（かたみち）', '["jalan raya", "jalan pintas", "sekali jalan", "kereta api"]'::jsonb, 2, '片道 dibaca かたみち, artinya "sekali jalan".', 'makna sekanji', 'belum', 1925),
('K5-1926', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
片道', '["かだみち", "がたみち", "がだみち", "かたみち"]'::jsonb, 3, '片道 artinya "sekali jalan", dibaca かたみち.', 'daku / daku+daku', 'belum', 1926),
('K5-1927', 'N5', 'kanji', 'Arti', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Apa arti kata berikut?
道徳（どうとく）', '["jalan pintas", "moral", "trotoar", "upacara teh"]'::jsonb, 1, '道徳 dibaca どうとく, artinya "moral".', 'makna sekanji', 'belum', 1927),
('K5-1928', 'N5', 'kanji', 'Bacaan', 9, 'T09', 'Tempat & Transportasi', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
道徳', '["どうとく", "とうとく", "みちとく", "どとく"]'::jsonb, 0, '道徳 artinya "moral", dibaca どうとく. Membacanya みちとく adalah kekeliruan yang umum.', 'on↔kun / daku / chouon-', 'belum', 1928),
('K5-1929', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今（いま）', '["tiap menit", "apa", "geometri", "sekarang"]'::jsonb, 3, '今 dibaca いま, artinya "sekarang".', 'makna se-ranah', 'belum', 1929),
('K5-1930', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今', '["いむ", "いま", "こん", "えま"]'::jsonb, 1, '今 artinya "sekarang", dibaca いま. Membacanya こん adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1930),
('K5-1931', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今回（こんかい）', '["kali ini", "akhir-akhir ini", "malam ini", "pagi ini"]'::jsonb, 0, '今回 dibaca こんかい, artinya "kali ini".', 'makna sekanji', 'belum', 1931),
('K5-1932', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今回', '["いまかい", "ごんかい", "こんかい", "こんがい"]'::jsonb, 2, '今回 artinya "kali ini", dibaca こんかい. Membacanya いまかい adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1932),
('K5-1933', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今度（こんど）', '["berapa kali", "lain kali", "kali ini", "aku pulang"]'::jsonb, 1, '今度 dibaca こんど, artinya "lain kali".', 'makna sekanji', 'belum', 1933),
('K5-1934', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今度', '["こんど", "いまど", "ごんど", "こんと"]'::jsonb, 0, '今度 artinya "lain kali", dibaca こんど. Membacanya いまど adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1934),
('K5-1935', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今夜（こんや）', '["akhir-akhir ini", "kali ini", "pagi ini", "malam ini"]'::jsonb, 3, '今夜 dibaca こんや, artinya "malam ini".', 'makna sekanji', 'belum', 1935),
('K5-1936', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今夜', '["ごんや", "こんよ", "こんや", "いまや"]'::jsonb, 2, '今夜 artinya "malam ini", dibaca こんや. Membacanya いまや adalah kekeliruan yang umum.', 'on↔kun / daku / vowel', 'belum', 1936),
('K5-1937', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今朝（けさ）', '["akhir-akhir ini", "pagi ini", "malam ini", "kali ini"]'::jsonb, 1, '今朝 dibaca けさ, artinya "pagi ini".', 'makna sekanji', 'belum', 1937),
('K5-1938', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今朝', '["げさ", "けざ", "けさ", "げざ"]'::jsonb, 2, '今朝 artinya "pagi ini", dibaca けさ.', 'daku / daku+daku', 'belum', 1938),
('K5-1939', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
只今（ただいま）', '["aku pulang", "akhir-akhir ini", "sekarang baru", "nanti malam"]'::jsonb, 0, '只今 dibaca ただいま, artinya "aku pulang".', 'makna sekanji', 'belum', 1939),
('K5-1940', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
只今', '["たたいま", "だたいま", "だだいま", "ただいま"]'::jsonb, 3, '只今 artinya "aku pulang", dibaca ただいま.', 'daku / daku+daku', 'belum', 1940),
('K5-1941', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今晩（こんばん）', '["nanti malam", "malam ini", "akhir-akhir ini", "setiap malam"]'::jsonb, 0, '今晩 dibaca こんばん, artinya "nanti malam".', 'makna sekanji', 'belum', 1941),
('K5-1942', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今晩', '["こんぱん", "こんばん", "いまばん", "ごんばん"]'::jsonb, 1, '今晩 artinya "nanti malam", dibaca こんばん. Membacanya いまばん adalah kekeliruan yang umum.', 'on↔kun / daku', 'belum', 1942),
('K5-1943', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
昨今（さっこん）', '["kali ini", "pagi ini", "malam ini", "akhir-akhir ini"]'::jsonb, 3, '昨今 dibaca さっこん, artinya "akhir-akhir ini".', 'makna sekanji', 'belum', 1943),
('K5-1944', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
昨今', '["ざっこん", "ざこん", "さっこん", "さこん"]'::jsonb, 2, '昨今 artinya "akhir-akhir ini", dibaca さっこん.', 'daku / sokuon- / daku+sokuon-', 'belum', 1944),
('K5-1945', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今時（いまどき）', '["lain kali", "zaman sekarang", "akhir-akhir ini", "sekarang baru"]'::jsonb, 1, '今時 dibaca いまどき, artinya "zaman sekarang".', 'makna sekanji', 'belum', 1945),
('K5-1946', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今時', '["こんどき", "いむどき", "えまどき", "いまどき"]'::jsonb, 3, '今時 artinya "zaman sekarang", dibaca いまどき. Membacanya こんどき adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1946),
('K5-1947', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
今更（いまさら）', '["sekarang baru", "nanti malam", "lain kali", "zaman sekarang"]'::jsonb, 0, '今更 dibaca いまさら, artinya "sekarang baru".', 'makna sekanji', 'belum', 1947),
('K5-1948', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
今更', '["あまさら", "いみさら", "いまさら", "こんさら"]'::jsonb, 2, '今更 artinya "sekarang baru", dibaca いまさら. Membacanya こんさら adalah kekeliruan yang umum.', 'on↔kun / vowel', 'belum', 1948),
('K5-1949', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何（なに）', '["apa", "tengah hari", "sekarang", "pagi (AM)"]'::jsonb, 0, '何 dibaca なに, artinya "apa".', 'makna se-ranah', 'belum', 1949),
('K5-1950', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何', '["ねに", "ねね", "なね", "なに"]'::jsonb, 3, '何 artinya "apa", dibaca なに.', 'vowel / vowel+vowel', 'belum', 1950),
('K5-1951', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何人（なんにん）', '["berapa derajat", "berapa kali", "berapa orang", "berapa umur"]'::jsonb, 2, '何人 dibaca なんにん, artinya "berapa orang".', 'makna sekanji', 'belum', 1951),
('K5-1952', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何人', '["なんねん", "なんにん", "にんねん", "にんにん"]'::jsonb, 1, '何人 artinya "berapa orang", dibaca なんにん.', 'vowel / vowel+vowel', 'belum', 1952),
('K5-1953', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何歳（なんさい）', '["berapa kali", "berapa derajat", "berapa umur", "berapa orang"]'::jsonb, 2, '何歳 dibaca なんさい, artinya "berapa umur".', 'makna sekanji', 'belum', 1953),
('K5-1954', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何歳', '["なんさい", "ねんさい", "なんざい", "ねんざい"]'::jsonb, 0, '何歳 artinya "berapa umur", dibaca なんさい.', 'vowel / daku / vowel+daku', 'belum', 1954),
('K5-1955', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何回（なんかい）', '["berapa derajat", "berapa orang", "berapa umur", "berapa kali"]'::jsonb, 3, '何回 dibaca なんかい, artinya "berapa kali".', 'makna sekanji', 'belum', 1955),
('K5-1956', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何回', '["にんがい", "なんかい", "にんかい", "なんがい"]'::jsonb, 1, '何回 artinya "berapa kali", dibaca なんかい.', 'vowel / daku / vowel+daku', 'belum', 1956),
('K5-1957', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何色（なにいろ）', '["warna apa", "berapa derajat", "siapa gerangan", "hari apa"]'::jsonb, 0, '何色 dibaca なにいろ, artinya "warna apa".', 'makna sekanji', 'belum', 1957),
('K5-1958', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何色', '["なぬいろ", "なにいろ", "ぬにいろ", "ぬぬいろ"]'::jsonb, 1, '何色 artinya "warna apa", dibaca なにいろ.', 'vowel / vowel+vowel', 'belum', 1958),
('K5-1959', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何度（なんど）', '["berapa orang", "berapa kali", "berapa derajat", "berapa umur"]'::jsonb, 2, '何度 dibaca なんど, artinya "berapa derajat".', 'makna sekanji', 'belum', 1959),
('K5-1960', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何度', '["なんと", "ぬんと", "ぬんど", "なんど"]'::jsonb, 3, '何度 artinya "berapa derajat", dibaca なんど.', 'vowel / daku / vowel+daku', 'belum', 1960),
('K5-1961', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何曜日（なんようび）', '["warna apa", "geometri", "hari apa", "berapa umur"]'::jsonb, 2, '何曜日 dibaca なんようび, artinya "hari apa".', 'makna sekanji', 'belum', 1961),
('K5-1962', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何曜日', '["のんようび", "なんようび", "のんゆうび", "なんゆうび"]'::jsonb, 1, '何曜日 artinya "hari apa", dibaca なんようび.', 'vowel / vowel+vowel', 'belum', 1962),
('K5-1963', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
幾何学（きかがく）', '["biasa saja", "hari apa", "berapa umur", "geometri"]'::jsonb, 3, '幾何学 dibaca きかがく, artinya "geometri".', 'makna sekanji', 'belum', 1963),
('K5-1964', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
幾何学', '["きかがく", "ぎががく", "ぎかがく", "きががく"]'::jsonb, 0, '幾何学 artinya "geometri", dibaca きかがく.', 'daku / daku+daku', 'belum', 1964),
('K5-1965', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何気ない（なにげない）', '["geometri", "biasa saja", "berapa kali", "warna apa"]'::jsonb, 1, '何気ない dibaca なにげない, artinya "biasa saja".', 'makna sekanji', 'belum', 1965),
('K5-1966', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何気ない', '["なのげない", "にのげない", "なにげない", "ににげない"]'::jsonb, 2, '何気ない artinya "biasa saja", dibaca なにげない.', 'vowel / vowel+vowel', 'belum', 1966),
('K5-1967', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
何者（なにもの）', '["warna apa", "berapa orang", "berapa kali", "siapa gerangan"]'::jsonb, 3, '何者 dibaca なにもの, artinya "siapa gerangan".', 'makna sekanji', 'belum', 1967),
('K5-1968', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
何者', '["なにもの", "ねにもの", "ねなもの", "ななもの"]'::jsonb, 0, '何者 artinya "siapa gerangan", dibaca なにもの.', 'vowel / vowel+vowel', 'belum', 1968),
('K5-1969', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎朝（まいあさ）', '["setiap malam", "tiap kali makan", "setiap kali", "setiap pagi"]'::jsonb, 3, '毎朝 dibaca まいあさ, artinya "setiap pagi".', 'makna sekanji', 'belum', 1969),
('K5-1970', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎朝', '["もいあさ", "まいあさ", "まうあさ", "もうあさ"]'::jsonb, 1, '毎朝 artinya "setiap pagi", dibaca まいあさ.', 'vowel / vowel+vowel', 'belum', 1970),
('K5-1971', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎晩（まいばん）', '["setiap malam", "tiap edisi", "setiap pagi", "setiap kali"]'::jsonb, 0, '毎晩 dibaca まいばん, artinya "setiap malam".', 'makna sekanji', 'belum', 1971),
('K5-1972', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎晩', '["めおばん", "まおばん", "まいばん", "めいばん"]'::jsonb, 2, '毎晩 artinya "setiap malam", dibaca まいばん.', 'vowel / vowel+vowel', 'belum', 1972),
('K5-1973', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎回（まいかい）', '["tiap kali makan", "setiap kali", "setiap pagi", "setiap malam"]'::jsonb, 1, '毎回 dibaca まいかい, artinya "setiap kali".', 'makna sekanji', 'belum', 1973),
('K5-1974', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎回', '["まえかい", "みいかい", "まいかい", "みえかい"]'::jsonb, 2, '毎回 artinya "setiap kali", dibaca まいかい.', 'vowel / vowel+vowel', 'belum', 1974),
('K5-1975', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎度（まいど）', '["tiap kali", "tiap kali makan", "tiap detik", "tiap menit"]'::jsonb, 0, '毎度 dibaca まいど, artinya "tiap kali".', 'makna sekanji', 'belum', 1975),
('K5-1976', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎度', '["まあど", "むいど", "むあど", "まいど"]'::jsonb, 3, '毎度 artinya "tiap kali", dibaca まいど.', 'vowel / vowel+vowel', 'belum', 1976),
('K5-1977', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎時（まいじ）', '["tiap jam", "tiap kali", "tiap detik", "tiap menit"]'::jsonb, 0, '毎時 dibaca まいじ, artinya "tiap jam".', 'makna sekanji', 'belum', 1977),
('K5-1978', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎時', '["みいじ", "まうじ", "みうじ", "まいじ"]'::jsonb, 3, '毎時 artinya "tiap jam", dibaca まいじ.', 'vowel / vowel+vowel', 'belum', 1978),
('K5-1979', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎分（まいふん）', '["tiap detik", "tiap edisi", "tiap menit", "tiap kali makan"]'::jsonb, 2, '毎分 dibaca まいふん, artinya "tiap menit".', 'makna sekanji', 'belum', 1979),
('K5-1980', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎分', '["まあふん", "まいふん", "むあふん", "むいふん"]'::jsonb, 1, '毎分 artinya "tiap menit", dibaca まいふん.', 'vowel / vowel+vowel', 'belum', 1980),
('K5-1981', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎秒（まいびょう）', '["tiap jam", "tiap kali makan", "tiap detik", "tiap menit"]'::jsonb, 2, '毎秒 dibaca まいびょう, artinya "tiap detik".', 'makna sekanji', 'belum', 1981),
('K5-1982', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎秒', '["まえびょう", "まいびょう", "もえびょう", "もいびょう"]'::jsonb, 1, '毎秒 artinya "tiap detik", dibaca まいびょう.', 'vowel / vowel+vowel', 'belum', 1982),
('K5-1983', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎食（まいしょく）', '["tiap jam", "tiap detik", "tiap kali", "tiap kali makan"]'::jsonb, 3, '毎食 dibaca まいしょく, artinya "tiap kali makan".', 'makna sekanji', 'belum', 1983),
('K5-1984', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎食', '["まいしょく", "まおしょく", "みいしょく", "みおしょく"]'::jsonb, 0, '毎食 artinya "tiap kali makan", dibaca まいしょく.', 'vowel / vowel+vowel', 'belum', 1984),
('K5-1985', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎学期（まいがっき）', '["tiap jam", "tiap kali", "tiap menit", "tiap semester"]'::jsonb, 3, '毎学期 dibaca まいがっき, artinya "tiap semester".', 'makna sekanji', 'belum', 1985),
('K5-1986', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎学期', '["まいがっき", "みいがっき", "みおがっき", "まおがっき"]'::jsonb, 0, '毎学期 artinya "tiap semester", dibaca まいがっき.', 'vowel / vowel+vowel', 'belum', 1986),
('K5-1987', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
毎号（まいごう）', '["tiap detik", "tiap jam", "tiap edisi", "tiap kali"]'::jsonb, 2, '毎号 dibaca まいごう, artinya "tiap edisi".', 'makna sekanji', 'belum', 1987),
('K5-1988', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
毎号', '["まうごう", "まいごう", "むいごう", "むうごう"]'::jsonb, 1, '毎号 artinya "tiap edisi", dibaca まいごう.', 'vowel / vowel+vowel', 'belum', 1988),
('K5-1989', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
正午（しょうご）', '["jamuan siang", "Hari Anak", "pulang dini hari", "tengah hari"]'::jsonb, 3, '正午 dibaca しょうご, artinya "tengah hari".', 'makna sekanji', 'belum', 1989),
('K5-1990', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
正午', '["しようご", "しょうご", "じようご", "じょうご"]'::jsonb, 1, '正午 artinya "tengah hari", dibaca しょうご.', 'daku / youon / daku+youon', 'belum', 1990),
('K5-1991', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
午前様（ごぜんさま）', '["pulang dini hari", "tengah hari", "garis meridian", "Hari Anak"]'::jsonb, 0, '午前様 dibaca ごぜんさま, artinya "pulang dini hari".', 'makna sekanji', 'belum', 1991),
('K5-1992', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午前様', '["こせんさま", "ごせんさま", "ごぜんさま", "こぜんさま"]'::jsonb, 2, '午前様 artinya "pulang dini hari", dibaca ごぜんさま.', 'daku / daku+daku', 'belum', 1992),
('K5-1993', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
端午（たんご）', '["tengah hari", "siang (PM)", "pagi (AM)", "Hari Anak"]'::jsonb, 3, '端午 dibaca たんご, artinya "Hari Anak".', 'makna sekanji', 'belum', 1993),
('K5-1994', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
端午', '["だんこ", "たんこ", "たんご", "だんご"]'::jsonb, 2, '端午 artinya "Hari Anak", dibaca たんご.', 'daku / daku+daku', 'belum', 1994),
('K5-1995', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
午睡（ごすい）', '["siang (PM)", "tidur siang", "Hari Anak", "jamuan siang"]'::jsonb, 1, '午睡 dibaca ごすい, artinya "tidur siang".', 'makna sekanji', 'belum', 1995),
('K5-1996', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午睡', '["ごすい", "ごずい", "こずい", "こすい"]'::jsonb, 0, '午睡 artinya "tidur siang", dibaca ごすい.', 'daku / daku+daku', 'belum', 1996),
('K5-1997', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
子午線（しごせん）', '["tahun kuda", "pagi (AM)", "garis meridian", "pulang dini hari"]'::jsonb, 2, '子午線 dibaca しごせん, artinya "garis meridian".', 'makna sekanji', 'belum', 1997),
('K5-1998', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
子午線', '["しごせん", "しこせん", "じこせん", "じごせん"]'::jsonb, 0, '子午線 artinya "garis meridian", dibaca しごせん.', 'daku / daku+daku', 'belum', 1998),
('K5-1999', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
午年（うまどし）', '["tahun kuda api", "pagi (AM)", "tengah hari", "tahun kuda"]'::jsonb, 3, '午年 dibaca うまどし, artinya "tahun kuda".', 'makna sekanji', 'belum', 1999),
('K5-2000', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午年', '["うめどし", "うまどし", "えめどし", "えまどし"]'::jsonb, 1, '午年 artinya "tahun kuda", dibaca うまどし.', 'vowel / vowel+vowel', 'belum', 2000)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
INSERT INTO public.bank_soal (code, level, category, qtype, unit, group_code, group_label, mode, checkpoint, question, options, answer_index, explanation, distractor_basis, review_status, order_index) VALUES
('K5-2001', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
丙午（ひのえうま）', '["Hari Anak", "tahun kuda api", "siang (PM)", "tahun kuda"]'::jsonb, 1, '丙午 dibaca ひのえうま, artinya "tahun kuda api".', 'makna sekanji', 'belum', 2001),
('K5-2002', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
丙午', '["ひのえうま", "びのうえうま", "ひのうえうま", "びのえうま"]'::jsonb, 0, '丙午 artinya "tahun kuda api", dibaca ひのえうま.', 'daku / chouon+ / daku+chouon+', 'belum', 2002),
('K5-2003', 'N5', 'kanji', 'Arti', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Apa arti kata berikut?
午餐（ごさん）', '["tahun kuda", "tidur siang", "siang (PM)", "jamuan siang"]'::jsonb, 3, '午餐 dibaca ごさん, artinya "jamuan siang".', 'makna sekanji', 'belum', 2003),
('K5-2004', 'N5', 'kanji', 'Bacaan', 10, 'T10', 'Waktu Sehari-hari', 'latihan', NULL, 'Bacaan yang tepat untuk kata berikut adalah?
午餐', '["ござん", "こさん", "ごさん", "こざん"]'::jsonb, 2, '午餐 artinya "jamuan siang", dibaca ごさん.', 'daku / daku+daku', 'belum', 2004),
('G5-001-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'latihan', 'CP1', 'わたし（　）学生です。', '["で", "へ", "は", "を"]'::jsonb, 2, 'は menandai topik: ''Saya (adalah) pelajar''. を, へ, dan で butuh kata kerja, tidak bisa dipakai dengan です.', 'partikel tertukar (topik は vs objek/arah/tempat)', 'belum', 0),
('G5-001-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'latihan', 'CP1', '「ミラーさんは 日本人ですか。」「いいえ、日本人（　）。」', '["です", "ですか", "では", "じゃありません"]'::jsonb, 3, 'Jawaban いいえ harus diikuti bentuk negatif じゃありません. では saja belum lengkap, harus では ありません.', 'polaritas tak cocok dengan いいえ / bentuk negatif terpotong', 'belum', 1),
('G5-001-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'latihan', 'CP1', '「あの 人は 先生です（　）。」「はい、先生です。」', '["は", "か", "を", "に"]'::jsonb, 1, 'か di akhir kalimat mengubahnya jadi pertanyaan. Jawaban はい menunjukkan kalimat pertama adalah pertanyaan.', 'penanda tanya hilang / partikel tertukar', 'belum', 2),
('G5-001-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'latihan', 'CP1', '「サントスさんは ブラジル人ですか。」「はい、（　）。」', '["ブラジル人です", "ブラジル人ですか", "ブラジル人じゃありません", "そうじゃありません"]'::jsonb, 0, 'はい diikuti bentuk positif: ブラジル人です. Bentuk negatif bertentangan dengan はい, dan jawaban tidak memakai か.', 'polaritas bertentangan dengan はい / jawaban berbentuk tanya', 'belum', 3),
('G5-001-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'latihan', 'CP1', 'わたしは インドネシア人（　）。', '["ですか", "は", "です", "じゃ"]'::jsonb, 2, 'Kalimat pernyataan diakhiri です. ですか menjadikannya pertanyaan; じゃ saja belum lengkap.', 'kalimat pernyataan diberi か / kopula terpotong', 'belum', 4),
('G5-001-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'checkpoint', 'CP1', '「ワンさんは 医者ですか。」「いいえ、医者（　）。エンジニアです。」', '["ですか", "です", "じゃありません", "は"]'::jsonb, 2, 'Kalimat kedua (エンジニアです) menunjukkan Wang bukan dokter, jadi pakai じゃありません.', 'polaritas tak cocok dengan いいえ', 'belum', 5),
('G5-001-07', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P001', 'NはNです／じゃありません／ですか', 'checkpoint', 'CP1', 'わたし ＿＿ ＿＿ ★ ＿＿。', '["じゃ", "ありません", "学生", "は"]'::jsonb, 0, 'Urutan benar: わたし は 学生 じゃ ありません. じゃ dan ありません selalu berdampingan di akhir.', 'urutan: topik → kata benda → じゃ → ありません', 'belum', 6),
('G5-001-08', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P001', 'NはNです／じゃありません／ですか', 'checkpoint', 'CP1', 'あの 人 ＿＿ ★ ＿＿ ＿＿。', '["か", "です", "先生", "は"]'::jsonb, 2, 'Urutan benar: あの人 は 先生 です か. か selalu paling akhir, setelah です.', 'urutan: は → kata benda → です → か', 'belum', 7),
('G5-001-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'cadangan', 'CP1', '「学生ですか。」「いいえ、（　）。」', '["学生です", "学生は", "学生ですか", "学生じゃありません"]'::jsonb, 3, 'いいえ diikuti bentuk negatif: 学生じゃありません.', 'polaritas tak cocok dengan いいえ', 'belum', 8),
('G5-001-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'cadangan', 'CP1', '「マリアさんは 学生ですか。」「はい、（　）です。」', '["そう", "はい", "か", "いいえ"]'::jsonb, 0, 'はい、そうです = ''Ya, benar.'' そう menggantikan kata benda yang ditanyakan.', 'jawaban singkat salah bentuk', 'belum', 9),
('G5-001-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P001', 'NはNです／じゃありません／ですか', 'cadangan', 'CP1', 'わたし（　）先生じゃありません。学生です。', '["です", "か", "は", "を"]'::jsonb, 2, 'Topik kalimat ditandai は, lalu diikuti kata benda dan じゃありません.', 'partikel tertukar / kopula di posisi partikel', 'belum', 10),
('G5-001-12', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P001', 'NはNです／じゃありません／ですか', 'cadangan', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["インドネシア人", "わたし", "は", "です"]'::jsonb, 0, 'Urutan benar: わたし は インドネシア人 です.', 'urutan: topik → は → kata benda → です', 'belum', 11),
('G5-002-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'latihan', 'CP1', 'ミラーさんは 会社員です。わたし（　）会社員です。', '["で", "も", "へ", "を"]'::jsonb, 1, 'も = ''juga''. Miller karyawan, saya juga karyawan. も menggantikan posisi は.', 'partikel tertukar (も vs objek/arah/tempat)', 'belum', 12),
('G5-002-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'latihan', 'CP1', '「ワンさんは 医者です。リンさん（　）医者ですか。」「はい、リンさんも 医者です。」', '["に", "へ", "を", "も"]'::jsonb, 3, 'Pertanyaan ''Apakah Lin juga dokter?'' memakai も, dan jawabannya juga memakai も.', 'partikel tertukar', 'belum', 13),
('G5-002-03', 'N5', 'tata_bahasa', 'Arti/konteks', 1, 'P002', 'Nも', 'latihan', 'CP1', '「わたしも 学生です。」 artinya…', '["Saya juga pelajar.", "Saya hanya pelajar.", "Apakah saya pelajar?", "Saya bukan pelajar."]'::jsonb, 0, 'も berarti ''juga''. ''Hanya'' adalah だけ, pola yang dipelajari nanti.', 'salah arti も (juga ↔ hanya/negatif)', 'belum', 14),
('G5-002-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'latihan', 'CP1', 'Kalimat yang benar adalah…', '["わたしもは 学生です。", "わたしをも 学生です。", "わたしも 学生です。", "わたしはも 学生です。"]'::jsonb, 2, 'も menggantikan は, tidak ditumpuk. わたしもは dan わたしはも salah.', 'も ditumpuk dengan partikel lain', 'belum', 15),
('G5-002-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'latihan', 'CP1', '「タワポンさんは タイ人です。カリナさん（　）タイ人ですか。」「いいえ、インドネシア人です。」', '["を", "も", "へ", "で"]'::jsonb, 1, '''Apakah Karina juga orang Thailand?'' — も karena membandingkan dengan Tawapon.', 'partikel tertukar', 'belum', 16),
('G5-002-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'checkpoint', 'CP1', 'イーさんは かんこく人です。キムさん（　）かんこく人です。', '["も", "の", "で", "を"]'::jsonb, 0, 'Kim juga orang Korea, jadi も. キムさんの berarti ''milik Kim'', tidak cocok dengan です di sini.', 'partikel tertukar (も vs の kepemilikan)', 'belum', 17),
('G5-002-07', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P002', 'Nも', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["も", "ワンさん", "です", "医者"]'::jsonb, 3, 'Urutan benar: ワンさん も 医者 です.', 'urutan: orang → も → kata benda → です', 'belum', 18),
('G5-002-08', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P002', 'Nも', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿か。', '["です", "も", "あの人", "先生"]'::jsonb, 1, 'Urutan benar: あの人 も 先生 です か.', 'urutan: orang → も → kata benda → です', 'belum', 19),
('G5-002-09', 'N5', 'tata_bahasa', 'Arti/konteks', 1, 'P002', 'Nも', 'cadangan', 'CP1', '「サントスさんは ブラジル人です。マリアさんも ブラジル人です。」 Mana yang benar?', '["Santos dan Maria orang Brasil.", "Maria bukan orang Brasil.", "Hanya Santos orang Brasil.", "Santos bukan orang Brasil."]'::jsonb, 0, 'も pada マリアさん berarti Maria juga orang Brasil, sama seperti Santos.', 'salah arti も', 'belum', 20),
('G5-002-10', 'N5', 'tata_bahasa', 'Arti/konteks', 1, 'P002', 'Nも', 'cadangan', 'CP1', '「あの人も 先生じゃありません。」 artinya…', '["Apakah orang itu guru?", "Orang itu bukan pelajar.", "Orang itu juga bukan guru.", "Orang itu juga guru."]'::jsonb, 2, 'も + じゃありません = ''juga bukan''.', 'salah arti も + negatif', 'belum', 21),
('G5-002-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 1, 'P002', 'Nも', 'cadangan', 'CP1', 'わたしは 会社員じゃありません。ワンさん（　）会社員じゃありません。', '["で", "へ", "を", "も"]'::jsonb, 3, 'も juga dipakai pada kalimat negatif: ''Wang juga bukan karyawan''.', 'partikel tertukar', 'belum', 22),
('G5-002-12', 'N5', 'tata_bahasa', 'Susun ★', 1, 'P002', 'Nも', 'cadangan', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["じゃありません", "かんこく人", "も", "キムさん"]'::jsonb, 2, 'Urutan benar: キムさん も かんこく人 じゃありません.', 'urutan: orang → も → kata benda → じゃありません', 'belum', 23),
('G5-003-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'latihan', 'CP1', 'これは わたし（　）本です。', '["で", "を", "へ", "の"]'::jsonb, 3, 'わたしの本 = buku saya. の menghubungkan pemilik dengan benda.', 'partikel tertukar (の kepemilikan)', 'belum', 24),
('G5-003-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'latihan', 'CP1', 'これは 日本語（　）本です。', '["を", "の", "で", "へ"]'::jsonb, 1, '日本語の本 = buku (tentang) bahasa Jepang. の juga menunjukkan jenis/isi.', 'partikel tertukar (の jenis)', 'belum', 25),
('G5-003-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'latihan', 'CP1', 'わたしは IMC（　）社員です。', '["を", "で", "へ", "の"]'::jsonb, 3, 'IMCの社員 = karyawan IMC. の menunjukkan tempat seseorang bernaung.', 'partikel tertukar (の afiliasi)', 'belum', 26),
('G5-003-04', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P003', 'N1のN2', 'latihan', 'CP1', '「ミラーさんの かばん」 artinya…', '["Miller dan tas", "tas milik Miller", "Miller di dalam tas", "Miller adalah tas"]'::jsonb, 1, 'N1のN2 = N2 milik N1. の bukan ''dan'' (と) atau ''di'' (に).', 'salah arti の (dan/di/adalah)', 'belum', 27),
('G5-003-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'latihan', 'CP1', '''Buku milik guru'' dalam bahasa Jepang adalah…', '["本の先生", "先生を本", "本は先生", "先生の本"]'::jsonb, 3, 'Pemilik di depan, benda di belakang: 先生の本. 本の先生 malah berarti ''guru buku''.', 'urutan N1/N2 terbalik / partikel salah', 'belum', 28),
('G5-003-06', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P003', 'N1のN2', 'checkpoint', 'CP1', '「これは わたしの かさです。」 artinya…', '["Ini bukan payung saya.", "Ini saya dan payung.", "Saya payung ini.", "Ini payung saya."]'::jsonb, 3, 'わたしのかさ = payung saya; です bentuk positif.', 'salah arti の / polaritas', 'belum', 29),
('G5-003-07', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P003', 'N1のN2', 'checkpoint', 'CP1', 'これは ＿＿ ＿＿ ★ ＿＿。', '["かばん", "ミラーさん", "の", "です"]'::jsonb, 0, 'Urutan benar: これは ミラーさん の かばん です.', 'urutan: pemilik → の → benda → です', 'belum', 30),
('G5-003-08', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P003', 'N1のN2', 'checkpoint', 'CP1', 'わたしは ＿＿ ★ ＿＿ ＿＿。', '["です", "学生", "の", "さくら大学"]'::jsonb, 2, 'Urutan benar: わたしは さくら大学 の 学生 です.', 'urutan: afiliasi → の → kata benda → です', 'belum', 31),
('G5-003-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'cadangan', 'CP1', 'これは コンピューター（　）本です。', '["の", "を", "に", "で"]'::jsonb, 0, 'コンピューターの本 = buku tentang komputer.', 'partikel tertukar (の jenis)', 'belum', 32),
('G5-003-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'cadangan', 'CP1', 'Kalimat yang benar adalah…', '["わたしの 本です。", "わたしは 本の。", "わたし 本です。", "本 わたしのです。"]'::jsonb, 0, 'わたしの本です = (Ini) buku saya. の wajib ada di antara pemilik dan benda.', 'の hilang / urutan salah', 'belum', 33),
('G5-003-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P003', 'N1のN2', 'cadangan', 'CP1', '「その かさは 先生のですか。」「はい、先生（　）です。」', '["へ", "で", "の", "を"]'::jsonb, 2, '先生のです = milik guru. Benda (かさ) boleh dihilangkan karena sudah jelas.', 'partikel tertukar (の sebagai kata ganti milik)', 'belum', 34),
('G5-003-12', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P003', 'N1のN2', 'cadangan', 'CP1', '「日本語の 先生」 artinya…', '["guru bahasa Jepang", "guru dan bahasa Jepang", "bahasa Jepang milik guru", "guru orang Jepang"]'::jsonb, 0, '日本語の先生 = guru yang mengajar bahasa Jepang. Guru orang Jepang adalah 日本人の先生.', 'salah arti の (jenis ↔ asal/kepemilikan)', 'belum', 35),
('G5-004-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'latihan', 'CP1', '「あの 人は（　）ですか。」「ミラーさんです。」', '["か", "だれ", "なん", "の"]'::jsonb, 1, 'Jawabannya nama orang, jadi tanya dengan だれ (siapa).', 'kata tanya tertukar (orang ↔ benda)', 'belum', 36),
('G5-004-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'latihan', 'CP1', '「これは（　）ですか。」「本です。」', '["の", "なん", "だれ", "か"]'::jsonb, 1, 'Jawabannya benda, jadi tanya dengan なん (apa).', 'kata tanya tertukar (benda ↔ orang)', 'belum', 37),
('G5-004-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'latihan', 'CP1', '「それは（　）の 本ですか。」「コンピューターの 本です。」', '["か", "なん", "だれ", "も"]'::jsonb, 1, 'Jawabannya jenis buku, jadi なんの本 (buku tentang apa). だれの本 menanyakan pemilik.', 'なんの (jenis) ↔ だれの (milik)', 'belum', 38),
('G5-004-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'latihan', 'CP1', '「これは（　）の かさですか。」「わたしのです。」', '["か", "だれ", "なん", "は"]'::jsonb, 1, 'Jawabannya pemilik (わたしの), jadi だれのかさ (payung siapa).', 'だれの (milik) ↔ なんの (jenis)', 'belum', 39),
('G5-004-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'latihan', 'CP1', '「ワンさんは 医者です（　）。」「はい、医者です。」', '["も", "を", "か", "の"]'::jsonb, 2, 'か di akhir kalimat = tanda tanya. Jawaban はい menunjukkan ini pertanyaan.', 'penanda tanya hilang', 'belum', 40),
('G5-004-06', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P004', 'か ・ なん ・ だれ', 'checkpoint', 'CP1', '「あの人は だれですか。」 artinya…', '["Orang itu guru?", "Siapa orang itu?", "Apa itu?", "Orang itu milik siapa?"]'::jsonb, 1, 'だれ = siapa. なん = apa.', 'salah arti kata tanya', 'belum', 41),
('G5-004-07', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P004', 'か ・ なん ・ だれ', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["ですか", "は", "それ", "なん"]'::jsonb, 3, 'Urutan benar: それ は なん ですか.', 'urutan: topik → は → kata tanya → ですか', 'belum', 42),
('G5-004-08', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P004', 'か ・ なん ・ だれ', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿ ですか。', '["だれ", "は", "あの", "人"]'::jsonb, 1, 'Urutan benar: あの 人 は だれ ですか.', 'urutan: あの + N → は → kata tanya', 'belum', 43),
('G5-004-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'cadangan', 'CP1', '「（　）の 雑誌ですか。」「カメラの 雑誌です。」', '["だれ", "なん", "か", "の"]'::jsonb, 1, 'Jawabannya jenis majalah, jadi なんの雑誌.', 'なんの (jenis) ↔ だれの (milik)', 'belum', 44),
('G5-004-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'cadangan', 'CP1', '「この 本は（　）のですか。」「サントスさんのです。」', '["なん", "も", "か", "だれ"]'::jsonb, 3, 'Jawabannya nama pemilik, jadi だれの.', 'だれの (milik) ↔ なんの (jenis)', 'belum', 45),
('G5-004-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'cadangan', 'CP1', '「あなたは 学生ですか。」 Jawaban yang benar…', '["学生か。", "はい、学生です。", "はい、学生ですか。", "いいえ、学生です。"]'::jsonb, 1, 'Jawaban tidak memakai か. いいえ harus diikuti bentuk negatif.', 'jawaban berbentuk tanya / polaritas bertentangan', 'belum', 46),
('G5-004-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P004', 'か ・ なん ・ だれ', 'cadangan', 'CP1', '「あれは（　）ですか。」「とけいです。」', '["だれ", "なん", "は", "か"]'::jsonb, 1, 'Jam adalah benda, jadi なん.', 'kata tanya tertukar (benda ↔ orang)', 'belum', 47),
('G5-005-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'latihan', 'CP1', '[Buku ada di tangan pembicara]（　）は わたしの 本です。', '["どれ", "あれ", "それ", "これ"]'::jsonb, 3, 'Benda dekat pembicara = これ.', 'jarak tertukar (dekat pembicara)', 'belum', 48),
('G5-005-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'latihan', 'CP1', '[Benda ada di dekat lawan bicara]（　）は なんですか。', '["どれ", "それ", "あれ", "これ"]'::jsonb, 1, 'Benda dekat lawan bicara = それ.', 'jarak tertukar (dekat lawan bicara)', 'belum', 49),
('G5-005-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'latihan', 'CP1', '[Gedung jauh dari keduanya]（　）は 病院です。', '["どれ", "これ", "それ", "あれ"]'::jsonb, 3, 'Benda jauh dari pembicara dan lawan bicara = あれ.', 'jarak tertukar (jauh dari keduanya)', 'belum', 50),
('G5-005-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'latihan', 'CP1', '「ミラーさんの かさは（　）ですか。」「それです。」', '["どれ", "なん", "これ", "だれ"]'::jsonb, 0, 'Memilih satu dari beberapa benda = どれ (yang mana).', 'どれ (yang mana) ↔ なん (apa)', 'belum', 51),
('G5-005-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'latihan', 'CP1', 'A「これは なんですか。」 B「（　）は ノートです。」 (A memegang bendanya)', '["どれ", "あれ", "それ", "これ"]'::jsonb, 2, 'Benda dipegang A, jadi bagi B bendanya dekat lawan bicara = それ.', 'sudut pandang pembicara tidak berganti', 'belum', 52),
('G5-005-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'checkpoint', 'CP1', 'A「それは ボールペンですか。」 B「はい、（　）は ボールペンです。」 (B memegang bendanya)', '["あれ", "それ", "これ", "どれ"]'::jsonb, 2, 'A bilang それ karena benda ada di dekat B. Bagi B, benda itu dekat dirinya = これ.', 'sudut pandang pembicara tidak berganti', 'belum', 53),
('G5-005-07', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P005', 'これ・それ・あれ・どれ', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["本ですか", "なんの", "これ", "は"]'::jsonb, 1, 'Urutan benar: これ は なんの 本ですか.', 'urutan: これ → は → なんの → N', 'belum', 54),
('G5-005-08', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P005', 'これ・それ・あれ・どれ', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["それ", "わたしの", "です", "は"]'::jsonb, 3, 'Urutan benar: それ は わたしの です.', 'urutan: それ → は → わたしの → です', 'belum', 55),
('G5-005-09', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P005', 'これ・それ・あれ・どれ', 'cadangan', 'CP1', '「どれですか。」 artinya…', '["Yang mana?", "Itu milik siapa?", "Di mana?", "Apa itu?"]'::jsonb, 0, 'どれ = yang mana (dari beberapa benda).', 'salah arti kata tanya (どれ/なん/だれ/どこ)', 'belum', 56),
('G5-005-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'cadangan', 'CP1', '[Jam di dinding, jauh dari keduanya]（　）は とけいですか。', '["これ", "それ", "あれ", "どれ"]'::jsonb, 2, 'Jauh dari keduanya = あれ.', 'jarak tertukar', 'belum', 57),
('G5-005-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'cadangan', 'CP1', '[Tas ada di dekat pembicara]（　）は わたしの かばんじゃありません。', '["これ", "あれ", "それ", "どれ"]'::jsonb, 0, 'Dekat pembicara = これ.', 'jarak tertukar', 'belum', 58),
('G5-005-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P005', 'これ・それ・あれ・どれ', 'cadangan', 'CP1', '「あなたの かさは どれですか。」「（　）です。」 (Payungnya ada di dekat si penanya)', '["あれ", "これ", "それ", "どれ"]'::jsonb, 2, 'Payung dekat si penanya = dekat lawan bicara bagi yang menjawab = それ.', 'sudut pandang pembicara tidak berganti', 'belum', 59),
('G5-006-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'latihan', 'CP1', '[Buku di tangan pembicara]（　）本は わたしのです。', '["その", "それ", "これ", "この"]'::jsonb, 3, 'Diikuti kata benda (本), jadi この. これ tidak bisa langsung diikuti kata benda.', 'これ (berdiri sendiri) ↔ この (+N)', 'belum', 60),
('G5-006-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'latihan', 'CP1', '[Tas di dekat lawan bicara]（　）かばんは だれのですか。', '["この", "その", "それ", "あの"]'::jsonb, 1, 'Dekat lawan bicara + kata benda = その.', 'それ ↔ その / jarak tertukar', 'belum', 61),
('G5-006-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'latihan', 'CP1', '[Orang yang jauh]（　）人は だれですか。', '["あれ", "その", "あの", "この"]'::jsonb, 2, 'Jauh + kata benda = あの.', 'あれ ↔ あの / jarak tertukar', 'belum', 62),
('G5-006-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'latihan', 'CP1', '「ミラーさんの かさは（　）かさですか。」「あの かさです。」', '["だれ", "なん", "どれ", "どの"]'::jsonb, 3, 'Diikuti kata benda (かさ), jadi どの.', 'どれ ↔ どの (+N)', 'belum', 63),
('G5-006-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'latihan', 'CP1', 'Kalimat yang benar adalah…', '["これ 本は わたしのです。", "どの 本は わたしのです。", "この は わたしの 本です。", "この 本は わたしのです。"]'::jsonb, 3, 'この harus diikuti kata benda. どの hanya dipakai dalam pertanyaan.', 'これ/この tertukar / どの dalam kalimat pernyataan', 'belum', 64),
('G5-006-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'checkpoint', 'CP1', '「これは わたしの 本です。」 = 「（　）本は わたしのです。」', '["この", "これ", "その", "それ"]'::jsonb, 0, 'これ berubah jadi この saat diikuti kata benda (本).', 'これ ↔ この', 'belum', 65),
('G5-006-07', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P006', 'この・その・あの・どの＋N', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿ ですか。', '["その", "は", "時計", "だれの"]'::jsonb, 1, 'Urutan benar: その 時計 は だれの ですか.', 'urutan: その + N → は → だれの', 'belum', 66),
('G5-006-08', 'N5', 'tata_bahasa', 'Susun ★', 2, 'P006', 'この・その・あの・どの＋N', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["先生です", "は", "人", "あの"]'::jsonb, 2, 'Urutan benar: あの 人 は 先生です.', 'urutan: あの + N → は → predikat', 'belum', 67),
('G5-006-09', 'N5', 'tata_bahasa', 'Arti/konteks', 2, 'P006', 'この・その・あの・どの＋N', 'cadangan', 'CP1', '「どの 人ですか。」 artinya…', '["Siapa orang itu?", "Orang yang mana?", "Orang itu apa?", "Di mana orangnya?"]'::jsonb, 1, 'どの + N = N yang mana.', 'salah arti どの', 'belum', 68),
('G5-006-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'cadangan', 'CP1', 'A「その ノートは あなたのですか。」 B「いいえ、（　）ノートは ワンさんのです。」 (B memegang buku catatannya)', '["あの", "その", "これ", "この"]'::jsonb, 3, 'Bagi B, buku catatan ada di tangannya + kata benda = この.', 'sudut pandang tidak berganti / この ↔ これ', 'belum', 69),
('G5-006-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'cadangan', 'CP1', '[Mobil jauh]（　）は 日本の くるまです。', '["あの", "あれ", "それ", "どの"]'::jsonb, 1, 'Tidak ada kata benda setelahnya (langsung は), jadi あれ.', 'あの (+N) ↔ あれ (berdiri sendiri)', 'belum', 70),
('G5-006-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 2, 'P006', 'この・その・あの・どの＋N', 'cadangan', 'CP1', '「ミラーさんは（　）人ですか。」「あの めがねの 人です。」', '["なん", "どれ", "だれ", "どの"]'::jsonb, 3, 'Diikuti kata benda (人), jadi どの人 (orang yang mana).', 'どれ/だれ ↔ どの', 'belum', 71),
('G5-007-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'latihan', 'CP1', '[Pembicara dan lawan bicara di kelas yang sama]（　）は きょうしつです。', '["そこ", "あそこ", "どこ", "ここ"]'::jsonb, 3, 'Tempat pembicara berada = ここ.', 'jarak tempat tertukar', 'belum', 72),
('G5-007-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'latihan', 'CP1', '「トイレは（　）ですか。」「あそこです。」', '["なん", "どこ", "どれ", "だれ"]'::jsonb, 1, 'Menanyakan tempat = どこ.', 'どこ (tempat) ↔ どれ/なん', 'belum', 73),
('G5-007-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'latihan', 'CP1', '[Menunjuk gedung yang jauh]病院は（　）です。', '["あの", "ここ", "あそこ", "あれ"]'::jsonb, 2, 'Menunjuk tempat yang jauh = あそこ. あれ untuk benda.', 'あれ (benda) ↔ あそこ (tempat)', 'belum', 74),
('G5-007-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'latihan', 'CP1', 'A「ここは どこですか。」 B「（　）は しょくどうです。」 (Keduanya berada di tempat yang sama)', '["ここ", "どこ", "そこ", "あそこ"]'::jsonb, 0, 'Keduanya ada di tempat yang sama, jadi tempat itu = ここ.', 'jarak tempat tertukar', 'belum', 75),
('G5-007-05', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'latihan', 'CP1', '「エレベーターは あそこです。」 artinya…', '["Lift ada di sana (jauh).", "Lift ada di sini.", "Lift itu yang itu.", "Lift di mana?"]'::jsonb, 0, 'あそこ = di sana, jauh dari pembicara dan lawan bicara.', 'salah arti あそこ', 'belum', 76),
('G5-007-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'checkpoint', 'CP1', '「ミラーさんは（　）ですか。」「かいぎしつです。」', '["どこ", "どれ", "なん", "だれ"]'::jsonb, 0, 'Jawabannya tempat (ruang rapat), jadi どこ.', 'kata tanya tertukar (tempat)', 'belum', 77),
('G5-007-07', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["どこ", "は", "ですか", "トイレ"]'::jsonb, 0, 'Urutan benar: トイレ は どこ ですか.', 'urutan: tempat → は → どこ → ですか', 'belum', 78),
('G5-007-08', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["ここ", "食堂", "は", "です"]'::jsonb, 2, 'Urutan benar: ここ は 食堂 です (atau 食堂 は ここ です). Keduanya menempatkan は di kotak ★.', 'urutan: ここ/tempat → は → N → です', 'belum', 79),
('G5-007-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'cadangan', 'CP1', '「ここは（　）ですか。」「大学です。」', '["どの", "どれ", "どこ", "だれ"]'::jsonb, 2, 'Menanyakan nama tempat = どこ.', 'kata tanya tertukar (tempat)', 'belum', 80),
('G5-007-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'cadangan', 'CP1', '[Lawan bicara berdiri dekat pintu]（　）は 出口です。', '["あそこ", "ここ", "どこ", "そこ"]'::jsonb, 3, 'Tempat dekat lawan bicara = そこ.', 'jarak tempat tertukar', 'belum', 81),
('G5-007-11', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'cadangan', 'CP1', '「どこですか。」 artinya…', '["Siapa?", "Apa?", "Yang mana?", "Di mana?"]'::jsonb, 3, 'どこ = di mana.', 'salah arti kata tanya', 'belum', 82),
('G5-007-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P007', 'ここ・そこ・あそこ・どこ', 'cadangan', 'CP1', '「かばんうりばは（　）ですか。」「２かいです。」', '["どれ", "なん", "だれ", "どこ"]'::jsonb, 3, 'Jawabannya lokasi (lantai 2), jadi どこ.', 'kata tanya tertukar (tempat)', 'belum', 83),
('G5-008-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'latihan', 'CP1', '(Bertanya dengan sopan) トイレは（　）ですか。', '["どちら", "どれ", "どの", "だれ"]'::jsonb, 0, 'どちら adalah versi sopan dari どこ.', 'どちら (sopan, tempat) ↔ どれ/どの', 'belum', 84),
('G5-008-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'latihan', 'CP1', '[Memperkenalkan orang di sebelahnya]（　）は 山田さんです。', '["どちら", "この", "こちら", "あちら"]'::jsonb, 2, 'Memperkenalkan orang di dekat pembicara dengan sopan = こちら.', 'jarak tertukar / この tanpa N', 'belum', 85),
('G5-008-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'latihan', 'CP1', '[Tempat jauh, bahasa sopan] エレベーターは（　）です。', '["どちら", "そちら", "あちら", "こちら"]'::jsonb, 2, 'Tempat jauh + sopan = あちら (versi sopan あそこ).', 'jarak tertukar', 'belum', 86),
('G5-008-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'latihan', 'CP1', '「お国は（　）ですか。」「インドネシアです。」', '["どれ", "どちら", "だれ", "なん"]'::jsonb, 1, 'Menanyakan negara dengan sopan = お国はどちらですか.', 'どちら ↔ なん/どれ', 'belum', 87),
('G5-008-05', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P008', 'こちら・そちら・あちら・どちら', 'latihan', 'CP1', '「会社は どちらですか。」 artinya…', '["Perusahaannya jam berapa?", "Anda bekerja di perusahaan apa?", "Perusahaannya milik siapa?", "Perusahaannya berapa harganya?"]'::jsonb, 1, '会社はどちらですか = menanyakan nama/lokasi perusahaan tempat bekerja dengan sopan.', 'salah arti どちら', 'belum', 88),
('G5-008-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'checkpoint', 'CP1', '[Pegawai toko menunjuk arah dekat pembeli] くつうりばは（　）です。', '["こちら", "あちら", "そちら", "どちら"]'::jsonb, 2, 'Dekat lawan bicara + sopan = そちら.', 'jarak tertukar', 'belum', 89),
('G5-008-07', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P008', 'こちら・そちら・あちら・どちら', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["は", "エレベーター", "どちら", "ですか"]'::jsonb, 2, 'Urutan benar: エレベーター は どちら ですか.', 'urutan: tempat → は → どちら → ですか', 'belum', 90),
('G5-008-08', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P008', 'こちら・そちら・あちら・どちら', 'checkpoint', 'CP1', '＿＿ ＿＿ ＿＿ ★。', '["どちら", "お国", "ですか", "は"]'::jsonb, 2, 'Urutan benar: お国 は どちら ですか.', 'urutan: topik → は → どちら → ですか', 'belum', 91),
('G5-008-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'cadangan', 'CP1', 'Cara paling sopan bertanya lokasi toilet kepada tamu…', '["トイレは だれですか。", "トイレは なんですか。", "トイレは どれですか。", "トイレは どちらですか。"]'::jsonb, 3, 'どちら = versi sopan untuk menanyakan tempat.', 'kata tanya tertukar', 'belum', 92),
('G5-008-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'cadangan', 'CP1', '[Di sini, bahasa sopan]（　）は かいぎしつです。', '["どの", "この", "こちら", "どちら"]'::jsonb, 2, 'Tempat pembicara + sopan = こちら. この harus diikuti kata benda.', 'この tanpa N / kata tanya', 'belum', 93),
('G5-008-11', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P008', 'こちら・そちら・あちら・どちら', 'cadangan', 'CP1', '「こちらは ワンさんです。」 artinya…', '["Ini (orang ini) Wang.", "Wang ada di sana.", "Wang yang mana?", "Ini milik Wang."]'::jsonb, 0, 'こちら dipakai untuk memperkenalkan orang dengan sopan.', 'salah arti こちら', 'belum', 94),
('G5-008-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P008', 'こちら・そちら・あちら・どちら', 'cadangan', 'CP1', 'すみません、お手洗いは（　）ですか。', '["なん", "どちら", "どの", "だれ"]'::jsonb, 1, 'Menanyakan tempat dengan sopan = どちら.', 'kata tanya tertukar', 'belum', 95),
('G5-009-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'latihan', 'CP1', '「この かばんは（　）ですか。」「3,000円です。」', '["いくら", "だれ", "どこ", "なん"]'::jsonb, 0, 'Jawabannya harga, jadi いくら (berapa harganya).', 'kata tanya tertukar (harga)', 'belum', 96),
('G5-009-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'latihan', 'CP1', '「その 時計は いくらですか。」「（　）です。」', '["わたし", "本", "あそこ", "5,000円"]'::jsonb, 3, 'いくら menanyakan harga, jadi jawabannya jumlah uang.', 'jawaban tidak menjawab harga', 'belum', 97),
('G5-009-03', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P009', 'Nはいくらですか', 'latihan', 'CP1', '「これは いくらですか。」 artinya…', '["Ini apa?", "Ini milik siapa?", "Ini berapa buah?", "Ini berapa harganya?"]'::jsonb, 3, 'いくら = berapa harganya. Berapa buah adalah いくつ.', 'いくら (harga) ↔ いくつ (jumlah)', 'belum', 98),
('G5-009-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'latihan', 'CP1', '[Wine di rak dekat penjual]（　）ワインは いくらですか。', '["それ", "どれ", "その", "そこ"]'::jsonb, 2, 'Dekat lawan bicara + kata benda (ワイン) = その.', 'それ/そこ ↔ その (+N)', 'belum', 99),
('G5-009-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'latihan', 'CP1', '「この カメラは（　）ですか。」「2万円です。」', '["どれ", "いくつ", "いくら", "なん"]'::jsonb, 2, 'Jawabannya harga (円), jadi いくら.', 'いくら (harga) ↔ いくつ (jumlah)', 'belum', 100),
('G5-009-06', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P009', 'Nはいくらですか', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["いくらですか", "本", "は", "その"]'::jsonb, 2, 'Urutan benar: その 本 は いくらですか.', 'urutan: その + N → は → いくらですか', 'belum', 101),
('G5-009-07', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P009', 'Nはいくらですか', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿ ですか。', '["いくら", "は", "ネクタイ", "この"]'::jsonb, 2, 'Urutan benar: この ネクタイ は いくら ですか.', 'urutan: この + N → は → いくら', 'belum', 102),
('G5-009-08', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'checkpoint', 'CP1', 'A「すみません。これは（　）ですか。」 B「800円です。」', '["なん", "いくら", "どちら", "どこ"]'::jsonb, 1, 'Jawabannya harga (円), jadi いくら.', 'kata tanya tertukar (harga)', 'belum', 103),
('G5-009-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'cadangan', 'CP1', '「この 傘は いくらですか。」 Jawaban yang benar…', '["あそこです。", "わたしのです。", "はい、いくらです。", "1,500円です。"]'::jsonb, 3, 'Pertanyaan いくら dijawab dengan harga.', 'jawaban tidak menjawab harga', 'belum', 104),
('G5-009-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'cadangan', 'CP1', '[Menunjuk barang yang jauh]（　）は いくらですか。', '["あの", "あそこ", "どれ", "あれ"]'::jsonb, 3, 'Benda jauh tanpa kata benda sesudahnya = あれ.', 'あの (+N) / tempat / kata tanya ↔ あれ (benda)', 'belum', 105),
('G5-009-11', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P009', 'Nはいくらですか', 'cadangan', 'CP1', '「あの くつは いくらですか。」 artinya…', '["Sepatu itu di mana?", "Sepatu itu (jauh) berapa harganya?", "Berapa pasang sepatu itu?", "Sepatu itu milik siapa?"]'::jsonb, 1, 'あのくつ = sepatu itu (jauh); いくら = berapa harganya.', 'salah arti いくら', 'belum', 106),
('G5-009-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P009', 'Nはいくらですか', 'cadangan', 'CP1', '「この 辞書は（　）ですか。」「2,500円です。」', '["なんの", "だれの", "いくら", "どこの"]'::jsonb, 2, 'Jawabannya harga, jadi いくら.', 'kata tanya tertukar (harga ↔ asal/milik/jenis)', 'belum', 107),
('G5-010-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'latihan', 'CP1', 'すみません、この ワイン（　）ください。', '["を", "に", "の", "で"]'::jsonb, 0, 'Benda yang diminta/dibeli ditandai を: このワインをください.', 'partikel tertukar (objek)', 'belum', 108),
('G5-010-02', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P010', 'Nをください', 'latihan', 'CP1', '「これを ください。」 artinya…', '["Ini apa?", "Tolong berikan ini kepadanya.", "Saya minta/beli ini.", "Ini untuk Anda."]'::jsonb, 2, 'Nをください = minta N (misalnya saat membeli di toko).', 'salah arti ください', 'belum', 109),
('G5-010-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'latihan', 'CP1', '[Menunjuk barang di dekat penjual] じゃ、（　）を ください。', '["これ", "その", "それ", "そこ"]'::jsonb, 2, 'Barang dekat lawan bicara tanpa kata benda sesudahnya = それ.', 'jarak tertukar / その tanpa N', 'belum', 110),
('G5-010-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'latihan', 'CP1', 'コーヒー（　）ください。', '["を", "は", "で", "へ"]'::jsonb, 0, 'Benda yang diminta ditandai を.', 'partikel tertukar (objek)', 'belum', 111),
('G5-010-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'latihan', 'CP1', '「この カメラは いくらですか。」「2万円です。」「じゃ、（　）。」', '["これを ください", "これは いくらですか", "これは だれのですか", "これは カメラですか"]'::jsonb, 0, 'Setelah tahu harganya, pembeli memutuskan membeli: これをください.', 'respons tidak sesuai konteks membeli', 'belum', 112),
('G5-010-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'checkpoint', 'CP1', 'すみません、あの くつ（　）ください。', '["で", "の", "へ", "を"]'::jsonb, 3, 'Benda yang diminta ditandai を.', 'partikel tertukar (objek)', 'belum', 113),
('G5-010-07', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P010', 'Nをください', 'checkpoint', 'CP1', 'じゃ、＿＿ ＿＿ ★ ＿＿。', '["を", "ください", "傘", "その"]'::jsonb, 0, 'Urutan benar: その 傘 を ください.', 'urutan: その + N → を → ください', 'belum', 114),
('G5-010-08', 'N5', 'tata_bahasa', 'Susun ★', 3, 'P010', 'Nをください', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["時計", "を", "ください", "この"]'::jsonb, 0, 'Urutan benar: この 時計 を ください.', 'urutan: この + N → を → ください', 'belum', 115),
('G5-010-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'cadangan', 'CP1', 'Kalimat yang benar adalah…', '["それの ください。", "それは ください。", "それへ ください。", "それを ください。"]'::jsonb, 3, 'Benda yang diminta ditandai を.', 'partikel tertukar (objek)', 'belum', 116),
('G5-010-10', 'N5', 'tata_bahasa', 'Arti/konteks', 3, 'P010', 'Nをください', 'cadangan', 'CP1', '「この ボールペンを ください。」 artinya…', '["Bolpoin ini milik saya.", "Ini bolpoin siapa?", "Bolpoin ini berapa harganya?", "Saya minta bolpoin ini."]'::jsonb, 3, 'Nをください = minta/beli N.', 'salah arti ください', 'belum', 117),
('G5-010-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'cadangan', 'CP1', '[Menunjuk barang yang jauh]（　）を ください。', '["あそこ", "あの", "どれ", "あれ"]'::jsonb, 3, 'Benda jauh tanpa kata benda sesudahnya = あれ.', 'あの (+N) / tempat / kata tanya ↔ あれ (benda)', 'belum', 118),
('G5-010-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 3, 'P010', 'Nをください', 'cadangan', 'CP1', 'みず（　）ください。', '["を", "で", "へ", "に"]'::jsonb, 0, 'Benda yang diminta ditandai を.', 'partikel tertukar (objek)', 'belum', 119),
('G5-011-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'latihan', 'CP1', 'きのう べんきょうし（　）。 (Kemarin saya belajar.)', '["ました", "ませんでした", "ません", "ます"]'::jsonb, 0, 'Kemarin = lampau, positif → ました.', 'kala tertukar (lampau ↔ sekarang) / polaritas', 'belum', 120),
('G5-011-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'latihan', 'CP1', 'あした はたらき（　）。 (Besok saya tidak bekerja.)', '["ます", "ません", "ませんでした", "ました"]'::jsonb, 1, 'Besok = belum terjadi, negatif → ません.', 'polaritas / kala tertukar', 'belum', 121),
('G5-011-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'latihan', 'CP1', 'けさ べんきょうし（　）。 (Tadi pagi saya tidak belajar.)', '["ました", "ません", "ませんでした", "ます"]'::jsonb, 2, 'Tadi pagi = lampau, negatif → ませんでした. ません hanya untuk sekarang/nanti.', 'negatif lampau ↔ negatif sekarang', 'belum', 122),
('G5-011-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'latihan', 'CP1', 'まいばん べんきょうし（　）。 (Setiap malam saya belajar.)', '["ません", "ました", "ます", "ませんでした"]'::jsonb, 2, 'Kebiasaan = bentuk sekarang, positif → ます.', 'kala tertukar (kebiasaan ↔ lampau)', 'belum', 123),
('G5-011-05', 'N5', 'tata_bahasa', 'Arti/konteks', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'latihan', 'CP1', '「やすみませんでした」 artinya…', '["tidak beristirahat (sekarang/nanti)", "tidak beristirahat (lampau)", "akan beristirahat", "beristirahat (lampau)"]'::jsonb, 1, 'ませんでした = negatif + lampau.', 'salah baca kala/polaritas', 'belum', 124),
('G5-011-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'checkpoint', 'CP1', '「きのうは はたらきましたか。」「いいえ、（　）。」', '["はたらきませんでした", "はたらきません", "はたらきました", "はたらきます"]'::jsonb, 0, 'Pertanyaan lampau + jawaban いいえ → negatif lampau: ませんでした.', 'polaritas atau kala tidak sesuai pertanyaan', 'belum', 125),
('G5-011-07', 'N5', 'tata_bahasa', 'Susun ★', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'checkpoint', 'CP1', '＿＿ ＿＿ ★ ＿＿。', '["べんきょう", "わたしは", "しませんでした", "きのう"]'::jsonb, 0, 'Urutan benar: わたしは きのう べんきょう しませんでした (きのう boleh di depan わたしは). べんきょう tetap di kotak ★.', 'urutan: waktu/topik → kegiatan → します', 'belum', 126),
('G5-011-08', 'N5', 'tata_bahasa', 'Susun ★', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'checkpoint', 'CP1', '＿＿ ＿＿ ＿＿ ★。', '["します", "わたしは", "べんきょう", "まいにち"]'::jsonb, 0, 'Urutan benar: わたしは まいにち べんきょう します. Kata kerja selalu di akhir.', 'urutan: kata kerja di akhir kalimat', 'belum', 127),
('G5-011-09', 'N5', 'tata_bahasa', 'Arti/konteks', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'cadangan', 'CP1', '「おきました」 artinya…', '["tidak bangun", "bangun (lampau)", "akan bangun", "belum bangun"]'::jsonb, 1, 'ました = positif lampau.', 'salah baca kala/polaritas', 'belum', 128),
('G5-011-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'cadangan', 'CP1', 'あしたも はたらき（　）か。 (Apakah besok juga bekerja?)', '["ます", "ませんでした", "ません", "ました"]'::jsonb, 0, 'Besok = belum terjadi → ます (+か untuk bertanya).', 'kala tertukar', 'belum', 129),
('G5-011-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'cadangan', 'CP1', 'おととい やすみ（　）。 (Kemarin lusa saya libur.)', '["ます", "ませんでした", "ません", "ました"]'::jsonb, 3, 'Kemarin lusa = lampau, positif → ました.', 'kala/polaritas tertukar', 'belum', 130),
('G5-011-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 4, 'P011', 'V-ます・ません・ました・ませんでした', 'cadangan', 'CP1', '「きのう べんきょうしましたか。」「はい、（　）。」', '["べんきょうしました", "べんきょうしませんでした", "べんきょうしません", "べんきょうします"]'::jsonb, 0, 'Pertanyaan lampau + はい → positif lampau: しました.', 'kala/polaritas tidak sesuai', 'belum', 131),
('G5-012-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'latihan', 'CP1', 'わたしは 6時（　）おきます。', '["へ", "で", "を", "に"]'::jsonb, 3, 'Jam tertentu ditandai に: 6時におきます.', 'partikel tertukar (waktu)', 'belum', 132),
('G5-012-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'latihan', 'CP1', '日曜日（　）はたらきません。', '["で", "を", "に", "へ"]'::jsonb, 2, 'Nama hari ditandai に.', 'partikel tertukar (waktu)', 'belum', 133),
('G5-012-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'latihan', 'CP1', 'あした（　）べんきょうします。', '["に", "を", "で", "（tidak perlu partikel）"]'::jsonb, 3, 'Kata waktu relatif (あした, きのう, まいにち, けさ) tidak memakai に.', 'に berlebih pada kata waktu relatif', 'belum', 134),
('G5-012-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'latihan', 'CP1', '３月３日（　）やすみます。', '["で", "に", "を", "の"]'::jsonb, 1, 'Tanggal ditandai に.', 'partikel tertukar (waktu)', 'belum', 135),
('G5-012-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'latihan', 'CP1', 'Kalimat yang benar adalah…', '["まいにちに べんきょうします。", "きのうに はたらきました。", "けさに おきました。", "9時に おきました。"]'::jsonb, 3, 'に dipakai untuk jam/hari/tanggal, tidak untuk きのう, まいにち, けさ.', 'に berlebih pada kata waktu relatif', 'belum', 136),
('G5-012-06', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P012', '(waktu)にV', 'checkpoint', 'CP1', '「11時に ねます。」 artinya…', '["Tidur sampai jam 11.", "Tidur jam 11.", "Tidur selama 11 jam.", "Tidur sebelum jam 11."]'::jsonb, 1, 'に menunjukkan titik waktu. ''Sampai'' adalah まで.', 'salah arti に (titik waktu ↔ durasi/batas)', 'belum', 137),
('G5-012-07', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P012', '(waktu)にV', 'checkpoint', 'CP1', 'わたしは ＿＿ ＿＿ ★ ＿＿。', '["まいあさ", "6時", "に", "おきます"]'::jsonb, 2, 'Urutan benar: わたしは まいあさ 6時 に おきます.', 'urutan: waktu relatif → jam → に → V', 'belum', 138),
('G5-012-08', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P012', '(waktu)にV', 'checkpoint', 'CP1', '＿＿ ★ ＿＿ ＿＿。', '["べんきょう", "しません", "日曜日", "に"]'::jsonb, 3, 'Urutan benar: 日曜日 に べんきょう しません.', 'urutan: hari → に → kegiatan → V', 'belum', 139),
('G5-012-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'cadangan', 'CP1', 'なんじ（　）ねますか。', '["を", "に", "で", "の"]'::jsonb, 1, 'Menanyakan jam = なんじに.', 'partikel tertukar (waktu)', 'belum', 140),
('G5-012-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'cadangan', 'CP1', 'こんばん（　）べんきょうします。', '["を", "で", "（tidak perlu partikel）", "に"]'::jsonb, 2, 'こんばん adalah kata waktu relatif, tidak memakai に.', 'に berlebih pada kata waktu relatif', 'belum', 141),
('G5-012-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'cadangan', 'CP1', 'ミラーさんは 月曜日（　）やすみます。', '["に", "の", "で", "を"]'::jsonb, 0, 'Nama hari ditandai に.', 'partikel tertukar (waktu)', 'belum', 142),
('G5-012-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P012', '(waktu)にV', 'cadangan', 'CP1', '8時半（　）ねました。', '["を", "に", "で", "の"]'::jsonb, 1, 'Jam tertentu ditandai に.', 'partikel tertukar (waktu)', 'belum', 143),
('G5-013-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'latihan', 'CP1', '9時（　）5時まで はたらきます。', '["から", "を", "に", "まで"]'::jsonb, 0, 'から = dari (titik awal). Pasangannya まで (sampai).', 'から ↔ まで tertukar', 'belum', 144),
('G5-013-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'latihan', 'CP1', '月曜日から 金曜日（　）べんきょうします。', '["で", "まで", "に", "から"]'::jsonb, 1, 'まで = sampai (titik akhir).', 'まで ↔ から tertukar', 'belum', 145),
('G5-013-03', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P013', 'N1からN2まで', 'latihan', 'CP1', '「ぎんこうは 9時から 3時までです。」 artinya…', '["Bank buka jam 9 dan jam 3.", "Bank tutup jam 9.", "Bank buka dari jam 9 sampai jam 3.", "Bank buka lebih dari jam 9."]'::jsonb, 2, 'から〜まで = dari ... sampai ....', 'salah arti から/まで', 'belum', 146),
('G5-013-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'latihan', 'CP1', 'ひるやすみは 12時から 1時（　）です。', '["まで", "へ", "から", "に"]'::jsonb, 0, 'Titik akhir istirahat = まで.', 'まで ↔ から tertukar', 'belum', 147),
('G5-013-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'latihan', 'CP1', '「びじゅつかんは なんじ（　）ですか。」「5時までです。」', '["まで", "から", "を", "に"]'::jsonb, 0, 'Jawabannya 5時まで, jadi pertanyaannya juga なんじまで.', 'partikel tidak cocok dengan jawaban', 'belum', 148),
('G5-013-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'checkpoint', 'CP1', 'Kalimat yang benar adalah…', '["9時から 5時まで はたらきます。", "9時から 5時に はたらきます。", "9時に 5時まで はたらきます。", "9時まで 5時から はたらきます。"]'::jsonb, 0, 'Urutannya selalu awal + から, lalu akhir + まで.', 'から/まで terbalik / に tertukar', 'belum', 149),
('G5-013-07', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P013', 'N1からN2まで', 'checkpoint', 'CP1', 'わたしは ＿＿ ＿＿ ★ ＿＿ はたらきます。', '["まで", "5時", "9時", "から"]'::jsonb, 1, 'Urutan benar: 9時 から 5時 まで.', 'urutan: awal → から → akhir → まで', 'belum', 150),
('G5-013-08', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P013', 'N1からN2まで', 'checkpoint', 'CP1', 'きのうは ＿＿ ★ ＿＿ ＿＿。', '["まで", "しました", "べんきょう", "10時"]'::jsonb, 0, 'Urutan benar: 10時 まで べんきょう しました.', 'urutan: waktu → まで → kegiatan → V', 'belum', 151),
('G5-013-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'cadangan', 'CP1', 'デパートは 10時（　）です。 (Department store buka mulai jam 10.)', '["から", "で", "に", "まで"]'::jsonb, 0, '''Mulai'' = から.', 'から ↔ まで tertukar', 'belum', 152),
('G5-013-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'cadangan', 'CP1', 'ゆうびんきょくは 土曜日（　）日曜日まで やすみです。', '["まで", "から", "に", "を"]'::jsonb, 1, 'Titik awal = から, pasangan dari まで.', 'から ↔ まで tertukar', 'belum', 153),
('G5-013-11', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P013', 'N1からN2まで', 'cadangan', 'CP1', '「12時まで」 artinya…', '["sekitar jam 12", "sampai jam 12", "dari jam 12", "pada jam 12"]'::jsonb, 1, 'まで = sampai. Dari = から, pada = に.', 'salah arti まで', 'belum', 154),
('G5-013-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P013', 'N1からN2まで', 'cadangan', 'CP1', 'まいにち 8時（　）はたらきます。 (Setiap hari bekerja mulai jam 8.)', '["から", "を", "まで", "へ"]'::jsonb, 0, '''Mulai'' = から.', 'から ↔ まで tertukar', 'belum', 155),
('G5-014-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'latihan', 'CP1', 'あした 京都（　）いきます。', '["で", "へ", "を", "の"]'::jsonb, 1, 'Arah tujuan gerak ditandai へ (dibaca え).', 'partikel tertukar (arah)', 'belum', 156),
('G5-014-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'latihan', 'CP1', 'きのう うち（　）かえりました。', '["で", "の", "を", "へ"]'::jsonb, 3, 'Tujuan pulang ditandai へ.', 'partikel tertukar (arah)', 'belum', 157),
('G5-014-03', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'latihan', 'CP1', 'ミラーさんは 去年 日本（　）きました。', '["の", "を", "へ", "で"]'::jsonb, 2, 'Tujuan datang ditandai へ.', 'partikel tertukar (arah)', 'belum', 158),
('G5-014-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'latihan', 'CP1', '「どこ（　）いきますか。」「スーパーへ いきます。」', '["の", "へ", "を", "で"]'::jsonb, 1, 'Jawabannya memakai へ, pertanyaannya juga どこへ.', 'partikel tertukar (arah)', 'belum', 159),
('G5-014-05', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'latihan', 'CP1', '「会社へ いきます。」 artinya…', '["Pergi dari kantor.", "Pergi ke kantor.", "Pulang ke kantor.", "Pergi di kantor."]'::jsonb, 1, 'へ = ke (arah). Dari = から; pulang = かえります.', 'salah arti へ / kata kerja gerak', 'belum', 160),
('G5-014-06', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'checkpoint', 'CP1', 'Kalimat yang benar adalah…', '["東京を いきます。", "東京へ いきます。", "東京の いきます。", "東京で いきます。"]'::jsonb, 1, 'Tujuan pergi ditandai へ.', 'partikel tertukar (arah)', 'belum', 161),
('G5-014-07', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'checkpoint', 'CP1', 'ミラーさんは あした ＿＿ ＿＿ ★ ＿＿。', '["へ", "大阪", "いきます", "か"]'::jsonb, 2, 'Urutan benar: ミラーさんは あした 大阪 へ いきます か.', 'urutan: tempat → へ → V → か', 'belum', 162),
('G5-014-08', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'checkpoint', 'CP1', 'あした ＿＿ ★ ＿＿ ＿＿。', '["いきます", "へ", "か", "どこ"]'::jsonb, 1, 'Urutan benar: あした どこ へ いきます か.', 'urutan: どこ → へ → V → か', 'belum', 163),
('G5-014-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'cadangan', 'CP1', 'インドネシア（　）かえります。', '["を", "へ", "の", "で"]'::jsonb, 1, 'Tujuan pulang ditandai へ.', 'partikel tertukar (arah)', 'belum', 164),
('G5-014-10', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'cadangan', 'CP1', '「どこへ いきますか。」 artinya…', '["Dari mana?", "Sedang di mana?", "Mau pergi ke mana?", "Pergi dengan siapa?"]'::jsonb, 2, 'どこへ = ke mana.', 'salah arti どこへ', 'belum', 165),
('G5-014-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'cadangan', 'CP1', 'なつやすみに くに（　）かえります。', '["を", "の", "で", "へ"]'::jsonb, 3, 'Tujuan pulang ditandai へ.', 'partikel tertukar (arah)', 'belum', 166),
('G5-014-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P014', '(tempat)へ いきます・きます・かえります', 'cadangan', 'CP1', '(Pembicara sekarang di Jepang) わたしは きのう インドネシアから 日本へ（　）。', '["いきます", "かえりました", "いきました", "きました"]'::jsonb, 3, 'Bergerak menuju tempat pembicara berada sekarang = きます. Pembicara di Jepang, jadi 日本へきました.', 'いきます ↔ きます (sudut pandang)', 'belum', 167),
('G5-015-01', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'latihan', 'CP1', 'バス（　）会社へ いきます。', '["に", "を", "へ", "で"]'::jsonb, 3, 'Kendaraan yang dipakai ditandai で.', 'partikel tertukar (sarana)', 'belum', 168),
('G5-015-02', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'latihan', 'CP1', '「なに（　）学校へ いきますか。」「電車で いきます。」', '["へ", "を", "に", "で"]'::jsonb, 3, 'Jawabannya memakai で, pertanyaannya juga なにで.', 'partikel tertukar (sarana)', 'belum', 169),
('G5-015-03', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P015', '(kendaraan)でV', 'latihan', 'CP1', '「駅から うちまで あるいて かえります。」 artinya…', '["Pulang naik kereta.", "Pulang naik bus.", "Pulang naik taksi.", "Pulang dengan berjalan kaki."]'::jsonb, 3, 'あるいて = berjalan kaki, dan tidak memakai で.', 'salah arti あるいて', 'belum', 170),
('G5-015-04', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'latihan', 'CP1', 'ひこうき（　）インドネシアへ かえります。', '["で", "に", "へ", "を"]'::jsonb, 0, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 171),
('G5-015-05', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'latihan', 'CP1', 'タクシー（　）うちへ かえりました。', '["を", "へ", "に", "で"]'::jsonb, 3, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 172),
('G5-015-06', 'N5', 'tata_bahasa', 'Arti/konteks', 5, 'P015', '(kendaraan)でV', 'checkpoint', 'CP1', '「しんかんせんで 大阪へ いきます。」 artinya…', '["Naik shinkansen di Osaka.", "Pergi bersama Osaka.", "Pergi ke Osaka naik shinkansen.", "Pergi ke Osaka dari shinkansen."]'::jsonb, 2, 'で setelah kendaraan = naik/dengan.', 'salah arti で (sarana ↔ tempat)', 'belum', 173),
('G5-015-07', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P015', '(kendaraan)でV', 'checkpoint', 'CP1', '学校へ ＿＿ ＿＿ ★ ＿＿。', '["で", "なに", "か", "いきます"]'::jsonb, 3, 'Urutan benar: 学校へ なに で いきます か.', 'urutan: なに → で → V → か', 'belum', 174),
('G5-015-08', 'N5', 'tata_bahasa', 'Susun ★', 5, 'P015', '(kendaraan)でV', 'checkpoint', 'CP1', '日本へ ＿＿ ★ ＿＿ ＿＿。', '["何", "か", "で", "来ました"]'::jsonb, 2, 'Urutan benar: 日本へ 何 で 来ました か.', 'urutan: 何 → で → V → か', 'belum', 175),
('G5-015-09', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'cadangan', 'CP1', 'ちかてつ（　）いきます。', '["に", "を", "で", "の"]'::jsonb, 2, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 176),
('G5-015-10', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'cadangan', 'CP1', 'Kalimat yang benar adalah…', '["バスで いきます。", "バスに いきます。", "バスの いきます。", "バスを いきます。"]'::jsonb, 0, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 177),
('G5-015-11', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'cadangan', 'CP1', 'ともだちは くるま（　）きました。', '["で", "の", "に", "を"]'::jsonb, 0, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 178),
('G5-015-12', 'N5', 'tata_bahasa', 'Pilih bentuk', 5, 'P015', '(kendaraan)でV', 'cadangan', 'CP1', 'ふね（　）いきます。', '["を", "で", "に", "の"]'::jsonb, 1, 'Kendaraan ditandai で.', 'partikel tertukar (sarana)', 'belum', 179)
ON CONFLICT (code) DO UPDATE SET level = EXCLUDED.level, category = EXCLUDED.category, qtype = EXCLUDED.qtype, unit = EXCLUDED.unit, group_code = EXCLUDED.group_code, group_label = EXCLUDED.group_label, mode = EXCLUDED.mode, checkpoint = EXCLUDED.checkpoint, question = EXCLUDED.question, options = EXCLUDED.options, answer_index = EXCLUDED.answer_index, explanation = EXCLUDED.explanation, distractor_basis = EXCLUDED.distractor_basis, review_status = EXCLUDED.review_status, order_index = EXCLUDED.order_index;
COMMIT;
