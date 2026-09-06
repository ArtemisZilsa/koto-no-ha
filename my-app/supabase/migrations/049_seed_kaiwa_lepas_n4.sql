-- 049: 16 kaiwa lepas N4 (daily 5, work 3, hospital 3, biz 2, kaigo 3).
--
-- Tata bahasa N4: bentuk-te, bentuk kamus, ~たら, ~なければならない, potensial,
-- ~ておく, ~てしまう, ~そうです. Sudah boleh ada kalimat majemuk, tapi
-- kosakatanya dijaga tetap sehari-hari.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO NOTHING.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(2, 'Membuang Sampah Berukuran Besar', 'daily',
 '[
  {"speaker":"アリ","text":"古い机を捨てたいんですが、どうすればいいですか。","reading":"ふるいつくえをすてたいんですが、どうすればいいですか。","romaji":"Furui tsukue o sutetai n desu ga, dou sureba ii desu ka.","trans":"Saya mau buang meja lama, caranya bagaimana ya?"},
  {"speaker":"係員","text":"机は粗大ごみになります。普通のごみの日には出せません。","reading":"つくえはそだいごみになります。ふつうのごみのひにはだせません。","romaji":"Tsukue wa sodai gomi ni narimasu. Futsuu no gomi no hi ni wa dasemasen.","trans":"Meja termasuk sampah besar. Tidak bisa dibuang di hari sampah biasa."},
  {"speaker":"アリ","text":"どうやって出すんですか。","reading":"どうやってだすんですか。","romaji":"Dou yatte dasu n desu ka.","trans":"Lalu cara membuangnya bagaimana?"},
  {"speaker":"係員","text":"まず電話で申し込んで、それから券を買っていただきます。","reading":"まずでんわでもうしこんで、それからけんをかっていただきます。","romaji":"Mazu denwa de moushikonde, sorekara ken o katte itadakimasu.","trans":"Pertama daftar lewat telepon, lalu beli kuponnya."},
  {"speaker":"アリ","text":"券はどこで買えますか。","reading":"けんはどこでかえますか。","romaji":"Ken wa doko de kaemasu ka.","trans":"Kuponnya bisa dibeli di mana?"},
  {"speaker":"係員","text":"コンビニで買えますよ。値段は大きさによって違います。","reading":"コンビニでかえますよ。ねだんはおおきさによってちがいます。","romaji":"Konbini de kaemasu yo. Nedan wa ookisa ni yotte chigaimasu.","trans":"Bisa dibeli di konbini. Harganya beda-beda tergantung ukuran."},
  {"speaker":"アリ","text":"机だといくらぐらいですか。","reading":"つくえだといくらぐらいですか。","romaji":"Tsukue da to ikura gurai desu ka.","trans":"Kalau meja kira-kira berapa?"},
  {"speaker":"係員","text":"四百円ぐらいだと思います。","reading":"しつれい、よんひゃくえんぐらいだとおもいます。","romaji":"Yonhyaku en gurai da to omoimasu.","trans":"Kira-kira 400 yen."},
  {"speaker":"アリ","text":"券を買ったあとは、どうしますか。","reading":"けんをかったあとは、どうしますか。","romaji":"Ken o katta ato wa, dou shimasu ka.","trans":"Setelah beli kupon, lalu bagaimana?"},
  {"speaker":"係員","text":"券に名前を書いて、机に貼っておいてください。","reading":"けんになまえをかいて、つくえにはっておいてください。","romaji":"Ken ni namae o kaite, tsukue ni hatte oite kudasai.","trans":"Tulis nama di kupon, lalu tempelkan di mejanya."},
  {"speaker":"アリ","text":"それから外に出すんですね。","reading":"それからそとにだすんですね。","romaji":"Sorekara soto ni dasu n desu ne.","trans":"Setelah itu diletakkan di luar ya."},
  {"speaker":"係員","text":"そうです。決められた日の朝八時までに出してください。","reading":"そうです。きめられたひのあさはちじまでにだしてください。","romaji":"Sou desu. Kimerareta hi no asa hachiji made ni dashite kudasai.","trans":"Betul. Keluarkan sebelum jam delapan pagi di hari yang ditentukan."},
  {"speaker":"アリ","text":"分かりました。忘れないようにメモしておきます。","reading":"わかりました。わすれないようにメモしておきます。","romaji":"Wakarimashita. Wasurenai you ni memo shite okimasu.","trans":"Baik. Saya catat supaya tidak lupa."}
 ]'::jsonb,
 '[
  {"word":"粗大ごみ","reading":"そだいごみ (sodai gomi)","meaning":"sampah berukuran besar (perlu daftar khusus)"},
  {"word":"申し込む","reading":"もうしこむ (moushikomu)","meaning":"mendaftar, mengajukan"},
  {"word":"券","reading":"けん (ken)","meaning":"kupon, tiket"},
  {"word":"貼る","reading":"はる (haru)","meaning":"menempel"}
 ]'::jsonb, false),

(2, 'Memperbaiki Sepeda', 'daily',
 '[
  {"speaker":"リナ","text":"すみません、自転車のタイヤがパンクしてしまいました。","reading":"すみません、じてんしゃのタイヤがパンクしてしまいました。","romaji":"Sumimasen, jitensha no taiya ga panku shite shimaimashita.","trans":"Permisi, ban sepeda saya bocor."},
  {"speaker":"店員","text":"見せてください。ああ、後ろですね。","reading":"みせてください。ああ、うしろですね。","romaji":"Misete kudasai. Aa, ushiro desu ne.","trans":"Coba saya lihat. Oh, yang belakang ya."},
  {"speaker":"リナ","text":"直せますか。","reading":"なおせますか。","romaji":"Naosemasu ka.","trans":"Bisa diperbaiki?"},
  {"speaker":"店員","text":"直せますよ。穴が小さいので、貼るだけで大丈夫です。","reading":"なおせますよ。あながちいさいので、はるだけでだいじょうぶです。","romaji":"Naosemasu yo. Ana ga chiisai node, haru dake de daijoubu desu.","trans":"Bisa kok. Lubangnya kecil, jadi cukup ditambal."},
  {"speaker":"リナ","text":"時間はどのぐらいかかりますか。","reading":"じかんはどのぐらいかかりますか。","romaji":"Jikan wa dono gurai kakarimasu ka.","trans":"Perlu waktu berapa lama?"},
  {"speaker":"店員","text":"二十分ぐらいです。待っていかれますか。","reading":"にじゅっぷんぐらいです。まっていかれますか。","romaji":"Nijuppun gurai desu. Matte ikaremasu ka.","trans":"Sekitar 20 menit. Mau ditunggu?"},
  {"speaker":"リナ","text":"はい、待ちます。いくらになりますか。","reading":"はい、まちます。いくらになりますか。","romaji":"Hai, machimasu. Ikura ni narimasu ka.","trans":"Ya, saya tunggu. Biayanya berapa?"},
  {"speaker":"店員","text":"千円です。ブレーキも見ておきましょうか。","reading":"せんえんです。ブレーキもみておきましょうか。","romaji":"Sen en desu. Bureeki mo mite okimashou ka.","trans":"1000 yen. Remnya sekalian saya cek juga?"},
  {"speaker":"リナ","text":"お願いします。最近、音がするんです。","reading":"おねがいします。さいきん、おとがするんです。","romaji":"Onegai shimasu. Saikin, oto ga suru n desu.","trans":"Tolong ya. Belakangan ini ada bunyinya."},
  {"speaker":"店員","text":"ゴムが減っていますね。換えたほうがいいと思います。","reading":"ゴムがへっていますね。かえたほうがいいとおもいます。","romaji":"Gomu ga hette imasu ne. Kaeta hou ga ii to omoimasu.","trans":"Karetnya sudah aus. Sebaiknya diganti."},
  {"speaker":"リナ","text":"それもいくらかかりますか。","reading":"それもいくらかかりますか。","romaji":"Sore mo ikura kakarimasu ka.","trans":"Itu tambah berapa?"},
  {"speaker":"店員","text":"八百円です。危ないので、今日換えたほうがいいですよ。","reading":"はっぴゃくえんです。あぶないので、きょうかえたほうがいいですよ。","romaji":"Happyaku en desu. Abunai node, kyou kaeta hou ga ii desu yo.","trans":"800 yen. Berbahaya, sebaiknya diganti hari ini."},
  {"speaker":"リナ","text":"では、両方お願いします。","reading":"では、りょうほうおねがいします。","romaji":"Dewa, ryouhou onegai shimasu.","trans":"Kalau begitu, dua-duanya tolong."}
 ]'::jsonb,
 '[
  {"word":"パンクする","reading":"panku suru","meaning":"bocor (ban)"},
  {"word":"穴","reading":"あな (ana)","meaning":"lubang"},
  {"word":"減る","reading":"へる (heru)","meaning":"berkurang, aus"},
  {"word":"換える","reading":"かえる (kaeru)","meaning":"mengganti"}
 ]'::jsonb, false),

(2, 'Membuat Kartu Poin di Toko', 'daily',
 '[
  {"speaker":"店員","text":"ポイントカードはお持ちですか。","reading":"ポイントカードはおもちですか。","romaji":"Pointo kaado wa omochi desu ka.","trans":"Apakah punya kartu poin?"},
  {"speaker":"ブディ","text":"持っていません。作ったほうがいいですか。","reading":"もっていません。つくったほうがいいですか。","romaji":"Motte imasen. Tsukutta hou ga ii desu ka.","trans":"Belum punya. Sebaiknya bikin ya?"},
  {"speaker":"店員","text":"よく来られるなら、作ったほうがお得ですよ。","reading":"よくこられるなら、つくったほうがおとくですよ。","romaji":"Yoku korareru nara, tsukutta hou ga otoku desu yo.","trans":"Kalau sering datang, lebih untung kalau bikin."},
  {"speaker":"ブディ","text":"お金はかかりますか。","reading":"おかねはかかりますか。","romaji":"Okane wa kakarimasu ka.","trans":"Ada biayanya?"},
  {"speaker":"店員","text":"無料です。百円で一ポイントたまります。","reading":"むりょうです。ひゃくえんでいちポイントたまります。","romaji":"Muryou desu. Hyaku en de ichi pointo tamarimasu.","trans":"Gratis. Setiap 100 yen dapat satu poin."},
  {"speaker":"ブディ","text":"ポイントは何に使えますか。","reading":"ポイントはなににつかえますか。","romaji":"Pointo wa nani ni tsukaemasu ka.","trans":"Poinnya bisa dipakai untuk apa?"},
  {"speaker":"店員","text":"お買い物に使えます。一ポイント一円です。","reading":"おかいものにつかえます。いちポイントいちえんです。","romaji":"Okaimono ni tsukaemasu. Ichi pointo ichi en desu.","trans":"Bisa dipakai belanja. Satu poin sama dengan satu yen."},
  {"speaker":"ブディ","text":"期限はありますか。","reading":"きげんはありますか。","romaji":"Kigen wa arimasu ka.","trans":"Ada masa berlakunya?"},
  {"speaker":"店員","text":"一年です。使わないと消えてしまいます。","reading":"いちねんです。つかわないときえてしまいます。","romaji":"Ichinen desu. Tsukawanai to kiete shimaimasu.","trans":"Satu tahun. Kalau tidak dipakai akan hangus."},
  {"speaker":"ブディ","text":"分かりました。じゃあ、作ります。","reading":"わかりました。じゃあ、つくります。","romaji":"Wakarimashita. Jaa, tsukurimasu.","trans":"Baik. Kalau begitu saya bikin."},
  {"speaker":"店員","text":"では、この用紙にご記入ください。身分証は要りません。","reading":"では、このようしにごきにゅうください。みぶんしょうはいりません。","romaji":"Dewa, kono youshi ni gokinyuu kudasai. Mibunshou wa irimasen.","trans":"Silakan isi formulir ini. Tidak perlu kartu identitas."},
  {"speaker":"ブディ","text":"住所も書かなければなりませんか。","reading":"じゅうしょもかかなければなりませんか。","romaji":"Juusho mo kakanakereba narimasen ka.","trans":"Alamat juga harus ditulis?"},
  {"speaker":"店員","text":"書かなくてもいいです。名前と電話番号だけで作れます。","reading":"かかなくてもいいです。なまえとでんわばんごうだけでつくれます。","romaji":"Kakanakute mo ii desu. Namae to denwa bangou dake de tsukuremasu.","trans":"Tidak perlu. Cukup nama dan nomor telepon saja."}
 ]'::jsonb,
 '[
  {"word":"たまる","reading":"tamaru","meaning":"terkumpul (poin)"},
  {"word":"お得","reading":"おとく (otoku)","meaning":"lebih menguntungkan"},
  {"word":"期限","reading":"きげん (kigen)","meaning":"batas waktu, masa berlaku"},
  {"word":"記入","reading":"きにゅう (kinyuu)","meaning":"pengisian formulir"}
 ]'::jsonb, false),

(2, 'Melapor Barang Hilang di Stasiun', 'daily',
 '[
  {"speaker":"デウィ","text":"すみません、電車の中に傘を忘れてしまいました。","reading":"すみません、でんしゃのなかにかさをわすれてしまいました。","romaji":"Sumimasen, densha no naka ni kasa o wasurete shimaimashita.","trans":"Permisi, payung saya tertinggal di dalam kereta."},
  {"speaker":"駅員","text":"何時ごろの電車ですか。","reading":"なんじごろのでんしゃですか。","romaji":"Nanji goro no densha desu ka.","trans":"Kereta jam berapa?"},
  {"speaker":"デウィ","text":"さっきです。八時十五分ぐらいだったと思います。","reading":"さっきです。はちじじゅうごふんぐらいだったとおもいます。","romaji":"Sakki desu. Hachiji juugofun gurai datta to omoimasu.","trans":"Barusan. Sekitar jam 8 lewat 15 kalau tidak salah."},
  {"speaker":"駅員","text":"どちら方面の電車でしたか。","reading":"どちらほうめんのでんしゃでしたか。","romaji":"Dochira houmen no densha deshita ka.","trans":"Kereta arah mana?"},
  {"speaker":"デウィ","text":"新宿方面です。前から三両目に乗っていました。","reading":"しんじゅくほうめんです。まえからさんりょうめにのっていました。","romaji":"Shinjuku houmen desu. Mae kara sanryoume ni notte imashita.","trans":"Arah Shinjuku. Saya naik di gerbong ketiga dari depan."},
  {"speaker":"駅員","text":"よく覚えていますね。傘はどんな傘ですか。","reading":"よくおぼえていますね。かさはどんなかさですか。","romaji":"Yoku oboete imasu ne. Kasa wa donna kasa desu ka.","trans":"Ingatannya bagus. Payungnya seperti apa?"},
  {"speaker":"デウィ","text":"青くて、長いです。持つところが木でできています。","reading":"あおくて、ながいです。もつところがきでできています。","romaji":"Aokute, nagai desu. Motsu tokoro ga ki de dekite imasu.","trans":"Biru dan panjang. Gagangnya dari kayu."},
  {"speaker":"駅員","text":"少し調べてみますので、お待ちください。","reading":"すこししらべてみますので、おまちください。","romaji":"Sukoshi shirabete mimasu node, omachi kudasai.","trans":"Saya coba periksa sebentar, mohon tunggu."},
  {"speaker":"デウィ","text":"お願いします。","reading":"おねがいします。","romaji":"Onegai shimasu.","trans":"Tolong ya."},
  {"speaker":"駅員","text":"まだ届いていないようです。終点の駅に届くかもしれません。","reading":"まだとどいていないようです。しゅうてんのえきにとどくかもしれません。","romaji":"Mada todoite inai you desu. Shuuten no eki ni todoku kamo shiremasen.","trans":"Sepertinya belum sampai ke sini. Mungkin nanti sampai di stasiun akhir."},
  {"speaker":"デウィ","text":"いつごろ分かりますか。","reading":"いつごろわかりますか。","romaji":"Itsu goro wakarimasu ka.","trans":"Kira-kira kapan bisa diketahui?"},
  {"speaker":"駅員","text":"夕方までには分かると思います。お電話番号を教えてください。","reading":"ゆうがたまでにはわかるとおもいます。おでんわばんごうをおしえてください。","romaji":"Yuugata made ni wa wakaru to omoimasu. Odenwa bangou o oshiete kudasai.","trans":"Kemungkinan sore ini sudah ketahuan. Boleh minta nomor telepon Anda?"},
  {"speaker":"デウィ","text":"はい、書きます。連絡を待っています。","reading":"はい、かきます。れんらくをまっています。","romaji":"Hai, kakimasu. Renraku o matte imasu.","trans":"Baik, saya tulis. Saya tunggu kabarnya."}
 ]'::jsonb,
 '[
  {"word":"方面","reading":"ほうめん (houmen)","meaning":"arah tujuan (kereta)"},
  {"word":"三両目","reading":"さんりょうめ (sanryoume)","meaning":"gerbong ketiga"},
  {"word":"終点","reading":"しゅうてん (shuuten)","meaning":"stasiun terakhir"},
  {"word":"調べる","reading":"しらべる (shiraberu)","meaning":"memeriksa, menyelidiki"}
 ]'::jsonb, false),

(2, 'Bertanya soal Rencana Akhir Pekan', 'daily',
 '[
  {"speaker":"同僚","text":"週末は何か予定がありますか。","reading":"しゅうまつはなにかよていがありますか。","romaji":"Shuumatsu wa nanika yotei ga arimasu ka.","trans":"Akhir pekan ada rencana?"},
  {"speaker":"サリ","text":"まだ決めていません。天気によります。","reading":"まだきめていません。てんきによります。","romaji":"Mada kimete imasen. Tenki ni yorimasu.","trans":"Belum diputuskan. Tergantung cuaca."},
  {"speaker":"同僚","text":"土曜日は晴れるそうですよ。","reading":"どようびははれるそうですよ。","romaji":"Doyoubi wa hareru sou desu yo.","trans":"Katanya hari Sabtu cerah lho."},
  {"speaker":"サリ","text":"本当ですか。じゃあ、公園に行こうかな。","reading":"ほんとうですか。じゃあ、こうえんにいこうかな。","romaji":"Hontou desu ka. Jaa, kouen ni ikou kana.","trans":"Benarkah? Kalau begitu mungkin saya ke taman."},
  {"speaker":"同僚","text":"いいですね。近くに大きい公園があります。","reading":"いいですね。ちかくにおおきいこうえんがあります。","romaji":"Ii desu ne. Chikaku ni ookii kouen ga arimasu.","trans":"Bagus tuh. Di dekat sini ada taman besar."},
  {"speaker":"サリ","text":"歩いて行けますか。","reading":"あるいていけますか。","romaji":"Aruite ikemasu ka.","trans":"Bisa jalan kaki ke sana?"},
  {"speaker":"同僚","text":"ちょっと遠いので、自転車のほうがいいと思います。","reading":"ちょっととおいので、じてんしゃのほうがいいとおもいます。","romaji":"Chotto tooi node, jitensha no hou ga ii to omoimasu.","trans":"Agak jauh, jadi lebih baik naik sepeda."},
  {"speaker":"サリ","text":"日曜日はどうですか。","reading":"にちようびはどうですか。","romaji":"Nichiyoubi wa dou desu ka.","trans":"Kalau hari Minggu bagaimana?"},
  {"speaker":"同僚","text":"日曜日は雨が降るかもしれません。","reading":"にちようびはあめがふるかもしれません。","romaji":"Nichiyoubi wa ame ga furu kamo shiremasen.","trans":"Hari Minggu mungkin hujan."},
  {"speaker":"サリ","text":"じゃあ、日曜日は家で洗濯をします。","reading":"じゃあ、にちようびはいえでせんたくをします。","romaji":"Jaa, nichiyoubi wa ie de sentaku o shimasu.","trans":"Kalau begitu, Minggu saya mencuci di rumah."},
  {"speaker":"同僚","text":"よかったら、土曜日は一緒に行きませんか。","reading":"よかったら、どようびはいっしょにいきませんか。","romaji":"Yokattara, doyoubi wa issho ni ikimasen ka.","trans":"Kalau berkenan, Sabtu mau pergi bareng?"},
  {"speaker":"サリ","text":"ぜひ。何時に会いましょうか。","reading":"ぜひ。なんじにあいましょうか。","romaji":"Zehi. Nanji ni aimashou ka.","trans":"Boleh sekali. Ketemu jam berapa?"},
  {"speaker":"同僚","text":"十時に駅の前でどうですか。","reading":"じゅうじにえきのまえでどうですか。","romaji":"Juuji ni eki no mae de dou desu ka.","trans":"Bagaimana kalau jam 10 di depan stasiun?"}
 ]'::jsonb,
 '[
  {"word":"予定","reading":"よてい (yotei)","meaning":"rencana, agenda"},
  {"word":"晴れる","reading":"はれる (hareru)","meaning":"cerah"},
  {"word":"～によります","reading":"ni yorimasu","meaning":"tergantung pada ~"},
  {"word":"かもしれません","reading":"kamo shiremasen","meaning":"mungkin, barangkali"}
 ]'::jsonb, false),

(2, 'Mengajari Pekerjaan ke Anggota Baru', 'work',
 '[
  {"speaker":"リナ","text":"今日から入った人ですね。私が教えます。","reading":"きょうからはいったひとですね。わたしがおしえます。","romaji":"Kyou kara haitta hito desu ne. Watashi ga oshiemasu.","trans":"Kamu yang mulai kerja hari ini ya. Saya yang mengajari."},
  {"speaker":"新人","text":"よろしくお願いします。何もわかりません。","reading":"よろしくおねがいします。なにもわかりません。","romaji":"Yoroshiku onegai shimasu. Nani mo wakarimasen.","trans":"Mohon bimbingannya. Saya belum tahu apa-apa."},
  {"speaker":"リナ","text":"大丈夫です。私も最初はそうでした。","reading":"だいじょうぶです。わたしもさいしょはそうでした。","romaji":"Daijoubu desu. Watashi mo saisho wa sou deshita.","trans":"Tidak apa-apa. Saya juga dulu begitu."},
  {"speaker":"新人","text":"まず何をすればいいですか。","reading":"まずなにをすればいいですか。","romaji":"Mazu nani o sureba ii desu ka.","trans":"Pertama harus melakukan apa?"},
  {"speaker":"リナ","text":"棚の商品を並べてください。前に出すのがコツです。","reading":"たなのしょうひんをならべてください。まえにだすのがコツです。","romaji":"Tana no shouhin o narabete kudasai. Mae ni dasu no ga kotsu desu.","trans":"Tolong tata barang di rak. Kuncinya, majukan ke depan."},
  {"speaker":"新人","text":"どうして前に出すんですか。","reading":"どうしてまえにだすんですか。","romaji":"Doushite mae ni dasu n desu ka.","trans":"Kenapa harus dimajukan?"},
  {"speaker":"リナ","text":"そのほうがお客さんが取りやすいからです。","reading":"そのほうがおきゃくさんがとりやすいからです。","romaji":"Sono hou ga okyakusan ga toriyasui kara desu.","trans":"Karena dengan begitu pelanggan lebih mudah mengambilnya."},
  {"speaker":"新人","text":"なるほど。日にちも見たほうがいいですか。","reading":"なるほど。ひにちもみたほうがいいですか。","romaji":"Naruhodo. Hinichi mo mita hou ga ii desu ka.","trans":"Oh begitu. Tanggalnya juga perlu dicek?"},
  {"speaker":"リナ","text":"はい。古いものを前に、新しいものを後ろに置きます。","reading":"はい。ふるいものをまえに、あたらしいものをうしろにおきます。","romaji":"Hai. Furui mono o mae ni, atarashii mono o ushiro ni okimasu.","trans":"Ya. Yang lama di depan, yang baru di belakang."},
  {"speaker":"新人","text":"分からないときは、聞いてもいいですか。","reading":"わからないときは、きいてもいいですか。","romaji":"Wakaranai toki wa, kiite mo ii desu ka.","trans":"Kalau tidak tahu, boleh bertanya?"},
  {"speaker":"リナ","text":"もちろんです。分からないまま続けるほうが困ります。","reading":"もちろんです。わからないままつづけるほうがこまります。","romaji":"Mochiron desu. Wakaranai mama tsuzukeru hou ga komarimasu.","trans":"Tentu saja. Justru repot kalau diteruskan tanpa paham."},
  {"speaker":"新人","text":"安心しました。がんばります。","reading":"あんしんしました。がんばります。","romaji":"Anshin shimashita. Ganbarimasu.","trans":"Saya jadi lega. Saya akan berusaha."},
  {"speaker":"リナ","text":"ゆっくりでいいですよ。急がなくても大丈夫です。","reading":"ゆっくりでいいですよ。いそがなくてもだいじょうぶです。","romaji":"Yukkuri de ii desu yo. Isoganakute mo daijoubu desu.","trans":"Pelan-pelan saja. Tidak perlu buru-buru."}
 ]'::jsonb,
 '[
  {"word":"並べる","reading":"ならべる (naraberu)","meaning":"menata berjajar"},
  {"word":"コツ","reading":"kotsu","meaning":"kunci, trik"},
  {"word":"～やすい","reading":"yasui","meaning":"mudah untuk di~"},
  {"word":"安心する","reading":"あんしんする (anshin suru)","meaning":"merasa lega"}
 ]'::jsonb, false),

(2, 'Menukar Shift dengan Rekan', 'work',
 '[
  {"speaker":"アリ","text":"ちょっとお願いがあるんですが。","reading":"ちょっとおねがいがあるんですが。","romaji":"Chotto onegai ga aru n desu ga.","trans":"Ada yang mau saya minta tolong."},
  {"speaker":"同僚","text":"何ですか。","reading":"なんですか。","romaji":"Nan desu ka.","trans":"Apa itu?"},
  {"speaker":"アリ","text":"来週の金曜日、シフトを換わってもらえませんか。","reading":"らいしゅうのきんようび、シフトをかわってもらえませんか。","romaji":"Raishuu no kinyoubi, shifuto o kawatte moraemasen ka.","trans":"Jumat depan, bisa tukar shift dengan saya?"},
  {"speaker":"同僚","text":"金曜日ですか。何時から何時までですか。","reading":"きんようびですか。なんじからなんじまでですか。","romaji":"Kinyoubi desu ka. Nanji kara nanji made desu ka.","trans":"Jumat ya. Dari jam berapa sampai jam berapa?"},
  {"speaker":"アリ","text":"夕方の五時から十時までです。","reading":"ゆうがたのごじからじゅうじまでです。","romaji":"Yuugata no goji kara juuji made desu.","trans":"Dari jam 5 sore sampai jam 10."},
  {"speaker":"同僚","text":"うーん、その日はちょっと用事があります。","reading":"うーん、そのひはちょっとようじがあります。","romaji":"Uun, sono hi wa chotto youji ga arimasu.","trans":"Hmm, hari itu saya ada keperluan."},
  {"speaker":"アリ","text":"そうですか。無理を言ってすみません。","reading":"そうですか。むりをいってすみません。","romaji":"Sou desu ka. Muri o itte sumimasen.","trans":"Oh begitu. Maaf sudah merepotkan."},
  {"speaker":"同僚","text":"土曜日なら換われますよ。土曜日はどうですか。","reading":"どようびならかわれますよ。どようびはどうですか。","romaji":"Doyoubi nara kawaremasu yo. Doyoubi wa dou desu ka.","trans":"Kalau Sabtu saya bisa. Bagaimana kalau Sabtu?"},
  {"speaker":"アリ","text":"土曜日でも大丈夫です。助かります。","reading":"どようびでもだいじょうぶです。たすかります。","romaji":"Doyoubi demo daijoubu desu. Tasukarimasu.","trans":"Sabtu juga bisa. Sangat terbantu."},
  {"speaker":"同僚","text":"店長に言っておいたほうがいいですね。","reading":"てんちょうにいっておいたほうがいいですね。","romaji":"Tenchou ni itte oita hou ga ii desu ne.","trans":"Sebaiknya kita beritahu manajer ya."},
  {"speaker":"アリ","text":"はい、私から言います。","reading":"はい、わたしからいいます。","romaji":"Hai, watashi kara iimasu.","trans":"Ya, saya yang bilang."},
  {"speaker":"同僚","text":"シフト表も直しておいてください。","reading":"シフトひょうもなおしておいてください。","romaji":"Shifuto hyou mo naoshite oite kudasai.","trans":"Tolong tabel shiftnya juga dibetulkan."},
  {"speaker":"アリ","text":"分かりました。本当にありがとうございます。","reading":"わかりました。ほんとうにありがとうございます。","romaji":"Wakarimashita. Hontou ni arigatou gozaimasu.","trans":"Baik. Terima kasih banyak sekali."}
 ]'::jsonb,
 '[
  {"word":"シフト","reading":"shifuto","meaning":"jadwal giliran kerja"},
  {"word":"換わる","reading":"かわる (kawaru)","meaning":"bertukar (posisi, giliran)"},
  {"word":"用事","reading":"ようじ (youji)","meaning":"keperluan, urusan"},
  {"word":"無理を言う","reading":"むりをいう (muri o iu)","meaning":"meminta hal yang memberatkan"}
 ]'::jsonb, false),

(2, 'Melaporkan Barang yang Rusak', 'work',
 '[
  {"speaker":"ブディ","text":"店長、すみません。コップを割ってしまいました。","reading":"てんちょう、すみません。コップをわってしまいました。","romaji":"Tenchou, sumimasen. Koppu o watte shimaimashita.","trans":"Pak Manajer, maaf. Saya memecahkan gelas."},
  {"speaker":"店長","text":"けがはありませんか。","reading":"けがはありませんか。","romaji":"Kega wa arimasen ka.","trans":"Ada yang terluka?"},
  {"speaker":"ブディ","text":"ありません。大丈夫です。","reading":"ありません。だいじょうぶです。","romaji":"Arimasen. Daijoubu desu.","trans":"Tidak ada. Saya baik-baik saja."},
  {"speaker":"店長","text":"それならよかった。物より人のほうが大事ですから。","reading":"それならよかった。ものよりひとのほうがだいじですから。","romaji":"Sore nara yokatta. Mono yori hito no hou ga daiji desu kara.","trans":"Syukurlah. Manusia lebih penting daripada barang."},
  {"speaker":"ブディ","text":"弁償しなければなりませんか。","reading":"べんしょうしなければなりませんか。","romaji":"Benshou shinakereba narimasen ka.","trans":"Apakah saya harus mengganti?"},
  {"speaker":"店長","text":"要りません。わざとじゃないでしょう。","reading":"いりません。わざとじゃないでしょう。","romaji":"Irimasen. Wazato ja nai deshou.","trans":"Tidak perlu. Kan bukan disengaja."},
  {"speaker":"ブディ","text":"はい、手がすべってしまいました。","reading":"はい、てがすべってしまいました。","romaji":"Hai, te ga subette shimaimashita.","trans":"Ya, tangan saya terpeleset."},
  {"speaker":"店長","text":"割れたところは片付けましたか。","reading":"われたところはかたづけましたか。","romaji":"Wareta tokoro wa katazukemashita ka.","trans":"Pecahannya sudah dibereskan?"},
  {"speaker":"ブディ","text":"まだです。今からします。","reading":"まだです。いまからします。","romaji":"Mada desu. Ima kara shimasu.","trans":"Belum. Sekarang saya bereskan."},
  {"speaker":"店長","text":"手ではなく、ほうきを使ってください。小さい破片が危ないです。","reading":"てではなく、ほうきをつかってください。ちいさいはへんがあぶないです。","romaji":"Te dewa naku, houki o tsukatte kudasai. Chiisai hahen ga abunai desu.","trans":"Jangan pakai tangan, pakai sapu. Serpihan kecil itu berbahaya."},
  {"speaker":"ブディ","text":"分かりました。気をつけます。","reading":"わかりました。きをつけます。","romaji":"Wakarimashita. Ki o tsukemasu.","trans":"Baik. Saya hati-hati."},
  {"speaker":"店長","text":"それから、ノートに書いておいてください。","reading":"それから、ノートにかいておいてください。","romaji":"Sorekara, nooto ni kaite oite kudasai.","trans":"Setelah itu, tolong catat di buku."},
  {"speaker":"ブディ","text":"はい、何が割れたか書きます。","reading":"はい、なにがわれたかかきます。","romaji":"Hai, nani ga wareta ka kakimasu.","trans":"Baik, saya tulis apa yang pecah."}
 ]'::jsonb,
 '[
  {"word":"割る","reading":"わる (waru)","meaning":"memecahkan"},
  {"word":"弁償","reading":"べんしょう (benshou)","meaning":"ganti rugi"},
  {"word":"わざと","reading":"wazato","meaning":"dengan sengaja"},
  {"word":"破片","reading":"はへん (hahen)","meaning":"serpihan, pecahan"}
 ]'::jsonb, false),

(2, 'Menjelaskan Alergi Obat', 'hospital',
 '[
  {"speaker":"医者","text":"今まで大きい病気をしたことがありますか。","reading":"いままでおおきいびょうきをしたことがありますか。","romaji":"Ima made ookii byouki o shita koto ga arimasu ka.","trans":"Pernah menderita penyakit berat sebelumnya?"},
  {"speaker":"サリ","text":"ありません。でも、薬でアレルギーが出たことがあります。","reading":"ありません。でも、くすりでアレルギーがでたことがあります。","romaji":"Arimasen. Demo, kusuri de arerugii ga deta koto ga arimasu.","trans":"Tidak. Tapi saya pernah alergi karena obat."},
  {"speaker":"医者","text":"それは大事な情報です。何の薬でしたか。","reading":"それはだいじなじょうほうです。なんのくすりでしたか。","romaji":"Sore wa daiji na jouhou desu. Nan no kusuri deshita ka.","trans":"Itu informasi penting. Obat apa?"},
  {"speaker":"サリ","text":"名前は覚えていません。国で飲んだ痛み止めです。","reading":"なまえはおぼえていません。くにでのんだいたみどめです。","romaji":"Namae wa oboete imasen. Kuni de nonda itamidome desu.","trans":"Namanya tidak ingat. Obat pereda nyeri yang saya minum di negara saya."},
  {"speaker":"医者","text":"どんな症状が出ましたか。","reading":"どんなしょうじょうがでましたか。","romaji":"Donna shoujou ga demashita ka.","trans":"Gejalanya seperti apa?"},
  {"speaker":"サリ","text":"体に赤いものが出て、かゆくなりました。","reading":"からだにあかいものがでて、かゆくなりました。","romaji":"Karada ni akai mono ga dete, kayuku narimashita.","trans":"Muncul bercak merah di badan dan gatal."},
  {"speaker":"医者","text":"息が苦しくなりましたか。","reading":"いきがくるしくなりましたか。","romaji":"Iki ga kurushiku narimashita ka.","trans":"Apakah napasnya jadi sesak?"},
  {"speaker":"サリ","text":"いいえ、それはありませんでした。","reading":"いいえ、それはありませんでした。","romaji":"Iie, sore wa arimasen deshita.","trans":"Tidak, itu tidak terjadi."},
  {"speaker":"医者","text":"分かりました。カルテに書いておきます。","reading":"わかりました。カルテにかいておきます。","romaji":"Wakarimashita. Karute ni kaite okimasu.","trans":"Baik. Saya catat di rekam medis."},
  {"speaker":"サリ","text":"今日の薬は大丈夫でしょうか。","reading":"きょうのくすりはだいじょうぶでしょうか。","romaji":"Kyou no kusuri wa daijoubu deshou ka.","trans":"Obat hari ini aman?"},
  {"speaker":"医者","text":"違う種類にしますから、心配しなくていいですよ。","reading":"ちがうしゅるいにしますから、しんぱいしなくていいですよ。","romaji":"Chigau shurui ni shimasu kara, shinpai shinakute ii desu yo.","trans":"Saya pakai jenis yang berbeda, jadi tidak perlu khawatir."},
  {"speaker":"サリ","text":"すみません、もし出たらどうすればいいですか。","reading":"すみません、もしでたらどうすればいいですか。","romaji":"Sumimasen, moshi detara dou sureba ii desu ka.","trans":"Maaf, kalau ternyata muncul lagi harus bagaimana?"},
  {"speaker":"医者","text":"すぐに薬をやめて、この病院に電話してください。","reading":"すぐにくすりをやめて、このびょういんにでんわしてください。","romaji":"Sugu ni kusuri o yamete, kono byouin ni denwa shite kudasai.","trans":"Langsung hentikan obatnya, lalu telepon rumah sakit ini."}
 ]'::jsonb,
 '[
  {"word":"アレルギー","reading":"arerugii","meaning":"alergi"},
  {"word":"症状","reading":"しょうじょう (shoujou)","meaning":"gejala"},
  {"word":"かゆい","reading":"kayui","meaning":"gatal"},
  {"word":"カルテ","reading":"karute","meaning":"rekam medis"}
 ]'::jsonb, false),

(2, 'Pemeriksaan Kesehatan Tahunan', 'hospital',
 '[
  {"speaker":"看護師","text":"今日は健康診断ですね。朝ごはんは食べましたか。","reading":"きょうはけんこうしんだんですね。あさごはんはたべましたか。","romaji":"Kyou wa kenkou shindan desu ne. Asagohan wa tabemashita ka.","trans":"Hari ini pemeriksaan kesehatan ya. Sudah sarapan?"},
  {"speaker":"アリ","text":"食べていません。水も飲まないほうがいいと聞きました。","reading":"たべていません。みずものまないほうがいいとききました。","romaji":"Tabete imasen. Mizu mo nomanai hou ga ii to kikimashita.","trans":"Belum. Katanya air pun sebaiknya tidak diminum."},
  {"speaker":"看護師","text":"水は少しなら大丈夫ですよ。","reading":"みずはすこしならだいじょうぶですよ。","romaji":"Mizu wa sukoshi nara daijoubu desu yo.","trans":"Air sedikit saja tidak masalah kok."},
  {"speaker":"アリ","text":"今日は何をしますか。","reading":"きょうはなにをしますか。","romaji":"Kyou wa nani o shimasu ka.","trans":"Hari ini apa saja yang diperiksa?"},
  {"speaker":"看護師","text":"身長と体重、血圧、血液検査、それからレントゲンです。","reading":"しんちょうとたいじゅう、けつあつ、けつえきけんさ、それからレントゲンです。","romaji":"Shinchou to taijuu, ketsuatsu, ketsueki kensa, sorekara rentogen desu.","trans":"Tinggi dan berat badan, tekanan darah, tes darah, lalu rontgen."},
  {"speaker":"アリ","text":"血を取るんですか。少し怖いです。","reading":"ちをとるんですか。すこしこわいです。","romaji":"Chi o toru n desu ka. Sukoshi kowai desu.","trans":"Diambil darahnya? Saya agak takut."},
  {"speaker":"看護師","text":"すぐ終わりますよ。目をつぶっていてもいいです。","reading":"すぐおわりますよ。めをつぶっていてもいいです。","romaji":"Sugu owarimasu yo. Me o tsubutte ite mo ii desu.","trans":"Cepat kok selesainya. Boleh sambil menutup mata."},
  {"speaker":"アリ","text":"レントゲンのときは何かしますか。","reading":"レントゲンのときはなにかしますか。","romaji":"Rentogen no toki wa nanika shimasu ka.","trans":"Waktu rontgen ada yang perlu dilakukan?"},
  {"speaker":"看護師","text":"金属のものを全部外してください。ネックレスや時計です。","reading":"きんぞくのものをぜんぶはずしてください。ネックレスやとけいです。","romaji":"Kinzoku no mono o zenbu hazushite kudasai. Nekkuresu ya tokei desu.","trans":"Lepas semua benda logam. Kalung, jam tangan, dan sejenisnya."},
  {"speaker":"アリ","text":"結果はいつ分かりますか。","reading":"けっかはいつわかりますか。","romaji":"Kekka wa itsu wakarimasu ka.","trans":"Hasilnya kapan keluar?"},
  {"speaker":"看護師","text":"二週間ぐらいで、会社に届きます。","reading":"にしゅうかんぐらいで、かいしゃにとどきます。","romaji":"Nishuukan gurai de, kaisha ni todokimasu.","trans":"Sekitar dua minggu, dikirim ke perusahaan."},
  {"speaker":"アリ","text":"悪いところがあったら、連絡が来ますか。","reading":"わるいところがあったら、れんらくがきますか。","romaji":"Warui tokoro ga attara, renraku ga kimasu ka.","trans":"Kalau ada yang bermasalah, akan dihubungi?"},
  {"speaker":"看護師","text":"はい、早めに連絡します。心配しないでください。","reading":"はい、はやめにれんらくします。しんぱいしないでください。","romaji":"Hai, hayame ni renraku shimasu. Shinpai shinaide kudasai.","trans":"Ya, akan segera dihubungi. Jangan khawatir."}
 ]'::jsonb,
 '[
  {"word":"健康診断","reading":"けんこうしんだん (kenkou shindan)","meaning":"pemeriksaan kesehatan berkala"},
  {"word":"血液検査","reading":"けつえきけんさ (ketsueki kensa)","meaning":"tes darah"},
  {"word":"金属","reading":"きんぞく (kinzoku)","meaning":"logam"},
  {"word":"結果","reading":"けっか (kekka)","meaning":"hasil"}
 ]'::jsonb, false),

(2, 'Menjenguk Teman di Rumah Sakit', 'hospital',
 '[
  {"speaker":"デウィ","text":"具合はどうですか。","reading":"ぐあいはどうですか。","romaji":"Guai wa dou desu ka.","trans":"Bagaimana keadaanmu?"},
  {"speaker":"友達","text":"だいぶよくなりました。来てくれてありがとう。","reading":"だいぶよくなりました。きてくれてありがとう。","romaji":"Daibu yoku narimashita. Kite kurete arigatou.","trans":"Sudah jauh lebih baik. Terima kasih sudah datang."},
  {"speaker":"デウィ","text":"これ、よかったら食べてください。","reading":"これ、よかったらたべてください。","romaji":"Kore, yokattara tabete kudasai.","trans":"Ini, kalau berkenan silakan dimakan."},
  {"speaker":"友達","text":"わあ、ありがとう。でも、花じゃなくてよかった。","reading":"わあ、ありがとう。でも、はなじゃなくてよかった。","romaji":"Waa, arigatou. Demo, hana ja nakute yokatta.","trans":"Wah, terima kasih. Untung bukan bunga."},
  {"speaker":"デウィ","text":"どうしてですか。","reading":"どうしてですか。","romaji":"Doushite desu ka.","trans":"Kenapa?"},
  {"speaker":"友達","text":"この病院は花を持ってきてはいけないんです。","reading":"このびょういんははなをもってきてはいけないんです。","romaji":"Kono byouin wa hana o motte kite wa ikenai n desu.","trans":"Di rumah sakit ini tidak boleh membawa bunga."},
  {"speaker":"デウィ","text":"知りませんでした。危なかったです。","reading":"しりませんでした。あぶなかったです。","romaji":"Shirimasen deshita. Abunakatta desu.","trans":"Saya tidak tahu. Untung tidak jadi."},
  {"speaker":"友達","text":"最近はそういう病院が多いそうですよ。","reading":"さいきんはそういうびょういんがおおいそうですよ。","romaji":"Saikin wa sou iu byouin ga ooi sou desu yo.","trans":"Katanya belakangan banyak rumah sakit seperti itu."},
  {"speaker":"デウィ","text":"いつ退院できそうですか。","reading":"いつたいいんできそうですか。","romaji":"Itsu taiin dekisou desu ka.","trans":"Kira-kira kapan bisa keluar rumah sakit?"},
  {"speaker":"友達","text":"来週だと言われました。まだ歩く練習をしています。","reading":"らいしゅうだといわれました。まだあるくれんしゅうをしています。","romaji":"Raishuu da to iwaremashita. Mada aruku renshuu o shite imasu.","trans":"Katanya minggu depan. Sekarang masih latihan berjalan."},
  {"speaker":"デウィ","text":"無理をしないでくださいね。","reading":"むりをしないでくださいね。","romaji":"Muri o shinaide kudasai ne.","trans":"Jangan memaksakan diri ya."},
  {"speaker":"友達","text":"うん。仕事のことは心配だけど、今は休みます。","reading":"うん。しごとのことはしんぱいだけど、いまはやすみます。","romaji":"Un. Shigoto no koto wa shinpai da kedo, ima wa yasumimasu.","trans":"Iya. Soal kerjaan sih khawatir, tapi sekarang istirahat dulu."},
  {"speaker":"デウィ","text":"それがいいです。また来ますね。","reading":"それがいいです。またきますね。","romaji":"Sore ga ii desu. Mata kimasu ne.","trans":"Itu yang terbaik. Saya akan datang lagi ya."}
 ]'::jsonb,
 '[
  {"word":"具合","reading":"ぐあい (guai)","meaning":"kondisi badan"},
  {"word":"退院","reading":"たいいん (taiin)","meaning":"keluar dari rumah sakit"},
  {"word":"無理をする","reading":"むりをする (muri o suru)","meaning":"memaksakan diri"},
  {"word":"～そうです","reading":"sou desu","meaning":"katanya, kabarnya"}
 ]'::jsonb, false),

(2, 'Mengatur Jadwal Rapat', 'biz',
 '[
  {"speaker":"リナ","text":"来週の会議の日を決めたいのですが。","reading":"らいしゅうのかいぎのひをきめたいのですが。","romaji":"Raishuu no kaigi no hi o kimetai no desu ga.","trans":"Saya ingin menentukan hari rapat minggu depan."},
  {"speaker":"部長","text":"何人集まりますか。","reading":"なんにんあつまりますか。","romaji":"Nannin atsumarimasu ka.","trans":"Berapa orang yang akan hadir?"},
  {"speaker":"リナ","text":"六人です。全員の予定を聞きました。","reading":"ろくにんです。ぜんいんのよていをききました。","romaji":"Rokunin desu. Zen-in no yotei o kikimashita.","trans":"Enam orang. Saya sudah tanya jadwal semuanya."},
  {"speaker":"部長","text":"それで、いつがよさそうですか。","reading":"それで、いつがよさそうですか。","romaji":"Sorede, itsu ga yosasou desu ka.","trans":"Jadi, kapan yang tampaknya paling cocok?"},
  {"speaker":"リナ","text":"水曜日の午後なら、全員空いています。","reading":"すいようびのごごなら、ぜんいんあいています。","romaji":"Suiyoubi no gogo nara, zen-in aite imasu.","trans":"Kalau Rabu siang, semuanya kosong."},
  {"speaker":"部長","text":"何時からにしましょうか。","reading":"なんじからにしましょうか。","romaji":"Nanji kara ni shimashou ka.","trans":"Mulai jam berapa?"},
  {"speaker":"リナ","text":"二時からはどうでしょうか。一時間の予定です。","reading":"にじからはどうでしょうか。いちじかんのよていです。","romaji":"Niji kara wa dou deshou ka. Ichijikan no yotei desu.","trans":"Bagaimana kalau mulai jam dua? Rencananya satu jam."},
  {"speaker":"部長","text":"いいですね。部屋は取ってありますか。","reading":"いいですね。へやはとってありますか。","romaji":"Ii desu ne. Heya wa totte arimasu ka.","trans":"Bagus. Ruangannya sudah dipesan?"},
  {"speaker":"リナ","text":"まだです。これから取っておきます。","reading":"まだです。これからとっておきます。","romaji":"Mada desu. Kore kara totte okimasu.","trans":"Belum. Sekarang saya pesan."},
  {"speaker":"部長","text":"資料も忘れないでください。前の日までに配ってください。","reading":"しりょうもわすれないでください。まえのひまでにくばってください。","romaji":"Shiryou mo wasurenaide kudasai. Mae no hi made ni kubatte kudasai.","trans":"Jangan lupa materinya juga. Bagikan paling lambat sehari sebelumnya."},
  {"speaker":"リナ","text":"はい。メールで送ってもいいですか。","reading":"はい。メールでおくってもいいですか。","romaji":"Hai. Meeru de okutte mo ii desu ka.","trans":"Baik. Boleh dikirim lewat email?"},
  {"speaker":"部長","text":"メールで結構です。紙は当日でいいです。","reading":"メールでけっこうです。かみはとうじつでいいです。","romaji":"Meeru de kekkou desu. Kami wa toujitsu de ii desu.","trans":"Lewat email saja cukup. Yang kertas boleh di hari-H."},
  {"speaker":"リナ","text":"かしこまりました。すぐ準備します。","reading":"かしこまりました。すぐじゅんびします。","romaji":"Kashikomarimashita. Sugu junbi shimasu.","trans":"Baik. Saya segera siapkan."}
 ]'::jsonb,
 '[
  {"word":"会議","reading":"かいぎ (kaigi)","meaning":"rapat"},
  {"word":"空いている","reading":"あいている (aite iru)","meaning":"kosong, senggang"},
  {"word":"資料","reading":"しりょう (shiryou)","meaning":"materi, bahan rapat"},
  {"word":"当日","reading":"とうじつ (toujitsu)","meaning":"hari pelaksanaan, hari-H"}
 ]'::jsonb, false),

(2, 'Mengonfirmasi Pesanan lewat Telepon', 'biz',
 '[
  {"speaker":"アリ","text":"お世話になっております。さくら商事のアリです。","reading":"おせわになっております。さくらしょうじのアリです。","romaji":"Osewa ni natte orimasu. Sakura Shouji no Ari desu.","trans":"Terima kasih atas kerja samanya. Saya Ari dari Sakura Shouji."},
  {"speaker":"取引先","text":"お世話になっております。どうされましたか。","reading":"おせわになっております。どうされましたか。","romaji":"Osewa ni natte orimasu. Dou saremashita ka.","trans":"Sama-sama. Ada keperluan apa?"},
  {"speaker":"アリ","text":"先週の注文の件で、確認したいことがあります。","reading":"せんしゅうのちゅうもんのけんで、かくにんしたいことがあります。","romaji":"Senshuu no chuumon no ken de, kakunin shitai koto ga arimasu.","trans":"Soal pesanan minggu lalu, ada yang ingin saya konfirmasi."},
  {"speaker":"取引先","text":"はい、どうぞ。","reading":"はい、どうぞ。","romaji":"Hai, douzo.","trans":"Ya, silakan."},
  {"speaker":"アリ","text":"数が五十個になっていますが、五百個ではありませんか。","reading":"かずがごじゅっこになっていますが、ごひゃっこではありませんか。","romaji":"Kazu ga gojukko ni natte imasu ga, gohyakko dewa arimasen ka.","trans":"Jumlahnya tertulis 50 buah, bukankah seharusnya 500?"},
  {"speaker":"取引先","text":"少々お待ちください。調べてみます。","reading":"しょうしょうおまちください。しらべてみます。","romaji":"Shoushou omachi kudasai. Shirabete mimasu.","trans":"Mohon tunggu sebentar. Saya periksa."},
  {"speaker":"アリ","text":"お願いします。","reading":"おねがいします。","romaji":"Onegai shimasu.","trans":"Tolong ya."},
  {"speaker":"取引先","text":"申し訳ありません。こちらの間違いでした。","reading":"もうしわけありません。こちらのまちがいでした。","romaji":"Moushiwake arimasen. Kochira no machigai deshita.","trans":"Mohon maaf. Itu kesalahan dari pihak kami."},
  {"speaker":"アリ","text":"いえいえ。直していただけますか。","reading":"いえいえ。なおしていただけますか。","romaji":"Ieie. Naoshite itadakemasu ka.","trans":"Tidak apa-apa. Bisa tolong dibetulkan?"},
  {"speaker":"取引先","text":"すぐ直します。届く日は変わりません。","reading":"すぐなおします。とどくひはかわりません。","romaji":"Sugu naoshimasu. Todoku hi wa kawarimasen.","trans":"Segera saya betulkan. Tanggal pengirimannya tidak berubah."},
  {"speaker":"アリ","text":"よかったです。新しい紙を送ってもらえますか。","reading":"よかったです。あたらしいかみをおくってもらえますか。","romaji":"Yokatta desu. Atarashii kami o okutte moraemasu ka.","trans":"Syukurlah. Bisa kirimkan dokumen yang baru?"},
  {"speaker":"取引先","text":"今日中にメールでお送りします。","reading":"きょうじゅうにメールでおおくりします。","romaji":"Kyoujuu ni meeru de ookuri shimasu.","trans":"Hari ini juga akan saya kirim lewat email."},
  {"speaker":"アリ","text":"ありがとうございます。失礼します。","reading":"ありがとうございます。しつれいします。","romaji":"Arigatou gozaimasu. Shitsurei shimasu.","trans":"Terima kasih. Permisi."}
 ]'::jsonb,
 '[
  {"word":"注文","reading":"ちゅうもん (chuumon)","meaning":"pesanan"},
  {"word":"～の件","reading":"のけん (no ken)","meaning":"perihal ~, mengenai ~"},
  {"word":"間違い","reading":"まちがい (machigai)","meaning":"kesalahan"},
  {"word":"今日中に","reading":"きょうじゅうに (kyoujuu ni)","meaning":"dalam hari ini juga"}
 ]'::jsonb, false),

(2, 'Menghadapi Lansia yang Menolak Mandi', 'kaigo',
 '[
  {"speaker":"職員","text":"山田さん、そろそろお風呂の時間ですよ。","reading":"やまださん、そろそろおふろのじかんですよ。","romaji":"Yamada-san, sorosoro ofuro no jikan desu yo.","trans":"Bu Yamada, sebentar lagi waktunya mandi."},
  {"speaker":"山田","text":"今日は入りたくない。","reading":"きょうははいりたくない。","romaji":"Kyou wa hairitakunai.","trans":"Hari ini saya tidak mau mandi."},
  {"speaker":"職員","text":"そうですか。どこか具合が悪いですか。","reading":"そうですか。どこかぐあいがわるいですか。","romaji":"Sou desu ka. Dokoka guai ga warui desu ka.","trans":"Begitu ya. Apakah ada yang tidak enak badan?"},
  {"speaker":"山田","text":"別に。ただ、面倒くさいんです。","reading":"べつに。ただ、めんどうくさいんです。","romaji":"Betsu ni. Tada, mendoukusai n desu.","trans":"Tidak juga. Hanya saja, malas."},
  {"speaker":"職員","text":"分かります。寒いですしね。","reading":"わかります。さむいですしね。","romaji":"Wakarimasu. Samui desu shi ne.","trans":"Saya paham. Lagi pula dinginnya juga."},
  {"speaker":"山田","text":"そう、寒いのがいやなんです。","reading":"そう、さむいのがいやなんです。","romaji":"Sou, samui no ga iya nan desu.","trans":"Iya, saya tidak suka yang dingin."},
  {"speaker":"職員","text":"お風呂場はもう暖めてあります。入ればすぐ暖かいですよ。","reading":"おふろばはもうあたためてあります。はいればすぐあたたかいですよ。","romaji":"Ofuroba wa mou atatamete arimasu. Haireba sugu atatakai desu yo.","trans":"Kamar mandinya sudah dihangatkan. Begitu masuk langsung hangat."},
  {"speaker":"山田","text":"そうなの。","reading":"そうなの。","romaji":"Sou nano.","trans":"Oh, begitu ya."},
  {"speaker":"職員","text":"今日が無理なら、明日にしてもいいですよ。","reading":"きょうがむりなら、あしたにしてもいいですよ。","romaji":"Kyou ga muri nara, ashita ni shite mo ii desu yo.","trans":"Kalau hari ini berat, boleh besok saja."},
  {"speaker":"山田","text":"明日でもいいの。","reading":"あしたでもいいの。","romaji":"Ashita demo ii no.","trans":"Boleh besok?"},
  {"speaker":"職員","text":"いいですよ。でも、足だけでも洗いませんか。","reading":"いいですよ。でも、あしだけでもあらいませんか。","romaji":"Ii desu yo. Demo, ashi dake demo araimasen ka.","trans":"Boleh kok. Tapi, bagaimana kalau kakinya saja dicuci?"},
  {"speaker":"山田","text":"足だけなら、いいですよ。","reading":"あしだけなら、いいですよ。","romaji":"Ashi dake nara, ii desu yo.","trans":"Kalau cuma kaki, boleh."},
  {"speaker":"職員","text":"では、お湯を持ってきますね。ゆっくりしましょう。","reading":"では、おゆをもってきますね。ゆっくりしましょう。","romaji":"Dewa, oyu o motte kimasu ne. Yukkuri shimashou.","trans":"Kalau begitu saya bawakan air hangatnya. Santai saja."}
 ]'::jsonb,
 '[
  {"word":"面倒くさい","reading":"めんどうくさい (mendoukusai)","meaning":"merepotkan, malas melakukannya"},
  {"word":"暖める","reading":"あたためる (atatameru)","meaning":"menghangatkan"},
  {"word":"いや","reading":"iya","meaning":"tidak suka, enggan"},
  {"word":"～なら","reading":"nara","meaning":"kalau ~ (syarat)"}
 ]'::jsonb, false),

(2, 'Mencatat Jumlah Makan dan Minum', 'kaigo',
 '[
  {"speaker":"先輩","text":"食事の記録の書き方を教えますね。","reading":"しょくじのきろくのかきかたをおしえますね。","romaji":"Shokuji no kiroku no kakikata o oshiemasu ne.","trans":"Saya ajarkan cara menulis catatan makan ya."},
  {"speaker":"アリ","text":"お願いします。全部食べたかどうかを書くんですか。","reading":"おねがいします。ぜんぶたべたかどうかをかくんですか。","romaji":"Onegai shimasu. Zenbu tabeta ka dou ka o kaku n desu ka.","trans":"Tolong ya. Yang ditulis apakah habis atau tidak?"},
  {"speaker":"先輩","text":"それだけでは足りません。十のうちいくつ食べたかを書きます。","reading":"それだけではたりません。じゅうのうちいくつたべたかをかきます。","romaji":"Sore dake dewa tarimasen. Juu no uchi ikutsu tabeta ka o kakimasu.","trans":"Itu saja tidak cukup. Kita tulis berapa dari sepuluh yang dimakan."},
  {"speaker":"アリ","text":"半分だったら、五ですか。","reading":"はんぶんだったら、ごですか。","romaji":"Hanbun dattara, go desu ka.","trans":"Kalau setengah, berarti lima?"},
  {"speaker":"先輩","text":"そうです。ごはんとおかずを分けて書いてください。","reading":"そうです。ごはんとおかずをわけてかいてください。","romaji":"Sou desu. Gohan to okazu o wakete kaite kudasai.","trans":"Betul. Nasi dan lauknya ditulis terpisah."},
  {"speaker":"アリ","text":"どうして分けるんですか。","reading":"どうしてわけるんですか。","romaji":"Doushite wakeru n desu ka.","trans":"Kenapa harus dipisah?"},
  {"speaker":"先輩","text":"ごはんだけ残す人もいるからです。理由が違います。","reading":"ごはんだけのこすひともいるからです。りゆうがちがいます。","romaji":"Gohan dake nokosu hito mo iru kara desu. Riyuu ga chigaimasu.","trans":"Karena ada yang hanya menyisakan nasi. Penyebabnya berbeda."},
  {"speaker":"アリ","text":"なるほど。飲み物はどう書きますか。","reading":"なるほど。のみものはどうかきますか。","romaji":"Naruhodo. Nomimono wa dou kakimasu ka.","trans":"Oh begitu. Kalau minuman bagaimana?"},
  {"speaker":"先輩","text":"ミリリットルで書きます。コップ一杯なら百五十です。","reading":"ミリリットルでかきます。コップいっぱいならひゃくごじゅうです。","romaji":"Miririttoru de kakimasu. Koppu ippai nara hyaku gojuu desu.","trans":"Ditulis dalam mililiter. Satu gelas berarti 150."},
  {"speaker":"アリ","text":"少ししか飲まなかったら、どうしますか。","reading":"すこししかのまなかったら、どうしますか。","romaji":"Sukoshi shika nomanakattara, dou shimasu ka.","trans":"Kalau hanya minum sedikit, bagaimana?"},
  {"speaker":"先輩","text":"見た分を書いて、あとで報告してください。","reading":"みたぶんをかいて、あとでほうこくしてください。","romaji":"Mita bun o kaite, ato de houkoku shite kudasai.","trans":"Tulis sebanyak yang kamu lihat, lalu laporkan."},
  {"speaker":"アリ","text":"三日続いたら、心配ですね。","reading":"みっかつづいたら、しんぱいですね。","romaji":"Mikka tsuzuitara, shinpai desu ne.","trans":"Kalau berlanjut tiga hari, itu mengkhawatirkan ya."},
  {"speaker":"先輩","text":"そのとおりです。数で見ると、変化がよく分かります。","reading":"そのとおりです。かずでみると、へんかがよくわかります。","romaji":"Sono toori desu. Kazu de miru to, henka ga yoku wakarimasu.","trans":"Tepat sekali. Kalau dilihat dari angkanya, perubahannya jadi jelas."}
 ]'::jsonb,
 '[
  {"word":"おかず","reading":"okazu","meaning":"lauk"},
  {"word":"残す","reading":"のこす (nokosu)","meaning":"menyisakan"},
  {"word":"理由","reading":"りゆう (riyuu)","meaning":"alasan, penyebab"},
  {"word":"変化","reading":"へんか (henka)","meaning":"perubahan"}
 ]'::jsonb, false),

(2, 'Menyambut Keluarga yang Berkunjung', 'kaigo',
 '[
  {"speaker":"家族","text":"すみません、母の様子を見に来ました。","reading":"すみません、ははのようすをみにきました。","romaji":"Sumimasen, haha no yousu o mi ni kimashita.","trans":"Permisi, saya datang untuk melihat keadaan ibu saya."},
  {"speaker":"職員","text":"いつもありがとうございます。こちらにご記入ください。","reading":"いつもありがとうございます。こちらにごきにゅうください。","romaji":"Itsumo arigatou gozaimasu. Kochira ni gokinyuu kudasai.","trans":"Terima kasih atas kunjungannya. Silakan isi di sini."},
  {"speaker":"家族","text":"今日はどうですか。","reading":"きょうはどうですか。","romaji":"Kyou wa dou desu ka.","trans":"Hari ini bagaimana keadaannya?"},
  {"speaker":"職員","text":"朝からよく召し上がって、今は起きていらっしゃいます。","reading":"あさからよくめしあがって、いまはおきていらっしゃいます。","romaji":"Asa kara yoku meshiagatte, ima wa okite irasshaimasu.","trans":"Sejak pagi makannya lahap, dan sekarang sedang terjaga."},
  {"speaker":"家族","text":"よかった。最近、元気がないと聞いていたので。","reading":"よかった。さいきん、げんきがないときいていたので。","romaji":"Yokatta. Saikin, genki ga nai to kiite ita node.","trans":"Syukurlah. Saya dengar belakangan ini kurang bersemangat."},
  {"speaker":"職員","text":"先週は少し食べる量が減っていました。","reading":"せんしゅうはすこしたべるりょうがへっていました。","romaji":"Senshuu wa sukoshi taberu ryou ga hette imashita.","trans":"Minggu lalu porsi makannya memang agak berkurang."},
  {"speaker":"家族","text":"今は戻りましたか。","reading":"いまはもどりましたか。","romaji":"Ima wa modorimashita ka.","trans":"Sekarang sudah kembali normal?"},
  {"speaker":"職員","text":"戻ってきています。詳しいことは看護師にお聞きください。","reading":"もどってきています。くわしいことはかんごしにおききください。","romaji":"Modotte kite imasu. Kuwashii koto wa kangoshi ni okiki kudasai.","trans":"Sudah membaik. Untuk detailnya silakan tanyakan ke perawat."},
  {"speaker":"家族","text":"分かりました。部屋に行ってもいいですか。","reading":"わかりました。へやにいってもいいですか。","romaji":"Wakarimashita. Heya ni itte mo ii desu ka.","trans":"Baik. Boleh saya ke kamarnya?"},
  {"speaker":"職員","text":"どうぞ。三時からおやつなので、それまでゆっくりどうぞ。","reading":"どうぞ。さんじからおやつなので、それまでゆっくりどうぞ。","romaji":"Douzo. Sanji kara oyatsu na node, sore made yukkuri douzo.","trans":"Silakan. Jam tiga ada camilan, jadi sampai sebelum itu silakan santai."},
  {"speaker":"家族","text":"おやつも一緒に食べてもいいですか。","reading":"おやつもいっしょにたべてもいいですか。","romaji":"Oyatsu mo issho ni tabete mo ii desu ka.","trans":"Boleh saya ikut menemani makan camilan?"},
  {"speaker":"職員","text":"もちろんです。喜ばれると思いますよ。","reading":"もちろんです。よろこばれるとおもいますよ。","romaji":"Mochiron desu. Yorokobareru to omoimasu yo.","trans":"Tentu saja. Beliau pasti senang."},
  {"speaker":"家族","text":"ありがとうございます。では、失礼します。","reading":"ありがとうございます。では、しつれいします。","romaji":"Arigatou gozaimasu. Dewa, shitsurei shimasu.","trans":"Terima kasih. Kalau begitu, permisi."}
 ]'::jsonb,
 '[
  {"word":"様子","reading":"ようす (yousu)","meaning":"keadaan, kondisi"},
  {"word":"量","reading":"りょう (ryou)","meaning":"jumlah, porsi"},
  {"word":"詳しい","reading":"くわしい (kuwashii)","meaning":"terperinci"},
  {"word":"おやつ","reading":"oyatsu","meaning":"camilan sore"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO NOTHING;
