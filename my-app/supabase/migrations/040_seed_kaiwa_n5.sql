-- 040: Seed 6 kaiwa N5 baru (2 daily, 1 work, 1 hospital, 1 biz, 1 kaigo).
-- Judul berformat Indonesia-saja, konsisten dengan data kaiwa live yang sudah ada.
-- Dua tema daily dipilih yang BELUM ada di N5 live (konbini & tanya arah sudah ada).
-- Setiap baris lines: {speaker, text, reading, romaji, trans} — memenuhi aturan konten.
-- Idempoten: unique index (level_id, title) + ON CONFLICT DO NOTHING.
-- TANPA DELETE — data kaiwa live yang sudah ada tidak disentuh.

CREATE UNIQUE INDEX IF NOT EXISTS uniq_kaiwa_level_title
  ON public.kaiwa_stories (level_id, title);

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

-- ── 1. daily · Kirim Paket di Kantor Pos ─────────────────────────────────────
(1, 'Kirim Paket di Kantor Pos', 'daily',
 '[
  {"speaker":"リナ","text":"すみません、この荷物をインドネシアに送りたいです。","reading":"すみません、このにもつをインドネシアにおくりたいです。","romaji":"Sumimasen, kono nimotsu o Indonesia ni okuritai desu.","trans":"Permisi, saya mau kirim paket ini ke Indonesia."},
  {"speaker":"局員","text":"はい。中身は何ですか。","reading":"はい。なかみはなんですか。","romaji":"Hai. Nakami wa nan desu ka.","trans":"Baik. Isinya apa?"},
  {"speaker":"リナ","text":"お菓子と服です。","reading":"おかしとふくです。","romaji":"Okashi to fuku desu.","trans":"Camilan sama baju."},
  {"speaker":"局員","text":"分かりました。こちらの紙に住所を書いてください。","reading":"わかりました。こちらのかみにじゅうしょをかいてください。","romaji":"Wakarimashita. Kochira no kami ni juusho o kaite kudasai.","trans":"Oke. Tolong tulis alamatnya di kertas ini."},
  {"speaker":"リナ","text":"日本語で書きますか。","reading":"にほんごでかきますか。","romaji":"Nihongo de kakimasu ka.","trans":"Nulisnya pakai bahasa Jepang?"},
  {"speaker":"局員","text":"いいえ、英語でも大丈夫ですよ。","reading":"いいえ、えいごでもだいじょうぶですよ。","romaji":"Iie, eigo demo daijoubu desu yo.","trans":"Nggak, pakai bahasa Inggris juga boleh."},
  {"speaker":"リナ","text":"はい、書きました。","reading":"はい、かきました。","romaji":"Hai, kakimashita.","trans":"Sudah, ini."},
  {"speaker":"局員","text":"船便と航空便と、どちらにしますか。","reading":"ふなびんとこうくうびんと、どちらにしますか。","romaji":"Funabin to koukuubin to, dochira ni shimasu ka.","trans":"Mau lewat laut atau udara?"},
  {"speaker":"リナ","text":"どちらが安いですか。","reading":"どちらがやすいですか。","romaji":"Dochira ga yasui desu ka.","trans":"Murahan mana?"},
  {"speaker":"局員","text":"船便です。でも、一か月ぐらいかかります。","reading":"ふなびんです。でも、いっかげつぐらいかかります。","romaji":"Funabin desu. Demo, ikkagetsu gurai kakarimasu.","trans":"Lewat laut. Tapi sampainya sekitar sebulan."},
  {"speaker":"リナ","text":"じゃあ、航空便でお願いします。","reading":"じゃあ、こうくうびんでおねがいします。","romaji":"Jaa, koukuubin de onegai shimasu.","trans":"Kalau gitu, lewat udara aja."},
  {"speaker":"局員","text":"はい。全部で二千三百円です。","reading":"はい。ぜんぶでにせんさんびゃくえんです。","romaji":"Hai. Zenbu de nisen sanbyaku en desu.","trans":"Baik. Semuanya 2.300 yen."},
  {"speaker":"リナ","text":"何日ぐらいで着きますか。","reading":"なんにちぐらいでつきますか。","romaji":"Nannichi gurai de tsukimasu ka.","trans":"Sampainya berapa hari?"},
  {"speaker":"局員","text":"一週間ぐらいです。","reading":"いっしゅうかんぐらいです。","romaji":"Isshuukan gurai desu.","trans":"Sekitar seminggu."},
  {"speaker":"リナ","text":"分かりました。お願いします。","reading":"わかりました。おねがいします。","romaji":"Wakarimashita. Onegai shimasu.","trans":"Oke, tolong ya."}
 ]'::jsonb,
 '[
  {"word":"荷物","reading":"にもつ","meaning":"paket / barang bawaan"},
  {"word":"中身","reading":"なかみ","meaning":"isi"},
  {"word":"住所","reading":"じゅうしょ","meaning":"alamat"},
  {"word":"船便","reading":"ふなびん","meaning":"pos jalur laut"},
  {"word":"航空便","reading":"こうくうびん","meaning":"pos jalur udara"}
 ]'::jsonb,
 false),

-- ── 2. daily · Cara Buang Sampah ─────────────────────────────────────────────
(1, 'Cara Buang Sampah', 'daily',
 '[
  {"speaker":"リナ","text":"すみません、ごみの出し方を教えてください。","reading":"すみません、ごみのだしかたをおしえてください。","romaji":"Sumimasen, gomi no dashikata o oshiete kudasai.","trans":"Permisi, boleh diajari cara buang sampah?"},
  {"speaker":"大家","text":"いいですよ。燃えるごみは月曜日と木曜日です。","reading":"いいですよ。もえるごみはげつようびともくようびです。","romaji":"Ii desu yo. Moeru gomi wa getsuyoubi to mokuyoubi desu.","trans":"Boleh. Sampah yang bisa dibakar tiap Senin dan Kamis."},
  {"speaker":"リナ","text":"ペットボトルはいつですか。","reading":"ペットボトルはいつですか。","romaji":"Pettobotoru wa itsu desu ka.","trans":"Kalau botol plastik kapan?"},
  {"speaker":"大家","text":"水曜日です。びんと缶も水曜日ですよ。","reading":"すいようびです。びんとかんもすいようびですよ。","romaji":"Suiyoubi desu. Bin to kan mo suiyoubi desu yo.","trans":"Rabu. Botol kaca sama kaleng juga Rabu."},
  {"speaker":"リナ","text":"何時までに出しますか。","reading":"なんじまでにだしますか。","romaji":"Nanji made ni dashimasu ka.","trans":"Buangnya paling lambat jam berapa?"},
  {"speaker":"大家","text":"朝八時までに出してください。","reading":"あさはちじまでにだしてください。","romaji":"Asa hachiji made ni dashite kudasai.","trans":"Sebelum jam 8 pagi ya."},
  {"speaker":"リナ","text":"夜に出してもいいですか。","reading":"よるにだしてもいいですか。","romaji":"Yoru ni dashite mo ii desu ka.","trans":"Kalau malam sebelumnya boleh?"},
  {"speaker":"大家","text":"だめです。カラスが来ますから。","reading":"だめです。カラスがきますから。","romaji":"Dame desu. Karasu ga kimasu kara.","trans":"Jangan. Nanti gagaknya datang."},
  {"speaker":"リナ","text":"そうですか。ごみ袋はどこで買えますか。","reading":"そうですか。ごみぶくろはどこでかえますか。","romaji":"Sou desu ka. Gomibukuro wa doko de kaemasu ka.","trans":"Oh gitu. Kantong sampahnya beli di mana?"},
  {"speaker":"大家","text":"スーパーやコンビニで買えますよ。","reading":"スーパーやコンビニでかえますよ。","romaji":"Suupaa ya konbini de kaemasu yo.","trans":"Di supermarket atau konbini ada."},
  {"speaker":"リナ","text":"大きいごみはどうしますか。","reading":"おおきいごみはどうしますか。","romaji":"Ookii gomi wa dou shimasu ka.","trans":"Kalau sampah besar gimana?"},
  {"speaker":"大家","text":"市に電話してください。お金がかかります。","reading":"しにでんわしてください。おかねがかかります。","romaji":"Shi ni denwa shite kudasai. Okane ga kakarimasu.","trans":"Telepon kantor kota dulu. Itu bayar."},
  {"speaker":"リナ","text":"分かりました。ありがとうございます。","reading":"わかりました。ありがとうございます。","romaji":"Wakarimashita. Arigatou gozaimasu.","trans":"Oke, makasih banyak."},
  {"speaker":"大家","text":"いいえ。分からなかったら、また聞いてくださいね。","reading":"いいえ。わからなかったら、またきいてくださいね。","romaji":"Iie. Wakaranakattara, mata kiite kudasai ne.","trans":"Sama-sama. Kalau bingung, tanya lagi aja ya."}
 ]'::jsonb,
 '[
  {"word":"ごみ","reading":"ごみ","meaning":"sampah"},
  {"word":"燃えるごみ","reading":"もえるごみ","meaning":"sampah mudah terbakar"},
  {"word":"ペットボトル","reading":"ペットボトル","meaning":"botol plastik"},
  {"word":"ごみ袋","reading":"ごみぶくろ","meaning":"kantong sampah"},
  {"word":"出す","reading":"だす","meaning":"membuang / mengeluarkan"}
 ]'::jsonb,
 false),

-- ── 3. work · Hari Pertama Kerja Part-time ───────────────────────────────────
(1, 'Hari Pertama Kerja Part-time', 'work',
 '[
  {"speaker":"店長","text":"おはようございます。今日からですね。","reading":"おはようございます。きょうからですね。","romaji":"Ohayou gozaimasu. Kyou kara desu ne.","trans":"Selamat pagi. Mulai hari ini ya."},
  {"speaker":"リナ","text":"おはようございます。リナです。よろしくお願いします。","reading":"おはようございます。リナです。よろしくおねがいします。","romaji":"Ohayou gozaimasu. Rina desu. Yoroshiku onegai shimasu.","trans":"Selamat pagi. Saya Rina. Mohon bimbingannya."},
  {"speaker":"店長","text":"よろしく。まず、この制服に着替えてください。","reading":"よろしく。まず、このせいふくにきがえてください。","romaji":"Yoroshiku. Mazu, kono seifuku ni kigaete kudasai.","trans":"Sama-sama. Pertama, ganti dulu ke seragam ini ya."},
  {"speaker":"リナ","text":"はい、分かりました。","reading":"はい、わかりました。","romaji":"Hai, wakarimashita.","trans":"Baik."},
  {"speaker":"店長","text":"仕事は九時から五時までです。","reading":"しごとはくじからごじまでです。","romaji":"Shigoto wa kuji kara goji made desu.","trans":"Kerjanya dari jam 9 sampai jam 5."},
  {"speaker":"店長","text":"休憩は一時間あります。","reading":"きゅうけいはいちじかんあります。","romaji":"Kyuukei wa ichijikan arimasu.","trans":"Istirahatnya satu jam."},
  {"speaker":"リナ","text":"休憩は何時からですか。","reading":"きゅうけいはなんじからですか。","romaji":"Kyuukei wa nanji kara desu ka.","trans":"Istirahatnya mulai jam berapa?"},
  {"speaker":"店長","text":"十二時からです。","reading":"じゅうにじからです。","romaji":"Juuniji kara desu.","trans":"Jam 12."},
  {"speaker":"リナ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Oke."},
  {"speaker":"店長","text":"分からないことがあったら、いつでも聞いてください。","reading":"わからないことがあったら、いつでもきいてください。","romaji":"Wakaranai koto ga attara, itsudemo kiite kudasai.","trans":"Kalau ada yang nggak jelas, tanya aja kapan pun."},
  {"speaker":"リナ","text":"はい、ありがとうございます。","reading":"はい、ありがとうございます。","romaji":"Hai, arigatou gozaimasu.","trans":"Baik, terima kasih."},
  {"speaker":"店長","text":"じゃあ、最初にレジの使い方を教えますね。","reading":"じゃあ、さいしょにレジのつかいかたをおしえますね。","romaji":"Jaa, saisho ni reji no tsukaikata o oshiemasu ne.","trans":"Nah, pertama kuajari cara pakai kasir ya."},
  {"speaker":"リナ","text":"お願いします。","reading":"おねがいします。","romaji":"Onegai shimasu.","trans":"Siap, tolong ya."},
  {"speaker":"店長","text":"ゆっくり覚えれば大丈夫ですよ。","reading":"ゆっくりおぼえればだいじょうぶですよ。","romaji":"Yukkuri oboereba daijoubu desu yo.","trans":"Pelan-pelan aja ngafalinnya, nggak apa-apa."},
  {"speaker":"リナ","text":"はい、頑張ります。","reading":"はい、がんばります。","romaji":"Hai, ganbarimasu.","trans":"Iya, aku akan berusaha!"}
 ]'::jsonb,
 '[
  {"word":"制服","reading":"せいふく","meaning":"seragam"},
  {"word":"休憩","reading":"きゅうけい","meaning":"istirahat"},
  {"word":"レジ","reading":"レジ","meaning":"kasir"},
  {"word":"使い方","reading":"つかいかた","meaning":"cara pakai"},
  {"word":"頑張る","reading":"がんばる","meaning":"berusaha"}
 ]'::jsonb,
 false),

-- ── 4. hospital · Periksa ke Dokter ──────────────────────────────────────────
(1, 'Periksa ke Dokter', 'hospital',
 '[
  {"speaker":"医者","text":"どうしましたか。","reading":"どうしましたか。","romaji":"Dou shimashita ka.","trans":"Ada keluhan apa?"},
  {"speaker":"リナ","text":"昨日から熱があります。頭も痛いです。","reading":"きのうからねつがあります。あたまもいたいです。","romaji":"Kinou kara netsu ga arimasu. Atama mo itai desu.","trans":"Dari kemarin demam. Kepala juga sakit."},
  {"speaker":"医者","text":"そうですか。熱は何度ですか。","reading":"そうですか。ねつはなんどですか。","romaji":"Sou desu ka. Netsu wa nando desu ka.","trans":"Begitu. Demamnya berapa derajat?"},
  {"speaker":"リナ","text":"三十八度です。","reading":"さんじゅうはちどです。","romaji":"Sanjuuhachi do desu.","trans":"38 derajat."},
  {"speaker":"医者","text":"のどは痛いですか。","reading":"のどはいたいですか。","romaji":"Nodo wa itai desu ka.","trans":"Tenggorokannya sakit?"},
  {"speaker":"リナ","text":"はい、少し痛いです。","reading":"はい、すこしいたいです。","romaji":"Hai, sukoshi itai desu.","trans":"Iya, agak sakit."},
  {"speaker":"医者","text":"口を開けてください。","reading":"くちをあけてください。","romaji":"Kuchi o akete kudasai.","trans":"Coba buka mulutnya."},
  {"speaker":"医者","text":"少し赤いですね。","reading":"すこしあかいですね。","romaji":"Sukoshi akai desu ne.","trans":"Agak merah ya."},
  {"speaker":"リナ","text":"風邪ですか。","reading":"かぜですか。","romaji":"Kaze desu ka.","trans":"Ini flu ya, Dok?"},
  {"speaker":"医者","text":"そうですね。ただの風邪だと思います。","reading":"そうですね。ただのかぜだとおもいます。","romaji":"Sou desu ne. Tada no kaze da to omoimasu.","trans":"Iya, kelihatannya cuma flu biasa."},
  {"speaker":"リナ","text":"薬はありますか。","reading":"くすりはありますか。","romaji":"Kusuri wa arimasu ka.","trans":"Ada obatnya?"},
  {"speaker":"医者","text":"はい、薬を出します。一日三回、食後に飲んでください。","reading":"はい、くすりをだします。いちにちさんかい、しょくごにのんでください。","romaji":"Hai, kusuri o dashimasu. Ichinichi sankai, shokugo ni nonde kudasai.","trans":"Ada, saya resepkan. Diminum 3 kali sehari setelah makan ya."},
  {"speaker":"リナ","text":"お風呂に入ってもいいですか。","reading":"おふろにはいってもいいですか。","romaji":"Ofuro ni haitte mo ii desu ka.","trans":"Boleh mandi berendam nggak?"},
  {"speaker":"医者","text":"今日はやめてください。ゆっくり休んでくださいね。","reading":"きょうはやめてください。ゆっくりやすんでくださいね。","romaji":"Kyou wa yamete kudasai. Yukkuri yasunde kudasai ne.","trans":"Hari ini jangan dulu. Istirahat yang cukup ya."},
  {"speaker":"リナ","text":"はい、ありがとうございました。","reading":"はい、ありがとうございました。","romaji":"Hai, arigatou gozaimashita.","trans":"Baik, terima kasih, Dok."}
 ]'::jsonb,
 '[
  {"word":"熱","reading":"ねつ","meaning":"demam"},
  {"word":"のど","reading":"のど","meaning":"tenggorokan"},
  {"word":"風邪","reading":"かぜ","meaning":"flu / masuk angin"},
  {"word":"薬","reading":"くすり","meaning":"obat"},
  {"word":"食後","reading":"しょくご","meaning":"setelah makan"}
 ]'::jsonb,
 false),

-- ── 5. biz · Menyambut Tamu dan Tukar Kartu Nama ─────────────────────────────
(1, 'Menyambut Tamu dan Tukar Kartu Nama', 'biz',
 '[
  {"speaker":"リナ","text":"おはようございます。ABC商事のリナと申します。","reading":"おはようございます。エービーシーしょうじのリナともうします。","romaji":"Ohayou gozaimasu. ABC shouji no Rina to moushimasu.","trans":"Selamat pagi. Saya Rina dari ABC Shoji."},
  {"speaker":"田中","text":"おはようございます。田中です。お世話になっております。","reading":"おはようございます。たなかです。おせわになっております。","romaji":"Ohayou gozaimasu. Tanaka desu. Osewa ni natte orimasu.","trans":"Selamat pagi. Saya Tanaka. Terima kasih atas kerja samanya selama ini."},
  {"speaker":"リナ","text":"こちらこそ、お世話になっております。","reading":"こちらこそ、おせわになっております。","romaji":"Kochira koso, osewa ni natte orimasu.","trans":"Sama-sama, terima kasih atas kerja samanya."},
  {"speaker":"田中","text":"名刺をどうぞ。","reading":"めいしをどうぞ。","romaji":"Meishi o douzo.","trans":"Ini kartu nama saya."},
  {"speaker":"リナ","text":"ありがとうございます。私の名刺です。どうぞ。","reading":"ありがとうございます。わたしのめいしです。どうぞ。","romaji":"Arigatou gozaimasu. Watashi no meishi desu. Douzo.","trans":"Terima kasih. Ini kartu nama saya."},
  {"speaker":"田中","text":"頂戴します。どうぞ、こちらへ。","reading":"ちょうだいします。どうぞ、こちらへ。","romaji":"Choudai shimasu. Douzo, kochira e.","trans":"Saya terima. Mari, silakan ke sini."},
  {"speaker":"リナ","text":"失礼します。","reading":"しつれいします。","romaji":"Shitsurei shimasu.","trans":"Permisi."},
  {"speaker":"田中","text":"コーヒーとお茶と、どちらがいいですか。","reading":"コーヒーとおちゃと、どちらがいいですか。","romaji":"Koohii to ocha to, dochira ga ii desu ka.","trans":"Mau kopi atau teh?"},
  {"speaker":"リナ","text":"お茶をお願いします。","reading":"おちゃをおねがいします。","romaji":"Ocha o onegai shimasu.","trans":"Teh saja."},
  {"speaker":"田中","text":"かしこまりました。少々お待ちください。","reading":"かしこまりました。しょうしょうおまちください。","romaji":"Kashikomarimashita. Shoushou omachi kudasai.","trans":"Baik. Mohon tunggu sebentar."},
  {"speaker":"リナ","text":"はい、ありがとうございます。","reading":"はい、ありがとうございます。","romaji":"Hai, arigatou gozaimasu.","trans":"Iya, terima kasih."},
  {"speaker":"田中","text":"担当の佐藤はすぐに参ります。","reading":"たんとうのさとうはすぐにまいります。","romaji":"Tantou no Satou wa sugu ni mairimasu.","trans":"Pak Sato yang menangani akan segera datang."},
  {"speaker":"リナ","text":"はい、よろしくお願いいたします。","reading":"はい、よろしくおねがいいたします。","romaji":"Hai, yoroshiku onegai itashimasu.","trans":"Baik, mohon kerja samanya."}
 ]'::jsonb,
 '[
  {"word":"名刺","reading":"めいし","meaning":"kartu nama"},
  {"word":"〜と申します","reading":"〜ともうします","meaning":"saya ... (cara sopan menyebut nama)"},
  {"word":"お世話になっております","reading":"おせわになっております","meaning":"frasa pembuka bisnis (terima kasih atas kerja samanya)"},
  {"word":"少々お待ちください","reading":"しょうしょうおまちください","meaning":"mohon tunggu sebentar"},
  {"word":"参ります","reading":"まいります","meaning":"datang (bentuk merendah)"}
 ]'::jsonb,
 false),

-- ── 6. kaigo · Membantu Lansia Makan ─────────────────────────────────────────
(1, 'Membantu Lansia Makan', 'kaigo',
 '[
  {"speaker":"リナ","text":"佐藤さん、こんにちは。お昼ご飯の時間ですよ。","reading":"さとうさん、こんにちは。おひるごはんのじかんですよ。","romaji":"Satou-san, konnichiwa. Ohirugohan no jikan desu yo.","trans":"Bu Sato, selamat siang. Sudah waktunya makan siang."},
  {"speaker":"佐藤","text":"ああ、リナさん。こんにちは。","reading":"ああ、リナさん。こんにちは。","romaji":"Aa, Rina-san. Konnichiwa.","trans":"Oh, Rina. Selamat siang."},
  {"speaker":"リナ","text":"今日は魚とみそ汁ですよ。おいしそうですね。","reading":"きょうはさかなとみそしるですよ。おいしそうですね。","romaji":"Kyou wa sakana to misoshiru desu yo. Oishisou desu ne.","trans":"Hari ini ikan sama sup miso. Kelihatannya enak."},
  {"speaker":"佐藤","text":"そうですか。楽しみですね。","reading":"そうですか。たのしみですね。","romaji":"Sou desu ka. Tanoshimi desu ne.","trans":"Wah, jadi nggak sabar."},
  {"speaker":"リナ","text":"まず、手を拭きましょうね。はい、どうぞ。","reading":"まず、てをふきましょうね。はい、どうぞ。","romaji":"Mazu, te o fukimashou ne. Hai, douzo.","trans":"Kita lap tangan dulu ya. Nah, silakan."},
  {"speaker":"佐藤","text":"ありがとう。","reading":"ありがとう。","romaji":"Arigatou.","trans":"Makasih."},
  {"speaker":"リナ","text":"みそ汁は熱いですから、気をつけてくださいね。","reading":"みそしるはあついですから、きをつけてくださいね。","romaji":"Misoshiru wa atsui desu kara, ki o tsukete kudasai ne.","trans":"Sup misonya panas, hati-hati ya."},
  {"speaker":"佐藤","text":"うん、大丈夫。","reading":"うん、だいじょうぶ。","romaji":"Un, daijoubu.","trans":"Iya, nggak apa-apa."},
  {"speaker":"リナ","text":"少し飲みますか。","reading":"すこしのみますか。","romaji":"Sukoshi nomimasu ka.","trans":"Mau minum kuahnya sedikit?"},
  {"speaker":"佐藤","text":"ええ、お願いします。","reading":"ええ、おねがいします。","romaji":"Ee, onegai shimasu.","trans":"Boleh, tolong ya."},
  {"speaker":"リナ","text":"ゆっくりでいいですよ。おいしいですか。","reading":"ゆっくりでいいですよ。おいしいですか。","romaji":"Yukkuri de ii desu yo. Oishii desu ka.","trans":"Pelan-pelan saja. Enak?"},
  {"speaker":"佐藤","text":"おいしいよ。ありがとうね。","reading":"おいしいよ。ありがとうね。","romaji":"Oishii yo. Arigatou ne.","trans":"Enak. Makasih ya."},
  {"speaker":"リナ","text":"よかったです。午後は散歩に行きましょうね。","reading":"よかったです。ごごはさんぽにいきましょうね。","romaji":"Yokatta desu. Gogo wa sanpo ni ikimashou ne.","trans":"Syukurlah. Nanti sore kita jalan-jalan ya."}
 ]'::jsonb,
 '[
  {"word":"お昼ご飯","reading":"おひるごはん","meaning":"makan siang"},
  {"word":"みそ汁","reading":"みそしる","meaning":"sup miso"},
  {"word":"拭く","reading":"ふく","meaning":"mengelap"},
  {"word":"熱い","reading":"あつい","meaning":"panas"},
  {"word":"散歩","reading":"さんぽ","meaning":"jalan-jalan"}
 ]'::jsonb,
 false)

ON CONFLICT (level_id, title) DO NOTHING;
