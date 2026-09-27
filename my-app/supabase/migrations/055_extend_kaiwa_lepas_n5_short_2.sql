-- 055: perpanjang 2 dialog lepas N5 sisa yang di bawah ambang panjang minimal
-- (6 baris) — lanjutan 054_extend_kaiwa_lepas_n5_short.sql, antrean E1
-- program kaiwa-30d (lihat scheduler/kaiwa-30d/STATE.md Day 5 "Belum
-- selesai / lanjutan").
--
-- Kedua dialog ini ADA di database (disetor sebelum alur migrasi-file
-- berlaku) tapi TIDAK punya file migrasi sumber di repo — lihat AUDIT.md
-- §4. Karena itu ditulis sebagai INSERT ... ON CONFLICT (level_id, title)
-- DO UPDATE, bukan edit file yang tidak ada. Judul, tema, dan 4 baris asli
-- tiap dialog dipertahankan persis (speaker/text/reading/romaji/trans tidak
-- diubah); baris baru ditambahkan di akhir. `vocab_highlight` ditulis ulang
-- penuh untuk sekaligus dinormalkan ke format glosarium standar Fase D
-- (kata berkanji "yomi · romaji" tanpa kurung, kata kana-saja = romaji
-- telanjang — lihat checkGlossaryFormat di tools/validate-kaiwa.mts).
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO UPDATE.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(1, 'Menyapa Tetangga', 'daily',
 '[
  {"speaker":"アリ","text":"おはようございます。","reading":"おはようございます。","romaji":"Ohayou gozaimasu.","trans":"Selamat pagi."},
  {"speaker":"鈴木","text":"おはようございます。いい天気ですね。","reading":"おはようございます。いいてんきですね。","romaji":"Ohayou gozaimasu. Ii tenki desu ne.","trans":"Selamat pagi. Cuacanya bagus ya."},
  {"speaker":"アリ","text":"そうですね。今日は暑いです。","reading":"そうですね。きょうはあついです。","romaji":"Sou desu ne. Kyou wa atsui desu.","trans":"Iya ya. Hari ini panas."},
  {"speaker":"鈴木","text":"では、行ってきます。","reading":"では、いってきます。","romaji":"Dewa, ittekimasu.","trans":"Kalau begitu, saya pergi dulu."},
  {"speaker":"アリ","text":"これからお仕事ですか。","reading":"これからおしごとですか。","romaji":"Kore kara oshigoto desu ka.","trans":"Mau berangkat kerja sekarang?"},
  {"speaker":"鈴木","text":"はい、そうです。アリさんはこれから買い物ですか。","reading":"はい、そうです。アリさんはこれからかいものですか。","romaji":"Hai, sou desu. Ari-san wa kore kara kaimono desu ka.","trans":"Ya, betul. Ari-san mau belanja sekarang?"},
  {"speaker":"アリ","text":"はい、スーパーへ行きます。行ってらっしゃい。","reading":"はい、スーパーへいきます。いってらっしゃい。","romaji":"Hai, suupaa e ikimasu. Itterasshai.","trans":"Ya, saya mau ke supermarket. Hati-hati di jalan."}
 ]'::jsonb,
 '[
  {"word":"天気","reading":"てんき · tenki","meaning":"cuaca"},
  {"word":"暑い","reading":"あつい · atsui","meaning":"panas"},
  {"word":"行ってきます","reading":"いってきます · ittekimasu","meaning":"saya pergi dulu (ungkapan saat berangkat)"},
  {"word":"仕事","reading":"しごと · shigoto","meaning":"pekerjaan"},
  {"word":"買い物","reading":"かいもの · kaimono","meaning":"belanja"}
 ]'::jsonb, false),

(1, 'Perkenalan Diri', 'daily',
 '[
  {"speaker":"田中","text":"はじめまして。田中です。","reading":"はじめまして。たなかです。","romaji":"Hajimemashite. Tanaka desu.","trans":"Salam kenal. Saya Tanaka."},
  {"speaker":"アリ","text":"はじめまして。アリです。インドネシアから来ました。","reading":"はじめまして。アリです。インドネシアからきました。","romaji":"Hajimemashite. Ari desu. Indonesia kara kimashita.","trans":"Salam kenal. Saya Ari. Saya datang dari Indonesia."},
  {"speaker":"田中","text":"どうぞよろしくお願いします。","reading":"どうぞよろしくおねがいします。","romaji":"Douzo yoroshiku onegaishimasu.","trans":"Mohon kerja samanya."},
  {"speaker":"アリ","text":"こちらこそ、よろしくお願いします。","reading":"こちらこそ、よろしくおねがいします。","romaji":"Kochira koso, yoroshiku onegaishimasu.","trans":"Saya juga, mohon kerja samanya."},
  {"speaker":"田中","text":"アリさんのお仕事は何ですか。","reading":"アリさんのおしごとはなんですか。","romaji":"Ari-san no oshigoto wa nan desu ka.","trans":"Pekerjaan Ari-san apa?"},
  {"speaker":"アリ","text":"会社員です。田中さんは。","reading":"かいしゃいんです。たなかさんは。","romaji":"Kaishain desu. Tanaka-san wa.","trans":"Saya karyawan perusahaan. Kalau Tanaka-san?"},
  {"speaker":"田中","text":"私も会社員です。今度一緒に昼ご飯を食べましょう。","reading":"わたしもかいしゃいんです。こんどいっしょにひるごはんをたべましょう。","romaji":"Watashi mo kaishain desu. Kondo issho ni hirugohan o tabemashou.","trans":"Saya juga karyawan perusahaan. Lain kali makan siang bareng, yuk."},
  {"speaker":"アリ","text":"はい、ぜひ。","reading":"はい、ぜひ。","romaji":"Hai, zehi.","trans":"Ya, boleh."}
 ]'::jsonb,
 '[
  {"word":"はじめまして","reading":"hajimemashite","meaning":"salam kenal"},
  {"word":"来ました","reading":"きました · kimashita","meaning":"datang (lampau)"},
  {"word":"よろしく","reading":"yoroshiku","meaning":"mohon kerja samanya"},
  {"word":"仕事","reading":"しごと · shigoto","meaning":"pekerjaan"},
  {"word":"会社員","reading":"かいしゃいん · kaishain","meaning":"karyawan perusahaan"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO UPDATE SET
  lines = EXCLUDED.lines,
  vocab_highlight = EXCLUDED.vocab_highlight;
