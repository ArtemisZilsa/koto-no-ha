-- ============================================================
-- Koto no Ha — Seed Dokkai N5 (level_id=1): 5 bacaan pendek (~100-150 huruf).
-- Tiap kalimat di content_json: jp + furigana + romaji + terjemahan Indonesia (id).
-- Re-runnable: hapus level ini lalu insert ulang.
-- ============================================================
DELETE FROM public.dokkai_passages WHERE level_id = 1;

INSERT INTO public.dokkai_passages (level_id, order_index, title, text_content, content_json, vocab_notes, questions, is_premium) VALUES
(1, 1, '自己紹介 — Perkenalan Diri',
 'はじめまして。わたしはアニサです。インドネシアから来ました。大学で日本語を勉強しています。どうぞよろしくお願いします。',
 '[
   {"jp":"はじめまして。わたしはアニサです。","furigana":"はじめまして。わたしはアニサです。","romaji":"Hajimemashite. Watashi wa Anisa desu.","id":"Salam kenal. Saya Anisa."},
   {"jp":"インドネシアから来ました。","furigana":"インドネシアからきました。","romaji":"Indonesia kara kimashita.","id":"Saya datang dari Indonesia."},
   {"jp":"大学で日本語を勉強しています。","furigana":"だいがくでにほんごをべんきょうしています。","romaji":"Daigaku de nihongo o benkyou shite imasu.","id":"Saya belajar bahasa Jepang di universitas."},
   {"jp":"どうぞよろしくお願いします。","furigana":"どうぞよろしくおねがいします。","romaji":"Douzo yoroshiku onegaishimasu.","id":"Mohon kerja samanya."}
 ]'::jsonb,
 '[
   {"word":"大学","reading":"だいがく","romaji":"daigaku","meaning":"universitas"},
   {"word":"日本語","reading":"にほんご","romaji":"nihongo","meaning":"bahasa Jepang"},
   {"word":"勉強","reading":"べんきょう","romaji":"benkyou","meaning":"belajar"},
   {"word":"来ました","reading":"きました","romaji":"kimashita","meaning":"datang (bentuk lampau)"}
 ]'::jsonb,
 '[
   {"q":"Anisa berasal dari mana?","options":["Jepang","Indonesia","Korea","Tiongkok"],"answer":1,"explanation":"Kalimat 「インドネシアから来ました」 berarti datang dari Indonesia."},
   {"q":"Apa yang Anisa pelajari di universitas?","options":["Bahasa Inggris","Bahasa Jepang","Matematika","Musik"],"answer":1,"explanation":"「日本語を勉強しています」 = sedang belajar bahasa Jepang."}
 ]'::jsonb,
 false),

(1, 2, 'わたしの一日 — Hari-hariku',
 'わたしは毎朝六時に起きます。朝ごはんを食べてから、学校へ行きます。午後は友だちと図書館で勉強します。夜十一時ごろ寝ます。',
 '[
   {"jp":"わたしは毎朝六時に起きます。","furigana":"わたしはまいあさろくじにおきます。","romaji":"Watashi wa maiasa rokuji ni okimasu.","id":"Saya bangun jam enam setiap pagi."},
   {"jp":"朝ごはんを食べてから、学校へ行きます。","furigana":"あさごはんをたべてから、がっこうへいきます。","romaji":"Asagohan o tabete kara, gakkou e ikimasu.","id":"Setelah sarapan, saya pergi ke sekolah."},
   {"jp":"午後は友だちと図書館で勉強します。","furigana":"ごごはともだちととしょかんでべんきょうします。","romaji":"Gogo wa tomodachi to toshokan de benkyou shimasu.","id":"Pada sore hari saya belajar di perpustakaan bersama teman."},
   {"jp":"夜十一時ごろ寝ます。","furigana":"よるじゅういちじごろねます。","romaji":"Yoru juuichiji goro nemasu.","id":"Saya tidur sekitar jam sebelas malam."}
 ]'::jsonb,
 '[
   {"word":"毎朝","reading":"まいあさ","romaji":"maiasa","meaning":"setiap pagi"},
   {"word":"起きます","reading":"おきます","romaji":"okimasu","meaning":"bangun"},
   {"word":"学校","reading":"がっこう","romaji":"gakkou","meaning":"sekolah"},
   {"word":"図書館","reading":"としょかん","romaji":"toshokan","meaning":"perpustakaan"},
   {"word":"寝ます","reading":"ねます","romaji":"nemasu","meaning":"tidur"}
 ]'::jsonb,
 '[
   {"q":"Jam berapa penulis bangun?","options":["Jam lima","Jam enam","Jam tujuh","Jam sebelas"],"answer":1,"explanation":"「六時に起きます」 = bangun jam enam."},
   {"q":"Di mana penulis belajar pada sore hari?","options":["Di sekolah","Di rumah","Di perpustakaan","Di kafe"],"answer":2,"explanation":"「図書館で勉強します」 = belajar di perpustakaan."}
 ]'::jsonb,
 false),

(1, 3, 'わたしの家族 — Keluargaku',
 'わたしの家族は四人です。父と母と妹がいます。父は会社員です。妹は高校生で、とても元気です。',
 '[
   {"jp":"わたしの家族は四人です。","furigana":"わたしのかぞくはよにんです。","romaji":"Watashi no kazoku wa yonin desu.","id":"Keluarga saya ada empat orang."},
   {"jp":"父と母と妹がいます。","furigana":"ちちとははといもうとがいます。","romaji":"Chichi to haha to imouto ga imasu.","id":"Ada ayah, ibu, dan adik perempuan."},
   {"jp":"父は会社員です。","furigana":"ちちはかいしゃいんです。","romaji":"Chichi wa kaishain desu.","id":"Ayah saya pegawai kantor."},
   {"jp":"妹は高校生で、とても元気です。","furigana":"いもうとはこうこうせいで、とてもげんきです。","romaji":"Imouto wa koukousei de, totemo genki desu.","id":"Adik saya siswa SMA dan sangat ceria."}
 ]'::jsonb,
 '[
   {"word":"家族","reading":"かぞく","romaji":"kazoku","meaning":"keluarga"},
   {"word":"父","reading":"ちち","romaji":"chichi","meaning":"ayah (sendiri)"},
   {"word":"妹","reading":"いもうと","romaji":"imouto","meaning":"adik perempuan"},
   {"word":"会社員","reading":"かいしゃいん","romaji":"kaishain","meaning":"pegawai kantor"},
   {"word":"高校生","reading":"こうこうせい","romaji":"koukousei","meaning":"siswa SMA"}
 ]'::jsonb,
 '[
   {"q":"Berapa jumlah anggota keluarga penulis?","options":["Tiga","Empat","Lima","Enam"],"answer":1,"explanation":"「四人です」 = empat orang."},
   {"q":"Apa pekerjaan ayah penulis?","options":["Guru","Pegawai kantor","Dokter","Siswa"],"answer":1,"explanation":"「父は会社員です」 = ayah seorang pegawai kantor."}
 ]'::jsonb,
 false),

(1, 4, 'わたしの町 — Kotaku',
 'わたしの町は静かです。駅の近くにスーパーやレストランがあります。公園もあって、週末は子どもが多いです。わたしはこの町が大好きです。',
 '[
   {"jp":"わたしの町は静かです。","furigana":"わたしのまちはしずかです。","romaji":"Watashi no machi wa shizuka desu.","id":"Kota saya tenang."},
   {"jp":"駅の近くにスーパーやレストランがあります。","furigana":"えきのちかくにスーパーやレストランがあります。","romaji":"Eki no chikaku ni suupaa ya resutoran ga arimasu.","id":"Di dekat stasiun ada supermarket dan restoran."},
   {"jp":"公園もあって、週末は子どもが多いです。","furigana":"こうえんもあって、しゅうまつはこどもがおおいです。","romaji":"Kouen mo atte, shuumatsu wa kodomo ga ooi desu.","id":"Ada juga taman, dan di akhir pekan banyak anak-anak."},
   {"jp":"わたしはこの町が大好きです。","furigana":"わたしはこのまちがだいすきです。","romaji":"Watashi wa kono machi ga daisuki desu.","id":"Saya sangat menyukai kota ini."}
 ]'::jsonb,
 '[
   {"word":"町","reading":"まち","romaji":"machi","meaning":"kota/distrik"},
   {"word":"静か","reading":"しずか","romaji":"shizuka","meaning":"tenang"},
   {"word":"駅","reading":"えき","romaji":"eki","meaning":"stasiun"},
   {"word":"公園","reading":"こうえん","romaji":"kouen","meaning":"taman"},
   {"word":"週末","reading":"しゅうまつ","romaji":"shuumatsu","meaning":"akhir pekan"}
 ]'::jsonb,
 '[
   {"q":"Bagaimana suasana kota penulis?","options":["Ramai","Tenang","Kotor","Berbahaya"],"answer":1,"explanation":"「静かです」 = tenang."},
   {"q":"Apa yang ada di dekat stasiun?","options":["Sekolah dan rumah sakit","Supermarket dan restoran","Bandara","Gunung"],"answer":1,"explanation":"「スーパーやレストランがあります」."}
 ]'::jsonb,
 false),

(1, 5, '週末 — Akhir Pekan',
 '先週の日曜日、友だちと映画を見ました。映画はとてもおもしろかったです。それから、レストランで昼ごはんを食べました。楽しい一日でした。',
 '[
   {"jp":"先週の日曜日、友だちと映画を見ました。","furigana":"せんしゅうのにちようび、ともだちとえいがをみました。","romaji":"Senshuu no nichiyoubi, tomodachi to eiga o mimashita.","id":"Minggu lalu hari Minggu, saya menonton film bersama teman."},
   {"jp":"映画はとてもおもしろかったです。","furigana":"えいがはとてもおもしろかったです。","romaji":"Eiga wa totemo omoshirokatta desu.","id":"Filmnya sangat menarik."},
   {"jp":"それから、レストランで昼ごはんを食べました。","furigana":"それから、レストランでひるごはんをたべました。","romaji":"Sorekara, resutoran de hirugohan o tabemashita.","id":"Setelah itu, kami makan siang di restoran."},
   {"jp":"楽しい一日でした。","furigana":"たのしいいちにちでした。","romaji":"Tanoshii ichinichi deshita.","id":"Hari yang menyenangkan."}
 ]'::jsonb,
 '[
   {"word":"先週","reading":"せんしゅう","romaji":"senshuu","meaning":"minggu lalu"},
   {"word":"映画","reading":"えいが","romaji":"eiga","meaning":"film"},
   {"word":"見ました","reading":"みました","romaji":"mimashita","meaning":"menonton (lampau)"},
   {"word":"昼ごはん","reading":"ひるごはん","romaji":"hirugohan","meaning":"makan siang"},
   {"word":"楽しい","reading":"たのしい","romaji":"tanoshii","meaning":"menyenangkan"}
 ]'::jsonb,
 '[
   {"q":"Apa yang dilakukan penulis pada hari Minggu lalu?","options":["Menonton film","Belajar","Bekerja","Berolahraga"],"answer":0,"explanation":"「映画を見ました」 = menonton film."},
   {"q":"Bagaimana kesan penulis tentang harinya?","options":["Membosankan","Melelahkan","Menyenangkan","Sedih"],"answer":2,"explanation":"「楽しい一日でした」 = hari yang menyenangkan."}
 ]'::jsonb,
 false);
