-- 048: 16 kaiwa lepas N5 (daily 5, work 3, hospital 3, biz 2, kaigo 3).
--
-- Dialog lepas: job_slug NULL, jadi muncul di telusur per tema (/kaiwa),
-- bukan di silabus profesi. Melengkapi lubang terbesar di data lama —
-- kategori hospital cuma punya 1 dialog di seluruh situs.
--
-- Tata bahasa dijaga di rentang N5: masu/desu, partikel dasar, te-kudasai,
-- tai-form. Frasa set bisnis (お世話になっております dsb) dibiarkan utuh karena
-- dipakai sebagai satu bongkah, bukan pola yang harus diurai pemula.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO NOTHING.
--
-- [Fase D, Day 4] `vocab_highlight[].reading` dirapikan dari "よみ (romaji)"
-- (kurung ganda dengan kurung yang dirender komponen) ke standar "よみ ·
-- romaji" — lihat catatan di 040_seed_kaiwa_n5.sql. Kata kana-saja (mis.
-- ハンコ, パジャマ) sudah bare-romaji sebelum ini, tidak disentuh. Tidak ada
-- arti, bacaan, atau baris dialog yang berubah.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(1, 'Di Laundry Koin', 'daily',
 '[
  {"speaker":"リナ","text":"すみません、この機械の使い方が分かりません。","reading":"すみません、このきかいのつかいかたがわかりません。","romaji":"Sumimasen, kono kikai no tsukaikata ga wakarimasen.","trans":"Permisi, saya tidak paham cara pakai mesin ini."},
  {"speaker":"店員","text":"洗濯ですか、乾燥ですか。","reading":"せんたくですか、かんそうですか。","romaji":"Sentaku desu ka, kansou desu ka.","trans":"Mau mencuci atau mengeringkan?"},
  {"speaker":"リナ","text":"洗濯です。","reading":"せんたくです。","romaji":"Sentaku desu.","trans":"Mencuci."},
  {"speaker":"店員","text":"では、この左の機械です。まず、服を入れてください。","reading":"では、このひだりのきかいです。まず、ふくをいれてください。","romaji":"Dewa, kono hidari no kikai desu. Mazu, fuku o irete kudasai.","trans":"Kalau begitu, mesin yang kiri ini. Pertama, masukkan pakaiannya."},
  {"speaker":"リナ","text":"洗剤はどこですか。","reading":"せんざいはどこですか。","romaji":"Senzai wa doko desu ka.","trans":"Deterjennya di mana?"},
  {"speaker":"店員","text":"洗剤は自動で出ます。買わなくていいです。","reading":"せんざいはじどうででます。かわなくていいです。","romaji":"Senzai wa jidou de demasu. Kawanakute ii desu.","trans":"Deterjennya keluar otomatis. Tidak perlu beli."},
  {"speaker":"リナ","text":"便利ですね。お金はいくらですか。","reading":"べんりですね。おかねはいくらですか。","romaji":"Benri desu ne. Okane wa ikura desu ka.","trans":"Praktis ya. Biayanya berapa?"},
  {"speaker":"店員","text":"四百円です。ここに入れてください。","reading":"よんひゃくえんです。ここにいれてください。","romaji":"Yonhyaku en desu. Koko ni irete kudasai.","trans":"400 yen. Masukkan uangnya di sini."},
  {"speaker":"リナ","text":"百円玉だけですか。","reading":"ひゃくえんだまだけですか。","romaji":"Hyakuen-dama dake desu ka.","trans":"Hanya koin 100 yen?"},
  {"speaker":"店員","text":"はい。両替機はあそこにあります。","reading":"はい。りょうがえきはあそこにあります。","romaji":"Hai. Ryougaeki wa asoko ni arimasu.","trans":"Ya. Mesin penukar uangnya ada di sana."},
  {"speaker":"リナ","text":"何分ぐらいかかりますか。","reading":"なんぷんぐらいかかりますか。","romaji":"Nanpun gurai kakarimasu ka.","trans":"Perlu berapa menit?"},
  {"speaker":"店員","text":"三十分ぐらいです。乾燥は別で二百円です。","reading":"さんじゅっぷんぐらいです。かんそうはべつでにひゃくえんです。","romaji":"Sanjuppun gurai desu. Kansou wa betsu de nihyaku en desu.","trans":"Sekitar 30 menit. Pengeringnya terpisah, 200 yen."},
  {"speaker":"リナ","text":"分かりました。ありがとうございます。","reading":"わかりました。ありがとうございます。","romaji":"Wakarimashita. Arigatou gozaimasu.","trans":"Baik. Terima kasih."}
 ]'::jsonb,
 '[
  {"word":"洗剤","reading":"せんざい · senzai","meaning":"deterjen"},
  {"word":"乾燥","reading":"かんそう · kansou","meaning":"pengeringan"},
  {"word":"両替機","reading":"りょうがえき · ryougaeki","meaning":"mesin penukar uang"},
  {"word":"百円玉","reading":"ひゃくえんだま · hyakuen-dama","meaning":"koin 100 yen"}
 ]'::jsonb, false),

(1, 'Membuka Rekening Bank', 'daily',
 '[
  {"speaker":"アリ","text":"すみません、口座を作りたいです。","reading":"すみません、こうざをつくりたいです。","romaji":"Sumimasen, kouza o tsukuritai desu.","trans":"Permisi, saya ingin membuat rekening."},
  {"speaker":"銀行員","text":"はい。在留カードとハンコはお持ちですか。","reading":"はい。ざいりゅうカードとハンコはおもちですか。","romaji":"Hai. Zairyuu kaado to hanko wa omochi desu ka.","trans":"Baik. Apakah membawa kartu izin tinggal dan stempel nama?"},
  {"speaker":"アリ","text":"在留カードはあります。ハンコはありません。","reading":"ざいりゅうカードはあります。ハンコはありません。","romaji":"Zairyuu kaado wa arimasu. Hanko wa arimasen.","trans":"Kartu izin tinggal ada. Stempel tidak punya."},
  {"speaker":"銀行員","text":"サインでも大丈夫ですよ。","reading":"サインでもだいじょうぶですよ。","romaji":"Sain demo daijoubu desu yo.","trans":"Tanda tangan juga boleh kok."},
  {"speaker":"アリ","text":"よかったです。","reading":"よかったです。","romaji":"Yokatta desu.","trans":"Syukurlah."},
  {"speaker":"銀行員","text":"この用紙に名前と住所を書いてください。","reading":"このようしになまえとじゅうしょをかいてください。","romaji":"Kono youshi ni namae to juusho o kaite kudasai.","trans":"Tolong tulis nama dan alamat di formulir ini."},
  {"speaker":"アリ","text":"名前はカタカナで書きますか。","reading":"なまえはカタカナでかきますか。","romaji":"Namae wa katakana de kakimasu ka.","trans":"Namanya ditulis pakai katakana?"},
  {"speaker":"銀行員","text":"はい、カタカナでお願いします。","reading":"はい、カタカナでおねがいします。","romaji":"Hai, katakana de onegai shimasu.","trans":"Ya, tolong dengan katakana."},
  {"speaker":"アリ","text":"電話番号も書きますか。","reading":"でんわばんごうもかきますか。","romaji":"Denwa bangou mo kakimasu ka.","trans":"Nomor telepon juga ditulis?"},
  {"speaker":"銀行員","text":"書いてください。携帯の番号でいいです。","reading":"かいてください。けいたいのばんごうでいいです。","romaji":"Kaite kudasai. Keitai no bangou de ii desu.","trans":"Tolong ditulis. Nomor HP saja cukup."},
  {"speaker":"アリ","text":"キャッシュカードはいつもらえますか。","reading":"キャッシュカードはいつもらえますか。","romaji":"Kyasshu kaado wa itsu moraemasu ka.","trans":"Kartu ATM-nya kapan saya terima?"},
  {"speaker":"銀行員","text":"一週間ぐらいで家に届きます。","reading":"いっしゅうかんぐらいでいえにとどきます。","romaji":"Isshuukan gurai de ie ni todokimasu.","trans":"Sekitar seminggu, dikirim ke rumah."},
  {"speaker":"アリ","text":"分かりました。ありがとうございます。","reading":"わかりました。ありがとうございます。","romaji":"Wakarimashita. Arigatou gozaimasu.","trans":"Baik. Terima kasih."}
 ]'::jsonb,
 '[
  {"word":"口座","reading":"こうざ · kouza","meaning":"rekening bank"},
  {"word":"在留カード","reading":"ざいりゅうカード · zairyuu kaado","meaning":"kartu izin tinggal"},
  {"word":"ハンコ","reading":"hanko","meaning":"stempel nama (pengganti tanda tangan di Jepang)"},
  {"word":"届く","reading":"とどく · todoku","meaning":"sampai, terkirim"}
 ]'::jsonb, false),

(1, 'Mencari Apartemen', 'daily',
 '[
  {"speaker":"デウィ","text":"アパートを探しています。","reading":"アパートをさがしています。","romaji":"Apaato o sagashite imasu.","trans":"Saya sedang mencari apartemen."},
  {"speaker":"店員","text":"ご予算はどのぐらいですか。","reading":"ごよさんはどのぐらいですか。","romaji":"Goyosan wa dono gurai desu ka.","trans":"Anggarannya sekitar berapa?"},
  {"speaker":"デウィ","text":"五万円ぐらいです。","reading":"ごまんえんぐらいです。","romaji":"Goman en gurai desu.","trans":"Sekitar 50.000 yen."},
  {"speaker":"店員","text":"駅から近いほうがいいですか。","reading":"えきからちかいほうがいいですか。","romaji":"Eki kara chikai hou ga ii desu ka.","trans":"Lebih baik yang dekat stasiun?"},
  {"speaker":"デウィ","text":"はい、歩いて十分ぐらいがいいです。","reading":"はい、あるいてじゅっぷんぐらいがいいです。","romaji":"Hai, aruite juppun gurai ga ii desu.","trans":"Ya, sekitar 10 menit jalan kaki."},
  {"speaker":"店員","text":"この部屋はどうですか。駅から八分です。","reading":"このへやはどうですか。えきからはっぷんです。","romaji":"Kono heya wa dou desu ka. Eki kara happun desu.","trans":"Bagaimana kamar ini? Delapan menit dari stasiun."},
  {"speaker":"デウィ","text":"家賃はいくらですか。","reading":"やちんはいくらですか。","romaji":"Yachin wa ikura desu ka.","trans":"Sewanya berapa?"},
  {"speaker":"店員","text":"五万二千円です。管理費が三千円かかります。","reading":"ごまんにせんえんです。かんりひがさんぜんえんかかります。","romaji":"Goman nisen en desu. Kanrihi ga sanzen en kakarimasu.","trans":"52.000 yen. Biaya pengelolaan 3.000 yen."},
  {"speaker":"デウィ","text":"全部でいくらになりますか。","reading":"ぜんぶでいくらになりますか。","romaji":"Zenbu de ikura ni narimasu ka.","trans":"Totalnya jadi berapa?"},
  {"speaker":"店員","text":"五万五千円です。","reading":"ごまんごせんえんです。","romaji":"Goman gosen en desu.","trans":"55.000 yen."},
  {"speaker":"デウィ","text":"少し高いですね。もう少し安い部屋はありますか。","reading":"すこしたかいですね。もうすこしやすいへやはありますか。","romaji":"Sukoshi takai desu ne. Mou sukoshi yasui heya wa arimasu ka.","trans":"Agak mahal ya. Ada kamar yang sedikit lebih murah?"},
  {"speaker":"店員","text":"あります。少し古いですが、四万八千円です。","reading":"あります。すこしふるいですが、よんまんはっせんえんです。","romaji":"Arimasu. Sukoshi furui desu ga, yonman hassen en desu.","trans":"Ada. Agak tua, tapi 48.000 yen."},
  {"speaker":"デウィ","text":"見たいです。お願いします。","reading":"みたいです。おねがいします。","romaji":"Mitai desu. Onegai shimasu.","trans":"Saya mau lihat. Tolong ya."}
 ]'::jsonb,
 '[
  {"word":"家賃","reading":"やちん · yachin","meaning":"uang sewa"},
  {"word":"管理費","reading":"かんりひ · kanrihi","meaning":"biaya pengelolaan gedung"},
  {"word":"予算","reading":"よさん · yosan","meaning":"anggaran"},
  {"word":"探す","reading":"さがす · sagasu","meaning":"mencari"}
 ]'::jsonb, false),

(1, 'Naik Bus Kota', 'daily',
 '[
  {"speaker":"ブディ","text":"すみません、このバスは市役所に行きますか。","reading":"すみません、このバスはしやくしょにいきますか。","romaji":"Sumimasen, kono basu wa shiyakusho ni ikimasu ka.","trans":"Permisi, bus ini ke kantor kota?"},
  {"speaker":"運転手","text":"行きますよ。","reading":"いきますよ。","romaji":"Ikimasu yo.","trans":"Ke sana kok."},
  {"speaker":"ブディ","text":"お金は先に払いますか。","reading":"おかねはさきにはらいますか。","romaji":"Okane wa saki ni haraimasu ka.","trans":"Bayarnya di depan?"},
  {"speaker":"運転手","text":"いいえ、降りるときです。整理券を取ってください。","reading":"いいえ、おりるときです。せいりけんをとってください。","romaji":"Iie, oriru toki desu. Seiriken o totte kudasai.","trans":"Tidak, saat turun. Tolong ambil karcis nomor."},
  {"speaker":"ブディ","text":"整理券はどこですか。","reading":"せいりけんはどこですか。","romaji":"Seiriken wa doko desu ka.","trans":"Karcis nomornya di mana?"},
  {"speaker":"運転手","text":"そこの機械から出ます。","reading":"そこのきかいからでます。","romaji":"Soko no kikai kara demasu.","trans":"Keluar dari mesin di situ."},
  {"speaker":"ブディ","text":"取りました。いくらですか。","reading":"とりました。いくらですか。","romaji":"Torimashita. Ikura desu ka.","trans":"Sudah saya ambil. Berapa ongkosnya?"},
  {"speaker":"運転手","text":"前の画面を見てください。番号のところに金額が出ます。","reading":"まえのがめんをみてください。ばんごうのところにきんがくがでます。","romaji":"Mae no gamen o mite kudasai. Bangou no tokoro ni kingaku ga demasu.","trans":"Lihat layar di depan. Jumlahnya muncul di kolom nomormu."},
  {"speaker":"ブディ","text":"二百二十円ですね。","reading":"にひゃくにじゅうえんですね。","romaji":"Nihyaku nijuu en desu ne.","trans":"220 yen ya."},
  {"speaker":"運転手","text":"そうです。小銭がなければ、両替できます。","reading":"そうです。こぜにがなければ、りょうがえできます。","romaji":"Sou desu. Kozeni ga nakereba, ryougae dekimasu.","trans":"Betul. Kalau tidak ada uang receh, bisa ditukar."},
  {"speaker":"ブディ","text":"市役所はいくつ目ですか。","reading":"しやくしょはいくつめですか。","romaji":"Shiyakusho wa ikutsume desu ka.","trans":"Kantor kota halte ke berapa?"},
  {"speaker":"運転手","text":"四つ目です。放送を聞いてください。","reading":"よっつめです。ほうそうをきいてください。","romaji":"Yottsume desu. Housou o kiite kudasai.","trans":"Halte keempat. Dengarkan pengumumannya."},
  {"speaker":"ブディ","text":"はい、ありがとうございます。","reading":"はい、ありがとうございます。","romaji":"Hai, arigatou gozaimasu.","trans":"Baik, terima kasih."}
 ]'::jsonb,
 '[
  {"word":"整理券","reading":"せいりけん · seiriken","meaning":"karcis nomor naik bus (penentu ongkos)"},
  {"word":"小銭","reading":"こぜに · kozeni","meaning":"uang receh"},
  {"word":"市役所","reading":"しやくしょ · shiyakusho","meaning":"kantor pemerintah kota"},
  {"word":"放送","reading":"ほうそう · housou","meaning":"pengumuman, siaran"}
 ]'::jsonb, false),

(1, 'Belanja di Supermarket', 'daily',
 '[
  {"speaker":"サリ","text":"すみません、牛乳はどこですか。","reading":"すみません、ぎゅうにゅうはどこですか。","romaji":"Sumimasen, gyuunyuu wa doko desu ka.","trans":"Permisi, susu di mana ya?"},
  {"speaker":"店員","text":"一番奥の右側です。","reading":"いちばんおくのみぎがわです。","romaji":"Ichiban oku no migigawa desu.","trans":"Di ujung paling dalam, sebelah kanan."},
  {"speaker":"サリ","text":"ありがとうございます。あの、これは何の肉ですか。","reading":"ありがとうございます。あの、これはなんのにくですか。","romaji":"Arigatou gozaimasu. Ano, kore wa nan no niku desu ka.","trans":"Terima kasih. Anu, ini daging apa?"},
  {"speaker":"店員","text":"それは豚肉です。","reading":"それはぶたにくです。","romaji":"Sore wa butaniku desu.","trans":"Itu daging babi."},
  {"speaker":"サリ","text":"鶏肉はありますか。豚は食べません。","reading":"とりにくはありますか。ぶたはたべません。","romaji":"Toriniku wa arimasu ka. Buta wa tabemasen.","trans":"Ada daging ayam? Saya tidak makan babi."},
  {"speaker":"店員","text":"ございます。こちらです。これは全部鶏肉です。","reading":"ございます。こちらです。これはぜんぶとりにくです。","romaji":"Gozaimasu. Kochira desu. Kore wa zenbu toriniku desu.","trans":"Ada. Di sebelah sini. Ini semua daging ayam."},
  {"speaker":"サリ","text":"分かりました。この魚は今日のですか。","reading":"わかりました。このさかなはきょうのですか。","romaji":"Wakarimashita. Kono sakana wa kyou no desu ka.","trans":"Baik. Ikan ini yang hari ini?"},
  {"speaker":"店員","text":"はい、今朝のです。新しいですよ。","reading":"はい、けさのです。あたらしいですよ。","romaji":"Hai, kesa no desu. Atarashii desu yo.","trans":"Ya, yang tadi pagi. Masih segar."},
  {"speaker":"サリ","text":"安いですね。","reading":"やすいですね。","romaji":"Yasui desu ne.","trans":"Murah ya."},
  {"speaker":"店員","text":"六時からもっと安くなります。シールが貼ってあります。","reading":"ろくじからもっとやすくなります。シールがはってあります。","romaji":"Rokuji kara motto yasuku narimasu. Shiiru ga hatte arimasu.","trans":"Mulai jam enam jadi lebih murah lagi. Ditempeli stiker diskon."},
  {"speaker":"サリ","text":"毎日ですか。","reading":"まいにちですか。","romaji":"Mainichi desu ka.","trans":"Setiap hari?"},
  {"speaker":"店員","text":"毎日です。夕方に来てください。","reading":"まいにちです。ゆうがたにきてください。","romaji":"Mainichi desu. Yuugata ni kite kudasai.","trans":"Setiap hari. Datanglah sore hari."},
  {"speaker":"サリ","text":"教えてくれてありがとうございます。","reading":"おしえてくれてありがとうございます。","romaji":"Oshiete kurete arigatou gozaimasu.","trans":"Terima kasih sudah memberitahu."}
 ]'::jsonb,
 '[
  {"word":"豚肉","reading":"ぶたにく · butaniku","meaning":"daging babi"},
  {"word":"鶏肉","reading":"とりにく · toriniku","meaning":"daging ayam"},
  {"word":"奥","reading":"おく · oku","meaning":"bagian dalam, ujung belakang"},
  {"word":"夕方","reading":"ゆうがた · yuugata","meaning":"sore menjelang malam"}
 ]'::jsonb, false),

(1, 'Meminta Cuti Sehari', 'work',
 '[
  {"speaker":"アリ","text":"店長、少しよろしいですか。","reading":"てんちょう、すこしよろしいですか。","romaji":"Tenchou, sukoshi yoroshii desu ka.","trans":"Pak Manajer, boleh minta waktu sebentar?"},
  {"speaker":"店長","text":"どうしましたか。","reading":"どうしましたか。","romaji":"Dou shimashita ka.","trans":"Ada apa?"},
  {"speaker":"アリ","text":"来週の水曜日、休みをもらいたいです。","reading":"らいしゅうのすいようび、やすみをもらいたいです。","romaji":"Raishuu no suiyoubi, yasumi o moraitai desu.","trans":"Rabu depan, saya ingin minta libur."},
  {"speaker":"店長","text":"何かありますか。","reading":"なにかありますか。","romaji":"Nanika arimasu ka.","trans":"Ada keperluan apa?"},
  {"speaker":"アリ","text":"市役所に行きます。ビザの手続きです。","reading":"しやくしょにいきます。ビザのてつづきです。","romaji":"Shiyakusho ni ikimasu. Biza no tetsuzuki desu.","trans":"Saya ke kantor kota. Urusan visa."},
  {"speaker":"店長","text":"分かりました。何時からですか。","reading":"わかりました。なんじからですか。","romaji":"Wakarimashita. Nanji kara desu ka.","trans":"Baik. Dari jam berapa?"},
  {"speaker":"アリ","text":"午前中だけです。午後は働けます。","reading":"ごぜんちゅうだけです。ごごははたらけます。","romaji":"Gozenchuu dake desu. Gogo wa hatarakemasu.","trans":"Hanya pagi saja. Sore saya bisa kerja."},
  {"speaker":"店長","text":"では、午後から来てください。","reading":"では、ごごからきてください。","romaji":"Dewa, gogo kara kite kudasai.","trans":"Kalau begitu, datang mulai siang saja."},
  {"speaker":"アリ","text":"ありがとうございます。","reading":"ありがとうございます。","romaji":"Arigatou gozaimasu.","trans":"Terima kasih banyak."},
  {"speaker":"店長","text":"早めに言ってくれて助かります。","reading":"はやめにいってくれてたすかります。","romaji":"Hayame ni itte kurete tasukarimasu.","trans":"Terbantu karena kamu bilang jauh-jauh hari."},
  {"speaker":"アリ","text":"すみません、来月もう一日休みたいです。","reading":"すみません、らいげつもういちにちやすみたいです。","romaji":"Sumimasen, raigetsu mou ichinichi yasumitai desu.","trans":"Maaf, bulan depan saya ingin libur satu hari lagi."},
  {"speaker":"店長","text":"大丈夫です。紙に書いておいてください。","reading":"だいじょうぶです。かみにかいておいてください。","romaji":"Daijoubu desu. Kami ni kaite oite kudasai.","trans":"Tidak masalah. Tolong tulis dulu di kertas."},
  {"speaker":"アリ","text":"はい、書きます。","reading":"はい、かきます。","romaji":"Hai, kakimasu.","trans":"Baik, saya tulis."}
 ]'::jsonb,
 '[
  {"word":"手続き","reading":"てつづき · tetsuzuki","meaning":"prosedur, pengurusan dokumen"},
  {"word":"午前中","reading":"ごぜんちゅう · gozenchuu","meaning":"sepanjang pagi"},
  {"word":"早めに","reading":"はやめに · hayame ni","meaning":"lebih awal dari batas waktu"},
  {"word":"助かる","reading":"たすかる · tasukaru","meaning":"terbantu"}
 ]'::jsonb, false),

(1, 'Membersihkan Toko Sebelum Tutup', 'work',
 '[
  {"speaker":"先輩","text":"今日は閉店の作業を教えます。","reading":"きょうはへいてんのさぎょうをおしえます。","romaji":"Kyou wa heiten no sagyou o oshiemasu.","trans":"Hari ini saya ajarkan pekerjaan penutupan toko."},
  {"speaker":"リナ","text":"よろしくお願いします。","reading":"よろしくおねがいします。","romaji":"Yoroshiku onegai shimasu.","trans":"Mohon bimbingannya."},
  {"speaker":"先輩","text":"まず、外の看板の電気を消します。","reading":"まず、そとのかんばんのでんきをけします。","romaji":"Mazu, soto no kanban no denki o keshimasu.","trans":"Pertama, matikan lampu papan nama di luar."},
  {"speaker":"リナ","text":"それから何をしますか。","reading":"それからなにをしますか。","romaji":"Sorekara nani o shimasu ka.","trans":"Setelah itu apa?"},
  {"speaker":"先輩","text":"床を掃いて、それからモップをかけます。","reading":"ゆかをはいて、それからモップをかけます。","romaji":"Yuka o haite, sorekara moppu o kakemasu.","trans":"Sapu lantainya, lalu dipel."},
  {"speaker":"リナ","text":"モップはどこですか。","reading":"モップはどこですか。","romaji":"Moppu wa doko desu ka.","trans":"Pelnya di mana?"},
  {"speaker":"先輩","text":"裏の部屋にあります。バケツも一緒です。","reading":"うらのへやにあります。バケツもいっしょです。","romaji":"Ura no heya ni arimasu. Baketsu mo issho desu.","trans":"Di ruang belakang. Embernya juga di situ."},
  {"speaker":"リナ","text":"ゴミはどうしますか。","reading":"ゴミはどうしますか。","romaji":"Gomi wa dou shimasu ka.","trans":"Sampahnya bagaimana?"},
  {"speaker":"先輩","text":"燃えるゴミと燃えないゴミを分けます。","reading":"もえるゴミともえないゴミをわけます。","romaji":"Moeru gomi to moenai gomi o wakemasu.","trans":"Pisahkan sampah yang bisa dibakar dan yang tidak."},
  {"speaker":"リナ","text":"分けてから外に出しますか。","reading":"わけてからそとにだしますか。","romaji":"Wakete kara soto ni dashimasu ka.","trans":"Setelah dipisah lalu dikeluarkan?"},
  {"speaker":"先輩","text":"いいえ、朝出します。夜は出しません。","reading":"いいえ、あさだします。よるはだしません。","romaji":"Iie, asa dashimasu. Yoru wa dashimasen.","trans":"Tidak, dikeluarkan pagi. Malam tidak boleh."},
  {"speaker":"リナ","text":"分かりました。最後は何ですか。","reading":"わかりました。さいごはなんですか。","romaji":"Wakarimashita. Saigo wa nan desu ka.","trans":"Baik. Yang terakhir apa?"},
  {"speaker":"先輩","text":"レジのお金を数えて、鍵を閉めます。","reading":"レジのおかねをかぞえて、かぎをしめます。","romaji":"Reji no okane o kazoete, kagi o shimemasu.","trans":"Hitung uang di kasir, lalu kunci pintunya."}
 ]'::jsonb,
 '[
  {"word":"閉店","reading":"へいてん · heiten","meaning":"penutupan toko"},
  {"word":"看板","reading":"かんばん · kanban","meaning":"papan nama toko"},
  {"word":"掃く","reading":"はく · haku","meaning":"menyapu"},
  {"word":"燃えるゴミ","reading":"もえるゴミ · moeru gomi","meaning":"sampah yang bisa dibakar"}
 ]'::jsonb, false),

(1, 'Terlambat Datang Kerja', 'work',
 '[
  {"speaker":"アリ","text":"店長、すみません。遅れました。","reading":"てんちょう、すみません。おくれました。","romaji":"Tenchou, sumimasen. Okuremashita.","trans":"Pak Manajer, maaf. Saya terlambat."},
  {"speaker":"店長","text":"何時に来ましたか。","reading":"なんじにきましたか。","romaji":"Nanji ni kimashita ka.","trans":"Datang jam berapa?"},
  {"speaker":"アリ","text":"九時十分です。十分遅れました。","reading":"くじじゅっぷんです。じゅっぷんおくれました。","romaji":"Kuji juppun desu. Juppun okuremashita.","trans":"Jam 9 lewat 10. Terlambat sepuluh menit."},
  {"speaker":"店長","text":"どうしましたか。","reading":"どうしましたか。","romaji":"Dou shimashita ka.","trans":"Kenapa?"},
  {"speaker":"アリ","text":"電車が止まりました。事故がありました。","reading":"でんしゃがとまりました。じこがありました。","romaji":"Densha ga tomarimashita. Jiko ga arimashita.","trans":"Keretanya berhenti. Ada kecelakaan."},
  {"speaker":"店長","text":"それは仕方がないですね。連絡はしましたか。","reading":"それはしかたがないですね。れんらくはしましたか。","romaji":"Sore wa shikata ga nai desu ne. Renraku wa shimashita ka.","trans":"Itu memang tidak bisa dihindari. Sudah menghubungi?"},
  {"speaker":"アリ","text":"しませんでした。すみません。","reading":"しませんでした。すみません。","romaji":"Shimasen deshita. Sumimasen.","trans":"Belum. Maaf."},
  {"speaker":"店長","text":"次から必ず電話してください。","reading":"つぎからかならずでんわしてください。","romaji":"Tsugi kara kanarazu denwa shite kudasai.","trans":"Mulai lain kali wajib telepon."},
  {"speaker":"アリ","text":"はい、分かりました。","reading":"はい、わかりました。","romaji":"Hai, wakarimashita.","trans":"Baik, saya mengerti."},
  {"speaker":"店長","text":"遅れることより、連絡がないことが困ります。","reading":"おくれることより、れんらくがないことがこまります。","romaji":"Okureru koto yori, renraku ga nai koto ga komarimasu.","trans":"Yang merepotkan bukan telatnya, tapi tidak ada kabar."},
  {"speaker":"アリ","text":"気をつけます。","reading":"きをつけます。","romaji":"Ki o tsukemasu.","trans":"Saya akan hati-hati."},
  {"speaker":"店長","text":"では、着替えて仕事を始めてください。","reading":"では、きがえてしごとをはじめてください。","romaji":"Dewa, kigaete shigoto o hajimete kudasai.","trans":"Kalau begitu, ganti baju dan mulai kerja."},
  {"speaker":"アリ","text":"はい、失礼しました。","reading":"はい、しつれいしました。","romaji":"Hai, shitsurei shimashita.","trans":"Baik, mohon maaf."}
 ]'::jsonb,
 '[
  {"word":"遅れる","reading":"おくれる · okureru","meaning":"terlambat"},
  {"word":"仕方がない","reading":"しかたがない · shikata ga nai","meaning":"tidak bisa dihindari, mau bagaimana lagi"},
  {"word":"連絡","reading":"れんらく · renraku","meaning":"kabar, pemberitahuan"},
  {"word":"着替える","reading":"きがえる · kigaeru","meaning":"berganti pakaian"}
 ]'::jsonb, false),

(1, 'Mendaftar di Resepsionis Rumah Sakit', 'hospital',
 '[
  {"speaker":"デウィ","text":"すみません、初めて来ました。","reading":"すみません、はじめてきました。","romaji":"Sumimasen, hajimete kimashita.","trans":"Permisi, saya baru pertama kali ke sini."},
  {"speaker":"受付","text":"保険証はお持ちですか。","reading":"ほけんしょうはおもちですか。","romaji":"Hokenshou wa omochi desu ka.","trans":"Apakah membawa kartu asuransi?"},
  {"speaker":"デウィ","text":"はい、これです。","reading":"はい、これです。","romaji":"Hai, kore desu.","trans":"Ya, ini."},
  {"speaker":"受付","text":"ありがとうございます。この紙に書いてください。","reading":"ありがとうございます。このかみにかいてください。","romaji":"Arigatou gozaimasu. Kono kami ni kaite kudasai.","trans":"Terima kasih. Tolong isi kertas ini."},
  {"speaker":"デウィ","text":"日本語で書きますか。","reading":"にほんごでかきますか。","romaji":"Nihongo de kakimasu ka.","trans":"Ditulis dalam bahasa Jepang?"},
  {"speaker":"受付","text":"はい。難しいところは、私が手伝います。","reading":"はい。むずかしいところは、わたしがてつだいます。","romaji":"Hai. Muzukashii tokoro wa, watashi ga tetsudaimasu.","trans":"Ya. Bagian yang sulit, saya bantu."},
  {"speaker":"デウィ","text":"どこが悪いか、書きますか。","reading":"どこがわるいか、かきますか。","romaji":"Doko ga warui ka, kakimasu ka.","trans":"Bagian yang sakit juga ditulis?"},
  {"speaker":"受付","text":"書いてください。どこが痛いですか。","reading":"かいてください。どこがいたいですか。","romaji":"Kaite kudasai. Doko ga itai desu ka.","trans":"Tolong ditulis. Mana yang sakit?"},
  {"speaker":"デウィ","text":"おなかです。三日前からです。","reading":"おなかです。みっかまえからです。","romaji":"Onaka desu. Mikka mae kara desu.","trans":"Perut. Sejak tiga hari lalu."},
  {"speaker":"受付","text":"分かりました。熱はありますか。","reading":"わかりました。ねつはありますか。","romaji":"Wakarimashita. Netsu wa arimasu ka.","trans":"Baik. Ada demam?"},
  {"speaker":"デウィ","text":"少しあります。","reading":"すこしあります。","romaji":"Sukoshi arimasu.","trans":"Sedikit ada."},
  {"speaker":"受付","text":"では、そこで待ってください。名前を呼びます。","reading":"では、そこでまってください。なまえをよびます。","romaji":"Dewa, soko de matte kudasai. Namae o yobimasu.","trans":"Kalau begitu, tunggu di situ. Nanti nama Anda dipanggil."},
  {"speaker":"デウィ","text":"はい、ありがとうございます。","reading":"はい、ありがとうございます。","romaji":"Hai, arigatou gozaimasu.","trans":"Baik, terima kasih."}
 ]'::jsonb,
 '[
  {"word":"保険証","reading":"ほけんしょう · hokenshou","meaning":"kartu asuransi kesehatan"},
  {"word":"受付","reading":"うけつけ · uketsuke","meaning":"resepsionis, pendaftaran"},
  {"word":"痛い","reading":"いたい · itai","meaning":"sakit, nyeri"},
  {"word":"初めて","reading":"はじめて · hajimete","meaning":"untuk pertama kali"}
 ]'::jsonb, false),

(1, 'Menjelaskan Sakit Gigi', 'hospital',
 '[
  {"speaker":"医者","text":"今日はどうしましたか。","reading":"きょうはどうしましたか。","romaji":"Kyou wa dou shimashita ka.","trans":"Hari ini ada keluhan apa?"},
  {"speaker":"ブディ","text":"歯が痛いです。","reading":"はがいたいです。","romaji":"Ha ga itai desu.","trans":"Gigi saya sakit."},
  {"speaker":"医者","text":"いつからですか。","reading":"いつからですか。","romaji":"Itsu kara desu ka.","trans":"Sejak kapan?"},
  {"speaker":"ブディ","text":"一週間前からです。","reading":"いっしゅうかんまえからです。","romaji":"Isshuukan mae kara desu.","trans":"Sejak seminggu lalu."},
  {"speaker":"医者","text":"どの歯ですか。","reading":"どのはですか。","romaji":"Dono ha desu ka.","trans":"Gigi yang mana?"},
  {"speaker":"ブディ","text":"右の下です。奥の歯です。","reading":"みぎのしたです。おくのはです。","romaji":"Migi no shita desu. Oku no ha desu.","trans":"Kanan bawah. Gigi geraham belakang."},
  {"speaker":"医者","text":"冷たいものを飲むと痛いですか。","reading":"つめたいものをのむといたいですか。","romaji":"Tsumetai mono o nomu to itai desu ka.","trans":"Kalau minum yang dingin terasa sakit?"},
  {"speaker":"ブディ","text":"はい、とても痛いです。","reading":"はい、とてもいたいです。","romaji":"Hai, totemo itai desu.","trans":"Ya, sakit sekali."},
  {"speaker":"医者","text":"甘いものはどうですか。","reading":"あまいものはどうですか。","romaji":"Amai mono wa dou desu ka.","trans":"Kalau yang manis bagaimana?"},
  {"speaker":"ブディ","text":"甘いものも痛いです。","reading":"あまいものもいたいです。","romaji":"Amai mono mo itai desu.","trans":"Yang manis juga sakit."},
  {"speaker":"医者","text":"見ましょう。口を大きく開けてください。","reading":"みましょう。くちをおおきくあけてください。","romaji":"Mimashou. Kuchi o ookiku akete kudasai.","trans":"Mari kita lihat. Tolong buka mulutnya lebar-lebar."},
  {"speaker":"ブディ","text":"はい。","reading":"はい。","romaji":"Hai.","trans":"Baik."},
  {"speaker":"医者","text":"虫歯ですね。今日治しましょう。","reading":"むしばですね。きょうなおしましょう。","romaji":"Mushiba desu ne. Kyou naoshimashou.","trans":"Ini gigi berlubang. Kita obati hari ini."}
 ]'::jsonb,
 '[
  {"word":"歯","reading":"は · ha","meaning":"gigi"},
  {"word":"虫歯","reading":"むしば · mushiba","meaning":"gigi berlubang"},
  {"word":"甘い","reading":"あまい · amai","meaning":"manis"},
  {"word":"治す","reading":"なおす · naosu","meaning":"mengobati, memperbaiki"}
 ]'::jsonb, false),

(1, 'Mengambil Obat di Apotek', 'hospital',
 '[
  {"speaker":"薬剤師","text":"サリさんですね。お薬をお出しします。","reading":"サリさんですね。おくすりをおだしします。","romaji":"Sari-san desu ne. Okusuri o odashi shimasu.","trans":"Ibu Sari ya. Saya serahkan obatnya."},
  {"speaker":"サリ","text":"はい、お願いします。","reading":"はい、おねがいします。","romaji":"Hai, onegai shimasu.","trans":"Ya, tolong."},
  {"speaker":"薬剤師","text":"三種類あります。この白いのは痛み止めです。","reading":"さんしゅるいあります。このしろいのはいたみどめです。","romaji":"Sanshurui arimasu. Kono shiroi no wa itamidome desu.","trans":"Ada tiga jenis. Yang putih ini pereda nyeri."},
  {"speaker":"サリ","text":"いつ飲みますか。","reading":"いつのみますか。","romaji":"Itsu nomimasu ka.","trans":"Diminum kapan?"},
  {"speaker":"薬剤師","text":"朝と夜、ご飯のあとに一つずつです。","reading":"あさとよる、ごはんのあとにひとつずつです。","romaji":"Asa to yoru, gohan no ato ni hitotsu zutsu desu.","trans":"Pagi dan malam, satu butir sesudah makan."},
  {"speaker":"サリ","text":"この黄色いのは何ですか。","reading":"このきいろいのはなんですか。","romaji":"Kono kiiroi no wa nan desu ka.","trans":"Yang kuning ini apa?"},
  {"speaker":"薬剤師","text":"熱の薬です。熱があるときだけ飲んでください。","reading":"ねつのくすりです。ねつがあるときだけのんでください。","romaji":"Netsu no kusuri desu. Netsu ga aru toki dake nonde kudasai.","trans":"Obat demam. Diminum hanya saat demam."},
  {"speaker":"サリ","text":"毎日ではないですね。","reading":"まいにちではないですね。","romaji":"Mainichi dewa nai desu ne.","trans":"Berarti tidak tiap hari ya."},
  {"speaker":"薬剤師","text":"毎日ではありません。","reading":"まいにちではありません。","romaji":"Mainichi dewa arimasen.","trans":"Tidak tiap hari."},
  {"speaker":"サリ","text":"この粉はどうしますか。","reading":"このこなはどうしますか。","romaji":"Kono kona wa dou shimasu ka.","trans":"Yang bubuk ini bagaimana?"},
  {"speaker":"薬剤師","text":"水と一緒に飲んでください。一日三回です。","reading":"みずといっしょにのんでください。いちにちさんかいです。","romaji":"Mizu to issho ni nonde kudasai. Ichinichi sankai desu.","trans":"Diminum dengan air. Tiga kali sehari."},
  {"speaker":"サリ","text":"お酒を飲んでもいいですか。","reading":"おさけをのんでもいいですか。","romaji":"Osake o nonde mo ii desu ka.","trans":"Boleh minum alkohol?"},
  {"speaker":"薬剤師","text":"だめです。薬の間はやめてください。","reading":"だめです。くすりのあいだはやめてください。","romaji":"Dame desu. Kusuri no aida wa yamete kudasai.","trans":"Tidak boleh. Selama minum obat, hentikan dulu."}
 ]'::jsonb,
 '[
  {"word":"薬剤師","reading":"やくざいし · yakuzaishi","meaning":"apoteker"},
  {"word":"痛み止め","reading":"いたみどめ · itamidome","meaning":"obat pereda nyeri"},
  {"word":"粉","reading":"こな · kona","meaning":"bubuk, serbuk"},
  {"word":"一日三回","reading":"いちにちさんかい · ichinichi sankai","meaning":"tiga kali sehari"}
 ]'::jsonb, false),

(1, 'Menerima Telepon Kantor', 'biz',
 '[
  {"speaker":"リナ","text":"はい、さくら商事でございます。","reading":"はい、さくらしょうじでございます。","romaji":"Hai, Sakura Shouji de gozaimasu.","trans":"Ya, dengan Sakura Shouji."},
  {"speaker":"山田","text":"田中商店の山田と申します。","reading":"たなかしょうてんのやまだともうします。","romaji":"Tanaka Shouten no Yamada to moushimasu.","trans":"Saya Yamada dari Toko Tanaka."},
  {"speaker":"リナ","text":"いつもお世話になっております。","reading":"いつもおせわになっております。","romaji":"Itsumo osewa ni natte orimasu.","trans":"Terima kasih atas kerja samanya selama ini."},
  {"speaker":"山田","text":"鈴木さんはいらっしゃいますか。","reading":"すずきさんはいらっしゃいますか。","romaji":"Suzuki-san wa irasshaimasu ka.","trans":"Apakah Pak Suzuki ada?"},
  {"speaker":"リナ","text":"少々お待ちください。","reading":"しょうしょうおまちください。","romaji":"Shoushou omachi kudasai.","trans":"Mohon tunggu sebentar."},
  {"speaker":"リナ","text":"すみません、鈴木は今、席をはずしております。","reading":"すみません、すずきはいま、せきをはずしております。","romaji":"Sumimasen, Suzuki wa ima, seki o hazushite orimasu.","trans":"Maaf, Pak Suzuki sedang tidak di tempat."},
  {"speaker":"山田","text":"何時ごろお戻りですか。","reading":"なんじごろおもどりですか。","romaji":"Nanji goro omodori desu ka.","trans":"Kira-kira jam berapa kembali?"},
  {"speaker":"リナ","text":"三時ごろ戻ります。","reading":"さんじごろもどります。","romaji":"Sanji goro modorimasu.","trans":"Sekitar jam tiga."},
  {"speaker":"山田","text":"では、また電話します。","reading":"では、またでんわします。","romaji":"Dewa, mata denwa shimasu.","trans":"Kalau begitu, saya telepon lagi nanti."},
  {"speaker":"リナ","text":"かしこまりました。お伝えしましょうか。","reading":"かしこまりました。おつたえしましょうか。","romaji":"Kashikomarimashita. Otsutae shimashou ka.","trans":"Baik. Perlu saya sampaikan pesannya?"},
  {"speaker":"山田","text":"お願いします。山田から電話があったと。","reading":"おねがいします。やまだからでんわがあったと。","romaji":"Onegai shimasu. Yamada kara denwa ga atta to.","trans":"Tolong ya. Bilang ada telepon dari Yamada."},
  {"speaker":"リナ","text":"はい、山田様ですね。伝えます。","reading":"はい、やまださまですね。つたえます。","romaji":"Hai, Yamada-sama desu ne. Tsutaemasu.","trans":"Baik, Bapak Yamada ya. Akan saya sampaikan."},
  {"speaker":"山田","text":"よろしくお願いします。","reading":"よろしくおねがいします。","romaji":"Yoroshiku onegai shimasu.","trans":"Terima kasih, mohon bantuannya."}
 ]'::jsonb,
 '[
  {"word":"席をはずす","reading":"せきをはずす · seki o hazusu","meaning":"sedang tidak di tempat"},
  {"word":"少々","reading":"しょうしょう · shoushou","meaning":"sebentar (bentuk sopan)"},
  {"word":"伝える","reading":"つたえる · tsutaeru","meaning":"menyampaikan pesan"},
  {"word":"お世話になっております","reading":"おせわになっております · osewa ni natte orimasu","meaning":"salam bisnis baku di telepon"}
 ]'::jsonb, false),

(1, 'Meminta Tanda Tangan Atasan', 'biz',
 '[
  {"speaker":"アリ","text":"課長、失礼します。","reading":"かちょう、しつれいします。","romaji":"Kachou, shitsurei shimasu.","trans":"Pak Kepala Bagian, permisi."},
  {"speaker":"課長","text":"はい、どうぞ。","reading":"はい、どうぞ。","romaji":"Hai, douzo.","trans":"Ya, silakan."},
  {"speaker":"アリ","text":"この書類にサインをお願いします。","reading":"このしょるいにサインをおねがいします。","romaji":"Kono shorui ni sain o onegai shimasu.","trans":"Mohon tanda tangan di dokumen ini."},
  {"speaker":"課長","text":"何の書類ですか。","reading":"なんのしょるいですか。","romaji":"Nan no shorui desu ka.","trans":"Dokumen apa ini?"},
  {"speaker":"アリ","text":"来月の予定表です。","reading":"らいげつのよていひょうです。","romaji":"Raigetsu no yoteihyou desu.","trans":"Jadwal bulan depan."},
  {"speaker":"課長","text":"見せてください。","reading":"みせてください。","romaji":"Misete kudasai.","trans":"Coba saya lihat."},
  {"speaker":"アリ","text":"こちらです。","reading":"こちらです。","romaji":"Kochira desu.","trans":"Ini, Pak."},
  {"speaker":"課長","text":"ここの日にちが違いますね。","reading":"ここのひにちがちがいますね。","romaji":"Koko no hinichi ga chigaimasu ne.","trans":"Tanggal di bagian ini salah."},
  {"speaker":"アリ","text":"すみません、直します。","reading":"すみません、なおします。","romaji":"Sumimasen, naoshimasu.","trans":"Maaf, saya perbaiki."},
  {"speaker":"課長","text":"直してから、もう一度持ってきてください。","reading":"なおしてから、もういちどもってきてください。","romaji":"Naoshite kara, mou ichido motte kite kudasai.","trans":"Setelah diperbaiki, bawa lagi ke sini."},
  {"speaker":"アリ","text":"はい。いつまでに出しますか。","reading":"はい。いつまでにだしますか。","romaji":"Hai. Itsu made ni dashimasu ka.","trans":"Baik. Batas penyerahannya kapan?"},
  {"speaker":"課長","text":"金曜日までにお願いします。","reading":"きんようびまでにおねがいします。","romaji":"Kinyoubi made ni onegai shimasu.","trans":"Tolong sebelum hari Jumat."},
  {"speaker":"アリ","text":"分かりました。失礼します。","reading":"わかりました。しつれいします。","romaji":"Wakarimashita. Shitsurei shimasu.","trans":"Baik. Permisi."}
 ]'::jsonb,
 '[
  {"word":"書類","reading":"しょるい · shorui","meaning":"dokumen"},
  {"word":"課長","reading":"かちょう · kachou","meaning":"kepala bagian"},
  {"word":"予定表","reading":"よていひょう · yoteihyou","meaning":"tabel jadwal"},
  {"word":"直す","reading":"なおす · naosu","meaning":"memperbaiki, membetulkan"}
 ]'::jsonb, false),

(1, 'Mengantar Lansia Jalan-jalan', 'kaigo',
 '[
  {"speaker":"職員","text":"田中さん、今日はいい天気ですよ。","reading":"たなかさん、きょうはいいてんきですよ。","romaji":"Tanaka-san, kyou wa ii tenki desu yo.","trans":"Pak Tanaka, hari ini cuacanya bagus lho."},
  {"speaker":"田中","text":"そうですね。","reading":"そうですね。","romaji":"Sou desu ne.","trans":"Iya ya."},
  {"speaker":"職員","text":"少し外を歩きませんか。","reading":"すこしそとをあるきませんか。","romaji":"Sukoshi soto o arukimasen ka.","trans":"Mau jalan-jalan sebentar di luar?"},
  {"speaker":"田中","text":"足が痛いです。","reading":"あしがいたいです。","romaji":"Ashi ga itai desu.","trans":"Kaki saya sakit."},
  {"speaker":"職員","text":"では、車いすで行きましょう。","reading":"では、くるまいすでいきましょう。","romaji":"Dewa, kurumaisu de ikimashou.","trans":"Kalau begitu, kita pakai kursi roda saja."},
  {"speaker":"田中","text":"それならいいです。","reading":"それならいいです。","romaji":"Sore nara ii desu.","trans":"Kalau begitu boleh."},
  {"speaker":"職員","text":"上着を着てください。外は寒いです。","reading":"うわぎをきてください。そとはさむいです。","romaji":"Uwagi o kite kudasai. Soto wa samui desu.","trans":"Tolong pakai jaketnya. Di luar dingin."},
  {"speaker":"田中","text":"帽子もいりますか。","reading":"ぼうしもいりますか。","romaji":"Boushi mo irimasu ka.","trans":"Topi juga perlu?"},
  {"speaker":"職員","text":"あったほうがいいです。日が強いですから。","reading":"あったほうがいいです。ひがつよいですから。","romaji":"Atta hou ga ii desu. Hi ga tsuyoi desu kara.","trans":"Sebaiknya pakai. Mataharinya terik."},
  {"speaker":"田中","text":"どこまで行きますか。","reading":"どこまでいきますか。","romaji":"Doko made ikimasu ka.","trans":"Kita pergi sampai mana?"},
  {"speaker":"職員","text":"前の公園までです。十分ぐらいです。","reading":"まえのこうえんまでです。じゅっぷんぐらいです。","romaji":"Mae no kouen made desu. Juppun gurai desu.","trans":"Sampai taman di depan. Sekitar sepuluh menit."},
  {"speaker":"田中","text":"花が咲いていますか。","reading":"はながさいていますか。","romaji":"Hana ga saite imasu ka.","trans":"Bunganya sedang mekar?"},
  {"speaker":"職員","text":"咲いています。見に行きましょう。","reading":"さいています。みにいきましょう。","romaji":"Saite imasu. Mi ni ikimashou.","trans":"Sedang mekar. Ayo kita lihat."}
 ]'::jsonb,
 '[
  {"word":"上着","reading":"うわぎ · uwagi","meaning":"jaket, baju luar"},
  {"word":"帽子","reading":"ぼうし · boushi","meaning":"topi"},
  {"word":"咲く","reading":"さく · saku","meaning":"mekar"},
  {"word":"車いす","reading":"くるまいす · kurumaisu","meaning":"kursi roda"}
 ]'::jsonb, false),

(1, 'Membantu Ganti Baju', 'kaigo',
 '[
  {"speaker":"職員","text":"山田さん、服を着替えましょう。","reading":"やまださん、ふくをきがえましょう。","romaji":"Yamada-san, fuku o kigaemashou.","trans":"Bu Yamada, mari kita ganti baju."},
  {"speaker":"山田","text":"今ですか。","reading":"いまですか。","romaji":"Ima desu ka.","trans":"Sekarang?"},
  {"speaker":"職員","text":"はい。パジャマから服に着替えます。","reading":"はい。パジャマからふくにきがえます。","romaji":"Hai. Pajama kara fuku ni kigaemasu.","trans":"Ya. Ganti dari piyama ke baju biasa."},
  {"speaker":"山田","text":"自分でできます。","reading":"じぶんでできます。","romaji":"Jibun de dekimasu.","trans":"Saya bisa sendiri."},
  {"speaker":"職員","text":"では、やってみてください。手伝いが要るときは言ってください。","reading":"では、やってみてください。てつだいがいるときはいってください。","romaji":"Dewa, yatte mite kudasai. Tetsudai ga iru toki wa itte kudasai.","trans":"Silakan dicoba. Kalau butuh bantuan, bilang ya."},
  {"speaker":"山田","text":"ボタンが難しいです。","reading":"ボタンがむずかしいです。","romaji":"Botan ga muzukashii desu.","trans":"Kancingnya susah."},
  {"speaker":"職員","text":"私がしましょうか。","reading":"わたしがしましょうか。","romaji":"Watashi ga shimashou ka.","trans":"Mau saya bantu?"},
  {"speaker":"山田","text":"お願いします。","reading":"おねがいします。","romaji":"Onegai shimasu.","trans":"Tolong ya."},
  {"speaker":"職員","text":"右の手から入れますね。痛くないですか。","reading":"みぎのてからいれますね。いたくないですか。","romaji":"Migi no te kara iremasu ne. Itakunai desu ka.","trans":"Mulai dari tangan kanan ya. Tidak sakit?"},
  {"speaker":"山田","text":"大丈夫です。","reading":"だいじょうぶです。","romaji":"Daijoubu desu.","trans":"Tidak apa-apa."},
  {"speaker":"職員","text":"次は左です。ゆっくりしましょう。","reading":"つぎはひだりです。ゆっくりしましょう。","romaji":"Tsugi wa hidari desu. Yukkuri shimashou.","trans":"Sekarang yang kiri. Pelan-pelan saja."},
  {"speaker":"山田","text":"ありがとう。","reading":"ありがとう。","romaji":"Arigatou.","trans":"Terima kasih."},
  {"speaker":"職員","text":"上手にできましたね。ズボンも自分ではきますか。","reading":"じょうずにできましたね。ズボンもじぶんではきますか。","romaji":"Jouzu ni dekimashita ne. Zubon mo jibun de hakimasu ka.","trans":"Bagus sekali. Celananya juga mau dipakai sendiri?"}
 ]'::jsonb,
 '[
  {"word":"着替える","reading":"きがえる · kigaeru","meaning":"berganti pakaian"},
  {"word":"パジャマ","reading":"pajama","meaning":"piyama"},
  {"word":"ボタン","reading":"botan","meaning":"kancing"},
  {"word":"はく","reading":"haku","meaning":"memakai (celana, sepatu)"}
 ]'::jsonb, false),

(1, 'Mengajak Ikut Kegiatan Rekreasi', 'kaigo',
 '[
  {"speaker":"職員","text":"今日は二時からレクリエーションがあります。","reading":"きょうはにじからレクリエーションがあります。","romaji":"Kyou wa niji kara rekurieeshon ga arimasu.","trans":"Hari ini ada kegiatan rekreasi mulai jam dua."},
  {"speaker":"佐藤","text":"何をしますか。","reading":"なにをしますか。","romaji":"Nani o shimasu ka.","trans":"Ngapain saja?"},
  {"speaker":"職員","text":"歌を歌います。それから、体を少し動かします。","reading":"うたをうたいます。それから、からだをすこしうごかします。","romaji":"Uta o utaimasu. Sorekara, karada o sukoshi ugokashimasu.","trans":"Menyanyi. Lalu menggerakkan badan sedikit."},
  {"speaker":"佐藤","text":"私は歌が下手です。","reading":"わたしはうたがへたです。","romaji":"Watashi wa uta ga heta desu.","trans":"Saya tidak pandai menyanyi."},
  {"speaker":"職員","text":"上手でなくていいです。聞くだけでもいいですよ。","reading":"じょうずでなくていいです。きくだけでもいいですよ。","romaji":"Jouzu de nakute ii desu. Kiku dake demo ii desu yo.","trans":"Tidak perlu pandai. Mendengarkan saja juga boleh."},
  {"speaker":"佐藤","text":"何人来ますか。","reading":"なんにんきますか。","romaji":"Nannin kimasu ka.","trans":"Berapa orang yang datang?"},
  {"speaker":"職員","text":"十人ぐらいです。みなさん楽しみにしています。","reading":"じゅうにんぐらいです。みなさんたのしみにしています。","romaji":"Juunin gurai desu. Minasan tanoshimi ni shite imasu.","trans":"Sekitar sepuluh orang. Semuanya menantikannya."},
  {"speaker":"佐藤","text":"どこでしますか。","reading":"どこでしますか。","romaji":"Doko de shimasu ka.","trans":"Diadakan di mana?"},
  {"speaker":"職員","text":"一階の広い部屋です。","reading":"いっかいのひろいへやです。","romaji":"Ikkai no hiroi heya desu.","trans":"Di ruangan luas lantai satu."},
  {"speaker":"佐藤","text":"遠いですね。","reading":"とおいですね。","romaji":"Tooi desu ne.","trans":"Jauh ya."},
  {"speaker":"職員","text":"一緒に行きましょう。私が押します。","reading":"いっしょにいきましょう。わたしがおします。","romaji":"Issho ni ikimashou. Watashi ga oshimasu.","trans":"Kita pergi bersama. Saya yang dorong."},
  {"speaker":"佐藤","text":"では、行きます。","reading":"では、いきます。","romaji":"Dewa, ikimasu.","trans":"Kalau begitu, saya ikut."},
  {"speaker":"職員","text":"よかったです。二時に呼びに来ますね。","reading":"よかったです。にじによびにきますね。","romaji":"Yokatta desu. Niji ni yobi ni kimasu ne.","trans":"Syukurlah. Jam dua saya jemput ya."}
 ]'::jsonb,
 '[
  {"word":"レクリエーション","reading":"rekurieeshon","meaning":"kegiatan rekreasi di panti"},
  {"word":"動かす","reading":"うごかす · ugokasu","meaning":"menggerakkan"},
  {"word":"下手","reading":"へた · heta","meaning":"tidak pandai"},
  {"word":"楽しみにする","reading":"たのしみにする · tanoshimi ni suru","meaning":"menantikan dengan senang"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO NOTHING;
