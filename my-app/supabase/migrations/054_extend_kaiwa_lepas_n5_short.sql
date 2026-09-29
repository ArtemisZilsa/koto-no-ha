-- 054: perpanjang 5 dialog lepas N5 yang di bawah ambang panjang minimal
-- (6 baris), sesuai AUDIT.md §4 dan antrean E1 program kaiwa-30d.
--
-- Kelima dialog ini ADA di database (disetor sebelum alur migrasi-file
-- berlaku) tapi TIDAK punya file migrasi sumber di repo — lihat AUDIT.md
-- §4. Karena itu ditulis sebagai INSERT ... ON CONFLICT (level_id, title)
-- DO UPDATE, bukan edit file yang tidak ada. Judul, tema, dan situasi tiap
-- dialog dipertahankan; hanya `lines` (baris baru ditambahkan di akhir,
-- baris lama tidak diubah) dan `vocab_highlight` (dinormalkan ke format
-- glosarium standar Fase D: kata berkanji "yomi · romaji" tanpa kurung,
-- kata kana-saja = romaji telanjang — lihat checkGlossaryFormat di
-- tools/validate-kaiwa.mts) yang berubah.
--
-- Dua dialog N5 pendek lainnya ("Menyapa Tetangga", "Perkenalan Diri")
-- sengaja belum disentuh hari ini (batas 5 item/PR konten) — lanjutan di
-- scheduler/kaiwa-30d/STATE.md.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO UPDATE.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(1, 'Belanja di Konbini', 'daily',
 '[
  {"speaker":"店員","text":"いらっしゃいませ。","reading":"いらっしゃいませ。","romaji":"Irasshaimase.","trans":"Selamat datang."},
  {"speaker":"アリ","text":"このおにぎりはいくらですか。","reading":"このおにぎりはいくらですか。","romaji":"Kono onigiri wa ikura desu ka.","trans":"Onigiri ini berapa harganya?"},
  {"speaker":"店員","text":"百二十円です。","reading":"ひゃくにじゅうえんです。","romaji":"Hyaku nijuu en desu.","trans":"120 yen."},
  {"speaker":"アリ","text":"じゃあ、これをください。","reading":"じゃあ、これをください。","romaji":"Jaa, kore o kudasai.","trans":"Kalau begitu, tolong yang ini."},
  {"speaker":"店員","text":"お支払いは現金とカードのどちらにしますか。","reading":"おしはらいはげんきんとカードのどちらにしますか。","romaji":"Oshiharai wa genkin to kaado no dochira ni shimasu ka.","trans":"Pembayarannya mau pakai uang tunai atau kartu?"},
  {"speaker":"アリ","text":"現金でお願いします。","reading":"げんきんでおねがいします。","romaji":"Genkin de onegaishimasu.","trans":"Tolong dengan uang tunai."},
  {"speaker":"店員","text":"ありがとうございます。","reading":"ありがとうございます。","romaji":"Arigatou gozaimasu.","trans":"Terima kasih."}
 ]'::jsonb,
 '[
  {"word":"いくら","reading":"ikura","meaning":"berapa (harga)"},
  {"word":"円","reading":"えん · en","meaning":"yen"},
  {"word":"ください","reading":"kudasai","meaning":"tolong (minta)"},
  {"word":"支払い","reading":"しはらい · shiharai","meaning":"pembayaran"},
  {"word":"現金","reading":"げんきん · genkin","meaning":"uang tunai"}
 ]'::jsonb, false),

(1, 'Bertanya Arah', 'daily',
 '[
  {"speaker":"アリ","text":"すみません、駅はどこですか。","reading":"すみません、えきはどこですか。","romaji":"Sumimasen, eki wa doko desu ka.","trans":"Permisi, stasiun di mana ya?"},
  {"speaker":"田中","text":"あそこです。まっすぐ行ってください。","reading":"あそこです。まっすぐいってください。","romaji":"Asoko desu. Massugu itte kudasai.","trans":"Di sana. Silakan jalan lurus."},
  {"speaker":"アリ","text":"遠いですか。","reading":"とおいですか。","romaji":"Tooi desu ka.","trans":"Jauh tidak?"},
  {"speaker":"田中","text":"いいえ、近いです。五分ぐらいです。","reading":"いいえ、ちかいです。ごふんぐらいです。","romaji":"Iie, chikai desu. Gofun gurai desu.","trans":"Tidak, dekat. Sekitar 5 menit."},
  {"speaker":"アリ","text":"分かりました。信号を渡りますか。","reading":"わかりました。しんごうをわたりますか。","romaji":"Wakarimashita. Shingou o watarimasu ka.","trans":"Baik. Apakah saya perlu menyeberang di lampu lalu lintas?"},
  {"speaker":"田中","text":"いいえ、渡らなくていいです。このまま行ってください。","reading":"いいえ、わたらなくていいです。このままいってください。","romaji":"Iie, wataranakute ii desu. Kono mama itte kudasai.","trans":"Tidak, tidak perlu menyeberang. Silakan jalan terus seperti ini."},
  {"speaker":"アリ","text":"分かりました。ありがとうございます。","reading":"わかりました。ありがとうございます。","romaji":"Wakarimashita. Arigatou gozaimasu.","trans":"Baik. Terima kasih."}
 ]'::jsonb,
 '[
  {"word":"駅","reading":"えき · eki","meaning":"stasiun"},
  {"word":"まっすぐ","reading":"massugu","meaning":"lurus"},
  {"word":"近い","reading":"ちかい · chikai","meaning":"dekat"},
  {"word":"信号","reading":"しんごう · shingou","meaning":"lampu lalu lintas"}
 ]'::jsonb, false),

(1, 'Di Restoran', 'daily',
 '[
  {"speaker":"店員","text":"ご注文は何ですか。","reading":"ごちゅうもんはなんですか。","romaji":"Gochuumon wa nan desu ka.","trans":"Pesanannya apa?"},
  {"speaker":"アリ","text":"ラーメンを一つお願いします。","reading":"ラーメンをひとつおねがいします。","romaji":"Raamen o hitotsu onegaishimasu.","trans":"Tolong satu ramen."},
  {"speaker":"店員","text":"お飲み物は。","reading":"おのみものは。","romaji":"Onomimono wa.","trans":"Minumannya?"},
  {"speaker":"アリ","text":"お水でいいです。","reading":"おみずでいいです。","romaji":"Omizu de ii desu.","trans":"Air putih saja cukup."},
  {"speaker":"店員","text":"かしこまりました。少々お待ちください。","reading":"かしこまりました。しょうしょうおまちください。","romaji":"Kashikomarimashita. Shoushou omachi kudasai.","trans":"Baik. Mohon tunggu sebentar."},
  {"speaker":"アリ","text":"はい、お願いします。","reading":"はい、おねがいします。","romaji":"Hai, onegaishimasu.","trans":"Baik, tolong ya."},
  {"speaker":"店員","text":"お待たせしました。ラーメンです。","reading":"おまたせしました。ラーメンです。","romaji":"Omatase shimashita. Raamen desu.","trans":"Maaf menunggu. Ini ramennya."},
  {"speaker":"アリ","text":"いただきます。","reading":"いただきます。","romaji":"Itadakimasu.","trans":"Selamat makan (saya mulai makan)."}
 ]'::jsonb,
 '[
  {"word":"注文","reading":"ちゅうもん · chuumon","meaning":"pesanan"},
  {"word":"一つ","reading":"ひとつ · hitotsu","meaning":"satu (buah)"},
  {"word":"飲み物","reading":"のみもの · nomimono","meaning":"minuman"},
  {"word":"いただきます","reading":"itadakimasu","meaning":"ungkapan sebelum makan (selamat makan)"}
 ]'::jsonb, false),

(1, 'Membeli Tiket Kereta', 'daily',
 '[
  {"speaker":"アリ","text":"すみません、東京までいくらですか。","reading":"すみません、とうきょうまでいくらですか。","romaji":"Sumimasen, Toukyou made ikura desu ka.","trans":"Permisi, sampai Tokyo berapa?"},
  {"speaker":"駅員","text":"五百円です。","reading":"ごひゃくえんです。","romaji":"Gohyaku en desu.","trans":"500 yen."},
  {"speaker":"アリ","text":"切符はどこで買いますか。","reading":"きっぷはどこでかいますか。","romaji":"Kippu wa doko de kaimasu ka.","trans":"Tiketnya beli di mana?"},
  {"speaker":"駅員","text":"あの機械で買えますよ。","reading":"あのきかいでかえますよ。","romaji":"Ano kikai de kaemasu yo.","trans":"Bisa beli di mesin itu."},
  {"speaker":"アリ","text":"使い方を教えてもらえますか。","reading":"つかいかたをおしえてもらえますか。","romaji":"Tsukaikata o oshiete moraemasu ka.","trans":"Bisa tolong ajari cara memakainya?"},
  {"speaker":"駅員","text":"もちろんです。まず、行き先を選んでください。","reading":"もちろんです。まず、いきさきをえらんでください。","romaji":"Mochiron desu. Mazu, ikisaki o erande kudasai.","trans":"Tentu saja. Pertama, pilih tujuannya."},
  {"speaker":"アリ","text":"分かりました。ありがとうございます。","reading":"わかりました。ありがとうございます。","romaji":"Wakarimashita. Arigatou gozaimasu.","trans":"Baik. Terima kasih."}
 ]'::jsonb,
 '[
  {"word":"切符","reading":"きっぷ · kippu","meaning":"tiket"},
  {"word":"買う","reading":"かう · kau","meaning":"membeli"},
  {"word":"機械","reading":"きかい · kikai","meaning":"mesin"},
  {"word":"行き先","reading":"いきさき · ikisaki","meaning":"tujuan (perjalanan)"}
 ]'::jsonb, false),

(1, 'Menanyakan Waktu', 'daily',
 '[
  {"speaker":"アリ","text":"すみません、今何時ですか。","reading":"すみません、いまなんじですか。","romaji":"Sumimasen, ima nanji desu ka.","trans":"Permisi, sekarang jam berapa?"},
  {"speaker":"田中","text":"午後三時です。","reading":"ごごさんじです。","romaji":"Gogo sanji desu.","trans":"Jam 3 sore."},
  {"speaker":"アリ","text":"電車は何時に来ますか。","reading":"でんしゃはなんじにきますか。","romaji":"Densha wa nanji ni kimasu ka.","trans":"Keretanya datang jam berapa?"},
  {"speaker":"田中","text":"三時半に来ます。","reading":"さんじはんにきます。","romaji":"Sanji han ni kimasu.","trans":"Datang jam setengah empat."},
  {"speaker":"アリ","text":"あと何分ありますか。","reading":"あとなんぷんありますか。","romaji":"Ato nanpun arimasu ka.","trans":"Masih ada berapa menit lagi?"},
  {"speaker":"田中","text":"あと三十分です。","reading":"あとさんじゅっぷんです。","romaji":"Ato sanjuppun desu.","trans":"Masih 30 menit lagi."},
  {"speaker":"アリ","text":"分かりました。待ちます。","reading":"わかりました。まちます。","romaji":"Wakarimashita. Machimasu.","trans":"Baik. Saya akan menunggu."}
 ]'::jsonb,
 '[
  {"word":"今","reading":"いま · ima","meaning":"sekarang"},
  {"word":"何時","reading":"なんじ · nanji","meaning":"jam berapa"},
  {"word":"電車","reading":"でんしゃ · densha","meaning":"kereta"},
  {"word":"待つ","reading":"まつ · matsu","meaning":"menunggu"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO UPDATE SET
  lines = EXCLUDED.lines,
  vocab_highlight = EXCLUDED.vocab_highlight;
