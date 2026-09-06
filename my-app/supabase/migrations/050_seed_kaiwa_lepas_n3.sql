-- 050: 16 kaiwa lepas N3 (daily 5, work 3, hospital 3, biz 2, kaigo 3).
--
-- Tata bahasa N3: ～ため, ～わけ, ～ようにする, pasif, kausatif, ～ば, ～ても,
-- serta keigo yang mulai rutin di situasi kerja. Situasinya juga naik: bukan
-- lagi bertanya arah, tapi menolak, menegur, menawar, dan menjelaskan
-- kesalahpahaman — hal yang menuntut kalimat bertingkat.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO NOTHING.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(3, 'Memperpanjang Visa di Imigrasi', 'daily',
 '[
  {"speaker":"アリ","text":"在留期間の更新に来ました。書類はこれで足りるでしょうか。","reading":"ざいりゅうきかんのこうしんにきました。しょるいはこれでたりるでしょうか。","romaji":"Zairyuu kikan no koushin ni kimashita. Shorui wa kore de tariru deshou ka.","trans":"Saya datang untuk memperpanjang masa tinggal. Apakah dokumennya sudah cukup?"},
  {"speaker":"職員","text":"拝見します。申請書と在職証明書はありますね。","reading":"はいけんします。しんせいしょとざいしょくしょうめいしょはありますね。","romaji":"Haiken shimasu. Shinseisho to zaishoku shoumeisho wa arimasu ne.","trans":"Saya lihat dulu. Formulir permohonan dan surat keterangan kerja ada."},
  {"speaker":"アリ","text":"はい。あと、住民税の証明書も持ってきました。","reading":"はい。あと、じゅうみんぜいのしょうめいしょももってきました。","romaji":"Hai. Ato, juuminzei no shoumeisho mo motte kimashita.","trans":"Ya. Selain itu, saya juga bawa surat keterangan pajak daerah."},
  {"speaker":"職員","text":"よく準備されていますね。ただ、写真が古いようです。","reading":"よくじゅんびされていますね。ただ、しゃしんがふるいようです。","romaji":"Yoku junbi sarete imasu ne. Tada, shashin ga furui you desu.","trans":"Persiapannya bagus. Hanya saja, fotonya sepertinya lama."},
  {"speaker":"アリ","text":"三か月以内のものでなければならないんですか。","reading":"さんかげついないのものでなければならないんですか。","romaji":"Sankagetsu inai no mono de nakereba naranai n desu ka.","trans":"Apakah harus foto yang diambil dalam tiga bulan terakhir?"},
  {"speaker":"職員","text":"そうです。近くに証明写真の機械がありますので、そちらで。","reading":"そうです。ちかくにしょうめいしゃしんのきかいがありますので、そちらで。","romaji":"Sou desu. Chikaku ni shoumei shashin no kikai ga arimasu node, sochira de.","trans":"Betul. Ada mesin pas foto di dekat sini, silakan pakai itu."},
  {"speaker":"アリ","text":"分かりました。撮ってきたら、また並び直すことになりますか。","reading":"わかりました。とってきたら、またならびなおすことになりますか。","romaji":"Wakarimashita. Totte kitara, mata narabinaosu koto ni narimasu ka.","trans":"Baik. Kalau sudah foto, apa saya harus mengantre ulang?"},
  {"speaker":"職員","text":"いいえ。この番号札を持っていれば、そのまま受け付けられます。","reading":"いいえ。このばんごうふだをもっていれば、そのままうけつけられます。","romaji":"Iie. Kono bangoufuda o motte ireba, sono mama uketsukeraremasu.","trans":"Tidak. Kalau masih pegang nomor antrean ini, bisa langsung dilayani."},
  {"speaker":"アリ","text":"助かります。結果はどのぐらいで出ますか。","reading":"たすかります。けっかはどのぐらいででますか。","romaji":"Tasukarimasu. Kekka wa dono gurai de demasu ka.","trans":"Terbantu sekali. Hasilnya keluar berapa lama?"},
  {"speaker":"職員","text":"混み具合によりますが、二週間から一か月ほどです。","reading":"こみぐあいによりますが、にしゅうかんからいっかげつほどです。","romaji":"Komiguai ni yorimasu ga, nishuukan kara ikkagetsu hodo desu.","trans":"Tergantung antrean, tapi sekitar dua minggu sampai satu bulan."},
  {"speaker":"アリ","text":"その間に期限が切れてしまったら、どうなりますか。","reading":"そのあいだにきげんがきれてしまったら、どうなりますか。","romaji":"Sono aida ni kigen ga kirete shimattara, dou narimasu ka.","trans":"Kalau masa berlakunya habis di tengah proses, bagaimana?"},
  {"speaker":"職員","text":"申請中であれば問題ありません。二か月間は今の資格で滞在できます。","reading":"しんせいちゅうであればもんだいありません。にかげつかんはいまのしかくでたいざいできます。","romaji":"Shinseichuu de areba mondai arimasen. Nikagetsukan wa ima no shikaku de taizai dekimasu.","trans":"Kalau sedang dalam proses, tidak masalah. Selama dua bulan Anda masih bisa tinggal dengan status sekarang."}
 ]'::jsonb,
 '[
  {"word":"在留期間","reading":"ざいりゅうきかん (zairyuu kikan)","meaning":"masa berlaku izin tinggal"},
  {"word":"更新","reading":"こうしん (koushin)","meaning":"perpanjangan, pembaruan"},
  {"word":"在職証明書","reading":"ざいしょくしょうめいしょ (zaishoku shoumeisho)","meaning":"surat keterangan bekerja"},
  {"word":"申請中","reading":"しんせいちゅう (shinseichuu)","meaning":"sedang dalam proses permohonan"}
 ]'::jsonb, false),

(3, 'Membahas Iuran Lingkungan', 'daily',
 '[
  {"speaker":"会長","text":"今月から自治会費を三百円上げることになりました。","reading":"こんげつからじちかいひをさんびゃくえんあげることになりました。","romaji":"Kongetsu kara jichikaihi o sanbyaku en ageru koto ni narimashita.","trans":"Mulai bulan ini iuran RW diputuskan naik 300 yen."},
  {"speaker":"リナ","text":"そうですか。何か理由があるんでしょうか。","reading":"そうですか。なにかりゆうがあるんでしょうか。","romaji":"Sou desu ka. Nanika riyuu ga aru n deshou ka.","trans":"Begitu ya. Apakah ada alasannya?"},
  {"speaker":"会長","text":"ゴミ置き場の屋根を直さなければならないんです。","reading":"ゴミおきばのやねをなおさなければならないんです。","romaji":"Gomi okiba no yane o naosanakereba naranai n desu.","trans":"Atap tempat pembuangan sampah harus diperbaiki."},
  {"speaker":"リナ","text":"確かに、雨の日はカラスに荒らされていますね。","reading":"たしかに、あめのひはカラスにあらされていますね。","romaji":"Tashika ni, ame no hi wa karasu ni arasarete imasu ne.","trans":"Memang, saat hujan sering diacak-acak gagak."},
  {"speaker":"会長","text":"そうなんです。直さないと、近所から苦情が出ます。","reading":"そうなんです。なおさないと、きんじょからくじょうがでます。","romaji":"Sou nan desu. Naosanai to, kinjo kara kujou ga demasu.","trans":"Betul. Kalau tidak diperbaiki, tetangga akan mengeluh."},
  {"speaker":"リナ","text":"値上げは今月だけですか。それともずっとですか。","reading":"ねあげはこんげつだけですか。それともずっとですか。","romaji":"Neage wa kongetsu dake desu ka. Soretomo zutto desu ka.","trans":"Kenaikannya hanya bulan ini, atau seterusnya?"},
  {"speaker":"会長","text":"一年間です。工事が終われば元に戻します。","reading":"いちねんかんです。こうじがおわればもとにもどします。","romaji":"Ichinenkan desu. Kouji ga owareba moto ni modoshimasu.","trans":"Selama satu tahun. Setelah pengerjaan selesai, dikembalikan seperti semula."},
  {"speaker":"リナ","text":"それなら納得できます。皆さんに説明はされましたか。","reading":"それならなっとくできます。みなさんにせつめいはされましたか。","romaji":"Sore nara nattoku dekimasu. Minasan ni setsumei wa saremashita ka.","trans":"Kalau begitu saya bisa terima. Sudah dijelaskan ke semua warga?"},
  {"speaker":"会長","text":"回覧板で回しましたが、読まない方も多くて。","reading":"かいらんばんでまわしましたが、よまないかたもおおくて。","romaji":"Kairanban de mawashimashita ga, yomanai kata mo ookute.","trans":"Sudah diedarkan lewat papan edaran, tapi banyak yang tidak membacanya."},
  {"speaker":"リナ","text":"外国人には日本語が難しいということもあると思います。","reading":"がいこくじんにはにほんごがむずかしいということもあるとおもいます。","romaji":"Gaikokujin ni wa nihongo ga muzukashii to iu koto mo aru to omoimasu.","trans":"Bagi orang asing, mungkin juga karena bahasa Jepangnya sulit."},
  {"speaker":"会長","text":"なるほど。簡単な言葉で書き直したほうがいいですね。","reading":"なるほど。かんたんなことばでかきなおしたほうがいいですね。","romaji":"Naruhodo. Kantan na kotoba de kakinaoshita hou ga ii desu ne.","trans":"Benar juga. Sebaiknya ditulis ulang dengan bahasa yang sederhana."},
  {"speaker":"リナ","text":"よろしければ、私が手伝いますよ。","reading":"よろしければ、わたしがてつだいますよ。","romaji":"Yoroshikereba, watashi ga tetsudaimasu yo.","trans":"Kalau berkenan, saya bisa bantu."}
 ]'::jsonb,
 '[
  {"word":"自治会費","reading":"じちかいひ (jichikaihi)","meaning":"iuran perkumpulan warga"},
  {"word":"苦情","reading":"くじょう (kujou)","meaning":"keluhan, protes"},
  {"word":"回覧板","reading":"かいらんばん (kairanban)","meaning":"papan edaran yang dioper antar rumah"},
  {"word":"納得する","reading":"なっとくする (nattoku suru)","meaning":"menerima dengan paham"}
 ]'::jsonb, false),

(3, 'Menawar Harga di Toko Barang Bekas', 'daily',
 '[
  {"speaker":"ブディ","text":"この自転車、いくらですか。","reading":"このじてんしゃ、いくらですか。","romaji":"Kono jitensha, ikura desu ka.","trans":"Sepeda ini berapa?"},
  {"speaker":"店主","text":"八千円です。整備したばかりなので、状態はいいですよ。","reading":"はっせんえんです。せいびしたばかりなので、じょうたいはいいですよ。","romaji":"Hassen en desu. Seibi shita bakari na node, joutai wa ii desu yo.","trans":"8000 yen. Baru saja diservis, jadi kondisinya bagus."},
  {"speaker":"ブディ","text":"少し高いような気がします。もう少し安くなりませんか。","reading":"すこしたかいようなきがします。もうすこしやすくなりませんか。","romaji":"Sukoshi takai you na ki ga shimasu. Mou sukoshi yasuku narimasen ka.","trans":"Rasanya agak mahal. Bisa sedikit lebih murah?"},
  {"speaker":"店主","text":"うーん、どのぐらいをお考えですか。","reading":"うーん、どのぐらいをおかんがえですか。","romaji":"Uun, dono gurai o okangae desu ka.","trans":"Hmm, kira-kira berapa yang Anda pikirkan?"},
  {"speaker":"ブディ","text":"六千円ぐらいだと助かるんですが。","reading":"ろくせんえんぐらいだとたすかるんですが。","romaji":"Rokusen en gurai da to tasukaru n desu ga.","trans":"Kalau sekitar 6000 yen, saya sangat terbantu."},
  {"speaker":"店主","text":"それはちょっと厳しいですね。整備代だけで三千円かかっていますから。","reading":"それはちょっときびしいですね。せいびだいだけでさんぜんえんかかっていますから。","romaji":"Sore wa chotto kibishii desu ne. Seibidai dake de sanzen en kakatte imasu kara.","trans":"Itu agak berat. Biaya servisnya saja sudah 3000 yen."},
  {"speaker":"ブディ","text":"そうですか。では、七千円ではどうでしょうか。","reading":"そうですか。では、ななせんえんではどうでしょうか。","romaji":"Sou desu ka. Dewa, nanasen en dewa dou deshou ka.","trans":"Begitu ya. Kalau 7000 yen bagaimana?"},
  {"speaker":"店主","text":"七千円なら、鍵をお付けしましょう。それでいかがですか。","reading":"ななせんえんなら、かぎをおつけしましょう。それでいかがですか。","romaji":"Nanasen en nara, kagi o otsuke shimashou. Sore de ikaga desu ka.","trans":"Kalau 7000 yen, saya sertakan gemboknya. Bagaimana?"},
  {"speaker":"ブディ","text":"それはありがたいです。防犯登録もしてもらえますか。","reading":"それはありがたいです。ぼうはんとうろくもしてもらえますか。","romaji":"Sore wa arigatai desu. Bouhan touroku mo shite moraemasu ka.","trans":"Itu sangat membantu. Registrasi antipencurian juga bisa diuruskan?"},
  {"speaker":"店主","text":"できますよ。ただ、それは別で六百円かかります。","reading":"できますよ。ただ、それはべつでろっぴゃくえんかかります。","romaji":"Dekimasu yo. Tada, sore wa betsu de roppyaku en kakarimasu.","trans":"Bisa. Tapi itu terpisah, biayanya 600 yen."},
  {"speaker":"ブディ","text":"必要なものですから、お願いします。","reading":"ひつようなものですから、おねがいします。","romaji":"Hitsuyou na mono desu kara, onegai shimasu.","trans":"Itu memang perlu, jadi tolong diuruskan."},
  {"speaker":"店主","text":"かしこまりました。身分証をお持ちでしたら、今すぐできます。","reading":"かしこまりました。みぶんしょうをおもちでしたら、いますぐできます。","romaji":"Kashikomarimashita. Mibunshou o omochi deshitara, ima sugu dekimasu.","trans":"Baik. Kalau membawa kartu identitas, bisa langsung diurus sekarang."}
 ]'::jsonb,
 '[
  {"word":"整備","reading":"せいび (seibi)","meaning":"servis, perawatan mesin"},
  {"word":"状態","reading":"じょうたい (joutai)","meaning":"kondisi barang"},
  {"word":"厳しい","reading":"きびしい (kibishii)","meaning":"berat, sulit dipenuhi"},
  {"word":"防犯登録","reading":"ぼうはんとうろく (bouhan touroku)","meaning":"registrasi antipencurian sepeda (wajib di Jepang)"}
 ]'::jsonb, false),

(3, 'Meluruskan Salah Paham dengan Tetangga', 'daily',
 '[
  {"speaker":"隣人","text":"あの、夜の音のことなんですが、少し気になっていまして。","reading":"あの、よるのおとのことなんですが、すこしきになっていまして。","romaji":"Ano, yoru no oto no koto nan desu ga, sukoshi ki ni natte imashite.","trans":"Anu, soal suara di malam hari, saya agak terganggu."},
  {"speaker":"サリ","text":"すみません。うるさかったでしょうか。","reading":"すみません。うるさかったでしょうか。","romaji":"Sumimasen. Urusakatta deshou ka.","trans":"Maaf. Apakah berisik?"},
  {"speaker":"隣人","text":"十一時ごろに、洗濯機の音が聞こえるんです。","reading":"じゅういちじごろに、せんたくきのおとがきこえるんです。","romaji":"Juuichiji goro ni, sentakuki no oto ga kikoeru n desu.","trans":"Sekitar jam sebelas, terdengar suara mesin cuci."},
  {"speaker":"サリ","text":"本当にすみませんでした。仕事が終わるのが遅いもので。","reading":"ほんとうにすみませんでした。しごとがおわるのがおそいもので。","romaji":"Hontou ni sumimasen deshita. Shigoto ga owaru no ga osoi mono de.","trans":"Saya benar-benar minta maaf. Karena pulang kerjanya larut."},
  {"speaker":"隣人","text":"事情は分かります。責めているわけではないんです。","reading":"じじょうはわかります。せめているわけではないんです。","romaji":"Jijou wa wakarimasu. Semete iru wake dewa nai n desu.","trans":"Saya paham situasinya. Bukan bermaksud menyalahkan."},
  {"speaker":"サリ","text":"ありがとうございます。何時までなら大丈夫でしょうか。","reading":"ありがとうございます。なんじまでならだいじょうぶでしょうか。","romaji":"Arigatou gozaimasu. Nanji made nara daijoubu deshou ka.","trans":"Terima kasih. Sampai jam berapa yang masih boleh?"},
  {"speaker":"隣人","text":"九時までにしていただけると助かります。","reading":"くじまでにしていただけるとたすかります。","romaji":"Kuji made ni shite itadakeru to tasukarimasu.","trans":"Kalau bisa sampai jam sembilan, saya terbantu."},
  {"speaker":"サリ","text":"分かりました。朝に回すようにします。","reading":"わかりました。あさにまわすようにします。","romaji":"Wakarimashita. Asa ni mawasu you ni shimasu.","trans":"Baik. Saya usahakan mencuci di pagi hari."},
  {"speaker":"隣人","text":"朝も六時前は避けていただけると、なおありがたいです。","reading":"あさもろくじまえはさけていただけると、なおありがたいです。","romaji":"Asa mo rokuji mae wa sakete itadakeru to, nao arigatai desu.","trans":"Kalau pagi pun bisa dihindari sebelum jam enam, saya lebih berterima kasih."},
  {"speaker":"サリ","text":"承知しました。教えてくださって、かえって助かりました。","reading":"しょうちしました。おしえてくださって、かえってたすかりました。","romaji":"Shouchi shimashita. Oshiete kudasatte, kaette tasukarimashita.","trans":"Saya mengerti. Justru saya terbantu karena Anda memberitahu."},
  {"speaker":"隣人","text":"言いにくかったのですが、黙っているほうがよくないと思いまして。","reading":"いいにくかったのですが、だまっているほうがよくないとおもいまして。","romaji":"Iinikukatta no desu ga, damatte iru hou ga yokunai to omoimashite.","trans":"Sebenarnya sulit dikatakan, tapi saya rasa diam saja malah tidak baik."},
  {"speaker":"サリ","text":"おっしゃるとおりです。これからも何かあれば言ってください。","reading":"おっしゃるとおりです。これからもなにかあればいってください。","romaji":"Ossharu toori desu. Korekara mo nanika areba itte kudasai.","trans":"Betul sekali. Ke depan pun kalau ada apa-apa tolong beritahu saya."}
 ]'::jsonb,
 '[
  {"word":"気になる","reading":"きになる (ki ni naru)","meaning":"mengganggu pikiran, jadi perhatian"},
  {"word":"事情","reading":"じじょう (jijou)","meaning":"situasi, keadaan yang melatari"},
  {"word":"～わけではない","reading":"wake dewa nai","meaning":"bukan berarti ~"},
  {"word":"避ける","reading":"さける (sakeru)","meaning":"menghindari"}
 ]'::jsonb, false),

(3, 'Berlangganan Internet Rumah', 'daily',
 '[
  {"speaker":"デウィ","text":"家にインターネットを引きたいんですが、相談できますか。","reading":"いえにインターネットをひきたいんですが、そうだんできますか。","romaji":"Ie ni intaanetto o hikitai n desu ga, soudan dekimasu ka.","trans":"Saya ingin pasang internet di rumah, bisa konsultasi?"},
  {"speaker":"店員","text":"もちろんです。アパートですか、一戸建てですか。","reading":"もちろんです。アパートですか、いっこだてですか。","romaji":"Mochiron desu. Apaato desu ka, ikkodate desu ka.","trans":"Tentu. Apartemen atau rumah tapak?"},
  {"speaker":"デウィ","text":"アパートです。二階の角部屋です。","reading":"アパートです。にかいのかどべやです。","romaji":"Apaato desu. Nikai no kadobeya desu.","trans":"Apartemen. Kamar pojok di lantai dua."},
  {"speaker":"店員","text":"建物に光回線が入っているかどうかで、工事の内容が変わります。","reading":"たてものにひかりかいせんがはいっているかどうかで、こうじのないようがかわります。","romaji":"Tatemono ni hikari kaisen ga haitte iru ka dou ka de, kouji no naiyou ga kawarimasu.","trans":"Isi pemasangannya berbeda tergantung apakah gedungnya sudah ada jalur fiber."},
  {"speaker":"デウィ","text":"どうすれば分かりますか。","reading":"どうすればわかりますか。","romaji":"Dou sureba wakarimasu ka.","trans":"Bagaimana cara mengetahuinya?"},
  {"speaker":"店員","text":"住所を教えていただければ、こちらで調べられます。","reading":"じゅうしょをおしえていただければ、こちらでしらべられます。","romaji":"Juusho o oshiete itadakereba, kochira de shiraberaremasu.","trans":"Kalau Anda beritahu alamatnya, kami bisa cek dari sini."},
  {"speaker":"デウィ","text":"大家さんの許可も要るんでしょうか。","reading":"おおやさんのきょかもいるんでしょうか。","romaji":"Ooya-san no kyoka mo iru n deshou ka.","trans":"Apakah perlu izin pemilik apartemen juga?"},
  {"speaker":"店員","text":"壁に穴を開ける場合は必要です。開けずに済むこともあります。","reading":"かべにあなをあけるばあいはひつようです。あけずにすむこともあります。","romaji":"Kabe ni ana o akeru baai wa hitsuyou desu. Akezu ni sumu koto mo arimasu.","trans":"Kalau harus melubangi dinding, perlu. Kadang bisa tanpa melubangi."},
  {"speaker":"デウィ","text":"料金はどのぐらいになりますか。","reading":"りょうきんはどのぐらいになりますか。","romaji":"Ryoukin wa dono gurai ni narimasu ka.","trans":"Biayanya kira-kira berapa?"},
  {"speaker":"店員","text":"月に四千円ほどです。ただし、二年契約が条件になります。","reading":"つきによんせんえんほどです。ただし、にねんけいやくがじょうけんになります。","romaji":"Tsuki ni yonsen en hodo desu. Tadashi, ninen keiyaku ga jouken ni narimasu.","trans":"Sekitar 4000 yen per bulan. Namun syaratnya kontrak dua tahun."},
  {"speaker":"デウィ","text":"途中でやめたら、お金がかかりますか。","reading":"とちゅうでやめたら、おかねがかかりますか。","romaji":"Tochuu de yametara, okane ga kakarimasu ka.","trans":"Kalau berhenti di tengah jalan, ada biayanya?"},
  {"speaker":"店員","text":"はい、解約金がかかります。そこはよくご確認ください。","reading":"はい、かいやくきんがかかります。そこはよくごかくにんください。","romaji":"Hai, kaiyakukin ga kakarimasu. Soko wa yoku gokakunin kudasai.","trans":"Ya, ada denda pembatalan. Bagian itu tolong dicek baik-baik."}
 ]'::jsonb,
 '[
  {"word":"光回線","reading":"ひかりかいせん (hikari kaisen)","meaning":"jalur internet fiber optik"},
  {"word":"大家","reading":"おおや (ooya)","meaning":"pemilik/pengelola properti sewa"},
  {"word":"契約","reading":"けいやく (keiyaku)","meaning":"kontrak"},
  {"word":"解約金","reading":"かいやくきん (kaiyakukin)","meaning":"denda pembatalan kontrak"}
 ]'::jsonb, false),

(3, 'Menolak Lembur dengan Alasan', 'work',
 '[
  {"speaker":"店長","text":"今日、二時間ほど残ってもらえないかな。人が足りなくて。","reading":"きょう、にじかんほどのこってもらえないかな。ひとがたりなくて。","romaji":"Kyou, nijikan hodo nokotte moraenai kana. Hito ga tarinakute.","trans":"Hari ini bisa tinggal sekitar dua jam? Orangnya kurang."},
  {"speaker":"アリ","text":"申し訳ありませんが、今日は難しいです。","reading":"もうしわけありませんが、きょうはむずかしいです。","romaji":"Moushiwake arimasen ga, kyou wa muzukashii desu.","trans":"Mohon maaf, hari ini sulit."},
  {"speaker":"店長","text":"何か予定がある。","reading":"なにかよていがある。","romaji":"Nanika yotei ga aru.","trans":"Ada acara?"},
  {"speaker":"アリ","text":"はい。日本語学校の試験が明日ありまして、今日は勉強したいんです。","reading":"はい。にほんごがっこうのしけんがあしたありまして、きょうはべんきょうしたいんです。","romaji":"Hai. Nihongo gakkou no shiken ga ashita arimashite, kyou wa benkyou shitai n desu.","trans":"Ya. Besok ada ujian di sekolah bahasa Jepang, jadi hari ini saya ingin belajar."},
  {"speaker":"店長","text":"そうか。それは大事だな。","reading":"そうか。それはだいじだな。","romaji":"Sou ka. Sore wa daiji da na.","trans":"Oh begitu. Itu penting."},
  {"speaker":"アリ","text":"急にお断りしてすみません。前もって言うべきでした。","reading":"きゅうにおことわりしてすみません。まえもっていうべきでした。","romaji":"Kyuu ni okotowari shite sumimasen. Maemotte iu beki deshita.","trans":"Maaf menolak mendadak. Seharusnya saya bilang lebih awal."},
  {"speaker":"店長","text":"いや、こちらこそ急に頼んで悪かった。","reading":"いや、こちらこそきゅうにたのんでわるかった。","romaji":"Iya, kochira koso kyuu ni tanonde warukatta.","trans":"Tidak, justru saya yang minta mendadak."},
  {"speaker":"アリ","text":"明後日でしたら、何時間でも残れます。","reading":"あさってでしたら、なんじかんでものこれます。","romaji":"Asatte deshitara, nanjikan demo nokoremasu.","trans":"Kalau lusa, saya bisa lembur berapa jam pun."},
  {"speaker":"店長","text":"助かるよ。じゃあ、明後日お願いする。","reading":"たすかるよ。じゃあ、あさっておねがいする。","romaji":"Tasukaru yo. Jaa, asatte onegai suru.","trans":"Terbantu sekali. Kalau begitu, lusa saya minta tolong ya."},
  {"speaker":"アリ","text":"はい。今日の分は、誰かに頼めそうですか。","reading":"はい。きょうのぶんは、だれかにたのめそうですか。","romaji":"Hai. Kyou no bun wa, dareka ni tanomesou desu ka.","trans":"Baik. Untuk hari ini, apa bisa minta tolong orang lain?"},
  {"speaker":"店長","text":"聞いてみる。だめなら、私が入るよ。","reading":"きいてみる。だめなら、わたしがはいるよ。","romaji":"Kiite miru. Dame nara, watashi ga hairu yo.","trans":"Saya coba tanya. Kalau tidak ada, saya sendiri yang masuk."},
  {"speaker":"アリ","text":"ありがとうございます。試験、がんばってきます。","reading":"ありがとうございます。しけん、がんばってきます。","romaji":"Arigatou gozaimasu. Shiken, ganbatte kimasu.","trans":"Terima kasih. Saya akan berusaha di ujiannya."}
 ]'::jsonb,
 '[
  {"word":"残業","reading":"ざんぎょう (zangyou)","meaning":"lembur"},
  {"word":"断る","reading":"ことわる (kotowaru)","meaning":"menolak"},
  {"word":"前もって","reading":"まえもって (maemotte)","meaning":"sebelumnya, jauh-jauh hari"},
  {"word":"～べきでした","reading":"beki deshita","meaning":"seharusnya ~ (penyesalan)"}
 ]'::jsonb, false),

(3, 'Menegur Rekan yang Sering Terlambat', 'work',
 '[
  {"speaker":"リナ","text":"ちょっといいですか。言いにくいことなんですが。","reading":"ちょっといいですか。いいにくいことなんですが。","romaji":"Chotto ii desu ka. Iinikui koto nan desu ga.","trans":"Boleh bicara sebentar? Ini agak sulit disampaikan."},
  {"speaker":"同僚","text":"何でしょうか。","reading":"なんでしょうか。","romaji":"Nan deshou ka.","trans":"Ada apa?"},
  {"speaker":"リナ","text":"最近、遅刻が続いていますよね。何かあったんですか。","reading":"さいきん、ちこくがつづいていますよね。なにかあったんですか。","romaji":"Saikin, chikoku ga tsuzuite imasu yo ne. Nanika atta n desu ka.","trans":"Belakangan ini sering terlambat ya. Ada masalah?"},
  {"speaker":"同僚","text":"すみません。夜のバイトを始めたので、朝が起きられなくて。","reading":"すみません。よるのバイトをはじめたので、あさがおきられなくて。","romaji":"Sumimasen. Yoru no baito o hajimeta node, asa ga okirarenakute.","trans":"Maaf. Saya mulai kerja sambilan malam, jadi susah bangun pagi."},
  {"speaker":"リナ","text":"事情は分かりました。でも、開店の準備が回らないんです。","reading":"じじょうはわかりました。でも、かいてんのじゅんびがまわらないんです。","romaji":"Jijou wa wakarimashita. Demo, kaiten no junbi ga mawaranai n desu.","trans":"Saya paham situasinya. Tapi persiapan buka toko jadi tidak terkejar."},
  {"speaker":"同僚","text":"ご迷惑をかけていますよね。本当にすみません。","reading":"ごめいわくをかけていますよね。ほんとうにすみません。","romaji":"Gomeiwaku o kakete imasu yo ne. Hontou ni sumimasen.","trans":"Saya merepotkan ya. Sungguh minta maaf."},
  {"speaker":"リナ","text":"責めたいわけではありません。どうすればいいか、一緒に考えたいんです。","reading":"せめたいわけではありません。どうすればいいか、いっしょにかんがえたいんです。","romaji":"Semetai wake dewa arimasen. Dou sureba ii ka, issho ni kangaetai n desu.","trans":"Saya tidak ingin menyalahkan. Saya ingin memikirkan solusinya bersama."},
  {"speaker":"同僚","text":"ありがとうございます。シフトを遅い時間に変えられないでしょうか。","reading":"ありがとうございます。シフトをおそいじかんにかえられないでしょうか。","romaji":"Arigatou gozaimasu. Shifuto o osoi jikan ni kaerarenai deshou ka.","trans":"Terima kasih. Apakah shift saya bisa diubah ke jam yang lebih siang?"},
  {"speaker":"リナ","text":"それなら店長に相談してみましょう。そのほうが現実的です。","reading":"それならてんちょうにそうだんしてみましょう。そのほうがげんじつてきです。","romaji":"Sore nara tenchou ni soudan shite mimashou. Sono hou ga genjitsuteki desu.","trans":"Kalau begitu mari kita bicarakan ke manajer. Itu lebih realistis."},
  {"speaker":"同僚","text":"自分から言うべきでした。黙っていてすみません。","reading":"じぶんからいうべきでした。だまっていてすみません。","romaji":"Jibun kara iu beki deshita. Damatte ite sumimasen.","trans":"Seharusnya saya yang bicara duluan. Maaf saya diam saja."},
  {"speaker":"リナ","text":"これからは早めに言ってください。そのほうが解決しやすいです。","reading":"これからははやめにいってください。そのほうがかいけつしやすいです。","romaji":"Korekara wa hayame ni itte kudasai. Sono hou ga kaiketsu shiyasui desu.","trans":"Ke depan tolong bilang lebih awal. Dengan begitu lebih mudah dicarikan solusi."},
  {"speaker":"同僚","text":"はい。明日は必ず間に合うようにします。","reading":"はい。あしたはかならずまにあうようにします。","romaji":"Hai. Ashita wa kanarazu ma ni au you ni shimasu.","trans":"Baik. Besok saya pastikan datang tepat waktu."}
 ]'::jsonb,
 '[
  {"word":"遅刻","reading":"ちこく (chikoku)","meaning":"keterlambatan"},
  {"word":"迷惑をかける","reading":"めいわくをかける (meiwaku o kakeru)","meaning":"merepotkan orang lain"},
  {"word":"現実的","reading":"げんじつてき (genjitsuteki)","meaning":"realistis"},
  {"word":"解決する","reading":"かいけつする (kaiketsu suru)","meaning":"menyelesaikan masalah"}
 ]'::jsonb, false),

(3, 'Menanyakan Isi Kontrak Kerja', 'work',
 '[
  {"speaker":"ブディ","text":"契約書のことで、確認させていただきたいことがあります。","reading":"けいやくしょのことで、かくにんさせていただきたいことがあります。","romaji":"Keiyakusho no koto de, kakunin sasete itadakitai koto ga arimasu.","trans":"Soal surat kontrak, ada yang ingin saya pastikan."},
  {"speaker":"担当者","text":"どうぞ、遠慮なく。","reading":"どうぞ、えんりょなく。","romaji":"Douzo, enryo naku.","trans":"Silakan, jangan sungkan."},
  {"speaker":"ブディ","text":"ここに書いてある固定残業代とは、どういう意味でしょうか。","reading":"ここにかいてあるこていざんぎょうだいとは、どういういみでしょうか。","romaji":"Koko ni kaite aru kotei zangyoudai to wa, dou iu imi deshou ka.","trans":"Yang tertulis sebagai upah lembur tetap di sini, artinya apa?"},
  {"speaker":"担当者","text":"月に二十時間分の残業代が、最初から給料に入っているということです。","reading":"つきににじゅうじかんぶんのざんぎょうだいが、さいしょからきゅうりょうにはいっているということです。","romaji":"Tsuki ni nijuujikanbun no zangyoudai ga, saisho kara kyuuryou ni haitte iru to iu koto desu.","trans":"Artinya upah lembur 20 jam per bulan sudah termasuk dalam gaji sejak awal."},
  {"speaker":"ブディ","text":"では、残業しなくても同じ額がもらえるわけですね。","reading":"では、ざんぎょうしなくてもおなじがくがもらえるわけですね。","romaji":"Dewa, zangyou shinakute mo onaji gaku ga moraeru wake desu ne.","trans":"Jadi walau tidak lembur, saya tetap menerima jumlah yang sama ya."},
  {"speaker":"担当者","text":"そのとおりです。ただ、二十時間を超えた分は別に払われます。","reading":"そのとおりです。ただ、にじゅうじかんをこえたぶんはべつにはらわれます。","romaji":"Sono toori desu. Tada, nijuujikan o koeta bun wa betsu ni haraware masu.","trans":"Tepat. Namun kelebihan di atas 20 jam dibayar terpisah."},
  {"speaker":"ブディ","text":"超えた分は、きちんと記録されるのでしょうか。","reading":"こえたぶんは、きちんときろくされるのでしょうか。","romaji":"Koeta bun wa, kichinto kiroku sareru no deshou ka.","trans":"Apakah kelebihannya dicatat dengan benar?"},
  {"speaker":"担当者","text":"タイムカードで管理していますので、ご安心ください。","reading":"タイムカードでかんりしていますので、ごあんしんください。","romaji":"Taimu kaado de kanri shite imasu node, goanshin kudasai.","trans":"Dikelola lewat kartu absen, jadi tenang saja."},
  {"speaker":"ブディ","text":"それから、有給休暇はいつから取れますか。","reading":"それから、ゆうきゅうきゅうかはいつからとれますか。","romaji":"Sorekara, yuukyuu kyuuka wa itsu kara toremasu ka.","trans":"Selain itu, cuti berbayar bisa diambil mulai kapan?"},
  {"speaker":"担当者","text":"半年働いていただいたあと、十日分が付与されます。","reading":"はんとしはたらいていただいたあと、とおかぶんがふよされます。","romaji":"Hantoshi hataraite itadaita ato, tooka bun ga fuyo saremasu.","trans":"Setelah bekerja setengah tahun, diberikan jatah 10 hari."},
  {"speaker":"ブディ","text":"よく分かりました。細かく聞いてすみません。","reading":"よくわかりました。こまかくきいてすみません。","romaji":"Yoku wakarimashita. Komakaku kiite sumimasen.","trans":"Sekarang saya paham. Maaf bertanya sedetail ini."},
  {"speaker":"担当者","text":"いいえ。分からないまま署名されるほうが困りますから。","reading":"いいえ。わからないまましょめいされるほうがこまりますから。","romaji":"Iie. Wakaranai mama shomei sareru hou ga komarimasu kara.","trans":"Tidak apa-apa. Justru repot kalau Anda menandatangani tanpa paham."}
 ]'::jsonb,
 '[
  {"word":"固定残業代","reading":"こていざんぎょうだい (kotei zangyoudai)","meaning":"upah lembur tetap yang sudah masuk gaji pokok"},
  {"word":"有給休暇","reading":"ゆうきゅうきゅうか (yuukyuu kyuuka)","meaning":"cuti berbayar"},
  {"word":"付与する","reading":"ふよする (fuyo suru)","meaning":"memberikan hak"},
  {"word":"署名","reading":"しょめい (shomei)","meaning":"tanda tangan"}
 ]'::jsonb, false),

(3, 'Menjelaskan Riwayat Penyakit Keluarga', 'hospital',
 '[
  {"speaker":"医師","text":"ご家族に、同じような病気の方はいらっしゃいますか。","reading":"ごかぞくに、おなじようなびょうきのかたはいらっしゃいますか。","romaji":"Gokazoku ni, onaji you na byouki no kata wa irasshaimasu ka.","trans":"Apakah ada anggota keluarga dengan penyakit serupa?"},
  {"speaker":"サリ","text":"父が糖尿病でした。五十歳ぐらいから薬を飲んでいます。","reading":"ちちがとうにょうびょうでした。ごじゅっさいぐらいからくすりをのんでいます。","romaji":"Chichi ga tounyoubyou deshita. Gojussai gurai kara kusuri o nonde imasu.","trans":"Ayah saya diabetes. Sejak usia sekitar 50 tahun minum obat."},
  {"speaker":"医師","text":"お母様はいかがですか。","reading":"おかあさまはいかがですか。","romaji":"Okaasama wa ikaga desu ka.","trans":"Kalau ibu Anda?"},
  {"speaker":"サリ","text":"母は血圧が高いと聞いています。詳しくは分かりません。","reading":"はははけつあつがたかいときいています。くわしくはわかりません。","romaji":"Haha wa ketsuatsu ga takai to kiite imasu. Kuwashiku wa wakarimasen.","trans":"Ibu saya katanya tekanan darahnya tinggi. Detailnya saya tidak tahu."},
  {"speaker":"医師","text":"分かる範囲で結構です。ご兄弟は。","reading":"わかるはんいでけっこうです。ごきょうだいは。","romaji":"Wakaru han-i de kekkou desu. Gokyoudai wa.","trans":"Sebatas yang Anda tahu saja cukup. Saudara kandung?"},
  {"speaker":"サリ","text":"兄が一人いますが、健康だと思います。","reading":"あにがひとりいますが、けんこうだとおもいます。","romaji":"Ani ga hitori imasu ga, kenkou da to omoimasu.","trans":"Ada satu kakak laki-laki, tapi saya rasa sehat."},
  {"speaker":"医師","text":"ありがとうございます。家族の病気は、体質と関係があることが多いんです。","reading":"ありがとうございます。かぞくのびょうきは、たいしつとかんけいがあることがおおいんです。","romaji":"Arigatou gozaimasu. Kazoku no byouki wa, taishitsu to kankei ga aru koto ga ooi n desu.","trans":"Terima kasih. Penyakit keluarga sering berkaitan dengan kondisi bawaan tubuh."},
  {"speaker":"サリ","text":"私も糖尿病になりやすいということでしょうか。","reading":"わたしもとうにょうびょうになりやすいということでしょうか。","romaji":"Watashi mo tounyoubyou ni nariyasui to iu koto deshou ka.","trans":"Apakah berarti saya juga rentan diabetes?"},
  {"speaker":"医師","text":"なりやすい傾向はあります。ただ、生活次第で防げます。","reading":"なりやすいけいこうはあります。ただ、せいかつしだいでふせげます。","romaji":"Nariyasui keikou wa arimasu. Tada, seikatsu shidai de fusegemasu.","trans":"Ada kecenderungan lebih rentan. Tapi bisa dicegah tergantung pola hidup."},
  {"speaker":"サリ","text":"何に気をつければいいでしょうか。","reading":"なににきをつければいいでしょうか。","romaji":"Nani ni ki o tsukereba ii deshou ka.","trans":"Apa yang perlu saya perhatikan?"},
  {"speaker":"医師","text":"甘い飲み物を減らして、週に二回は体を動かしてください。","reading":"あまいのみものをへらして、しゅうににかいはからだをうごかしてください。","romaji":"Amai nomimono o herashite, shuu ni nikai wa karada o ugokashite kudasai.","trans":"Kurangi minuman manis, dan gerakkan badan dua kali seminggu."},
  {"speaker":"サリ","text":"分かりました。年に一度は検査を受けたほうがいいですか。","reading":"わかりました。ねんにいちどはけんさをうけたほうがいいですか。","romaji":"Wakarimashita. Nen ni ichido wa kensa o uketa hou ga ii desu ka.","trans":"Baik. Sebaiknya periksa setahun sekali?"}
 ]'::jsonb,
 '[
  {"word":"糖尿病","reading":"とうにょうびょう (tounyoubyou)","meaning":"diabetes"},
  {"word":"体質","reading":"たいしつ (taishitsu)","meaning":"kondisi bawaan tubuh"},
  {"word":"傾向","reading":"けいこう (keikou)","meaning":"kecenderungan"},
  {"word":"～次第","reading":"しだい (shidai)","meaning":"tergantung pada ~"}
 ]'::jsonb, false),

(3, 'Menanyakan Biaya dan Asuransi', 'hospital',
 '[
  {"speaker":"アリ","text":"すみません、治療費のことでお伺いしたいのですが。","reading":"すみません、ちりょうひのことでおうかがいしたいのですが。","romaji":"Sumimasen, chiryouhi no koto de oukagai shitai no desu ga.","trans":"Permisi, saya ingin bertanya soal biaya pengobatan."},
  {"speaker":"会計","text":"はい、どうぞ。","reading":"はい、どうぞ。","romaji":"Hai, douzo.","trans":"Ya, silakan."},
  {"speaker":"アリ","text":"手術が必要だと言われたのですが、いくらぐらいかかるでしょうか。","reading":"しゅじゅつがひつようだといわれたのですが、いくらぐらいかかるでしょうか。","romaji":"Shujutsu ga hitsuyou da to iwareta no desu ga, ikura gurai kakaru deshou ka.","trans":"Saya diberitahu perlu operasi, kira-kira biayanya berapa?"},
  {"speaker":"会計","text":"保険が使えますので、三割のご負担になります。","reading":"ほけんがつかえますので、さんわりのごふたんになります。","romaji":"Hoken ga tsukaemasu node, sanwari no gofutan ni narimasu.","trans":"Asuransi bisa dipakai, jadi Anda menanggung 30 persen."},
  {"speaker":"アリ","text":"三割でも、金額が大きいのではないでしょうか。","reading":"さんわりでも、きんがくがおおきいのではないでしょうか。","romaji":"Sanwari demo, kingaku ga ookii no dewa nai deshou ka.","trans":"Meski 30 persen, bukankah jumlahnya tetap besar?"},
  {"speaker":"会計","text":"高額療養費制度というものがあります。上限が決まっているんです。","reading":"こうがくりょうようひせいどというものがあります。じょうげんがきまっているんです。","romaji":"Kougaku ryouyouhi seido to iu mono ga arimasu. Jougen ga kimatte iru n desu.","trans":"Ada sistem bernama kougaku ryouyouhi. Ada batas maksimalnya."},
  {"speaker":"アリ","text":"上限とは、どのぐらいですか。","reading":"じょうげんとは、どのぐらいですか。","romaji":"Jougen to wa, dono gurai desu ka.","trans":"Batasnya berapa?"},
  {"speaker":"会計","text":"収入によりますが、月に八万円ほどで済む方が多いです。","reading":"しゅうにゅうによりますが、つきにはちまんえんほどですむかたがおおいです。","romaji":"Shuunyuu ni yorimasu ga, tsuki ni hachiman en hodo de sumu kata ga ooi desu.","trans":"Tergantung penghasilan, tapi kebanyakan cukup sekitar 80.000 yen per bulan."},
  {"speaker":"アリ","text":"それは助かります。申請は自分でするのでしょうか。","reading":"それはたすかります。しんせいはじぶんでするのでしょうか。","romaji":"Sore wa tasukarimasu. Shinsei wa jibun de suru no deshou ka.","trans":"Itu sangat membantu. Pengajuannya saya sendiri yang urus?"},
  {"speaker":"会計","text":"事前に認定証をもらっておくと、窓口の支払いが最初から安くなります。","reading":"じぜんににんていしょうをもらっておくと、まどぐちのしはらいがさいしょからやすくなります。","romaji":"Jizen ni ninteishou o moratte oku to, madoguchi no shiharai ga saisho kara yasuku narimasu.","trans":"Kalau mengurus surat keterangan lebih dulu, pembayaran di loket langsung lebih murah sejak awal."},
  {"speaker":"アリ","text":"どこでもらえますか。","reading":"どこでもらえますか。","romaji":"Doko de moraemasu ka.","trans":"Bisa diambil di mana?"},
  {"speaker":"会計","text":"保険証に書いてある窓口です。手続きの紙をお渡ししますね。","reading":"ほけんしょうにかいてあるまどぐちです。てつづきのかみをおわたししますね。","romaji":"Hokenshou ni kaite aru madoguchi desu. Tetsuzuki no kami o owatashi shimasu ne.","trans":"Di kantor yang tertulis di kartu asuransi Anda. Saya berikan lembar prosedurnya."}
 ]'::jsonb,
 '[
  {"word":"治療費","reading":"ちりょうひ (chiryouhi)","meaning":"biaya pengobatan"},
  {"word":"負担","reading":"ふたん (futan)","meaning":"tanggungan biaya"},
  {"word":"高額療養費制度","reading":"こうがくりょうようひせいど (kougaku ryouyouhi seido)","meaning":"sistem batas maksimal biaya medis bulanan"},
  {"word":"上限","reading":"じょうげん (jougen)","meaning":"batas atas"}
 ]'::jsonb, false),

(3, 'Menemani Teman Berobat', 'hospital',
 '[
  {"speaker":"デウィ","text":"友達の通訳として来ました。日本語がまだ話せないんです。","reading":"ともだちのつうやくとしてきました。にほんごがまだはなせないんです。","romaji":"Tomodachi no tsuuyaku toshite kimashita. Nihongo ga mada hanasenai n desu.","trans":"Saya datang sebagai penerjemah teman saya. Dia belum bisa bahasa Jepang."},
  {"speaker":"看護師","text":"ありがとうございます。助かります。どんな症状ですか。","reading":"ありがとうございます。たすかります。どんなしょうじょうですか。","romaji":"Arigatou gozaimasu. Tasukarimasu. Donna shoujou desu ka.","trans":"Terima kasih. Sangat membantu. Gejalanya bagaimana?"},
  {"speaker":"デウィ","text":"四日前から熱が下がらなくて、咳もひどいそうです。","reading":"よっかまえからねつがさがらなくて、せきもひどいそうです。","romaji":"Yokka mae kara netsu ga sagaranakute, seki mo hidoi sou desu.","trans":"Katanya sejak empat hari lalu demamnya tidak turun, batuknya juga parah."},
  {"speaker":"看護師","text":"薬は何か飲みましたか。","reading":"くすりはなにかのみましたか。","romaji":"Kusuri wa nanika nomimashita ka.","trans":"Sudah minum obat apa saja?"},
  {"speaker":"デウィ","text":"はい。国から持ってきた薬を飲んだそうですが、効かなかったと言っています。","reading":"はい。くにからもってきたくすりをのんだそうですが、きかなかったといっています。","romaji":"Hai. Kuni kara motte kita kusuri o nonda sou desu ga, kikanakatta to itte imasu.","trans":"Ya. Katanya minum obat yang dibawa dari negaranya, tapi tidak mempan."},
  {"speaker":"看護師","text":"その薬の名前は分かりますか。","reading":"そのくすりのなまえはわかりますか。","romaji":"Sono kusuri no namae wa wakarimasu ka.","trans":"Apakah tahu nama obatnya?"},
  {"speaker":"デウィ","text":"箱を持ってきています。これです。","reading":"はこをもってきています。これです。","romaji":"Hako o motte kite imasu. Kore desu.","trans":"Dia bawa kotaknya. Ini."},
  {"speaker":"看護師","text":"助かります。医師に見せますね。保険証はお持ちですか。","reading":"たすかります。いしにみせますね。ほけんしょうはおもちですか。","romaji":"Tasukarimasu. Ishi ni misemasu ne. Hokenshou wa omochi desu ka.","trans":"Sangat membantu. Nanti saya tunjukkan ke dokter. Kartu asuransinya ada?"},
  {"speaker":"デウィ","text":"あります。ただ、住所が変わったばかりで、まだ直していません。","reading":"あります。ただ、じゅうしょがかわったばかりで、まだなおしていません。","romaji":"Arimasu. Tada, juusho ga kawatta bakari de, mada naoshite imasen.","trans":"Ada. Hanya saja alamatnya baru pindah dan belum diperbarui."},
  {"speaker":"看護師","text":"今日は大丈夫ですが、早めに市役所で手続きをしてください。","reading":"きょうはだいじょうぶですが、はやめにしやくしょでてつづきをしてください。","romaji":"Kyou wa daijoubu desu ga, hayame ni shiyakusho de tetsuzuki o shite kudasai.","trans":"Hari ini tidak masalah, tapi segera urus di kantor kota."},
  {"speaker":"デウィ","text":"伝えておきます。診察のとき、私も入っていいですか。","reading":"つたえておきます。しんさつのとき、わたしもはいっていいですか。","romaji":"Tsutaete okimasu. Shinsatsu no toki, watashi mo haitte ii desu ka.","trans":"Akan saya sampaikan. Saat pemeriksaan, boleh saya ikut masuk?"},
  {"speaker":"看護師","text":"どうぞ。通訳の方がいたほうが、正確に伝わりますから。","reading":"どうぞ。つうやくのかたがいたほうが、せいかくにつたわりますから。","romaji":"Douzo. Tsuuyaku no kata ga ita hou ga, seikaku ni tsutawarimasu kara.","trans":"Silakan. Justru dengan penerjemah, informasinya tersampaikan lebih akurat."}
 ]'::jsonb,
 '[
  {"word":"通訳","reading":"つうやく (tsuuyaku)","meaning":"penerjemah lisan"},
  {"word":"効く","reading":"きく (kiku)","meaning":"berkhasiat, mempan"},
  {"word":"診察","reading":"しんさつ (shinsatsu)","meaning":"pemeriksaan dokter"},
  {"word":"正確に","reading":"せいかくに (seikaku ni)","meaning":"dengan akurat"}
 ]'::jsonb, false),

(3, 'Menyampaikan Keterlambatan Pengiriman', 'biz',
 '[
  {"speaker":"リナ","text":"お世話になっております。納期の件でご連絡いたしました。","reading":"おせわになっております。のうきのけんでごれんらくいたしました。","romaji":"Osewa ni natte orimasu. Nouki no ken de gorenraku itashimashita.","trans":"Terima kasih atas kerja samanya. Saya menghubungi soal tenggat pengiriman."},
  {"speaker":"客先","text":"はい、何かありましたか。","reading":"はい、なにかありましたか。","romaji":"Hai, nanika arimashita ka.","trans":"Ya, ada apa?"},
  {"speaker":"リナ","text":"申し訳ございません。工場の機械が故障し、三日遅れる見込みです。","reading":"もうしわけございません。こうじょうのきかいがこしょうし、みっかおくれるみこみです。","romaji":"Moushiwake gozaimasen. Koujou no kikai ga koshou shi, mikka okureru mikomi desu.","trans":"Mohon maaf. Mesin pabrik rusak, diperkirakan terlambat tiga hari."},
  {"speaker":"客先","text":"三日ですか。こちらの予定にも影響が出ますね。","reading":"みっかですか。こちらのよていにもえいきょうがでますね。","romaji":"Mikka desu ka. Kochira no yotei ni mo eikyou ga demasu ne.","trans":"Tiga hari ya. Itu berdampak pada jadwal kami juga."},
  {"speaker":"リナ","text":"重ねてお詫び申し上げます。一部だけ先に納めることは可能です。","reading":"かさねておわびもうしあげます。いちぶだけさきにおさめることはかのうです。","romaji":"Kasanete owabi moushiagemasu. Ichibu dake saki ni osameru koto wa kanou desu.","trans":"Sekali lagi saya mohon maaf. Sebagian bisa kami kirim lebih dulu."},
  {"speaker":"客先","text":"どのぐらい出せますか。","reading":"どのぐらいだせますか。","romaji":"Dono gurai dasemasu ka.","trans":"Berapa banyak yang bisa dikirim?"},
  {"speaker":"リナ","text":"全体の六割は、予定どおりお届けできます。","reading":"ぜんたいのろくわりは、よていどおりおとどけできます。","romaji":"Zentai no rokuwari wa, yotei doori otodoke dekimasu.","trans":"60 persen dari total bisa kami kirim sesuai jadwal."},
  {"speaker":"客先","text":"それなら何とかなります。残りは必ず三日後ですか。","reading":"それならなんとかなります。のこりはかならずみっかごですか。","romaji":"Sore nara nantoka narimasu. Nokori wa kanarazu mikkago desu ka.","trans":"Kalau begitu masih bisa diatasi. Sisanya pasti tiga hari kemudian?"},
  {"speaker":"リナ","text":"はい。修理は明日終わる予定で、確認が取れております。","reading":"はい。しゅうりはあすおわるよていで、かくにんがとれております。","romaji":"Hai. Shuuri wa asu owaru yotei de, kakunin ga torete orimasu.","trans":"Ya. Perbaikannya dijadwalkan selesai besok, dan itu sudah kami konfirmasi."},
  {"speaker":"客先","text":"分かりました。次からは、早めに知らせていただけると助かります。","reading":"わかりました。つぎからは、はやめにしらせていただけるとたすかります。","romaji":"Wakarimashita. Tsugi kara wa, hayame ni shirasete itadakeru to tasukarimasu.","trans":"Baik. Lain kali, kalau bisa dikabari lebih awal, kami terbantu."},
  {"speaker":"リナ","text":"おっしゃるとおりです。今後は分かった時点でご報告いたします。","reading":"おっしゃるとおりです。こんごはわかったじてんでごほうこくいたします。","romaji":"Ossharu toori desu. Kongo wa wakatta jiten de gohoukoku itashimasu.","trans":"Betul sekali. Ke depan akan kami laporkan begitu diketahui."},
  {"speaker":"客先","text":"お願いします。では、六割の分をお待ちしています。","reading":"おねがいします。では、ろくわりのぶんをおまちしています。","romaji":"Onegai shimasu. Dewa, rokuwari no bun o omachi shite imasu.","trans":"Mohon ya. Kalau begitu, kami tunggu yang 60 persen itu."}
 ]'::jsonb,
 '[
  {"word":"納期","reading":"のうき (nouki)","meaning":"tenggat pengiriman"},
  {"word":"故障","reading":"こしょう (koshou)","meaning":"kerusakan mesin"},
  {"word":"見込み","reading":"みこみ (mikomi)","meaning":"perkiraan, prospek"},
  {"word":"お詫び申し上げます","reading":"おわびもうしあげます (owabi moushiagemasu)","meaning":"saya menyampaikan permohonan maaf (sangat formal)"}
 ]'::jsonb, false),

(3, 'Memperkenalkan Produk ke Calon Klien', 'biz',
 '[
  {"speaker":"アリ","text":"本日はお時間をいただき、ありがとうございます。","reading":"ほんじつはおじかんをいただき、ありがとうございます。","romaji":"Honjitsu wa ojikan o itadaki, arigatou gozaimasu.","trans":"Terima kasih telah meluangkan waktu hari ini."},
  {"speaker":"客先","text":"いえいえ。それで、どのような商品でしょうか。","reading":"いえいえ。それで、どのようなしょうひんでしょうか。","romaji":"Ieie. Sorede, dono you na shouhin deshou ka.","trans":"Sama-sama. Jadi, produk seperti apa?"},
  {"speaker":"アリ","text":"外国人スタッフ向けの、多言語対応の業務アプリです。","reading":"がいこくじんスタッフむけの、たげんごたいおうのぎょうむアプリです。","romaji":"Gaikokujin sutaffu muke no, tagengo taiou no gyoumu apuri desu.","trans":"Aplikasi kerja multibahasa yang ditujukan untuk staf asing."},
  {"speaker":"客先","text":"うちにも外国人が増えていますから、興味はあります。","reading":"うちにもがいこくじんがふえていますから、きょうみはあります。","romaji":"Uchi ni mo gaikokujin ga fuete imasu kara, kyoumi wa arimasu.","trans":"Di tempat kami juga staf asing bertambah, jadi saya tertarik."},
  {"speaker":"アリ","text":"作業の手順を、写真と母語の説明で見せられるのが特徴です。","reading":"さぎょうのてじゅんを、しゃしんとぼごのせつめいでみせられるのがとくちょうです。","romaji":"Sagyou no tejun o, shashin to bogo no setsumei de miserareru no ga tokuchou desu.","trans":"Keunggulannya, prosedur kerja bisa ditampilkan dengan foto dan penjelasan bahasa ibu."},
  {"speaker":"客先","text":"何か国語に対応していますか。","reading":"なんかこくごにたいおうしていますか。","romaji":"Nankakokugo ni taiou shite imasu ka.","trans":"Mendukung berapa bahasa?"},
  {"speaker":"アリ","text":"現在は六か国語です。インドネシア語とベトナム語も含まれます。","reading":"げんざいはろっかこくごです。インドネシアごとベトナムごもふくまれます。","romaji":"Genzai wa rokkakokugo desu. Indoneshiago to Betonamugo mo fukumaremasu.","trans":"Saat ini enam bahasa. Termasuk bahasa Indonesia dan Vietnam."},
  {"speaker":"客先","text":"導入にはどのぐらいかかりますか。","reading":"どうにゅうにはどのぐらいかかりますか。","romaji":"Dounyuu ni wa dono gurai kakarimasu ka.","trans":"Berapa lama waktu penerapannya?"},
  {"speaker":"アリ","text":"二週間ほどです。既存の手順書があれば、もっと早く済みます。","reading":"にしゅうかんほどです。きぞんのてじゅんしょがあれば、もっとはやくすみます。","romaji":"Nishuukan hodo desu. Kizon no tejunsho ga areba, motto hayaku sumimasu.","trans":"Sekitar dua minggu. Kalau sudah ada manual prosedur, bisa lebih cepat."},
  {"speaker":"客先","text":"費用の面はいかがですか。","reading":"ひようのめんはいかがですか。","romaji":"Hiyou no men wa ikaga desu ka.","trans":"Bagaimana dari sisi biaya?"},
  {"speaker":"アリ","text":"人数によりますが、まずは一か月の無料試用をおすすめしています。","reading":"にんずうによりますが、まずはいっかげつのむりょうしようをおすすめしています。","romaji":"Ninzuu ni yorimasu ga, mazu wa ikkagetsu no muryou shiyou o osusume shite imasu.","trans":"Tergantung jumlah orang, tapi kami sarankan mencoba gratis satu bulan dulu."},
  {"speaker":"客先","text":"それなら試しやすいですね。資料を置いていってください。","reading":"それならためしやすいですね。しりょうをおいていってください。","romaji":"Sore nara tameshiyasui desu ne. Shiryou o oite itte kudasai.","trans":"Kalau begitu mudah dicoba. Tolong tinggalkan materinya."}
 ]'::jsonb,
 '[
  {"word":"～向け","reading":"むけ (muke)","meaning":"ditujukan untuk ~"},
  {"word":"母語","reading":"ぼご (bogo)","meaning":"bahasa ibu"},
  {"word":"導入","reading":"どうにゅう (dounyuu)","meaning":"penerapan, pengadaan"},
  {"word":"試用","reading":"しよう (shiyou)","meaning":"masa percobaan"}
 ]'::jsonb, false),

(3, 'Menenangkan Lansia yang Marah', 'kaigo',
 '[
  {"speaker":"利用者","text":"私の財布がない。誰かが取ったに違いない。","reading":"わたしのさいふがない。だれかがとったにちがいない。","romaji":"Watashi no saifu ga nai. Dareka ga totta ni chigainai.","trans":"Dompet saya hilang. Pasti ada yang mengambilnya."},
  {"speaker":"職員","text":"それは心配ですね。一緒に探しましょう。","reading":"それはしんぱいですね。いっしょにさがしましょう。","romaji":"Sore wa shinpai desu ne. Issho ni sagashimashou.","trans":"Wah, pasti khawatir ya. Mari kita cari bersama."},
  {"speaker":"利用者","text":"探しても無駄よ。あんたたちが取ったんでしょう。","reading":"さがしてもむだよ。あんたたちがとったんでしょう。","romaji":"Sagashite mo muda yo. Antatachi ga totta n deshou.","trans":"Percuma dicari. Kalian yang mengambilnya, kan?"},
  {"speaker":"職員","text":"大切なものがなくなると、不安になりますよね。","reading":"たいせつなものがなくなると、ふあんになりますよね。","romaji":"Taisetsu na mono ga naku naru to, fuan ni narimasu yo ne.","trans":"Kalau barang penting hilang, memang jadi cemas ya."},
  {"speaker":"利用者","text":"当たり前でしょう。中にお金が入っているんだから。","reading":"あたりまえでしょう。なかにおかねがはいっているんだから。","romaji":"Atarimae deshou. Naka ni okane ga haitte iru n da kara.","trans":"Ya jelas. Di dalamnya ada uang."},
  {"speaker":"職員","text":"そうですよね。最後に使われたのは、いつごろでしょうか。","reading":"そうですよね。さいごにつかわれたのは、いつごろでしょうか。","romaji":"Sou desu yo ne. Saigo ni tsukawareta no wa, itsu goro deshou ka.","trans":"Betul sekali. Terakhir dipakai kira-kira kapan ya?"},
  {"speaker":"利用者","text":"昨日、売店で買い物をしたときかしら。","reading":"きのう、ばいてんでかいものをしたときかしら。","romaji":"Kinou, baiten de kaimono o shita toki kashira.","trans":"Kemarin, waktu belanja di kios mungkin."},
  {"speaker":"職員","text":"では、その辺りから見てみましょう。引き出しの中も確認しますね。","reading":"では、そのあたりからみてみましょう。ひきだしのなかもかくにんしますね。","romaji":"Dewa, sono atari kara mite mimashou. Hikidashi no naka mo kakunin shimasu ne.","trans":"Kalau begitu, mari kita cari dari sekitar situ. Laci juga saya periksa ya."},
  {"speaker":"利用者","text":"……あら、これじゃない。","reading":"……あら、これじゃない。","romaji":"...Ara, kore ja nai.","trans":"...Lho, ini kan?"},
  {"speaker":"職員","text":"よかったですね。見つかって安心しました。","reading":"よかったですね。みつかってあんしんしました。","romaji":"Yokatta desu ne. Mitsukatte anshin shimashita.","trans":"Syukurlah. Saya lega ketemu."},
  {"speaker":"利用者","text":"疑って悪かったわね。","reading":"うたがってわるかったわね。","romaji":"Utagatte warukatta wa ne.","trans":"Maaf ya sudah menuduh."},
  {"speaker":"職員","text":"気にしないでください。心配なときは、いつでも呼んでくださいね。","reading":"きにしないでください。しんぱいなときは、いつでもよんでくださいね。","romaji":"Ki ni shinaide kudasai. Shinpai na toki wa, itsudemo yonde kudasai ne.","trans":"Tidak apa-apa. Kalau khawatir, panggil saya kapan saja ya."}
 ]'::jsonb,
 '[
  {"word":"～に違いない","reading":"にちがいない (ni chigainai)","meaning":"pasti ~, tidak salah lagi"},
  {"word":"不安","reading":"ふあん (fuan)","meaning":"kecemasan"},
  {"word":"疑う","reading":"うたがう (utagau)","meaning":"mencurigai"},
  {"word":"物盗られ妄想","reading":"ものとられもうそう (monotorare mousou)","meaning":"delusi kehilangan barang (umum pada demensia)"}
 ]'::jsonb, false),

(3, 'Berdiskusi dengan Care Manager', 'kaigo',
 '[
  {"speaker":"ケアマネ","text":"来月のケアプランについて、現場のご意見を伺いたいのですが。","reading":"らいげつのケアプランについて、げんばのごいけんをうかがいたいのですが。","romaji":"Raigetsu no kea puran ni tsuite, genba no goiken o ukagaitai no desu ga.","trans":"Soal rencana perawatan bulan depan, saya ingin dengar pendapat dari lapangan."},
  {"speaker":"職員","text":"はい。田中様のことでしたら、少し気になる点があります。","reading":"はい。たなかさまのことでしたら、すこしきになるてんがあります。","romaji":"Hai. Tanaka-sama no koto deshitara, sukoshi ki ni naru ten ga arimasu.","trans":"Baik. Kalau soal Bapak Tanaka, ada beberapa hal yang saya perhatikan."},
  {"speaker":"ケアマネ","text":"どういった点でしょうか。","reading":"どういったてんでしょうか。","romaji":"Dou itta ten deshou ka.","trans":"Hal seperti apa?"},
  {"speaker":"職員","text":"ここ二週間、歩く距離が明らかに短くなっています。","reading":"ここにしゅうかん、あるくきょりがあきらかにみじかくなっています。","romaji":"Koko nishuukan, aruku kyori ga akiraka ni mijikaku natte imasu.","trans":"Dalam dua minggu ini, jarak berjalannya jelas memendek."},
  {"speaker":"ケアマネ","text":"記録に残っていますか。","reading":"きろくにのこっていますか。","romaji":"Kiroku ni nokotte imasu ka.","trans":"Apakah tercatat?"},
  {"speaker":"職員","text":"はい。以前は食堂まで歩かれていましたが、今は途中で座り込まれます。","reading":"はい。いぜんはしょくどうまであるかれていましたが、いまはとちゅうですわりこまれます。","romaji":"Hai. Izen wa shokudou made arukarete imashita ga, ima wa tochuu de suwarikomaremasu.","trans":"Ya. Dulu beliau bisa jalan sampai ruang makan, sekarang duduk di tengah jalan."},
  {"speaker":"ケアマネ","text":"痛みを訴えられることはありますか。","reading":"いたみをうったえられることはありますか。","romaji":"Itami o uttaerareru koto wa arimasu ka.","trans":"Apakah beliau mengeluh sakit?"},
  {"speaker":"職員","text":"膝が痛いとおっしゃることが増えました。","reading":"ひざがいたいとおっしゃることがふえました。","romaji":"Hiza ga itai to ossharu koto ga fuemashita.","trans":"Keluhan lutut sakit makin sering."},
  {"speaker":"ケアマネ","text":"では、リハビリの回数を増やすことを検討しましょう。","reading":"では、リハビリのかいすうをふやすことをけんとうしましょう。","romaji":"Dewa, rihabiri no kaisuu o fuyasu koto o kentou shimashou.","trans":"Kalau begitu, mari kita pertimbangkan menambah frekuensi rehabilitasi."},
  {"speaker":"職員","text":"賛成です。ただ、ご本人が嫌がられる可能性もあります。","reading":"さんせいです。ただ、ごほんにんがいやがられるかのうせいもあります。","romaji":"Sansei desu. Tada, gohonnin ga iyagarareru kanousei mo arimasu.","trans":"Saya setuju. Tapi ada kemungkinan beliau sendiri enggan."},
  {"speaker":"ケアマネ","text":"そこは大事な情報です。ご本人の希望も聞いた上で決めます。","reading":"そこはだいじなじょうほうです。ごほんにんのきぼうもきいたうえできめます。","romaji":"Soko wa daiji na jouhou desu. Gohonnin no kibou mo kiita ue de kimemasu.","trans":"Itu informasi penting. Kita putuskan setelah mendengar keinginan beliau juga."},
  {"speaker":"職員","text":"ご家族にも伝えたほうがよろしいでしょうか。","reading":"ごかぞくにもつたえたほうがよろしいでしょうか。","romaji":"Gokazoku ni mo tsutaeta hou ga yoroshii deshou ka.","trans":"Apakah sebaiknya disampaikan ke keluarga juga?"}
 ]'::jsonb,
 '[
  {"word":"ケアプラン","reading":"kea puran","meaning":"rencana perawatan individual"},
  {"word":"現場","reading":"げんば (genba)","meaning":"lapangan, tempat kerja langsung"},
  {"word":"訴える","reading":"うったえる (uttaeru)","meaning":"mengeluhkan (gejala)"},
  {"word":"検討する","reading":"けんとうする (kentou suru)","meaning":"mempertimbangkan"}
 ]'::jsonb, false),

(3, 'Melaporkan Kondisi ke Keluarga lewat Telepon', 'kaigo',
 '[
  {"speaker":"職員","text":"お世話になっております。さくら苑の職員でございます。","reading":"おせわになっております。さくらえんのしょくいんでございます。","romaji":"Osewa ni natte orimasu. Sakura-en no shokuin de gozaimasu.","trans":"Selamat siang. Saya staf dari Panti Sakura."},
  {"speaker":"家族","text":"はい。母に何かありましたか。","reading":"はい。ははになにかありましたか。","romaji":"Hai. Haha ni nanika arimashita ka.","trans":"Ya. Apakah terjadi sesuatu pada ibu saya?"},
  {"speaker":"職員","text":"落ち着いてお聞きください。命に別状はございません。","reading":"おちついておききください。いのちにべつじょうはございません。","romaji":"Ochitsuite okiki kudasai. Inochi ni betsujou wa gozaimasen.","trans":"Mohon didengarkan dengan tenang. Tidak ada bahaya pada nyawanya."},
  {"speaker":"家族","text":"分かりました。何があったのでしょうか。","reading":"わかりました。なにがあったのでしょうか。","romaji":"Wakarimashita. Nani ga atta no deshou ka.","trans":"Baik. Apa yang terjadi?"},
  {"speaker":"職員","text":"本日十時ごろ、廊下で転倒されました。左の腕を打たれています。","reading":"ほんじつじゅうじごろ、ろうかでてんとうされました。ひだりのうでをうたれています。","romaji":"Honjitsu juuji goro, rouka de tentou saremashita. Hidari no ude o utarete imasu.","trans":"Hari ini sekitar jam sepuluh, beliau terjatuh di koridor. Lengan kirinya terbentur."},
  {"speaker":"家族","text":"骨は折れていませんか。","reading":"ほねはおれていませんか。","romaji":"Hone wa orete imasen ka.","trans":"Tulangnya tidak patah?"},
  {"speaker":"職員","text":"すぐに受診し、レントゲンを撮りました。骨に異常はございませんでした。","reading":"すぐにじゅしんし、レントゲンをとりました。ほねにいじょうはございませんでした。","romaji":"Sugu ni jushin shi, rentogen o torimashita. Hone ni ijou wa gozaimasen deshita.","trans":"Langsung diperiksa dan dirontgen. Tidak ada kelainan pada tulangnya."},
  {"speaker":"家族","text":"よかった。今はどうしていますか。","reading":"よかった。いまはどうしていますか。","romaji":"Yokatta. Ima wa dou shite imasu ka.","trans":"Syukurlah. Sekarang bagaimana kondisinya?"},
  {"speaker":"職員","text":"お部屋で休んでおられます。食事も普段どおり召し上がりました。","reading":"おへやでやすんでおられます。しょくじもふだんどおりめしあがりました。","romaji":"Oheya de yasunde oraremasu. Shokuji mo fudan doori meshiagarimashita.","trans":"Sedang istirahat di kamar. Makannya pun seperti biasa."},
  {"speaker":"家族","text":"どうして転んだのでしょうか。","reading":"どうしてころんだのでしょうか。","romaji":"Doushite koronda no deshou ka.","trans":"Kenapa bisa terjatuh?"},
  {"speaker":"職員","text":"床が濡れていた可能性があります。原因を調べ、対策を取ります。","reading":"ゆかがぬれていたかのうせいがあります。げんいんをしらべ、たいさくをとります。","romaji":"Yuka ga nurete ita kanousei ga arimasu. Gen-in o shirabe, taisaku o torimasu.","trans":"Ada kemungkinan lantainya basah. Kami akan selidiki penyebabnya dan ambil tindakan."},
  {"speaker":"家族","text":"お願いします。すぐに知らせてくださって、ありがとうございました。","reading":"おねがいします。すぐにしらせてくださって、ありがとうございました。","romaji":"Onegai shimasu. Sugu ni shirasete kudasatte, arigatou gozaimashita.","trans":"Mohon ya. Terima kasih sudah langsung mengabari."}
 ]'::jsonb,
 '[
  {"word":"命に別状はない","reading":"いのちにべつじょうはない (inochi ni betsujou wa nai)","meaning":"nyawanya tidak terancam"},
  {"word":"受診","reading":"じゅしん (jushin)","meaning":"memeriksakan diri ke dokter"},
  {"word":"異常","reading":"いじょう (ijou)","meaning":"kelainan"},
  {"word":"対策","reading":"たいさく (taisaku)","meaning":"langkah penanggulangan"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO NOTHING;
