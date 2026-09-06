-- 052: 16 kaiwa lepas N1 (daily 5, work 3, hospital 3, biz 2, kaigo 3).
--
-- Tata bahasa N1: ～を余儀なくされる, ～にほかならない, ～かねない, ～に即して,
-- ～ずにはいられない, nominalisasi padat, dan kosakata abstrak (制度, 是正,
-- 尊厳, 収益性). Di level ini pelajar tidak lagi menerima informasi — ia
-- berargumen, menuntut koreksi, dan menimbang nilai yang saling bertabrakan.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO NOTHING.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(5, 'Berdiskusi soal Kebijakan Imigrasi', 'daily',
 '[
  {"speaker":"友人","text":"外国人労働者の受け入れ拡大について、どう思われますか。","reading":"がいこくじんろうどうしゃのうけいれかくだいについて、どうおもわれますか。","romaji":"Gaikokujin roudousha no ukeire kakudai ni tsuite, dou omowaremasu ka.","trans":"Bagaimana pendapat Anda soal perluasan penerimaan pekerja asing?"},
  {"speaker":"アリ","text":"労働力不足への対応としては、避けて通れない政策だと考えています。","reading":"ろうどうりょくぶそくへのたいおうとしては、さけてとおれないせいさくだとかんがえています。","romaji":"Roudouryoku busoku e no taiou toshite wa, sakete toorenai seisaku da to kangaete imasu.","trans":"Sebagai respons atas kekurangan tenaga kerja, saya rasa itu kebijakan yang tak terhindarkan."},
  {"speaker":"友人","text":"ただ、賃金水準が下がるという懸念の声もありますね。","reading":"ただ、ちんぎんすいじゅんがさがるというけねんのこえもありますね。","romaji":"Tada, chingin suijun ga sagaru to iu kenen no koe mo arimasu ne.","trans":"Tapi ada juga suara yang mengkhawatirkan turunnya tingkat upah."},
  {"speaker":"アリ","text":"その懸念は、外国人の存在ではなく制度の設計に起因するものです。","reading":"そのけねんは、がいこくじんのそんざいではなくせいどのせっけいにきいんするものです。","romaji":"Sono kenen wa, gaikokujin no sonzai dewa naku seido no sekkei ni kiin suru mono desu.","trans":"Kekhawatiran itu berakar pada desain sistemnya, bukan pada keberadaan orang asingnya."},
  {"speaker":"友人","text":"と申しますと。","reading":"ともうしますと。","romaji":"To moushimasu to.","trans":"Maksudnya?"},
  {"speaker":"アリ","text":"同一労働同一賃金が徹底されていれば、そもそも生じない問題です。","reading":"どういつろうどうどういつちんぎんがてっていされていれば、そもそもしょうじないもんだいです。","romaji":"Douitsu roudou douitsu chingin ga tettei sarete ireba, somosomo shoujinai mondai desu.","trans":"Kalau prinsip upah sama untuk kerja sama benar-benar ditegakkan, masalah itu tidak akan muncul sejak awal."},
  {"speaker":"友人","text":"なるほど。現実には、そうなっていないということですか。","reading":"なるほど。げんじつには、そうなっていないということですか。","romaji":"Naruhodo. Genjitsu ni wa, sou natte inai to iu koto desu ka.","trans":"Begitu. Jadi kenyataannya belum demikian?"},
  {"speaker":"アリ","text":"転職の自由が制限されている以上、交渉力に差が出るのは必然です。","reading":"てんしょくのじゆうがせいげんされているいじょう、こうしょうりょくにさがでるのはひつぜんです。","romaji":"Tenshoku no jiyuu ga seigen sarete iru ijou, koushouryoku ni sa ga deru no wa hitsuzen desu.","trans":"Selama kebebasan berpindah kerja dibatasi, perbedaan daya tawar itu tak terelakkan."},
  {"speaker":"友人","text":"厳しい指摘ですが、否定はできませんね。","reading":"きびしいしてきですが、ひていはできませんね。","romaji":"Kibishii shiteki desu ga, hitei wa dekimasen ne.","trans":"Kritik yang tajam, tapi tidak bisa saya bantah."},
  {"speaker":"アリ","text":"受け入れの是非よりも、受け入れた後の処遇こそ議論されるべきです。","reading":"うけいれのぜひよりも、うけいれたあとのしょぐうこそぎろんされるべきです。","romaji":"Ukeire no zehi yori mo, ukeireta ato no shoguu koso giron sareru beki desu.","trans":"Yang seharusnya diperdebatkan bukan setuju-tidaknya penerimaan, melainkan perlakuan setelah diterima."},
  {"speaker":"友人","text":"当事者の立場からの意見は、やはり重みが違いますね。","reading":"とうじしゃのたちばからのいけんは、やはりおもみがちがいますね。","romaji":"Toujisha no tachiba kara no iken wa, yahari omomi ga chigaimasu ne.","trans":"Pendapat dari sudut pandang pihak yang mengalaminya memang punya bobot berbeda."},
  {"speaker":"アリ","text":"恐縮です。ただ、これは私個人の見解に過ぎません。","reading":"きょうしゅくです。ただ、これはわたしこじんのけんかいにすぎません。","romaji":"Kyoushuku desu. Tada, kore wa watashi kojin no kenkai ni sugimasen.","trans":"Terima kasih. Namun ini tidak lebih dari pandangan pribadi saya."}
 ]'::jsonb,
 '[
  {"word":"受け入れ","reading":"うけいれ (ukeire)","meaning":"penerimaan (kebijakan menerima pendatang)"},
  {"word":"起因する","reading":"きいんする (kiin suru)","meaning":"berakar pada, disebabkan oleh"},
  {"word":"処遇","reading":"しょぐう (shoguu)","meaning":"perlakuan terhadap pekerja"},
  {"word":"～に過ぎない","reading":"にすぎない (ni suginai)","meaning":"tidak lebih dari ~"}
 ]'::jsonb, false),

(5, 'Menghadapi Sengketa Kontrak Sewa', 'daily',
 '[
  {"speaker":"リナ","text":"退去時の原状回復費用について、納得しかねる点がございます。","reading":"たいきょじのげんじょうかいふくひようについて、なっとくしかねるてんがございます。","romaji":"Taikyoji no genjou kaifuku hiyou ni tsuite, nattoku shikaneru ten ga gozaimasu.","trans":"Soal biaya pemulihan kondisi saat keluar, ada poin yang sulit saya terima."},
  {"speaker":"管理会社","text":"どちらの項目でしょうか。","reading":"どちらのこうもくでしょうか。","romaji":"Dochira no koumoku deshou ka.","trans":"Item yang mana?"},
  {"speaker":"リナ","text":"壁紙の全面張り替え費用が、全額こちらの負担となっております。","reading":"かべがみのぜんめんはりかえひようが、ぜんがくこちらのふたんとなっております。","romaji":"Kabegami no zenmen harikae hiyou ga, zengaku kochira no futan to natte orimasu.","trans":"Biaya penggantian seluruh wallpaper dibebankan sepenuhnya kepada saya."},
  {"speaker":"管理会社","text":"居住に伴う損耗ですので、通常はご負担いただいております。","reading":"きょじゅうにともなうそんもうですので、つうじょうはごふたんいただいております。","romaji":"Kyojuu ni tomonau sonmou desu node, tsuujou wa gofutan itadaite orimasu.","trans":"Karena keausan yang menyertai penghunian, biasanya ditanggung penyewa."},
  {"speaker":"リナ","text":"国土交通省のガイドラインでは、通常損耗は貸主負担とされています。","reading":"こくどこうつうしょうのガイドラインでは、つうじょうそんもうはかしぬしふたんとされています。","romaji":"Kokudo koutsuushou no gaidorain de wa, tsuujou sonmou wa kashinushi futan to sarete imasu.","trans":"Dalam pedoman Kementerian Pertanahan, keausan wajar ditanggung pihak pemilik."},
  {"speaker":"管理会社","text":"……確かに、そのような記載はございます。","reading":"たしかに、そのようなきさいはございます。","romaji":"Tashika ni, sono you na kisai wa gozaimasu.","trans":"Memang, ada ketentuan seperti itu."},
  {"speaker":"リナ","text":"日焼けによる変色は、通常損耗に該当するのではないでしょうか。","reading":"ひやけによるへんしょくは、つうじょうそんもうにがいとうするのではないでしょうか。","romaji":"Hiyake ni yoru henshoku wa, tsuujou sonmou ni gaitou suru no dewa nai deshou ka.","trans":"Bukankah perubahan warna akibat sinar matahari termasuk keausan wajar?"},
  {"speaker":"管理会社","text":"ご指摘の部分については、再度査定させていただきます。","reading":"ごしてきのぶぶんについては、さいどさていさせていただきます。","romaji":"Goshiteki no bubun ni tsuite wa, saido satei sasete itadakimasu.","trans":"Untuk bagian yang Anda tunjukkan, akan kami nilai ulang."},
  {"speaker":"リナ","text":"入居時の写真も保管しております。必要であればご提示します。","reading":"にゅうきょじのしゃしんもほかんしております。ひつようであればごていじします。","romaji":"Nyuukyoji no shashin mo hokan shite orimasu. Hitsuyou de areba goteiji shimasu.","trans":"Saya juga menyimpan foto saat masuk. Kalau perlu, akan saya tunjukkan."},
  {"speaker":"管理会社","text":"それは大変助かります。証拠があれば話が早うございます。","reading":"それはたいへんたすかります。しょうこがあればはなしがはようございます。","romaji":"Sore wa taihen tasukarimasu. Shouko ga areba hanashi ga hayou gozaimasu.","trans":"Itu sangat membantu. Kalau ada bukti, pembicaraan jadi lebih cepat."},
  {"speaker":"リナ","text":"合意に至らない場合は、少額訴訟も視野に入れざるを得ません。","reading":"ごういにいたらないばあいは、しょうがくそしょうもしやにいれざるをえません。","romaji":"Goui ni itaranai baai wa, shougaku soshou mo shiya ni irezaru o emasen.","trans":"Kalau tidak tercapai kesepakatan, saya terpaksa mempertimbangkan gugatan nilai kecil."},
  {"speaker":"管理会社","text":"そこまでには至らぬよう、社内で調整いたします。一週間お時間ください。","reading":"そこまでにはいたらぬよう、しゃないでちょうせいいたします。いっしゅうかんおじかんください。","romaji":"Soko made ni wa itaranu you, shanai de chousei itashimasu. Isshuukan ojikan kudasai.","trans":"Agar tidak sampai ke sana, kami akan sesuaikan secara internal. Beri kami waktu satu minggu."}
 ]'::jsonb,
 '[
  {"word":"原状回復","reading":"げんじょうかいふく (genjou kaifuku)","meaning":"pemulihan kondisi properti seperti semula"},
  {"word":"通常損耗","reading":"つうじょうそんもう (tsuujou sonmou)","meaning":"keausan wajar akibat pemakaian normal"},
  {"word":"該当する","reading":"がいとうする (gaitou suru)","meaning":"termasuk dalam kategori"},
  {"word":"視野に入れる","reading":"しやにいれる (shiya ni ireru)","meaning":"mulai mempertimbangkan sebagai opsi"}
 ]'::jsonb, false),

(5, 'Wawancara Permohonan Naturalisasi', 'daily',
 '[
  {"speaker":"担当官","text":"帰化を志望された動機を、ご自身の言葉でお聞かせください。","reading":"きかをしぼうされたどうきを、ごじしんのことばでおきかせください。","romaji":"Kika o shibou sareta douki o, gojishin no kotoba de okikase kudasai.","trans":"Silakan sampaikan motivasi Anda mengajukan naturalisasi dengan kata-kata Anda sendiri."},
  {"speaker":"ブディ","text":"日本に十二年暮らし、生活の基盤も人間関係もこの国にございます。","reading":"にほんにじゅうにねんくらし、せいかつのきばんもにんげんかんけいもこのくににございます。","romaji":"Nihon ni juuninen kurashi, seikatsu no kiban mo ningen kankei mo kono kuni ni gozaimasu.","trans":"Saya tinggal 12 tahun di Jepang; fondasi hidup dan relasi saya ada di negara ini."},
  {"speaker":"担当官","text":"母国の国籍を離脱することになりますが、ご覚悟はおありですか。","reading":"ぼこくのこくせきをりだつすることになりますが、ごかくごはおありですか。","romaji":"Bokoku no kokuseki o ridatsu suru koto ni narimasu ga, gokakugo wa oari desu ka.","trans":"Anda harus melepas kewarganegaraan negara asal. Apakah sudah siap?"},
  {"speaker":"ブディ","text":"容易な決断ではございませんでした。家族とも長く話し合いました。","reading":"よういなけつだんではございませんでした。かぞくともながくはなしあいました。","romaji":"Youi na ketsudan de wa gozaimasen deshita. Kazoku to mo nagaku hanashiaimashita.","trans":"Itu bukan keputusan yang mudah. Saya berdiskusi panjang dengan keluarga."},
  {"speaker":"担当官","text":"ご家族の理解は得られておりますか。","reading":"ごかぞくのりかいはえられておりますか。","romaji":"Gokazoku no rikai wa erarete orimasu ka.","trans":"Apakah Anda sudah mendapat pengertian dari keluarga?"},
  {"speaker":"ブディ","text":"はい。子どもが日本で育つ以上、法的地位を揃えるべきだという結論に至りました。","reading":"はい。こどもがにほんでそだついじょう、ほうてきちいをそろえるべきだというけつろんにいたりました。","romaji":"Hai. Kodomo ga nihon de sodatsu ijou, houteki chii o soroeru beki da to iu ketsuron ni itarimashita.","trans":"Ya. Karena anak saya tumbuh di Jepang, kami menyimpulkan status hukum sebaiknya diseragamkan."},
  {"speaker":"担当官","text":"納税と年金の履行状況についても確認させていただきます。","reading":"のうぜいとねんきんのりこうじょうきょうについてもかくにんさせていただきます。","romaji":"Nouzei to nenkin no rikou joukyou ni tsuite mo kakunin sasete itadakimasu.","trans":"Kami juga akan memeriksa pemenuhan kewajiban pajak dan pensiun Anda."},
  {"speaker":"ブディ","text":"未納はございません。納付証明はすべて添付しております。","reading":"みのうはございません。のうふしょうめいはすべててんぷしております。","romaji":"Minou wa gozaimasen. Noufu shoumei wa subete tenpu shite orimasu.","trans":"Tidak ada tunggakan. Semua bukti pembayaran sudah saya lampirkan."},
  {"speaker":"担当官","text":"日本語の読み書きについても、簡単な確認をさせていただきます。","reading":"にほんごのよみかきについても、かんたんなかくにんをさせていただきます。","romaji":"Nihongo no yomikaki ni tsuite mo, kantan na kakunin o sasete itadakimasu.","trans":"Kami juga akan melakukan pengecekan sederhana atas kemampuan baca-tulis bahasa Jepang."},
  {"speaker":"ブディ","text":"承知しております。日常業務でも文書を扱っておりますので。","reading":"しょうちしております。にちじょうぎょうむでもぶんしょをあつかっておりますので。","romaji":"Shouchi shite orimasu. Nichijou gyoumu demo bunsho o atsukatte orimasu node.","trans":"Saya memahaminya. Dalam pekerjaan sehari-hari pun saya menangani dokumen."},
  {"speaker":"担当官","text":"審査には一年前後を要します。その間、住所変更は必ずご連絡ください。","reading":"しんさにはいちねんぜんごをようします。そのかん、じゅうしょへんこうはかならずごれんらくください。","romaji":"Shinsa ni wa ichinen zengo o youshimasu. Sono kan, juusho henkou wa kanarazu gorenraku kudasai.","trans":"Pemeriksaan memerlukan sekitar satu tahun. Selama itu, wajib laporkan perubahan alamat."},
  {"speaker":"ブディ","text":"かしこまりました。ご指示に従い、誠実に対応いたします。","reading":"かしこまりました。ごしじにしたがい、せいじつにたいおういたします。","romaji":"Kashikomarimashita. Goshiji ni shitagai, seijitsu ni taiou itashimasu.","trans":"Baik. Saya akan mengikuti arahan Anda dan menanggapinya dengan jujur."}
 ]'::jsonb,
 '[
  {"word":"帰化","reading":"きか (kika)","meaning":"naturalisasi kewarganegaraan"},
  {"word":"離脱","reading":"りだつ (ridatsu)","meaning":"pelepasan, keluar dari"},
  {"word":"履行","reading":"りこう (rikou)","meaning":"pemenuhan kewajiban"},
  {"word":"～を要する","reading":"をようする (o you suru)","meaning":"memerlukan ~"}
 ]'::jsonb, false),

(5, 'Membahas Kesiapan Bencana di Lingkungan', 'daily',
 '[
  {"speaker":"防災担当","text":"本日は、外国人世帯を含めた避難計画の見直しについて伺いたく。","reading":"ほんじつは、がいこくじんせたいをふくめたひなんけいかくのみなおしについてうかがいたく。","romaji":"Honjitsu wa, gaikokujin setai o fukumeta hinan keikaku no minaoshi ni tsuite ukagaitaku.","trans":"Hari ini saya ingin bertanya soal peninjauan rencana evakuasi termasuk rumah tangga asing."},
  {"speaker":"サリ","text":"ありがたいお取り組みです。実は、前回の訓練で課題を感じました。","reading":"ありがたいおとりくみです。じつは、ぜんかいのくんれんでかだいをかんじました。","romaji":"Arigatai otorikumi desu. Jitsu wa, zenkai no kunren de kadai o kanjimashita.","trans":"Ini upaya yang saya hargai. Sebenarnya, pada latihan lalu saya merasakan ada persoalan."},
  {"speaker":"防災担当","text":"率直におっしゃってください。改善に生かします。","reading":"そっちょくにおっしゃってください。かいぜんにいかします。","romaji":"Socchoku ni osshatte kudasai. Kaizen ni ikashimasu.","trans":"Silakan sampaikan terus terang. Akan kami manfaatkan untuk perbaikan."},
  {"speaker":"サリ","text":"放送がすべて日本語で、しかも早口でした。理解が追いつきません。","reading":"ほうそうがすべてにほんごで、しかもはやくちでした。りかいがおいつきません。","romaji":"Housou ga subete nihongo de, shikamo hayakuchi deshita. Rikai ga oitsukimasen.","trans":"Pengumumannya semua bahasa Jepang, dan diucapkan cepat. Pemahaman tidak sempat mengejar."},
  {"speaker":"防災担当","text":"やさしい日本語の導入が検討されておりますが、まだ普及しておりません。","reading":"やさしいにほんごのどうにゅうがけんとうされておりますが、まだふきゅうしておりません。","romaji":"Yasashii nihongo no dounyuu ga kentou sarete orimasu ga, mada fukyuu shite orimasen.","trans":"Penggunaan bahasa Jepang sederhana sedang dipertimbangkan, tapi belum menyebar luas."},
  {"speaker":"サリ","text":"多言語化よりも、やさしい日本語のほうが現実的かと存じます。","reading":"たげんごかよりも、やさしいにほんごのほうがげんじつてきかとぞんじます。","romaji":"Tagengoka yori mo, yasashii nihongo no hou ga genjitsuteki ka to zonjimasu.","trans":"Menurut saya bahasa Jepang sederhana lebih realistis daripada multibahasa."},
  {"speaker":"防災担当","text":"と申しますと、翻訳より簡略化ということでしょうか。","reading":"ともうしますと、ほんやくよりかんりゃくかということでしょうか。","romaji":"To moushimasu to, honyaku yori kanryakuka to iu koto deshou ka.","trans":"Maksudnya, penyederhanaan lebih baik daripada penerjemahan?"},
  {"speaker":"サリ","text":"はい。言語の数だけ増やしても、母語話者以外には届きませんので。","reading":"はい。げんごのかずだけふやしても、ぼごわしゃいがいにはとどきませんので。","romaji":"Hai. Gengo no kazu dake fuyashite mo, bogowasha igai ni wa todokimasen node.","trans":"Ya. Menambah jumlah bahasa saja tidak sampai ke penutur di luar bahasa itu."},
  {"speaker":"防災担当","text":"目から鱗です。ベトナム語を足しても、ネパールの方には無意味ですね。","reading":"めからうろこです。ベトナムごをたしても、ネパールのかたにはむいみですね。","romaji":"Me kara uroko desu. Betonamugo o tashite mo, Nepaaru no kata ni wa muimi desu ne.","trans":"Membuka mata saya. Menambah bahasa Vietnam pun tidak berguna bagi warga Nepal."},
  {"speaker":"サリ","text":"避難所の掲示も、絵記号を併用していただけると助かります。","reading":"ひなんじょのけいじも、えきごうをへいようしていただけるとたすかります。","romaji":"Hinanjo no keiji mo, ekigou o heiyou shite itadakeru to tasukarimasu.","trans":"Papan informasi di tempat pengungsian pun, kalau disertai piktogram, sangat membantu."},
  {"speaker":"防災担当","text":"次回の会議で提案いたします。ご協力いただけますでしょうか。","reading":"じかいのかいぎでていあんいたします。ごきょうりょくいただけますでしょうか。","romaji":"Jikai no kaigi de teian itashimasu. Gokyouryoku itadakemasu deshou ka.","trans":"Akan saya usulkan pada rapat berikutnya. Bisakah Anda bekerja sama?"},
  {"speaker":"サリ","text":"喜んで。当事者が関わらなければ、実効性は生まれませんから。","reading":"よろこんで。とうじしゃがかかわらなければ、じっこうせいはうまれませんから。","romaji":"Yorokonde. Toujisha ga kakawaranakereba, jikkousei wa umaremasen kara.","trans":"Dengan senang hati. Tanpa keterlibatan pihak yang bersangkutan, efektivitasnya tidak akan lahir."}
 ]'::jsonb,
 '[
  {"word":"やさしい日本語","reading":"やさしいにほんご (yasashii nihongo)","meaning":"bahasa Jepang yang disederhanakan untuk penutur asing"},
  {"word":"普及する","reading":"ふきゅうする (fukyuu suru)","meaning":"menyebar luas, memasyarakat"},
  {"word":"目から鱗","reading":"めからうろこ (me kara uroko)","meaning":"tercerahkan, membuka mata"},
  {"word":"実効性","reading":"じっこうせい (jikkousei)","meaning":"efektivitas nyata"}
 ]'::jsonb, false),

(5, 'Melaporkan Perlakuan Diskriminatif', 'daily',
 '[
  {"speaker":"デウィ","text":"不動産の入居申し込みを、国籍を理由に断られました。","reading":"ふどうさんのにゅうきょもうしこみを、こくせきをりゆうにことわられました。","romaji":"Fudousan no nyuukyo moushikomi o, kokuseki o riyuu ni kotowararemashita.","trans":"Permohonan sewa properti saya ditolak dengan alasan kewarganegaraan."},
  {"speaker":"相談員","text":"それは深刻な事案です。断られた際の言葉を覚えていらっしゃいますか。","reading":"それはしんこくなじあんです。ことわられたさいのことばをおぼえていらっしゃいますか。","romaji":"Sore wa shinkoku na jian desu. Kotowareta sai no kotoba o oboete irasshaimasu ka.","trans":"Itu kasus yang serius. Apakah Anda ingat kata-kata saat ditolak?"},
  {"speaker":"デウィ","text":"外国の方はお断りしている、と明確に言われました。録音もございます。","reading":"がいこくのかたはおことわりしている、とめいかくにいわれました。ろくおんもございます。","romaji":"Gaikoku no kata wa okotowari shite iru, to meikaku ni iwaremashita. Rokuon mo gozaimasu.","trans":"Dikatakan dengan jelas bahwa mereka menolak orang asing. Saya juga punya rekamannya."},
  {"speaker":"相談員","text":"証拠があるのは大きいです。日時と担当者名も記録されていますか。","reading":"しょうこがあるのはおおきいです。にちじとたんとうしゃめいもきろくされていますか。","romaji":"Shouko ga aru no wa ookii desu. Nichiji to tantoushamei mo kiroku sarete imasu ka.","trans":"Adanya bukti itu besar artinya. Tanggal, waktu, dan nama petugasnya juga tercatat?"},
  {"speaker":"デウィ","text":"はい、すべて控えております。ただ、争うべきか迷っております。","reading":"はい、すべてひかえております。ただ、あらそうべきかまよっております。","romaji":"Hai, subete hikaete orimasu. Tada, arasou beki ka mayotte orimasu.","trans":"Ya, semuanya saya catat. Hanya saja, saya ragu apakah perlu mempermasalahkannya."},
  {"speaker":"相談員","text":"迷われるお気持ちは分かります。時間も労力も要しますから。","reading":"まよわれるおきもちはわかります。じかんもろうりょくもようしますから。","romaji":"Mayowareru okimochi wa wakarimasu. Jikan mo rouryoku mo youshimasu kara.","trans":"Saya memahami keraguan Anda. Karena memakan waktu maupun tenaga."},
  {"speaker":"デウィ","text":"正直、住む場所を早く見つけたいという思いもございます。","reading":"しょうじき、すむばしょをはやくみつけたいというおもいもございます。","romaji":"Shoujiki, sumu basho o hayaku mitsuketai to iu omoi mo gozaimasu.","trans":"Terus terang, saya juga ingin cepat menemukan tempat tinggal."},
  {"speaker":"相談員","text":"両立は可能です。住まい探しを続けつつ、申し立ても並行できます。","reading":"りょうりつはかのうです。すまいさがしをつづけつつ、もうしたてもへいこうできます。","romaji":"Ryouritsu wa kanou desu. Sumaisagashi o tsuzuketsutsu, moushitate mo heikou dekimasu.","trans":"Keduanya bisa berjalan. Sambil terus mencari rumah, pengaduan bisa diajukan paralel."},
  {"speaker":"デウィ","text":"申し立ては、どちらに行えばよろしいのでしょうか。","reading":"もうしたては、どちらにおこなえばよろしいのでしょうか。","romaji":"Moushitate wa, dochira ni okonaeba yoroshii no deshou ka.","trans":"Pengaduannya diajukan ke mana?"},
  {"speaker":"相談員","text":"法務局の人権擁護部門です。当窓口から同行することも可能です。","reading":"ほうむきょくのじんけんようごぶもんです。とうまどぐちからどうこうすることもかのうです。","romaji":"Houmukyoku no jinken yougo bumon desu. Toumadoguchi kara doukou suru koto mo kanou desu.","trans":"Ke divisi perlindungan HAM di Biro Hukum. Kami dari loket ini juga bisa mendampingi."},
  {"speaker":"デウィ","text":"心強いです。私一人の問題では済まされない気もしております。","reading":"こころづよいです。わたしひとりのもんだいではすまされないきもしております。","romaji":"Kokorozuyoi desu. Watashi hitori no mondai de wa sumasarenai ki mo shite orimasu.","trans":"Saya merasa terkuatkan. Saya juga merasa ini tidak bisa dianggap masalah saya seorang."},
  {"speaker":"相談員","text":"まさにそのとおりです。記録が残ることで、次の方が救われます。","reading":"まさにそのとおりです。きろくがのこることで、つぎのかたがすくわれます。","romaji":"Masa ni sono toori desu. Kiroku ga nokoru koto de, tsugi no kata ga sukuwaremasu.","trans":"Tepat sekali. Dengan adanya catatan, orang berikutnya akan tertolong."}
 ]'::jsonb,
 '[
  {"word":"事案","reading":"じあん (jian)","meaning":"kasus, perkara"},
  {"word":"申し立て","reading":"もうしたて (moushitate)","meaning":"pengaduan resmi"},
  {"word":"人権擁護","reading":"じんけんようご (jinken yougo)","meaning":"perlindungan hak asasi manusia"},
  {"word":"～では済まされない","reading":"ではすまされない (dewa sumasarenai)","meaning":"tidak bisa dianggap selesai hanya dengan ~"}
 ]'::jsonb, false),

(5, 'Bernegosiasi soal Promosi Jabatan', 'work',
 '[
  {"speaker":"アリ","text":"次期の人事について、率直にご相談させていただきたく存じます。","reading":"じきのじんじについて、そっちょくにごそうだんさせていただきたくぞんじます。","romaji":"Jiki no jinji ni tsuite, socchoku ni gosoudan sasete itadakitaku zonjimasu.","trans":"Saya ingin berkonsultasi terus terang soal penempatan periode berikutnya."},
  {"speaker":"部長","text":"どうぞ。君の働きぶりは評価している。","reading":"どうぞ。きみのはたらきぶりはひょうかしている。","romaji":"Douzo. Kimi no hatarakiburi wa hyouka shite iru.","trans":"Silakan. Kinerjamu memang kami nilai baik."},
  {"speaker":"アリ","text":"三年間、チームの実務を統括してまいりました。役職への登用をご検討いただけないでしょうか。","reading":"さんねんかん、チームのじつむをとうかつしてまいりました。やくしょくへのとうようをごけんとういただけないでしょうか。","romaji":"Sannenkan, chiimu no jitsumu o toukatsu shite mairimashita. Yakushoku e no touyou o gokentou itadakenai deshou ka.","trans":"Selama tiga tahun saya mengoordinasikan kerja teknis tim. Bisakah promosi jabatan dipertimbangkan?"},
  {"speaker":"部長","text":"正直に言うと、社内には前例がない。外国籍の管理職はまだいない。","reading":"しょうじきにいうと、しゃないにはぜんれいがない。がいこくせきのかんりしょくはまだいない。","romaji":"Shoujiki ni iu to, shanai ni wa zenrei ga nai. Gaikokuseki no kanrishoku wa mada inai.","trans":"Terus terang, di perusahaan belum ada presedennya. Belum ada manajer berkewarganegaraan asing."},
  {"speaker":"アリ","text":"前例がないことは、能力の不足を意味するものではないと存じます。","reading":"ぜんれいがないことは、のうりょくのふそくをいみするものではないとぞんじます。","romaji":"Zenrei ga nai koto wa, nouryoku no fusoku o imi suru mono dewa nai to zonjimasu.","trans":"Menurut saya, tiadanya preseden tidak berarti kurangnya kemampuan."},
  {"speaker":"部長","text":"もっともだ。私個人としては推したい気持ちがある。","reading":"もっともだ。わたしこじんとしてはおしたいきもちがある。","romaji":"Mottomo da. Watashi kojin toshite wa oshitai kimochi ga aru.","trans":"Benar juga. Secara pribadi saya ingin mendorongmu."},
  {"speaker":"アリ","text":"障壁があるとすれば、具体的に何が課題とされているのでしょうか。","reading":"しょうへきがあるとすれば、ぐたいてきになにがかだいとされているのでしょうか。","romaji":"Shouheki ga aru to sureba, gutaiteki ni nani ga kadai to sarete iru no deshou ka.","trans":"Kalau ada hambatan, secara konkret apa yang dianggap persoalan?"},
  {"speaker":"部長","text":"役員会では、対外的な折衝力を懸念する声がある。","reading":"やくいんかいでは、たいがいてきなせっしょうりょくをけねんするこえがある。","romaji":"Yakuinkai de wa, taigaiteki na sesshouryoku o kenen suru koe ga aru.","trans":"Di rapat direksi ada suara yang mengkhawatirkan kemampuan negosiasi eksternal."},
  {"speaker":"アリ","text":"昨年度、私が主導した取引先三社との条件改定をご確認いただけますか。","reading":"さくねんど、わたしがしゅどうしたとりひきさきさんしゃとのじょうけんかいていをごかくにんいただけますか。","romaji":"Sakunendo, watashi ga shudou shita torihikisaki sansha to no jouken kaitei o gokakunin itadakemasu ka.","trans":"Bisakah Anda mengecek revisi syarat dengan tiga mitra yang saya pimpin tahun lalu?"},
  {"speaker":"部長","text":"あれは君の案件だったか。数字は把握していたが、主導者までは見ていなかった。","reading":"あれはきみのあんけんだったか。すうじははあくしていたが、しゅどうしゃまではみていなかった。","romaji":"Are wa kimi no anken datta ka. Suuji wa haaku shite ita ga, shudousha made wa mite inakatta.","trans":"Itu proyekmu? Saya tahu angkanya, tapi tidak memeriksa siapa yang memimpin."},
  {"speaker":"アリ","text":"評価が実績に即して行われることを、望んでおります。","reading":"ひょうかがじっせきにそくしておこなわれることを、のぞんでおります。","romaji":"Hyouka ga jisseki ni soku shite okonawareru koto o, nozonde orimasu.","trans":"Saya berharap penilaian dilakukan sesuai dengan capaian nyata."},
  {"speaker":"部長","text":"当然の要求だ。資料をまとめてくれ。私が役員会に持ち込む。","reading":"とうぜんのようきゅうだ。しりょうをまとめてくれ。わたしがやくいんかいにもちこむ。","romaji":"Touzen no youkyuu da. Shiryou o matomete kure. Watashi ga yakuinkai ni mochikomu.","trans":"Itu tuntutan yang wajar. Rangkum datanya. Saya yang akan bawa ke rapat direksi."}
 ]'::jsonb,
 '[
  {"word":"登用","reading":"とうよう (touyou)","meaning":"pengangkatan ke posisi lebih tinggi"},
  {"word":"前例","reading":"ぜんれい (zenrei)","meaning":"preseden"},
  {"word":"折衝力","reading":"せっしょうりょく (sesshouryoku)","meaning":"kemampuan bernegosiasi"},
  {"word":"～に即して","reading":"にそくして (ni soku shite)","meaning":"sesuai dengan, berdasarkan pada"}
 ]'::jsonb, false),

(5, 'Melaporkan Dugaan Pelanggaran Ketenagakerjaan', 'work',
 '[
  {"speaker":"ブディ","text":"労働基準監督署にご相談に参りました。残業代の未払いがございます。","reading":"ろうどうきじゅんかんとくしょにごそうだんにまいりました。ざんぎょうだいのみばらいがございます。","romaji":"Roudou kijun kantokusho ni gosoudan ni mairimashita. Zangyoudai no mibarai ga gozaimasu.","trans":"Saya datang berkonsultasi ke kantor pengawas ketenagakerjaan. Ada upah lembur yang belum dibayar."},
  {"speaker":"監督官","text":"詳しく伺います。実労働時間を記録したものはございますか。","reading":"くわしくうかがいます。じつろうどうじかんをきろくしたものはございますか。","romaji":"Kuwashiku ukagaimasu. Jitsu roudou jikan o kiroku shita mono wa gozaimasu ka.","trans":"Saya akan mendengarkan detailnya. Apakah ada catatan jam kerja sebenarnya?"},
  {"speaker":"ブディ","text":"タイムカードは定時で押させられ、その後も二時間働かされておりました。","reading":"タイムカードはていじでおさせられ、そのあともにじかんはたらかされておりました。","romaji":"Taimu kaado wa teiji de osaserare, sono ato mo nijikan hatarakasarete orimashita.","trans":"Saya disuruh absen pada jam pulang resmi, lalu tetap dipekerjakan dua jam lagi."},
  {"speaker":"監督官","text":"それが事実であれば、労働基準法違反にあたります。","reading":"それがじじつであれば、ろうどうきじゅんほういはんにあたります。","romaji":"Sore ga jijitsu de areba, roudou kijunhou ihan ni atarimasu.","trans":"Kalau itu benar, hal tersebut termasuk pelanggaran Undang-Undang Standar Ketenagakerjaan."},
  {"speaker":"ブディ","text":"証明する手立てがないのが悩みでした。","reading":"しょうめいするてだてがないのがなやみでした。","romaji":"Shoumei suru tedate ga nai no ga nayami deshita.","trans":"Yang menjadi kesulitan saya adalah tidak ada cara membuktikannya."},
  {"speaker":"監督官","text":"退勤時刻の記録は、携帯の位置情報や交通系ICの履歴でも代替できます。","reading":"たいきんじこくのきろくは、けいたいのいちじょうほうやこうつうけいアイシーのりれきでもだいたいできます。","romaji":"Taikin jikoku no kiroku wa, keitai no ichi jouhou ya koutsuukei aishii no rireki demo daitai dekimasu.","trans":"Catatan jam pulang bisa digantikan data lokasi ponsel atau riwayat kartu transportasi."},
  {"speaker":"ブディ","text":"それは存じませんでした。二年分は残っているはずです。","reading":"それはぞんじませんでした。にねんぶんはのこっているはずです。","romaji":"Sore wa zonjimasen deshita. Ninenbun wa nokotte iru hazu desu.","trans":"Saya tidak tahu itu. Seharusnya data dua tahun masih tersimpan."},
  {"speaker":"監督官","text":"十分です。未払い賃金の請求権は三年間有効ですので。","reading":"じゅうぶんです。みばらいちんぎんのせいきゅうけんはさんねんかんゆうこうですので。","romaji":"Juubun desu. Mibarai chingin no seikyuuken wa sannenkan yuukou desu node.","trans":"Itu cukup. Hak menuntut upah tertunggak berlaku selama tiga tahun."},
  {"speaker":"ブディ","text":"申告したことが会社に知られ、報復を受けることはないでしょうか。","reading":"しんこくしたことがかいしゃにしられ、ほうふくをうけることはないでしょうか。","romaji":"Shinkoku shita koto ga kaisha ni shirare, houfuku o ukeru koto wa nai deshou ka.","trans":"Apakah tidak akan ada pembalasan bila perusahaan tahu saya melapor?"},
  {"speaker":"監督官","text":"申告を理由とする不利益取扱いは、法律で明確に禁じられています。","reading":"しんこくをりゆうとするふりえきとりあつかいは、ほうりつでめいかくにきんじられています。","romaji":"Shinkoku o riyuu to suru furieki toriatsukai wa, houritsu de meikaku ni kinjirarete imasu.","trans":"Perlakuan merugikan karena pelaporan dilarang tegas oleh undang-undang."},
  {"speaker":"ブディ","text":"それでも、在留資格が絡む立場としては不安が残ります。","reading":"それでも、ざいりゅうしかくがからむたちばとしてはふあんがのこります。","romaji":"Soredemo, zairyuu shikaku ga karamu tachiba toshite wa fuan ga nokorimasu.","trans":"Meski begitu, sebagai orang yang status tinggalnya terkait, kecemasan tetap ada."},
  {"speaker":"監督官","text":"ごもっともです。匿名での情報提供という形から始めることも可能です。","reading":"ごもっともです。とくめいでのじょうほうていきょうというかたちからはじめることもかのうです。","romaji":"Gomottomo desu. Tokumei de no jouhou teikyou to iu katachi kara hajimeru koto mo kanou desu.","trans":"Sangat wajar. Bisa juga dimulai dari bentuk pemberian informasi secara anonim."}
 ]'::jsonb,
 '[
  {"word":"労働基準監督署","reading":"ろうどうきじゅんかんとくしょ (roudou kijun kantokusho)","meaning":"kantor pengawas standar ketenagakerjaan"},
  {"word":"未払い","reading":"みばらい (mibarai)","meaning":"belum dibayarkan"},
  {"word":"不利益取扱い","reading":"ふりえきとりあつかい (furieki toriatsukai)","meaning":"perlakuan merugikan sebagai pembalasan"},
  {"word":"匿名","reading":"とくめい (tokumei)","meaning":"anonim"}
 ]'::jsonb, false),

(5, 'Memimpin Rapat Evaluasi Kinerja', 'work',
 '[
  {"speaker":"リナ","text":"本日は下半期の評価面談です。まずご自身の総括からお願いします。","reading":"ほんじつはしもはんきのひょうかめんだんです。まずごじしんのそうかつからおねがいします。","romaji":"Honjitsu wa shimohanki no hyouka mendan desu. Mazu gojishin no soukatsu kara onegai shimasu.","trans":"Hari ini wawancara evaluasi semester dua. Silakan mulai dari rangkuman diri Anda."},
  {"speaker":"部下","text":"目標であった新規開拓は、十五件のうち九件にとどまりました。","reading":"もくひょうであったしんきかいたくは、じゅうごけんのうちきゅうけんにとどまりました。","romaji":"Mokuhyou de atta shinki kaitaku wa, juugoken no uchi kyuuken ni todomarimashita.","trans":"Target perluasan klien baru hanya tercapai sembilan dari lima belas."},
  {"speaker":"リナ","text":"未達の要因を、ご自身ではどう分析されていますか。","reading":"みたつのよういんを、ごじしんではどうぶんせきされていますか。","romaji":"Mitatsu no youin o, gojishin de wa dou bunseki sarete imasu ka.","trans":"Faktor tidak tercapainya, bagaimana Anda menganalisisnya sendiri?"},
  {"speaker":"部下","text":"訪問件数を優先するあまり、事前準備が疎かになったと考えております。","reading":"ほうもんけんすうをゆうせんするあまり、じぜんじゅんびがおろそかになったとかんがえております。","romaji":"Houmon kensuu o yuusen suru amari, jizen junbi ga orosoka ni natta to kangaete orimasu.","trans":"Karena terlalu mengutamakan jumlah kunjungan, persiapan awal jadi terabaikan."},
  {"speaker":"リナ","text":"自己分析としては的確です。ただ、私の見立ては少し異なります。","reading":"じこぶんせきとしてはてきかくです。ただ、わたしのみたてはすこしことなります。","romaji":"Jiko bunseki toshite wa tekikaku desu. Tada, watashi no mitate wa sukoshi kotonarimasu.","trans":"Sebagai analisis diri itu tepat. Namun penilaian saya sedikit berbeda."},
  {"speaker":"部下","text":"お聞かせください。","reading":"おきかせください。","romaji":"Okikase kudasai.","trans":"Silakan sampaikan."},
  {"speaker":"リナ","text":"目標設定そのものが、市場環境に照らして過大だった可能性があります。","reading":"もくひょうせっていそのものが、しじょうかんきょうにてらしてかだいだったかのうせいがあります。","romaji":"Mokuhyou settei sono mono ga, shijou kankyou ni terashite kadai datta kanousei ga arimasu.","trans":"Ada kemungkinan penetapan targetnya sendiri terlalu besar bila dilihat dari kondisi pasar."},
  {"speaker":"部下","text":"そのように言っていただけるとは思いませんでした。","reading":"そのようにいっていただけるとはおもいませんでした。","romaji":"Sono you ni itte itadakeru to wa omoimasen deshita.","trans":"Saya tidak menyangka Anda akan mengatakan hal itu."},
  {"speaker":"リナ","text":"未達を個人の責任に還元してしまうのは、管理者の怠慢にほかなりません。","reading":"みたつをこじんのせきにんにかんげんしてしまうのは、かんりしゃのたいまんにほかなりません。","romaji":"Mitatsu o kojin no sekinin ni kangen shite shimau no wa, kanrisha no taiman ni hoka narimasen.","trans":"Mengembalikan kegagalan target sepenuhnya ke tanggung jawab individu tak lain adalah kelalaian manajer."},
  {"speaker":"部下","text":"来期は、どのように設定すべきとお考えでしょうか。","reading":"らいきは、どのようにせっていすべきとおかんがえでしょうか。","romaji":"Raiki wa, dono you ni settei subeki to okangae deshou ka.","trans":"Untuk periode depan, menurut Anda bagaimana sebaiknya ditetapkan?"},
  {"speaker":"リナ","text":"件数ではなく、成約率と継続率を指標に据えたいと考えています。","reading":"けんすうではなく、せいやくりつとけいぞくりつをしひょうにすえたいとかんがえています。","romaji":"Kensuu dewa naku, seiyakuritsu to keizokuritsu o shihyou ni suetai to kangaete imasu.","trans":"Saya ingin menjadikan tingkat penutupan dan retensi sebagai indikator, bukan jumlah kunjungan."},
  {"speaker":"部下","text":"それであれば、準備に時間をかける意義が評価に反映されます。","reading":"それであれば、じゅんびにじかんをかけるいぎがひょうかにはんえいされます。","romaji":"Sore de areba, junbi ni jikan o kakeru igi ga hyouka ni han-ei saremasu.","trans":"Kalau begitu, nilai dari meluangkan waktu untuk persiapan akan tercermin dalam penilaian."}
 ]'::jsonb,
 '[
  {"word":"総括","reading":"そうかつ (soukatsu)","meaning":"rangkuman evaluatif"},
  {"word":"疎か","reading":"おろそか (orosoka)","meaning":"terabaikan, dilalaikan"},
  {"word":"～にほかならない","reading":"にほかならない (ni hoka naranai)","meaning":"tak lain adalah ~"},
  {"word":"指標","reading":"しひょう (shihyou)","meaning":"indikator"}
 ]'::jsonb, false),

(5, 'Persetujuan Tindakan Sebelum Operasi', 'hospital',
 '[
  {"speaker":"医師","text":"手術に先立ち、内容とリスクをご説明いたします。","reading":"しゅじゅつにさきだち、ないようとリスクをごせつめいいたします。","romaji":"Shujutsu ni sakidachi, naiyou to risuku o gosetsumei itashimasu.","trans":"Sebelum operasi, saya akan menjelaskan isi tindakan dan risikonya."},
  {"speaker":"サリ","text":"よろしくお願いいたします。専門用語は噛み砕いていただけますと幸いです。","reading":"よろしくおねがいいたします。せんもんようごはかみくだいていただけますとさいわいです。","romaji":"Yoroshiku onegai itashimasu. Senmon yougo wa kamikudaite itadakemasu to saiwai desu.","trans":"Mohon bantuannya. Saya akan berterima kasih bila istilah teknisnya disederhanakan."},
  {"speaker":"医師","text":"承知しました。全身麻酔を用い、腹部に小さな穴を三か所開けます。","reading":"しょうちしました。ぜんしんますいをもちい、ふくぶにちいさなあなをさんかしょあけます。","romaji":"Shouchi shimashita. Zenshin masui o mochii, fukubu ni chiisana ana o sankasho akemasu.","trans":"Baik. Dengan bius total, kami membuat tiga lubang kecil di bagian perut."},
  {"speaker":"サリ","text":"開腹する方法と比べて、どのような利点がございますか。","reading":"かいふくするほうほうとくらべて、どのようなりてんがございますか。","romaji":"Kaifuku suru houhou to kurabete, dono you na riten ga gozaimasu ka.","trans":"Dibanding metode bedah terbuka, apa kelebihannya?"},
  {"speaker":"医師","text":"傷が小さく、回復が早い点です。ただし、途中で開腹に切り替える可能性もあります。","reading":"きずがちいさく、かいふくがはやいてんです。ただし、とちゅうでかいふくにきりかえるかのうせいもあります。","romaji":"Kizu ga chiisaku, kaifuku ga hayai ten desu. Tadashi, tochuu de kaifuku ni kirikaeru kanousei mo arimasu.","trans":"Lukanya kecil dan pemulihannya cepat. Namun ada kemungkinan beralih ke bedah terbuka di tengah tindakan."},
  {"speaker":"サリ","text":"その判断は、私の同意なく行われるということでしょうか。","reading":"そのはんだんは、わたしのどういなくおこなわれるということでしょうか。","romaji":"Sono handan wa, watashi no doui naku okonawareru to iu koto deshou ka.","trans":"Apakah keputusan itu dilakukan tanpa persetujuan saya?"},
  {"speaker":"医師","text":"はい。麻酔下では確認が取れないため、本日の同意書に含めております。","reading":"はい。ますいかではかくにんがとれないため、ほんじつのどういしょにふくめております。","romaji":"Hai. Masuika de wa kakunin ga torenai tame, honjitsu no douisho ni fukumete orimasu.","trans":"Ya. Karena tidak bisa dikonfirmasi dalam kondisi terbius, hal itu tercakup dalam surat persetujuan hari ini."},
  {"speaker":"サリ","text":"承知しました。合併症が生じる確率は、どの程度でしょうか。","reading":"しょうちしました。がっぺいしょうがしょうじるかくりつは、どのていどでしょうか。","romaji":"Shouchi shimashita. Gappeishou ga shoujiru kakuritsu wa, dono teido deshou ka.","trans":"Saya mengerti. Berapa probabilitas terjadinya komplikasi?"},
  {"speaker":"医師","text":"出血や感染が約二パーセント、重篤なものは〇・一パーセント未満です。","reading":"しゅっけつやかんせんがやくにパーセント、じゅうとくなものはれいてんいちパーセントみまんです。","romaji":"Shukketsu ya kansen ga yaku nipaasento, juutoku na mono wa reiten-ichi paasento miman desu.","trans":"Pendarahan atau infeksi sekitar dua persen, yang berat di bawah 0,1 persen."},
  {"speaker":"サリ","text":"数字でお示しいただけると、判断がしやすくなります。","reading":"すうじでおしめしいただけると、はんだんがしやすくなります。","romaji":"Suuji de oshimeshi itadakeru to, handan ga shiyasuku narimasu.","trans":"Kalau ditunjukkan dengan angka, saya jadi lebih mudah memutuskan."},
  {"speaker":"医師","text":"本日ご署名いただく必要はありません。お持ち帰りいただいて結構です。","reading":"ほんじつごしょめいいただくひつようはありません。おもちかえりいただいてけっこうです。","romaji":"Honjitsu goshomei itadaku hitsuyou wa arimasen. Omochikaeri itadaite kekkou desu.","trans":"Anda tidak perlu menandatangani hari ini. Silakan dibawa pulang dulu."},
  {"speaker":"サリ","text":"ありがとうございます。家族と読み合わせた上で、改めてご連絡いたします。","reading":"ありがとうございます。かぞくとよみあわせたうえで、あらためてごれんらくいたします。","romaji":"Arigatou gozaimasu. Kazoku to yomiawaseta ue de, aratamete gorenraku itashimasu.","trans":"Terima kasih. Setelah membacanya bersama keluarga, saya akan menghubungi kembali."}
 ]'::jsonb,
 '[
  {"word":"～に先立ち","reading":"にさきだち (ni sakidachi)","meaning":"mendahului ~, sebelum ~"},
  {"word":"噛み砕く","reading":"かみくだく (kamikudaku)","meaning":"menyederhanakan penjelasan"},
  {"word":"同意書","reading":"どういしょ (douisho)","meaning":"surat persetujuan tindakan"},
  {"word":"重篤","reading":"じゅうとく (juutoku)","meaning":"berat, kritis (kondisi medis)"}
 ]'::jsonb, false),

(5, 'Berdiskusi soal Etika Perawatan Akhir Hayat', 'hospital',
 '[
  {"speaker":"医師","text":"延命処置を継続するか否か、ご家族のご意向を伺わねばなりません。","reading":"えんめいしょちをけいぞくするかいなか、ごかぞくのごいこうをうかがわねばなりません。","romaji":"Enmei shochi o keizoku suru ka ina ka, gokazoku no goikou o ukagawaneba narimasen.","trans":"Kami harus menanyakan kehendak keluarga: melanjutkan tindakan penyambung hidup atau tidak."},
  {"speaker":"家族","text":"重い問いですね。父本人の意思は、確認しようがありません。","reading":"おもいといですね。ちちほんにんのいしは、かくにんしようがありません。","romaji":"Omoi toi desu ne. Chichi honnin no ishi wa, kakunin shiyou ga arimasen.","trans":"Pertanyaan yang berat. Kehendak ayah saya sendiri tidak mungkin dipastikan lagi."},
  {"speaker":"医師","text":"事前指示書やご生前のご発言など、手がかりはございませんか。","reading":"じぜんしじしょやごせいぜんのごはつげんなど、てがかりはございませんか。","romaji":"Jizen shijisho ya goseizen no gohatsugen nado, tegakari wa gozaimasen ka.","trans":"Apakah ada petunjuk seperti wasiat medis atau ucapan beliau semasa sadar?"},
  {"speaker":"家族","text":"管につながれてまで生きたくはない、と申しておりました。","reading":"くだにつながれてまでいきたくはない、ともうしておりました。","romaji":"Kuda ni tsunagarete made ikitaku wa nai, to moushite orimashita.","trans":"Beliau pernah berkata tidak ingin hidup sampai harus tersambung selang."},
  {"speaker":"医師","text":"それは重要なご証言です。ただ、文書として残ってはおりませんね。","reading":"それはじゅうようなごしょうげんです。ただ、ぶんしょとしてのこってはおりませんね。","romaji":"Sore wa juuyou na goshougen desu. Tada, bunsho toshite nokotte wa orimasen ne.","trans":"Itu kesaksian penting. Namun tidak tersimpan dalam bentuk dokumen ya."},
  {"speaker":"家族","text":"はい。私の記憶に頼るほかありません。それが心苦しいのです。","reading":"はい。わたしのきおくにたよるほかありません。それがこころぐるしいのです。","romaji":"Hai. Watashi no kioku ni tayoru hoka arimasen. Sore ga kokorogurushii no desu.","trans":"Ya. Tidak ada pilihan selain bersandar pada ingatan saya. Itulah yang menyiksa batin."},
  {"speaker":"医師","text":"ご負担をお一人で背負われる必要はございません。","reading":"ごふたんをおひとりでせおわれるひつようはございません。","romaji":"Gofutan o ohitori de seowareru hitsuyou wa gozaimasen.","trans":"Anda tidak perlu memikul beban itu seorang diri."},
  {"speaker":"家族","text":"と申しますと。","reading":"ともうしますと。","romaji":"To moushimasu to.","trans":"Maksudnya?"},
  {"speaker":"医師","text":"多職種で構成される倫理委員会に諮ることができます。","reading":"たしょくしゅでこうせいされるりんりいいんかいにはかることができます。","romaji":"Tashokushu de kousei sareru rinri iinkai ni hakaru koto ga dekimasu.","trans":"Kami bisa membawanya ke komite etik yang terdiri dari berbagai profesi."},
  {"speaker":"家族","text":"決定を委ねるということでしょうか。","reading":"けっていをゆだねるということでしょうか。","romaji":"Kettei o yudaneru to iu koto deshou ka.","trans":"Apakah artinya menyerahkan keputusannya?"},
  {"speaker":"医師","text":"いいえ。決定権はご家族にあります。判断の妥当性を共に検証する場です。","reading":"いいえ。けっていけんはごかぞくにあります。はんだんのだとうせいをともにけんしょうするばです。","romaji":"Iie. Ketteiken wa gokazoku ni arimasu. Handan no datousei o tomo ni kenshou suru ba desu.","trans":"Tidak. Hak memutuskan tetap pada keluarga. Itu forum untuk menguji kelayakan penilaian bersama."},
  {"speaker":"家族","text":"それであれば、お願いしたく存じます。一人では抱えきれません。","reading":"それであれば、おねがいしたくぞんじます。ひとりではかかえきれません。","romaji":"Sore de areba, onegai shitaku zonjimasu. Hitori de wa kakaekiremasen.","trans":"Kalau begitu, saya mohon dilakukan. Sendirian saya tidak sanggup menanggungnya."}
 ]'::jsonb,
 '[
  {"word":"延命処置","reading":"えんめいしょち (enmei shochi)","meaning":"tindakan memperpanjang hidup"},
  {"word":"事前指示書","reading":"じぜんしじしょ (jizen shijisho)","meaning":"wasiat medis yang dibuat sebelumnya"},
  {"word":"倫理委員会","reading":"りんりいいんかい (rinri iinkai)","meaning":"komite etik"},
  {"word":"妥当性","reading":"だとうせい (datousei)","meaning":"kelayakan, kepatutan"}
 ]'::jsonb, false),

(5, 'Meminta Pendapat Kedua', 'hospital',
 '[
  {"speaker":"アリ","text":"申し上げにくいのですが、セカンドオピニオンを希望しております。","reading":"もうしあげにくいのですが、セカンドオピニオンをきぼうしております。","romaji":"Moushiage nikui no desu ga, sekando opinion o kibou shite orimasu.","trans":"Sulit saya sampaikan, tapi saya ingin meminta pendapat kedua."},
  {"speaker":"医師","text":"当然のご希望です。遠慮なさる必要はまったくございません。","reading":"とうぜんのごきぼうです。えんりょなさるひつようはまったくございません。","romaji":"Touzen no gokibou desu. Enryo nasaru hitsuyou wa mattaku gozaimasen.","trans":"Itu keinginan yang wajar. Sama sekali tidak perlu sungkan."},
  {"speaker":"アリ","text":"先生の診断を疑っているわけではございません。","reading":"せんせいのしんだんをうたがっているわけではございません。","romaji":"Sensei no shindan o utagatte iru wake dewa gozaimasen.","trans":"Bukan berarti saya meragukan diagnosis Anda."},
  {"speaker":"医師","text":"承知しております。重い決断ほど、複数の視点があったほうがよい。","reading":"しょうちしております。おもいけつだんほど、ふくすうのしてんがあったほうがよい。","romaji":"Shouchi shite orimasu. Omoi ketsudan hodo, fukusuu no shiten ga atta hou ga yoi.","trans":"Saya memahaminya. Makin berat keputusannya, makin baik ada beberapa sudut pandang."},
  {"speaker":"アリ","text":"そう言っていただけて、正直ほっとしております。","reading":"そういっていただけて、しょうじきほっとしております。","romaji":"Sou itte itadakete, shoujiki hotto shite orimasu.","trans":"Terus terang saya lega mendengar Anda berkata begitu."},
  {"speaker":"医師","text":"紹介状と検査データ一式をご用意します。二度手間を省くためです。","reading":"しょうかいじょうとけんさデータいっしきをごよういします。にどでまをはぶくためです。","romaji":"Shoukaijou to kensa deeta isshiki o goyoui shimasu. Nidodema o habuku tame desu.","trans":"Saya siapkan surat rujukan dan seluruh data pemeriksaan. Agar tidak ada pemeriksaan ulang yang sia-sia."},
  {"speaker":"アリ","text":"検査をやり直さずに済むのですか。","reading":"けんさをやりなおさずにすむのですか。","romaji":"Kensa o yarinaosazu ni sumu no desu ka.","trans":"Jadi tidak perlu mengulang pemeriksaan?"},
  {"speaker":"医師","text":"画像データがあれば、多くは再撮影の必要がありません。","reading":"がぞうデータがあれば、おおくはさいさつえいのひつようがありません。","romaji":"Gazou deeta ga areba, ooku wa saisatsuei no hitsuyou ga arimasen.","trans":"Kalau ada data pencitraan, sebagian besar tidak perlu difoto ulang."},
  {"speaker":"アリ","text":"費用面でも助かります。どちらの病院がよろしいでしょうか。","reading":"ひようめんでもたすかります。どちらのびょういんがよろしいでしょうか。","romaji":"Hiyoumen demo tasukarimasu. Dochira no byouin ga yoroshii deshou ka.","trans":"Dari sisi biaya pun membantu. Rumah sakit mana yang sebaiknya saya tuju?"},
  {"speaker":"医師","text":"私から特定の施設を推すのは、中立性を欠きます。候補を三つお示しします。","reading":"わたしからとくていのしせつをおすのは、ちゅうりつせいをかきます。こうほをみっつおしめしします。","romaji":"Watashi kara tokutei no shisetsu o osu no wa, chuuritsusei o kakimasu. Kouho o mittsu oshimeshi shimasu.","trans":"Kalau saya mendorong satu fasilitas tertentu, itu kehilangan netralitas. Saya tunjukkan tiga kandidat."},
  {"speaker":"アリ","text":"ご配慮に感謝いたします。結果は先生にもお伝えすべきでしょうか。","reading":"ごはいりょにかんしゃいたします。けっかはせんせいにもおつたえすべきでしょうか。","romaji":"Gohairyo ni kansha itashimasu. Kekka wa sensei ni mo otsutae subeki deshou ka.","trans":"Saya menghargai pertimbangan Anda. Haruskah hasilnya juga saya sampaikan kepada Anda?"},
  {"speaker":"医師","text":"ぜひお願いします。異なる見解こそ、私の学びになりますので。","reading":"ぜひおねがいします。ことなるけんかいこそ、わたしのまなびになりますので。","romaji":"Zehi onegai shimasu. Kotonaru kenkai koso, watashi no manabi ni narimasu node.","trans":"Sangat saya harapkan. Justru pandangan yang berbeda itulah yang menjadi pembelajaran bagi saya."}
 ]'::jsonb,
 '[
  {"word":"セカンドオピニオン","reading":"sekando opinion","meaning":"pendapat kedua dari dokter lain"},
  {"word":"中立性","reading":"ちゅうりつせい (chuuritsusei)","meaning":"netralitas"},
  {"word":"見解","reading":"けんかい (kenkai)","meaning":"pandangan, penilaian profesional"},
  {"word":"～を欠く","reading":"をかく (o kaku)","meaning":"kehilangan ~, tidak memiliki ~"}
 ]'::jsonb, false),

(5, 'Presentasi Kinerja Kuartal ke Investor', 'biz',
 '[
  {"speaker":"リナ","text":"第三四半期の業績についてご報告いたします。売上は前年比八パーセント増です。","reading":"だいさんしはんきのぎょうせきについてごほうこくいたします。うりあげはぜんねんひはちパーセントぞうです。","romaji":"Daisan shihanki no gyouseki ni tsuite gohoukoku itashimasu. Uriage wa zennenhi hachipaasento zou desu.","trans":"Saya laporkan kinerja kuartal ketiga. Penjualan naik delapan persen dibanding tahun lalu."},
  {"speaker":"投資家","text":"増収は結構ですが、利益率が低下している点をどう説明されますか。","reading":"ぞうしゅうはけっこうですが、りえきりつがていかしているてんをどうせつめいされますか。","romaji":"Zoushuu wa kekkou desu ga, riekiritsu ga teika shite iru ten o dou setsumei saremasu ka.","trans":"Kenaikan pendapatan bagus, tapi bagaimana Anda menjelaskan turunnya margin laba?"},
  {"speaker":"リナ","text":"ご指摘のとおりです。人件費と原材料費の上昇を吸収しきれておりません。","reading":"ごしてきのとおりです。じんけんひとげんざいりょうひのじょうしょうをきゅうしゅうしきれておりません。","romaji":"Goshiteki no toori desu. Jinkenhi to genzairyouhi no joushou o kyuushuu shikirete orimasen.","trans":"Seperti yang Anda tunjukkan. Kami belum sepenuhnya menyerap kenaikan biaya tenaga kerja dan bahan baku."},
  {"speaker":"投資家","text":"価格転嫁は検討されなかったのですか。","reading":"かかくてんかはけんとうされなかったのですか。","romaji":"Kakaku tenka wa kentou sarenakatta no desu ka.","trans":"Apakah pengalihan biaya ke harga jual tidak dipertimbangkan?"},
  {"speaker":"リナ","text":"段階的に実施しております。ただ、急激な値上げは顧客離れを招きかねません。","reading":"だんかいてきにじっしております。ただ、きゅうげきなねあげはこきゃくばなれをまねきかねません。","romaji":"Dankaiteki ni jisshi shite orimasu. Tada, kyuugeki na neage wa kokyakubanare o maneki kanemasen.","trans":"Kami lakukan bertahap. Namun kenaikan drastis berisiko memicu kaburnya pelanggan."},
  {"speaker":"投資家","text":"短期の収益性と長期の顧客基盤、どちらを優先されるのですか。","reading":"たんきのしゅうえきせいとちょうきのこきゃくきばん、どちらをゆうせんされるのですか。","romaji":"Tanki no shuuekisei to chouki no kokyaku kiban, dochira o yuusen sareru no desu ka.","trans":"Profitabilitas jangka pendek atau basis pelanggan jangka panjang, mana yang Anda prioritaskan?"},
  {"speaker":"リナ","text":"後者です。ただし、それは収益を軽視するという意味ではございません。","reading":"こうしゃです。ただし、それはしゅうえきをけいしするといういみではございません。","romaji":"Kousha desu. Tadashi, sore wa shuueki o keishi suru to iu imi dewa gozaimasen.","trans":"Yang kedua. Namun itu tidak berarti kami memandang enteng profitabilitas."},
  {"speaker":"投資家","text":"では、どのように両立を図られるのでしょうか。","reading":"では、どのようにりょうりつをはかられるのでしょうか。","romaji":"Dewa, dono you ni ryouritsu o hakarareru no deshou ka.","trans":"Lalu bagaimana Anda mengupayakan keduanya berjalan bersama?"},
  {"speaker":"リナ","text":"高付加価値帯へ製品構成を移し、値上げではなく単価を上げる方針です。","reading":"こうふかかちたいへせいひんこうせいをうつし、ねあげではなくたんかをあげるほうしんです。","romaji":"Koufukakachitai e seihin kousei o utsushi, neage dewa naku tanka o ageru houshin desu.","trans":"Kebijakannya menggeser komposisi produk ke segmen bernilai tambah tinggi, menaikkan harga satuan alih-alih menaikkan harga."},
  {"speaker":"投資家","text":"なるほど。その転換には、どの程度の期間を見込んでおられますか。","reading":"なるほど。そのてんかんには、どのていどのきかんをみこんでおられますか。","romaji":"Naruhodo. Sono tenkan ni wa, dono teido no kikan o mikonde oraremasu ka.","trans":"Begitu. Anda memperkirakan peralihan itu memakan waktu berapa lama?"},
  {"speaker":"リナ","text":"二年です。来期に中間指標をお示しし、進捗を検証いただく予定です。","reading":"にねんです。らいきにちゅうかんしひょうをおしめしし、しんちょくをけんしょういただくよていです。","romaji":"Ninen desu. Raiki ni chuukan shihyou o oshimeshi shi, shinchoku o kenshou itadaku yotei desu.","trans":"Dua tahun. Periode depan kami akan menunjukkan indikator antara agar kemajuannya bisa Anda uji."},
  {"speaker":"投資家","text":"検証可能な形で提示される姿勢は評価いたします。","reading":"けんしょうかのうなかたちでていじされるしせいはひょうかいたします。","romaji":"Kenshou kanou na katachi de teiji sareru shisei wa hyouka itashimasu.","trans":"Saya menghargai sikap Anda menyajikannya dalam bentuk yang bisa diverifikasi."}
 ]'::jsonb,
 '[
  {"word":"利益率","reading":"りえきりつ (riekiritsu)","meaning":"margin laba"},
  {"word":"価格転嫁","reading":"かかくてんか (kakaku tenka)","meaning":"pengalihan kenaikan biaya ke harga jual"},
  {"word":"～かねない","reading":"kanenai","meaning":"berisiko menjadi ~ (hal buruk)"},
  {"word":"収益性","reading":"しゅうえきせい (shuuekisei)","meaning":"profitabilitas"}
 ]'::jsonb, false),

(5, 'Menyusun Ulang Perjanjian Kerja Sama', 'biz',
 '[
  {"speaker":"アリ","text":"現行の業務提携契約について、抜本的な見直しを提案いたします。","reading":"げんこうのぎょうむていけいけいやくについて、ばっぽんてきなみなおしをていあんいたします。","romaji":"Genkou no gyoumu teikei keiyaku ni tsuite, bapponteki na minaoshi o teian itashimasu.","trans":"Saya mengusulkan peninjauan mendasar atas perjanjian kemitraan yang berlaku."},
  {"speaker":"相手企業","text":"抜本的とは、穏やかではありませんね。何が問題でしょうか。","reading":"ばっぽんてきとは、おだやかではありませんね。なにがもんだいでしょうか。","romaji":"Bapponteki to wa, odayaka dewa arimasen ne. Nani ga mondai deshou ka.","trans":"Mendasar, itu bukan kata yang menenangkan. Apa yang jadi masalah?"},
  {"speaker":"アリ","text":"締結時と市場環境が大きく変わり、責任分担が実態と乖離しております。","reading":"ていけつじとしじょうかんきょうがおおきくかわり、せきにんぶんたんがじったいとかいりしております。","romaji":"Teiketsuji to shijou kankyou ga ookiku kawari, sekinin buntan ga jittai to kairi shite orimasu.","trans":"Kondisi pasar berubah besar sejak penandatanganan, dan pembagian tanggung jawab menyimpang dari kenyataan."},
  {"speaker":"相手企業","text":"具体的にはどの条項を指しておられますか。","reading":"ぐたいてきにはどのじょうこうをさしておられますか。","romaji":"Gutaiteki ni wa dono joukou o sashite oraremasu ka.","trans":"Secara konkret pasal mana yang Anda maksud?"},
  {"speaker":"アリ","text":"第七条の在庫責任です。現在、実質的に当社が全量を負担しております。","reading":"だいななじょうのざいこせきにんです。げんざい、じっしつてきにとうしゃがぜんりょうをふたんしております。","romaji":"Dainanajou no zaiko sekinin desu. Genzai, jisshitsuteki ni tousha ga zenryou o futan shite orimasu.","trans":"Pasal tujuh soal tanggung jawab stok. Saat ini praktisnya perusahaan kami menanggung seluruh volume."},
  {"speaker":"相手企業","text":"契約上は折半のはずですが。","reading":"けいやくじょうはせっぱんのはずですが。","romaji":"Keiyakujou wa seppan no hazu desu ga.","trans":"Secara kontrak seharusnya dibagi dua."},
  {"speaker":"アリ","text":"条文上はそうです。ただ、発注権が貴社にある以上、当社に調整余地がありません。","reading":"じょうぶんじょうはそうです。ただ、はっちゅうけんがきしゃにあるいじょう、とうしゃにちょうせいよちがありません。","romaji":"Joubunjou wa sou desu. Tada, hacchuuken ga kisha ni aru ijou, tousha ni chousei yochi ga arimasen.","trans":"Dalam teks memang begitu. Tapi selama hak pemesanan ada di pihak Anda, kami tidak punya ruang penyesuaian."},
  {"speaker":"相手企業","text":"……言われてみれば、権限と責任が対応していませんね。","reading":"いわれてみれば、けんげんとせきにんがたいおうしていませんね。","romaji":"Iwarete mireba, kengen to sekinin ga taiou shite imasen ne.","trans":"Kalau dipikir, kewenangan dan tanggung jawabnya memang tidak sepadan."},
  {"speaker":"アリ","text":"是正の方向性は二つ考えられます。発注権の共有か、責任比率の変更です。","reading":"ぜせいのほうこうせいはふたつかんがえられます。はっちゅうけんのきょうゆうか、せきにんひりつのへんこうです。","romaji":"Zesei no houkousei wa futatsu kangaeraremasu. Hacchuuken no kyouyuu ka, sekinin hiritsu no henkou desu.","trans":"Ada dua arah koreksi: berbagi hak pemesanan, atau mengubah rasio tanggung jawab."},
  {"speaker":"相手企業","text":"前者は当社の販売戦略に踏み込むことになり、社内の抵抗が大きいでしょう。","reading":"ぜんしゃはとうしゃのはんばいせんりゃくにふみこむことになり、しゃないのていこうがおおきいでしょう。","romaji":"Zensha wa tousha no hanbai senryaku ni fumikomu koto ni nari, shanai no teikou ga ookii deshou.","trans":"Yang pertama berarti masuk ke strategi penjualan kami, resistensi internalnya pasti besar."},
  {"speaker":"アリ","text":"であれば、後者を軸に条件を詰めさせていただければと存じます。","reading":"であれば、こうしゃをじくにじょうけんをつめさせていただければとぞんじます。","romaji":"De areba, kousha o jiku ni jouken o tsumesasete itadakereba to zonjimasu.","trans":"Kalau begitu, izinkan kami merumuskan syaratnya dengan bertumpu pada opsi kedua."},
  {"speaker":"相手企業","text":"結構です。法務を交えて、来月中に草案を作成しましょう。","reading":"けっこうです。ほうむをまじえて、らいげつちゅうにそうあんをさくせいしましょう。","romaji":"Kekkou desu. Houmu o majiete, raigetsuchuu ni souan o sakusei shimashou.","trans":"Baik. Dengan melibatkan bagian hukum, mari susun draf dalam bulan depan."}
 ]'::jsonb,
 '[
  {"word":"抜本的","reading":"ばっぽんてき (bapponteki)","meaning":"mendasar, sampai ke akar"},
  {"word":"乖離","reading":"かいり (kairi)","meaning":"penyimpangan, jurang antara dua hal"},
  {"word":"条項","reading":"じょうこう (joukou)","meaning":"pasal dan ayat kontrak"},
  {"word":"是正","reading":"ぜせい (zesei)","meaning":"koreksi, pembetulan"}
 ]'::jsonb, false),

(5, 'Menangani Dugaan Kekerasan pada Lansia', 'kaigo',
 '[
  {"speaker":"職員","text":"主任、お時間よろしいでしょうか。申し上げにくいことがございます。","reading":"しゅにん、おじかんよろしいでしょうか。もうしあげにくいことがございます。","romaji":"Shunin, ojikan yoroshii deshou ka. Moushiage nikui koto ga gozaimasu.","trans":"Pak Kepala, ada waktu? Ada hal yang sulit saya sampaikan."},
  {"speaker":"主任","text":"どうぞ。言いにくいことほど、聞かねばなりません。","reading":"どうぞ。いいにくいことほど、きかねばなりません。","romaji":"Douzo. Iinikui koto hodo, kikaneba narimasen.","trans":"Silakan. Justru hal yang sulit dikatakan itu yang harus saya dengar."},
  {"speaker":"職員","text":"昨日、同僚が利用者様に強い口調で命令する場面を目撃いたしました。","reading":"きのう、どうりょうがりようしゃさまにつよいくちょうでめいれいするばめんをもくげきいたしました。","romaji":"Kinou, douryou ga riyousha-sama ni tsuyoi kuchou de meirei suru bamen o mokugeki itashimashita.","trans":"Kemarin saya menyaksikan rekan kerja memerintah penghuni dengan nada keras."},
  {"speaker":"主任","text":"具体的には、どのような言葉でしたか。","reading":"ぐたいてきには、どのようなことばでしたか。","romaji":"Gutaiteki ni wa, dono you na kotoba deshita ka.","trans":"Secara konkret, kata-katanya seperti apa?"},
  {"speaker":"職員","text":"早くしろ、何度言わせるんだ、という趣旨です。腕も強く掴んでおりました。","reading":"はやくしろ、なんどいわせるんだ、というしゅしです。うでもつよくつかんでおりました。","romaji":"Hayaku shiro, nando iwaseru n da, to iu shushi desu. Ude mo tsuyoku tsukande orimashita.","trans":"Intinya: cepat, berapa kali harus kubilang. Lengannya juga dicengkeram kuat."},
  {"speaker":"主任","text":"それは高齢者虐待の心理的虐待および身体的虐待に該当し得ます。","reading":"それはこうれいしゃぎゃくたいのしんりてきぎゃくたいおよびしんたいてきぎゃくたいにがいとうしえます。","romaji":"Sore wa koureisha gyakutai no shinriteki gyakutai oyobi shintaiteki gyakutai ni gaitou shiemasu.","trans":"Itu bisa termasuk kekerasan psikis maupun fisik dalam kategori kekerasan terhadap lansia."},
  {"speaker":"職員","text":"同僚を売るようで、報告をためらっておりました。","reading":"どうりょうをうるようで、ほうこくをためらっておりました。","romaji":"Douryou o uru you de, houkoku o tameratte orimashita.","trans":"Rasanya seperti menjual rekan sendiri, jadi saya ragu melapor."},
  {"speaker":"主任","text":"通報は法律上の義務です。ためらいは分かりますが、黙認は加担になります。","reading":"つうほうはほうりつじょうのぎむです。ためらいはわかりますが、もくにんはかたんになります。","romaji":"Tsuuhou wa houritsujou no gimu desu. Tamerai wa wakarimasu ga, mokunin wa katan ni narimasu.","trans":"Pelaporan adalah kewajiban hukum. Keraguan Anda saya paham, tapi membiarkan berarti ikut serta."},
  {"speaker":"職員","text":"その同僚は、慢性的な人手不足で疲弊しております。それも事実です。","reading":"そのどうりょうは、まんせいてきなひとでぶそくでひへいしております。それもじじつです。","romaji":"Sono douryou wa, manseiteki na hitode busoku de hihei shite orimasu. Sore mo jijitsu desu.","trans":"Rekan itu kelelahan karena kekurangan tenaga yang kronis. Itu juga fakta."},
  {"speaker":"主任","text":"重要な指摘です。個人を処分して終わらせては、再発を防げません。","reading":"じゅうようなしてきです。こじんをしょぶんしておわらせては、さいはつをふせげません。","romaji":"Juuyou na shiteki desu. Kojin o shobun shite owarasete wa, saihatsu o fusegemasen.","trans":"Poin penting. Kalau selesai hanya dengan menghukum individu, kekambuhan tidak bisa dicegah."},
  {"speaker":"職員","text":"では、どのように進められるのでしょうか。","reading":"では、どのようにすすめられるのでしょうか。","romaji":"Dewa, dono you ni susumerareru no deshou ka.","trans":"Lalu bagaimana ini akan dijalankan?"},
  {"speaker":"主任","text":"市に通報した上で、配置人数の実態調査も同時に行います。両輪です。","reading":"しにつうほうしたうえで、はいちにんずうのじったいちょうさもどうじにおこないます。りょうりんです。","romaji":"Shi ni tsuuhou shita ue de, haichi ninzuu no jittai chousa mo douji ni okonaimasu. Ryourin desu.","trans":"Setelah melapor ke pemerintah kota, kami juga menyelidiki kondisi riil jumlah personel. Keduanya sejalan."}
 ]'::jsonb,
 '[
  {"word":"高齢者虐待","reading":"こうれいしゃぎゃくたい (koureisha gyakutai)","meaning":"kekerasan terhadap lansia"},
  {"word":"通報","reading":"つうほう (tsuuhou)","meaning":"pelaporan wajib kepada otoritas"},
  {"word":"黙認","reading":"もくにん (mokunin)","meaning":"membiarkan tanpa menegur"},
  {"word":"加担","reading":"かたん (katan)","meaning":"ikut serta, turut bersalah"}
 ]'::jsonb, false),

(5, 'Rapat Peningkatan Mutu Layanan', 'kaigo',
 '[
  {"speaker":"施設長","text":"本年度の利用者満足度調査の結果を踏まえ、改善策を議論します。","reading":"ほんねんどのりようしゃまんぞくどちょうさのけっかをふまえ、かいぜんさくをぎろんします。","romaji":"Honnendo no riyousha manzokudo chousa no kekka o fumae, kaizensaku o giron shimasu.","trans":"Berdasarkan hasil survei kepuasan penghuni tahun ini, kita bahas langkah perbaikan."},
  {"speaker":"職員A","text":"入浴の待ち時間に対する不満が、最も多く挙がっております。","reading":"にゅうよくのまちじかんにたいするふまんが、もっともおおくあがっております。","romaji":"Nyuuyoku no machijikan ni taisuru fuman ga, mottomo ooku agatte orimasu.","trans":"Keluhan terhadap waktu tunggu mandi adalah yang paling banyak muncul."},
  {"speaker":"施設長","text":"平均でどの程度お待たせしているのですか。","reading":"へいきんでどのていどおまたせしているのですか。","romaji":"Heikin de dono teido omatase shite iru no desu ka.","trans":"Rata-rata berapa lama mereka menunggu?"},
  {"speaker":"職員A","text":"四十分前後です。脱衣所でお待ちいただく形になっております。","reading":"よんじゅっぷんぜんごです。だついじょでおまちいただくかたちになっております。","romaji":"Yonjuppun zengo desu. Datsuijo de omachi itadaku katachi ni natte orimasu.","trans":"Sekitar empat puluh menit. Mereka menunggu di ruang ganti."},
  {"speaker":"職員B","text":"寒い時期は、それ自体が健康上のリスクとなり得ます。","reading":"さむいじきは、それじたいがけんこうじょうのリスクとなりえます。","romaji":"Samui jiki wa, sore jitai ga kenkoujou no risuku to narimasu.","trans":"Di musim dingin, hal itu sendiri bisa menjadi risiko kesehatan."},
  {"speaker":"施設長","text":"満足度以前の問題ですね。なぜ待ち時間が生じるのですか。","reading":"まんぞくどいぜんのもんだいですね。なぜまちじかんがしょうじるのですか。","romaji":"Manzokudo izen no mondai desu ne. Naze machijikan ga shoujiru no desu ka.","trans":"Ini masalah sebelum bicara kepuasan. Kenapa terjadi waktu tunggu?"},
  {"speaker":"職員A","text":"全員を午後に集中させているためです。慣例で、そうなっております。","reading":"ぜんいんをごごにしゅうちゅうさせているためです。かんれいで、そうなっております。","romaji":"Zen-in o gogo ni shuuchuu saseteiru tame desu. Kanrei de, sou natte orimasu.","trans":"Karena semuanya dipusatkan di siang hari. Itu berjalan karena kebiasaan."},
  {"speaker":"施設長","text":"慣例という言葉ほど、検証を怠らせるものはありません。","reading":"かんれいということばほど、けんしょうをおこたらせるものはありません。","romaji":"Kanrei to iu kotoba hodo, kenshou o okotaraseru mono wa arimasen.","trans":"Tidak ada kata yang lebih membuat orang lalai memverifikasi selain kata kebiasaan."},
  {"speaker":"職員B","text":"午前にも回せば、一回あたりの人数を半減できるかと存じます。","reading":"ごぜんにもまわせば、いっかいあたりのにんずうをはんげんできるかとぞんじます。","romaji":"Gozen ni mo mawaseba, ikkai atari no ninzuu o hangen dekiru ka to zonjimasu.","trans":"Kalau juga dialokasikan ke pagi, jumlah per sesi bisa dipangkas separuh."},
  {"speaker":"職員A","text":"ただ、午前は記録業務と重なります。そこの調整が要ります。","reading":"ただ、ごぜんはきろくぎょうむとかさなります。そこのちょうせいがいります。","romaji":"Tada, gozen wa kiroku gyoumu to kasanarimasu. Soko no chousei ga irimasu.","trans":"Tapi pagi bertabrakan dengan pekerjaan pencatatan. Di situ perlu penyesuaian."},
  {"speaker":"施設長","text":"記録を午後に移すことは可能ですか。優先順位の問題です。","reading":"きろくをごごにうつすことはかのうですか。ゆうせんじゅんいのもんだいです。","romaji":"Kiroku o gogo ni utsusu koto wa kanou desu ka. Yuusen jun-i no mondai desu.","trans":"Bisakah pencatatan dipindah ke sore? Ini soal prioritas."},
  {"speaker":"職員B","text":"可能です。ご本人の尊厳に直結する業務を、優先すべきかと存じます。","reading":"かのうです。ごほんにんのそんげんにちょっけつするぎょうむを、ゆうせんすべきかとぞんじます。","romaji":"Kanou desu. Gohonnin no songen ni chokketsu suru gyoumu o, yuusen subeki ka to zonjimasu.","trans":"Bisa. Menurut saya pekerjaan yang langsung menyangkut martabat penghuni harus diprioritaskan."}
 ]'::jsonb,
 '[
  {"word":"満足度調査","reading":"まんぞくどちょうさ (manzokudo chousa)","meaning":"survei tingkat kepuasan"},
  {"word":"～を踏まえ","reading":"をふまえ (o fumae)","meaning":"berdasarkan, dengan berpijak pada"},
  {"word":"慣例","reading":"かんれい (kanrei)","meaning":"kebiasaan yang sudah berjalan"},
  {"word":"尊厳","reading":"そんげん (songen)","meaning":"martabat"}
 ]'::jsonb, false),

(5, 'Menjelaskan Sistem Asuransi Perawatan', 'kaigo',
 '[
  {"speaker":"家族","text":"介護保険の仕組みが、正直よく理解できておりません。","reading":"かいごほけんのしくみが、しょうじきよくりかいできておりません。","romaji":"Kaigo hoken no shikumi ga, shoujiki yoku rikai dekite orimasen.","trans":"Terus terang saya belum memahami mekanisme asuransi perawatan."},
  {"speaker":"相談員","text":"複雑な制度ですので、無理もございません。要介護認定はお済みですね。","reading":"ふくざつなせいどですので、むりもございません。ようかいごにんていはおすみですね。","romaji":"Fukuzatsu na seido desu node, muri mo gozaimasen. Youkaigo nintei wa osumi desu ne.","trans":"Sistemnya rumit, jadi wajar saja. Penetapan tingkat kebutuhan perawatan sudah selesai ya."},
  {"speaker":"家族","text":"はい、要介護三と判定されました。その数字の意味も曖昧です。","reading":"はい、ようかいごさんとはんていされました。そのすうじのいみもあいまいです。","romaji":"Hai, youkaigo san to hantei saremashita. Sono suuji no imi mo aimai desu.","trans":"Ya, ditetapkan sebagai tingkat tiga. Arti angka itu pun masih kabur bagi saya."},
  {"speaker":"相談員","text":"介護に要する手間の量を段階化したものです。数字が大きいほど支給限度額も上がります。","reading":"かいごにようするてまのりょうをだんかいかしたものです。すうじがおおきいほどしきゅうげんどがくもあがります。","romaji":"Kaigo ni you suru tema no ryou o dankaika shita mono desu. Suuji ga ookii hodo shikyuu gendogaku mo agarimasu.","trans":"Itu penjenjangan banyaknya perawatan yang dibutuhkan. Makin besar angkanya, makin tinggi pula plafon tunjangannya."},
  {"speaker":"家族","text":"限度額を超えた分は、どうなるのでしょうか。","reading":"げんどがくをこえたぶんは、どうなるのでしょうか。","romaji":"Gendogaku o koeta bun wa, dou naru no deshou ka.","trans":"Bagaimana dengan bagian yang melebihi plafon?"},
  {"speaker":"相談員","text":"全額自己負担となります。そこがご家計に響きやすい点です。","reading":"ぜんがくじこふたんとなります。そこがごかけいにひびきやすいてんです。","romaji":"Zengaku jiko futan to narimasu. Soko ga gokakei ni hibikiyasui ten desu.","trans":"Menjadi tanggungan sendiri sepenuhnya. Di situlah yang mudah membebani keuangan keluarga."},
  {"speaker":"家族","text":"限度内に収める工夫は、可能なのでしょうか。","reading":"げんどないにおさめるくふうは、かのうなのでしょうか。","romaji":"Gendonai ni osameru kufuu wa, kanou na no deshou ka.","trans":"Apakah mungkin diupayakan agar tetap dalam plafon?"},
  {"speaker":"相談員","text":"可能です。ケアマネジャーが、必要性に即して組み替えます。","reading":"かのうです。ケアマネジャーが、ひつようせいにそくしてくみかえます。","romaji":"Kanou desu. Kea manejaa ga, hitsuyousei ni soku shite kumikaemasu.","trans":"Mungkin. Care manager akan menyusun ulang sesuai tingkat kebutuhan."},
  {"speaker":"家族","text":"自己負担の割合は、一律なのですか。","reading":"じこふたんのわりあいは、いちりつなのですか。","romaji":"Jiko futan no wariai wa, ichiritsu na no desu ka.","trans":"Apakah persentase tanggungan pribadi itu seragam?"},
  {"speaker":"相談員","text":"いいえ。所得に応じて一割から三割まで変動いたします。","reading":"いいえ。しょとくにおうじていちわりからさんわりまでへんどういたします。","romaji":"Iie. Shotoku ni oujite ichiwari kara sanwari made hendou itashimasu.","trans":"Tidak. Berubah dari 10 sampai 30 persen sesuai penghasilan."},
  {"speaker":"家族","text":"制度を知らずにいると、損をするということですね。","reading":"せいどをしらずにいると、そんをするということですね。","romaji":"Seido o shirazu ni iru to, son o suru to iu koto desu ne.","trans":"Jadi kalau tidak tahu sistemnya, kita yang rugi ya."},
  {"speaker":"相談員","text":"残念ながら、申請主義ですので。だからこそ、私どもがおります。","reading":"ざんねんながら、しんせいしゅぎですので。だからこそ、わたくしどもがおります。","romaji":"Zannen nagara, shinsei shugi desu node. Dakara koso, watakushidomo ga orimasu.","trans":"Sayangnya sistemnya berbasis pengajuan. Justru karena itulah kami ada."}
 ]'::jsonb,
 '[
  {"word":"要介護認定","reading":"ようかいごにんてい (youkaigo nintei)","meaning":"penetapan tingkat kebutuhan perawatan"},
  {"word":"支給限度額","reading":"しきゅうげんどがく (shikyuu gendogaku)","meaning":"plafon tunjangan yang ditanggung"},
  {"word":"自己負担","reading":"じこふたん (jiko futan)","meaning":"bagian yang ditanggung sendiri"},
  {"word":"申請主義","reading":"しんせいしゅぎ (shinsei shugi)","meaning":"prinsip bahwa hak hanya diberikan bila diajukan"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO NOTHING;
