-- ============================================================
-- Koto no Ha — Seed Dokkai N3 (level_id=3): 5 bacaan (~300 huruf), tata bahasa menengah.
-- content_json: jp + furigana + romaji + terjemahan Indonesia (id). Re-runnable.
-- ============================================================
DELETE FROM public.dokkai_passages WHERE level_id = 3;

INSERT INTO public.dokkai_passages (level_id, order_index, title, text_content, content_json, vocab_notes, questions, is_premium) VALUES
(3, 1, 'SNSとの付き合い方 — Bijak Bermedia Sosial',
 '最近、SNSを使う人がとても増えました。SNSのおかげで、遠くにいる友だちとも簡単に連絡が取れます。しかし、長い時間使いすぎると、目が疲れたり、勉強の時間が減ったりします。また、インターネットの情報がすべて正しいとは限りません。だから、情報を信じる前に、よく確認することが大切です。SNSは便利な道具ですが、使い方には注意が必要です。',
 '[
   {"jp":"最近、SNSを使う人がとても増えました。","furigana":"さいきん、エスエヌエスをつかうひとがとてもふえました。","romaji":"Saikin, esuenuesu o tsukau hito ga totemo fuemashita.","id":"Akhir-akhir ini, orang yang menggunakan media sosial semakin banyak."},
   {"jp":"SNSのおかげで、遠くにいる友だちとも簡単に連絡が取れます。","furigana":"エスエヌエスのおかげで、とおくにいるともだちともかんたんにれんらくがとれます。","romaji":"Esuenuesu no okage de, tooku ni iru tomodachi to mo kantan ni renraku ga toremasu.","id":"Berkat media sosial, kita bisa dengan mudah menghubungi teman yang jauh sekalipun."},
   {"jp":"しかし、長い時間使いすぎると、目が疲れたり、勉強の時間が減ったりします。","furigana":"しかし、ながいじかんつかいすぎると、めがつかれたり、べんきょうのじかんがへったりします。","romaji":"Shikashi, nagai jikan tsukaisugiru to, me ga tsukaretari, benkyou no jikan ga hettari shimasu.","id":"Namun, jika digunakan terlalu lama, mata menjadi lelah dan waktu belajar pun berkurang."},
   {"jp":"また、インターネットの情報がすべて正しいとは限りません。","furigana":"また、インターネットのじょうほうがすべてただしいとはかぎりません。","romaji":"Mata, intaanetto no jouhou ga subete tadashii to wa kagirimasen.","id":"Selain itu, tidak semua informasi di internet itu benar."},
   {"jp":"だから、情報を信じる前に、よく確認することが大切です。","furigana":"だから、じょうほうをしんじるまえに、よくかくにんすることがたいせつです。","romaji":"Dakara, jouhou o shinjiru mae ni, yoku kakunin suru koto ga taisetsu desu.","id":"Karena itu, sebelum mempercayai informasi, penting untuk memeriksanya dengan teliti."},
   {"jp":"SNSは便利な道具ですが、使い方には注意が必要です。","furigana":"エスエヌエスはべんりなどうぐですが、つかいかたにはちゅういがひつようです。","romaji":"Esuenuesu wa benri na dougu desu ga, tsukaikata ni wa chuui ga hitsuyou desu.","id":"Media sosial adalah alat yang praktis, tetapi cara penggunaannya perlu diperhatikan."}
 ]'::jsonb,
 '[
   {"word":"増えました","reading":"ふえました","romaji":"fuemashita","meaning":"bertambah/meningkat"},
   {"word":"連絡","reading":"れんらく","romaji":"renraku","meaning":"kontak/menghubungi"},
   {"word":"情報","reading":"じょうほう","romaji":"jouhou","meaning":"informasi"},
   {"word":"確認","reading":"かくにん","romaji":"kakunin","meaning":"konfirmasi/memeriksa"},
   {"word":"道具","reading":"どうぐ","romaji":"dougu","meaning":"alat"},
   {"word":"注意","reading":"ちゅうい","romaji":"chuui","meaning":"perhatian/kehati-hatian"}
 ]'::jsonb,
 '[
   {"q":"Apa keuntungan media sosial menurut bacaan?","options":["Membuat mata sehat","Mudah menghubungi teman yang jauh","Menambah waktu belajar","Menambah penghasilan"],"answer":1,"explanation":"「遠くにいる友だちとも簡単に連絡が取れます」."},
   {"q":"Apa yang penting dilakukan sebelum mempercayai informasi?","options":["Membagikannya","Memeriksanya dengan teliti","Menghapusnya","Mengabaikannya"],"answer":1,"explanation":"「信じる前に、よく確認することが大切」."},
   {"q":"Apa kesimpulan penulis tentang media sosial?","options":["Harus dihindari sepenuhnya","Alat praktis tetapi perlu kehati-hatian","Selalu benar","Hanya untuk anak muda"],"answer":1,"explanation":"「便利な道具ですが、使い方には注意が必要」."}
 ]'::jsonb,
 false),

(3, 2, '日本の四季 — Empat Musim Jepang',
 '日本には春夏秋冬という四つの季節があります。春になると、桜が咲いて、多くの人が花見を楽しみます。夏は暑くて、海や祭りに行く人が増えます。秋は涼しくなり、紅葉がとてもきれいです。冬は雪が降る地域も多く、温泉が人気です。このように、季節によって楽しみ方が変わるのが日本の魅力です。',
 '[
   {"jp":"日本には春夏秋冬という四つの季節があります。","furigana":"にほんにははるなつあきふゆというよっつのきせつがあります。","romaji":"Nihon ni wa haru natsu aki fuyu to iu yottsu no kisetsu ga arimasu.","id":"Di Jepang ada empat musim, yaitu semi, panas, gugur, dan dingin."},
   {"jp":"春になると、桜が咲いて、多くの人が花見を楽しみます。","furigana":"はるになると、さくらがさいて、おおくのひとがはなみをたのしみます。","romaji":"Haru ni naru to, sakura ga saite, ooku no hito ga hanami o tanoshimimasu.","id":"Saat musim semi tiba, sakura mekar dan banyak orang menikmati hanami."},
   {"jp":"夏は暑くて、海や祭りに行く人が増えます。","furigana":"なつはあつくて、うみやまつりにいくひとがふえます。","romaji":"Natsu wa atsukute, umi ya matsuri ni iku hito ga fuemasu.","id":"Musim panas terasa panas, dan orang yang pergi ke laut atau festival bertambah."},
   {"jp":"秋は涼しくなり、紅葉がとてもきれいです。","furigana":"あきはすずしくなり、こうようがとてもきれいです。","romaji":"Aki wa suzushiku nari, kouyou ga totemo kirei desu.","id":"Musim gugur menjadi sejuk, dan dedaunan merah sangat indah."},
   {"jp":"冬は雪が降る地域も多く、温泉が人気です。","furigana":"ふゆはゆきがふるちいきもおおく、おんせんがにんきです。","romaji":"Fuyu wa yuki ga furu chiiki mo ooku, onsen ga ninki desu.","id":"Pada musim dingin banyak daerah turun salju, dan onsen menjadi populer."},
   {"jp":"このように、季節によって楽しみ方が変わるのが日本の魅力です。","furigana":"このように、きせつによってたのしみかたがかわるのがにほんのみりょくです。","romaji":"Kono you ni, kisetsu ni yotte tanoshimikata ga kawaru no ga nihon no miryoku desu.","id":"Dengan demikian, cara menikmati yang berubah menurut musim adalah daya tarik Jepang."}
 ]'::jsonb,
 '[
   {"word":"季節","reading":"きせつ","romaji":"kisetsu","meaning":"musim"},
   {"word":"桜","reading":"さくら","romaji":"sakura","meaning":"bunga sakura"},
   {"word":"花見","reading":"はなみ","romaji":"hanami","meaning":"melihat bunga (sakura)"},
   {"word":"紅葉","reading":"こうよう","romaji":"kouyou","meaning":"dedaunan musim gugur"},
   {"word":"温泉","reading":"おんせん","romaji":"onsen","meaning":"pemandian air panas"},
   {"word":"魅力","reading":"みりょく","romaji":"miryoku","meaning":"daya tarik"}
 ]'::jsonb,
 '[
   {"q":"Apa yang dinikmati orang saat musim semi?","options":["Onsen","Hanami","Festival laut","Salju"],"answer":1,"explanation":"「桜が咲いて…花見を楽しみます」."},
   {"q":"Apa yang populer pada musim dingin?","options":["Hanami","Pergi ke laut","Onsen","Melihat kouyou"],"answer":2,"explanation":"「冬は…温泉が人気」."},
   {"q":"Menurut penulis, apa daya tarik Jepang?","options":["Makanannya","Cara menikmati yang berubah tiap musim","Kotanya yang ramai","Bahasanya"],"answer":1,"explanation":"「季節によって楽しみ方が変わるのが日本の魅力」."}
 ]'::jsonb,
 false),

(3, 3, '留学の経験 — Pengalaman Studi di Jepang',
 '去年、わたしは一年間日本に留学しました。最初は言葉が分からなくて、毎日不安でした。でも、クラスメートや先生が親切に助けてくれました。少しずつ日本語が話せるようになって、自信がつきました。文化の違いに驚くこともありましたが、それも良い経験でした。この留学で、わたしは大きく成長できたと思います。',
 '[
   {"jp":"去年、わたしは一年間日本に留学しました。","furigana":"きょねん、わたしはいちねんかんにほんにりゅうがくしました。","romaji":"Kyonen, watashi wa ichinenkan nihon ni ryuugaku shimashita.","id":"Tahun lalu, saya belajar di Jepang selama satu tahun."},
   {"jp":"最初は言葉が分からなくて、毎日不安でした。","furigana":"さいしょはことばがわからなくて、まいにちふあんでした。","romaji":"Saisho wa kotoba ga wakaranakute, mainichi fuan deshita.","id":"Awalnya saya tidak mengerti bahasanya, dan setiap hari merasa cemas."},
   {"jp":"でも、クラスメートや先生が親切に助けてくれました。","furigana":"でも、クラスメートやせんせいがしんせつにたすけてくれました。","romaji":"Demo, kurasumeeto ya sensei ga shinsetsu ni tasukete kuremashita.","id":"Tetapi, teman sekelas dan guru dengan ramah membantu saya."},
   {"jp":"少しずつ日本語が話せるようになって、自信がつきました。","furigana":"すこしずつにほんごがはなせるようになって、じしんがつきました。","romaji":"Sukoshi zutsu nihongo ga hanaseru you ni natte, jishin ga tsukimashita.","id":"Sedikit demi sedikit saya menjadi bisa berbicara bahasa Jepang, dan tumbuh rasa percaya diri."},
   {"jp":"文化の違いに驚くこともありましたが、それも良い経験でした。","furigana":"ぶんかのちがいにおどろくこともありましたが、それもよいけいけんでした。","romaji":"Bunka no chigai ni odoroku koto mo arimashita ga, sore mo yoi keiken deshita.","id":"Ada kalanya saya terkejut dengan perbedaan budaya, tetapi itu pun pengalaman yang baik."},
   {"jp":"この留学で、わたしは大きく成長できたと思います。","furigana":"このりゅうがくで、わたしはおおきくせいちょうできたとおもいます。","romaji":"Kono ryuugaku de, watashi wa ookiku seichou dekita to omoimasu.","id":"Lewat studi ini, saya rasa saya bisa berkembang dengan pesat."}
 ]'::jsonb,
 '[
   {"word":"留学","reading":"りゅうがく","romaji":"ryuugaku","meaning":"studi ke luar negeri"},
   {"word":"不安","reading":"ふあん","romaji":"fuan","meaning":"cemas/khawatir"},
   {"word":"親切","reading":"しんせつ","romaji":"shinsetsu","meaning":"ramah/baik hati"},
   {"word":"自信","reading":"じしん","romaji":"jishin","meaning":"percaya diri"},
   {"word":"文化","reading":"ぶんか","romaji":"bunka","meaning":"budaya"},
   {"word":"成長","reading":"せいちょう","romaji":"seichou","meaning":"pertumbuhan/berkembang"}
 ]'::jsonb,
 '[
   {"q":"Bagaimana perasaan penulis pada awal masa studinya?","options":["Senang","Cemas","Marah","Bosan"],"answer":1,"explanation":"「毎日不安でした」."},
   {"q":"Siapa yang membantu penulis?","options":["Keluarganya","Teman sekelas dan guru","Tetangganya","Tidak ada"],"answer":1,"explanation":"「クラスメートや先生が…助けてくれました」."},
   {"q":"Apa kesimpulan penulis tentang pengalamannya?","options":["Membuang waktu","Bisa berkembang pesat","Terlalu sulit","Biasa saja"],"answer":1,"explanation":"「大きく成長できた」."}
 ]'::jsonb,
 false),

(3, 4, '環境問題とリサイクル — Lingkungan dan Daur Ulang',
 '今、世界中で環境問題が話題になっています。特に、プラスチックごみの問題は深刻です。日本では、ごみを細かく分けて出すルールがあります。一人ひとりがリサイクルに協力すれば、ごみを減らすことができます。小さな行動でも、続ければ大きな力になります。未来のために、今できることから始めましょう。',
 '[
   {"jp":"今、世界中で環境問題が話題になっています。","furigana":"いま、せかいじゅうでかんきょうもんだいがわだいになっています。","romaji":"Ima, sekaijuu de kankyou mondai ga wadai ni natte imasu.","id":"Saat ini, masalah lingkungan menjadi topik pembicaraan di seluruh dunia."},
   {"jp":"特に、プラスチックごみの問題は深刻です。","furigana":"とくに、プラスチックごみのもんだいはしんこくです。","romaji":"Tokuni, purasuchikku gomi no mondai wa shinkoku desu.","id":"Terutama, masalah sampah plastik sangat serius."},
   {"jp":"日本では、ごみを細かく分けて出すルールがあります。","furigana":"にほんでは、ごみをこまかくわけてだすルールがあります。","romaji":"Nihon de wa, gomi o komakaku wakete dasu ruuru ga arimasu.","id":"Di Jepang, ada aturan untuk memilah sampah secara rinci sebelum membuangnya."},
   {"jp":"一人ひとりがリサイクルに協力すれば、ごみを減らすことができます。","furigana":"ひとりひとりがリサイクルにきょうりょくすれば、ごみをへらすことができます。","romaji":"Hitorihitori ga risaikuru ni kyouryoku sureba, gomi o herasu koto ga dekimasu.","id":"Jika setiap orang bekerja sama dalam daur ulang, sampah bisa dikurangi."},
   {"jp":"小さな行動でも、続ければ大きな力になります。","furigana":"ちいさなこうどうでも、つづければおおきなちからになります。","romaji":"Chiisa na koudou demo, tsuzukereba ooki na chikara ni narimasu.","id":"Meskipun tindakan kecil, jika diteruskan akan menjadi kekuatan besar."},
   {"jp":"未来のために、今できることから始めましょう。","furigana":"みらいのために、いまできることからはじめましょう。","romaji":"Mirai no tame ni, ima dekiru koto kara hajimemashou.","id":"Demi masa depan, mari kita mulai dari hal yang bisa dilakukan sekarang."}
 ]'::jsonb,
 '[
   {"word":"環境","reading":"かんきょう","romaji":"kankyou","meaning":"lingkungan"},
   {"word":"深刻","reading":"しんこく","romaji":"shinkoku","meaning":"serius/parah"},
   {"word":"分けて","reading":"わけて","romaji":"wakete","meaning":"memilah/membagi"},
   {"word":"協力","reading":"きょうりょく","romaji":"kyouryoku","meaning":"kerja sama"},
   {"word":"減らす","reading":"へらす","romaji":"herasu","meaning":"mengurangi"},
   {"word":"未来","reading":"みらい","romaji":"mirai","meaning":"masa depan"}
 ]'::jsonb,
 '[
   {"q":"Masalah apa yang disebut paling serius?","options":["Polusi udara","Sampah plastik","Kebisingan","Air bersih"],"answer":1,"explanation":"「プラスチックごみの問題は深刻」."},
   {"q":"Apa aturan tentang sampah di Jepang?","options":["Membakar sampah","Memilah sampah secara rinci","Membuang ke laut","Tidak ada aturan"],"answer":1,"explanation":"「ごみを細かく分けて出すルール」."},
   {"q":"Apa pesan utama penulis?","options":["Hanya pemerintah yang harus bertindak","Mulai dari hal kecil yang bisa dilakukan sekarang","Lingkungan tidak penting","Hanya ilmuwan yang bisa membantu"],"answer":1,"explanation":"「今できることから始めましょう」."}
 ]'::jsonb,
 false),

(3, 5, '仕事と休みのバランス — Keseimbangan Kerja dan Istirahat',
 '日本では、長い時間働く人が多いと言われています。仕事は大切ですが、休むことも同じくらい大切です。十分に休まないと、体も心も疲れてしまいます。最近は、家で働ける会社も増えてきました。自分の時間を大切にすることで、仕事ももっとうまくいきます。働きすぎず、よく休むことが幸せな生活につながります。',
 '[
   {"jp":"日本では、長い時間働く人が多いと言われています。","furigana":"にほんでは、ながいじかんはたらくひとがおおいといわれています。","romaji":"Nihon de wa, nagai jikan hataraku hito ga ooi to iwarete imasu.","id":"Di Jepang dikatakan banyak orang yang bekerja dalam waktu lama."},
   {"jp":"仕事は大切ですが、休むことも同じくらい大切です。","furigana":"しごとはたいせつですが、やすむこともおなじくらいたいせつです。","romaji":"Shigoto wa taisetsu desu ga, yasumu koto mo onaji kurai taisetsu desu.","id":"Pekerjaan itu penting, tetapi beristirahat juga sama pentingnya."},
   {"jp":"十分に休まないと、体も心も疲れてしまいます。","furigana":"じゅうぶんにやすまないと、からだもこころもつかれてしまいます。","romaji":"Juubun ni yasumanai to, karada mo kokoro mo tsukarete shimaimasu.","id":"Jika tidak cukup beristirahat, baik tubuh maupun pikiran akan kelelahan."},
   {"jp":"最近は、家で働ける会社も増えてきました。","furigana":"さいきんは、いえではたらけるかいしゃもふえてきました。","romaji":"Saikin wa, ie de hatarakeru kaisha mo fuete kimashita.","id":"Akhir-akhir ini, perusahaan yang memperbolehkan bekerja dari rumah pun bertambah."},
   {"jp":"自分の時間を大切にすることで、仕事ももっとうまくいきます。","furigana":"じぶんのじかんをたいせつにすることで、しごとももっとうまくいきます。","romaji":"Jibun no jikan o taisetsu ni suru koto de, shigoto mo motto umaku ikimasu.","id":"Dengan menghargai waktu untuk diri sendiri, pekerjaan pun akan berjalan lebih baik."},
   {"jp":"働きすぎず、よく休むことが幸せな生活につながります。","furigana":"はたらきすぎず、よくやすむことがしあわせなせいかつにつながります。","romaji":"Hatarakisugizu, yoku yasumu koto ga shiawase na seikatsu ni tsunagarimasu.","id":"Tidak bekerja berlebihan dan beristirahat dengan baik akan membawa pada kehidupan yang bahagia."}
 ]'::jsonb,
 '[
   {"word":"働く","reading":"はたらく","romaji":"hataraku","meaning":"bekerja"},
   {"word":"休む","reading":"やすむ","romaji":"yasumu","meaning":"beristirahat"},
   {"word":"十分","reading":"じゅうぶん","romaji":"juubun","meaning":"cukup/memadai"},
   {"word":"体","reading":"からだ","romaji":"karada","meaning":"tubuh"},
   {"word":"生活","reading":"せいかつ","romaji":"seikatsu","meaning":"kehidupan"},
   {"word":"幸せ","reading":"しあわせ","romaji":"shiawase","meaning":"bahagia"}
 ]'::jsonb,
 '[
   {"q":"Menurut bacaan, apa yang sama pentingnya dengan pekerjaan?","options":["Uang","Beristirahat","Belajar","Olahraga"],"answer":1,"explanation":"「休むことも同じくらい大切」."},
   {"q":"Apa yang terjadi jika tidak cukup istirahat?","options":["Menjadi kaya","Tubuh dan pikiran kelelahan","Pekerjaan selesai cepat","Tidak terjadi apa-apa"],"answer":1,"explanation":"「体も心も疲れてしまいます」."},
   {"q":"Apa yang bertambah akhir-akhir ini?","options":["Perusahaan yang membolehkan kerja dari rumah","Jam kerja","Jumlah hari libur nasional","Besar gaji"],"answer":0,"explanation":"「家で働ける会社も増えてきました」."}
 ]'::jsonb,
 false);
