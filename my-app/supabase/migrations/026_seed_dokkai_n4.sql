-- ============================================================
-- Koto no Ha — Seed Dokkai N4 (level_id=2): 5 bacaan (~200 huruf).
-- content_json: jp + furigana + romaji + terjemahan Indonesia (id).
-- Re-runnable.
-- ============================================================
DELETE FROM public.dokkai_passages WHERE level_id = 2;

INSERT INTO public.dokkai_passages (level_id, order_index, title, text_content, content_json, vocab_notes, questions, is_premium) VALUES
(2, 1, 'アルバイト — Kerja Paruh Waktu',
 'わたしは週に三回、コンビニでアルバイトをしています。仕事は夕方から夜までです。最初はレジが難しかったですが、今は慣れました。お客さんに「ありがとう」と言われると、うれしいです。このアルバイトで日本語も上手になりました。',
 '[
   {"jp":"わたしは週に三回、コンビニでアルバイトをしています。","furigana":"わたしはしゅうにさんかい、コンビニでアルバイトをしています。","romaji":"Watashi wa shuu ni sankai, konbini de arubaito o shite imasu.","id":"Saya bekerja paruh waktu di minimarket tiga kali seminggu."},
   {"jp":"仕事は夕方から夜までです。","furigana":"しごとはゆうがたからよるまでです。","romaji":"Shigoto wa yuugata kara yoru made desu.","id":"Pekerjaannya dari sore hingga malam."},
   {"jp":"最初はレジが難しかったですが、今は慣れました。","furigana":"さいしょはレジがむずかしかったですが、いまはなれました。","romaji":"Saisho wa reji ga muzukashikatta desu ga, ima wa naremashita.","id":"Awalnya kasir terasa sulit, tetapi sekarang saya sudah terbiasa."},
   {"jp":"お客さんに「ありがとう」と言われると、うれしいです。","furigana":"おきゃくさんに「ありがとう」といわれると、うれしいです。","romaji":"Okyakusan ni arigatou to iwareru to, ureshii desu.","id":"Ketika pelanggan mengucapkan terima kasih, saya merasa senang."},
   {"jp":"このアルバイトで日本語も上手になりました。","furigana":"このアルバイトでにほんごもじょうずになりました。","romaji":"Kono arubaito de nihongo mo jouzu ni narimashita.","id":"Berkat kerja paruh waktu ini, bahasa Jepang saya pun menjadi lebih baik."}
 ]'::jsonb,
 '[
   {"word":"アルバイト","reading":"あるばいと","romaji":"arubaito","meaning":"kerja paruh waktu"},
   {"word":"仕事","reading":"しごと","romaji":"shigoto","meaning":"pekerjaan"},
   {"word":"最初","reading":"さいしょ","romaji":"saisho","meaning":"mula-mula/awalnya"},
   {"word":"慣れました","reading":"なれました","romaji":"naremashita","meaning":"sudah terbiasa"},
   {"word":"上手","reading":"じょうず","romaji":"jouzu","meaning":"mahir/pandai"}
 ]'::jsonb,
 '[
   {"q":"Berapa kali seminggu penulis bekerja paruh waktu?","options":["Sekali","Dua kali","Tiga kali","Setiap hari"],"answer":2,"explanation":"「週に三回」 = tiga kali seminggu."},
   {"q":"Bagaimana perasaan penulis saat awal menjadi kasir?","options":["Mudah","Sulit","Menyenangkan","Membosankan"],"answer":1,"explanation":"「最初はレジが難しかった」 = awalnya kasir terasa sulit."},
   {"q":"Apa manfaat lain dari kerja paruh waktu ini?","options":["Mendapat banyak uang","Bahasa Jepangnya membaik","Mendapat banyak teman","Bisa tidur lebih lama"],"answer":1,"explanation":"「日本語も上手になりました」."}
 ]'::jsonb,
 false),

(2, 2, '日本の食べ物 — Makanan Jepang',
 'わたしは日本の食べ物が大好きです。特にすしとラーメンがおいしいと思います。でも、納豆はまだ食べられません。においが少し苦手だからです。今度、友だちと一緒にお好み焼きを作ってみたいです。',
 '[
   {"jp":"わたしは日本の食べ物が大好きです。","furigana":"わたしはにほんのたべものがだいすきです。","romaji":"Watashi wa nihon no tabemono ga daisuki desu.","id":"Saya sangat suka makanan Jepang."},
   {"jp":"特にすしとラーメンがおいしいと思います。","furigana":"とくにすしとラーメンがおいしいとおもいます。","romaji":"Tokuni sushi to raamen ga oishii to omoimasu.","id":"Terutama sushi dan ramen, menurut saya enak."},
   {"jp":"でも、納豆はまだ食べられません。","furigana":"でも、なっとうはまだたべられません。","romaji":"Demo, nattou wa mada taberaremasen.","id":"Tetapi, saya masih belum bisa makan natto."},
   {"jp":"においが少し苦手だからです。","furigana":"においがすこしにがてだからです。","romaji":"Nioi ga sukoshi nigate da kara desu.","id":"Karena saya agak tidak tahan dengan baunya."},
   {"jp":"今度、友だちと一緒にお好み焼きを作ってみたいです。","furigana":"こんど、ともだちといっしょにおこのみやきをつくってみたいです。","romaji":"Kondo, tomodachi to issho ni okonomiyaki o tsukutte mitai desu.","id":"Lain kali, saya ingin mencoba membuat okonomiyaki bersama teman."}
 ]'::jsonb,
 '[
   {"word":"食べ物","reading":"たべもの","romaji":"tabemono","meaning":"makanan"},
   {"word":"特に","reading":"とくに","romaji":"tokuni","meaning":"terutama"},
   {"word":"納豆","reading":"なっとう","romaji":"nattou","meaning":"natto (kedelai fermentasi)"},
   {"word":"苦手","reading":"にがて","romaji":"nigate","meaning":"tidak suka/tidak pandai"},
   {"word":"今度","reading":"こんど","romaji":"kondo","meaning":"lain kali"}
 ]'::jsonb,
 '[
   {"q":"Makanan apa yang dianggap enak oleh penulis?","options":["Natto dan tempura","Sushi dan ramen","Kari dan udon","Onigiri"],"answer":1,"explanation":"「すしとラーメンがおいしい」."},
   {"q":"Mengapa penulis belum bisa makan natto?","options":["Terlalu mahal","Tidak tahan baunya","Alergi","Sudah kenyang"],"answer":1,"explanation":"「においが少し苦手だから」 = karena tidak tahan baunya."}
 ]'::jsonb,
 false),

(2, 3, '旅行の計画 — Rencana Berlibur',
 '来月、家族で京都へ旅行に行く予定です。京都にはお寺や神社がたくさんあります。新幹線で行くので、とても速いです。ホテルはもう予約しました。早く週末になってほしいです。',
 '[
   {"jp":"来月、家族で京都へ旅行に行く予定です。","furigana":"らいげつ、かぞくできょうとへりょこうにいくよていです。","romaji":"Raigetsu, kazoku de kyouto e ryokou ni iku yotei desu.","id":"Bulan depan, saya berencana berlibur ke Kyoto bersama keluarga."},
   {"jp":"京都にはお寺や神社がたくさんあります。","furigana":"きょうとにはおてらやじんじゃがたくさんあります。","romaji":"Kyouto ni wa otera ya jinja ga takusan arimasu.","id":"Di Kyoto ada banyak kuil Buddha dan kuil Shinto."},
   {"jp":"新幹線で行くので、とても速いです。","furigana":"しんかんせんでいくので、とてもはやいです。","romaji":"Shinkansen de iku node, totemo hayai desu.","id":"Karena pergi naik shinkansen, perjalanannya sangat cepat."},
   {"jp":"ホテルはもう予約しました。","furigana":"ホテルはもうよやくしました。","romaji":"Hoteru wa mou yoyaku shimashita.","id":"Hotelnya sudah saya pesan."},
   {"jp":"早く週末になってほしいです。","furigana":"はやくしゅうまつになってほしいです。","romaji":"Hayaku shuumatsu ni natte hoshii desu.","id":"Saya berharap akhir pekan cepat tiba."}
 ]'::jsonb,
 '[
   {"word":"来月","reading":"らいげつ","romaji":"raigetsu","meaning":"bulan depan"},
   {"word":"予定","reading":"よてい","romaji":"yotei","meaning":"rencana/jadwal"},
   {"word":"お寺","reading":"おてら","romaji":"otera","meaning":"kuil Buddha"},
   {"word":"神社","reading":"じんじゃ","romaji":"jinja","meaning":"kuil Shinto"},
   {"word":"予約","reading":"よやく","romaji":"yoyaku","meaning":"reservasi/pemesanan"}
 ]'::jsonb,
 '[
   {"q":"Ke mana penulis akan berlibur?","options":["Tokyo","Osaka","Kyoto","Hokkaido"],"answer":2,"explanation":"「京都へ旅行に行く」."},
   {"q":"Apa yang sudah dipesan penulis?","options":["Tiket pesawat","Hotel","Restoran","Tiket museum"],"answer":1,"explanation":"「ホテルはもう予約しました」."}
 ]'::jsonb,
 false),

(2, 4, 'わたしの趣味 — Hobiku',
 'わたしの趣味は写真を撮ることです。週末になると、カメラを持って公園へ行きます。花や空の写真を撮るのが好きです。いい写真が撮れたとき、本当にうれしくなります。いつか写真の展覧会を開いてみたいです。',
 '[
   {"jp":"わたしの趣味は写真を撮ることです。","furigana":"わたしのしゅみはしゃしんをとることです。","romaji":"Watashi no shumi wa shashin o toru koto desu.","id":"Hobi saya adalah memotret."},
   {"jp":"週末になると、カメラを持って公園へ行きます。","furigana":"しゅうまつになると、カメラをもってこうえんへいきます。","romaji":"Shuumatsu ni naru to, kamera o motte kouen e ikimasu.","id":"Setiap akhir pekan tiba, saya membawa kamera dan pergi ke taman."},
   {"jp":"花や空の写真を撮るのが好きです。","furigana":"はなやそらのしゃしんをとるのがすきです。","romaji":"Hana ya sora no shashin o toru no ga suki desu.","id":"Saya suka memotret bunga dan langit."},
   {"jp":"いい写真が撮れたとき、本当にうれしくなります。","furigana":"いいしゃしんがとれたとき、ほんとうにうれしくなります。","romaji":"Ii shashin ga toreta toki, hontou ni ureshiku narimasu.","id":"Saat berhasil mengambil foto yang bagus, saya benar-benar merasa senang."},
   {"jp":"いつか写真の展覧会を開いてみたいです。","furigana":"いつかしゃしんのてんらんかいをひらいてみたいです。","romaji":"Itsuka shashin no tenrankai o hiraite mitai desu.","id":"Suatu hari saya ingin mencoba mengadakan pameran foto."}
 ]'::jsonb,
 '[
   {"word":"趣味","reading":"しゅみ","romaji":"shumi","meaning":"hobi"},
   {"word":"写真","reading":"しゃしん","romaji":"shashin","meaning":"foto"},
   {"word":"撮る","reading":"とる","romaji":"toru","meaning":"memotret/mengambil foto"},
   {"word":"展覧会","reading":"てんらんかい","romaji":"tenrankai","meaning":"pameran"},
   {"word":"いつか","reading":"いつか","romaji":"itsuka","meaning":"suatu hari nanti"}
 ]'::jsonb,
 '[
   {"q":"Apa hobi penulis?","options":["Melukis","Memotret","Menyanyi","Membaca"],"answer":1,"explanation":"「趣味は写真を撮ること」."},
   {"q":"Apa yang ingin dilakukan penulis suatu hari nanti?","options":["Membeli kamera baru","Mengadakan pameran foto","Menjadi guru","Pindah ke Kyoto"],"answer":1,"explanation":"「写真の展覧会を開いてみたい」."}
 ]'::jsonb,
 false),

(2, 5, '病院で — Di Rumah Sakit',
 '昨日から熱があって、今朝病院へ行きました。お医者さんは「かぜですね」と言いました。薬をもらって、家でゆっくり休みました。医者に「無理をしないでください」と言われました。明日はたぶん元気になると思います。',
 '[
   {"jp":"昨日から熱があって、今朝病院へ行きました。","furigana":"きのうからねつがあって、けさびょういんへいきました。","romaji":"Kinou kara netsu ga atte, kesa byouin e ikimashita.","id":"Sejak kemarin saya demam, dan tadi pagi pergi ke rumah sakit."},
   {"jp":"お医者さんは「かぜですね」と言いました。","furigana":"おいしゃさんは「かぜですね」といいました。","romaji":"Oishasan wa kaze desu ne to iimashita.","id":"Dokter berkata, ini flu ya."},
   {"jp":"薬をもらって、家でゆっくり休みました。","furigana":"くすりをもらって、いえでゆっくりやすみました。","romaji":"Kusuri o moratte, ie de yukkuri yasumimashita.","id":"Saya menerima obat lalu beristirahat dengan tenang di rumah."},
   {"jp":"医者に「無理をしないでください」と言われました。","furigana":"いしゃに「むりをしないでください」といわれました。","romaji":"Isha ni muri o shinaide kudasai to iwaremashita.","id":"Saya diingatkan oleh dokter, jangan memaksakan diri."},
   {"jp":"明日はたぶん元気になると思います。","furigana":"あしたはたぶんげんきになるとおもいます。","romaji":"Ashita wa tabun genki ni naru to omoimasu.","id":"Besok saya rasa mungkin akan sehat kembali."}
 ]'::jsonb,
 '[
   {"word":"熱","reading":"ねつ","romaji":"netsu","meaning":"demam"},
   {"word":"病院","reading":"びょういん","romaji":"byouin","meaning":"rumah sakit"},
   {"word":"お医者さん","reading":"おいしゃさん","romaji":"oishasan","meaning":"dokter"},
   {"word":"薬","reading":"くすり","romaji":"kusuri","meaning":"obat"},
   {"word":"無理","reading":"むり","romaji":"muri","meaning":"memaksakan diri/berlebihan"}
 ]'::jsonb,
 '[
   {"q":"Mengapa penulis pergi ke rumah sakit?","options":["Patah tulang","Demam","Sakit gigi","Pemeriksaan rutin"],"answer":1,"explanation":"「熱があって…病院へ行きました」."},
   {"q":"Apa kata dokter tentang kondisi penulis?","options":["Flu","Patah tulang","Alergi","Sehat"],"answer":0,"explanation":"「かぜですね」 = ini flu."},
   {"q":"Apa nasihat dokter?","options":["Banyak berolahraga","Jangan memaksakan diri","Makan yang banyak","Segera bekerja"],"answer":1,"explanation":"「無理をしないでください」."}
 ]'::jsonb,
 false);
