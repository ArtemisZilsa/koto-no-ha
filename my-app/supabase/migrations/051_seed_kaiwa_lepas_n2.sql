-- 051: 16 kaiwa lepas N2 (daily 5, work 3, hospital 3, biz 2, kaigo 3).
--
-- Tata bahasa N2: ～に関して, ～に基づいて, ～ざるを得ない, ～かねる, ～上で,
-- kausatif-pasif, dan keigo yang sudah menjadi cara bicara default, bukan
-- hiasan. Situasinya menuntut pelajar mengambil posisi: mengusulkan,
-- menengahi, menolak dengan alasan, menagih penjelasan.
--
-- Idempoten: uniq_kaiwa_level_title (level_id, title) + DO NOTHING.

INSERT INTO public.kaiwa_stories (level_id, title, category, lines, vocab_highlight, is_premium) VALUES

(4, 'Mengurus Pindah Rumah dan Lapor Alamat', 'daily',
 '[
  {"speaker":"アリ","text":"転出届の手続きに参りました。来月、隣の市に引っ越します。","reading":"てんしゅつとどけのてつづきにまいりました。らいげつ、となりのしにひっこします。","romaji":"Tenshutsu todoke no tetsuzuki ni mairimashita. Raigetsu, tonari no shi ni hikkoshimasu.","trans":"Saya datang untuk mengurus surat pindah keluar. Bulan depan saya pindah ke kota sebelah."},
  {"speaker":"職員","text":"承知しました。引っ越しの日付はお決まりでしょうか。","reading":"しょうちしました。ひっこしのひづけはおきまりでしょうか。","romaji":"Shouchi shimashita. Hikkoshi no hizuke wa okimari deshou ka.","trans":"Baik. Tanggal pindahnya sudah ditentukan?"},
  {"speaker":"アリ","text":"十五日です。転出届は何日前から出せるのでしょうか。","reading":"じゅうごにちです。てんしゅつとどけはなんにちまえからだせるのでしょうか。","romaji":"Juugonichi desu. Tenshutsu todoke wa nannichi mae kara daseru no deshou ka.","trans":"Tanggal 15. Surat pindah keluar bisa diajukan mulai berapa hari sebelumnya?"},
  {"speaker":"職員","text":"二週間前からです。本日でしたら問題ございません。","reading":"にしゅうかんまえからです。ほんじつでしたらもんだいございません。","romaji":"Nishuukan mae kara desu. Honjitsu deshitara mondai gozaimasen.","trans":"Mulai dua minggu sebelumnya. Kalau hari ini, tidak masalah."},
  {"speaker":"アリ","text":"転入先での手続きは、いつまでにすればよいですか。","reading":"てんにゅうさきでのてつづきは、いつまでにすればよいですか。","romaji":"Tennyuusaki de no tetsuzuki wa, itsu made ni sureba yoi desu ka.","trans":"Pengurusan di tempat baru harus selesai kapan?"},
  {"speaker":"職員","text":"引っ越された日から十四日以内です。遅れると過料が発生する場合があります。","reading":"ひっこされたひからじゅうよっかいないです。おくれるとかりょうがはっせいするばあいがあります。","romaji":"Hikkosareta hi kara juuyokka inai desu. Okureru to karyou ga hassei suru baai ga arimasu.","trans":"Dalam 14 hari sejak tanggal pindah. Kalau telat, bisa dikenakan denda administratif."},
  {"speaker":"アリ","text":"それは知りませんでした。在留カードの住所も変更が必要ですよね。","reading":"それはしりませんでした。ざいりゅうカードのじゅうしょもへんこうがひつようですよね。","romaji":"Sore wa shirimasen deshita. Zairyuu kaado no juusho mo henkou ga hitsuyou desu yo ne.","trans":"Saya tidak tahu itu. Alamat di kartu izin tinggal juga perlu diubah, kan?"},
  {"speaker":"職員","text":"はい。転入届と同時に、裏面に新住所を記載いたします。","reading":"はい。てんにゅうとどけとどうじに、うらめんにしんじゅうしょをきさいいたします。","romaji":"Hai. Tennyuu todoke to douji ni, uramen ni shinjuusho o kisai itashimasu.","trans":"Ya. Bersamaan dengan surat pindah masuk, alamat baru dicatat di sisi belakang."},
  {"speaker":"アリ","text":"国民健康保険についてはいかがでしょうか。","reading":"こくみんけんこうほけんについてはいかがでしょうか。","romaji":"Kokumin kenkou hoken ni tsuite wa ikaga deshou ka.","trans":"Bagaimana dengan asuransi kesehatan nasional?"},
  {"speaker":"職員","text":"こちらで一度資格を喪失し、転入先で改めて加入していただきます。","reading":"こちらでいちどしかくをそうしつし、てんにゅうさきであらためてかにゅうしていただきます。","romaji":"Kochira de ichido shikaku o soushitsu shi, tennyuusaki de aratamete kanyuu shite itadakimasu.","trans":"Di sini statusnya dicabut dulu, lalu Anda mendaftar ulang di kota tujuan."},
  {"speaker":"アリ","text":"その間に病院に行った場合は、全額負担になるのでしょうか。","reading":"そのあいだにびょういんにいったばあいは、ぜんがくふたんになるのでしょうか。","romaji":"Sono aida ni byouin ni itta baai wa, zengaku futan ni naru no deshou ka.","trans":"Kalau ke rumah sakit di masa itu, apakah saya menanggung seluruh biayanya?"},
  {"speaker":"職員","text":"一時的に立て替えとなりますが、後日申請すれば払い戻されます。","reading":"いちじてきにたてかえとなりますが、ごじつしんせいすればはらいもどされます。","romaji":"Ichijiteki ni tatekae to narimasu ga, gojitsu shinsei sureba haraimodosaremasu.","trans":"Sementara Anda menalangi dulu, tapi bisa dikembalikan bila mengajukan kemudian."}
 ]'::jsonb,
 '[
  {"word":"転出届","reading":"てんしゅつとどけ (tenshutsu todoke)","meaning":"surat pemberitahuan pindah keluar"},
  {"word":"過料","reading":"かりょう (karyou)","meaning":"denda administratif"},
  {"word":"資格を喪失する","reading":"しかくをそうしつする (shikaku o soushitsu suru)","meaning":"kehilangan status kepesertaan"},
  {"word":"立て替え","reading":"たてかえ (tatekae)","meaning":"menalangi biaya lebih dulu"}
 ]'::jsonb, false),

(4, 'Menghadapi Penipuan lewat Telepon', 'daily',
 '[
  {"speaker":"相手","text":"市役所の保険課の者ですが、還付金の手続きがお済みでないようです。","reading":"しやくしょのほけんかのものですが、かんぷきんのてつづきがおすみでないようです。","romaji":"Shiyakusho no hokenka no mono desu ga, kanpukin no tetsuzuki ga osumi de nai you desu.","trans":"Saya dari bagian asuransi kantor kota. Sepertinya prosedur pengembalian dana Anda belum selesai."},
  {"speaker":"リナ","text":"還付金ですか。そのようなお知らせは受け取っておりませんが。","reading":"かんぷきんですか。そのようなおしらせはうけとっておりませんが。","romaji":"Kanpukin desu ka. Sono you na oshirase wa uketotte orimasen ga.","trans":"Pengembalian dana? Saya tidak menerima pemberitahuan seperti itu."},
  {"speaker":"相手","text":"三か月前に送付しております。本日が期限ですので、至急お手続きを。","reading":"さんかげつまえにそうふしております。ほんじつがきげんですので、しきゅうおてつづきを。","romaji":"Sankagetsu mae ni soufu shite orimasu. Honjitsu ga kigen desu node, shikyuu otetsuzuki o.","trans":"Sudah kami kirim tiga bulan lalu. Hari ini batas akhirnya, jadi segera urus."},
  {"speaker":"リナ","text":"急がせようとされている点が、少し気になります。","reading":"いそがせようとされているてんが、すこしきになります。","romaji":"Isogaseyou to sarete iru ten ga, sukoshi ki ni narimasu.","trans":"Saya agak terganggu dengan cara Anda yang seolah memburu-buru saya."},
  {"speaker":"相手","text":"お近くのATMへ向かっていただければ、こちらで操作をご案内します。","reading":"おちかくのエーティーエムへむかっていただければ、こちらでそうさをごあんないします。","romaji":"Ochikaku no eetiiemu e mukatte itadakereba, kochira de sousa o goannai shimasu.","trans":"Kalau Anda menuju ATM terdekat, kami akan memandu pengoperasiannya."},
  {"speaker":"リナ","text":"還付金をATMで受け取るという制度は、存在しないはずです。","reading":"かんぷきんをエーティーエムでうけとるというせいどは、そんざいしないはずです。","romaji":"Kanpukin o eetiiemu de uketoru to iu seido wa, sonzai shinai hazu desu.","trans":"Setahu saya tidak ada sistem menerima pengembalian dana lewat ATM."},
  {"speaker":"相手","text":"いえ、新しい制度でして。","reading":"いえ、あたらしいせいどでして。","romaji":"Ie, atarashii seido deshite.","trans":"Bukan, ini sistem baru."},
  {"speaker":"リナ","text":"それでしたら、こちらから市役所の代表番号にかけ直します。","reading":"それでしたら、こちらからしやくしょのだいひょうばんごうにかけなおします。","romaji":"Sore deshitara, kochira kara shiyakusho no daihyou bangou ni kakenaoshimasu.","trans":"Kalau begitu, saya akan menelepon balik ke nomor resmi kantor kota."},
  {"speaker":"相手","text":"いや、その必要は……。","reading":"いや、そのひつようは……。","romaji":"Iya, sono hitsuyou wa....","trans":"Tidak, itu tidak perlu..."},
  {"speaker":"リナ","text":"お名前と部署をもう一度お聞かせいただけますか。記録しております。","reading":"おなまえとぶしょをもういちどおきかせいただけますか。きろくしております。","romaji":"Onamae to busho o mou ichido okikase itadakemasu ka. Kiroku shite orimasu.","trans":"Boleh sebutkan sekali lagi nama dan bagian Anda? Saya sedang mencatat."},
  {"speaker":"相手","text":"……失礼します。","reading":"……しつれいします。","romaji":"...Shitsurei shimasu.","trans":"...Permisi."},
  {"speaker":"リナ","text":"切れましたね。念のため、警察の相談窓口に連絡しておきます。","reading":"きれましたね。ねんのため、けいさつのそうだんまどぐちにれんらくしておきます。","romaji":"Kiremashita ne. Nen no tame, keisatsu no soudan madoguchi ni renraku shite okimasu.","trans":"Teleponnya diputus. Untuk berjaga-jaga, saya akan lapor ke layanan konsultasi polisi."}
 ]'::jsonb,
 '[
  {"word":"還付金","reading":"かんぷきん (kanpukin)","meaning":"dana pengembalian (sering dipakai modus penipuan)"},
  {"word":"至急","reading":"しきゅう (shikyuu)","meaning":"segera, mendesak"},
  {"word":"～はずです","reading":"hazu desu","meaning":"seharusnya ~ (berdasar penalaran)"},
  {"word":"念のため","reading":"ねんのため (nen no tame)","meaning":"untuk berjaga-jaga"}
 ]'::jsonb, false),

(4, 'Membahas Perkembangan Anak dengan Guru', 'daily',
 '[
  {"speaker":"先生","text":"本日はお時間をいただき、ありがとうございます。","reading":"ほんじつはおじかんをいただき、ありがとうございます。","romaji":"Honjitsu wa ojikan o itadaki, arigatou gozaimasu.","trans":"Terima kasih sudah meluangkan waktu hari ini."},
  {"speaker":"サリ","text":"いえ。息子のことで、何か気になる点がおありでしょうか。","reading":"いえ。むすこのことで、なにかきになるてんがおありでしょうか。","romaji":"Ie. Musuko no koto de, nanika ki ni naru ten ga oari deshou ka.","trans":"Tidak apa-apa. Apakah ada hal yang Anda perhatikan soal anak saya?"},
  {"speaker":"先生","text":"学習面は問題ありません。ただ、発言が極端に少ないのが気になります。","reading":"がくしゅうめんはもんだいありません。ただ、はつげんがきょくたんにすくないのがきになります。","romaji":"Gakushuumen wa mondai arimasen. Tada, hatsugen ga kyokutan ni sukunai no ga ki ni narimasu.","trans":"Dari sisi belajar tidak ada masalah. Hanya, dia sangat jarang bicara di kelas."},
  {"speaker":"サリ","text":"家では普通に話すのですが、日本語に自信がないのだと思います。","reading":"いえではふつうにはなすのですが、にほんごにじしんがないのだとおもいます。","romaji":"Ie de wa futsuu ni hanasu no desu ga, nihongo ni jishin ga nai no da to omoimasu.","trans":"Di rumah bicara biasa saja, tapi saya rasa dia kurang percaya diri dengan bahasa Jepangnya."},
  {"speaker":"先生","text":"なるほど。間違えることを恐れているのかもしれませんね。","reading":"なるほど。まちがえることをおそれているのかもしれませんね。","romaji":"Naruhodo. Machigaeru koto o osorete iru no kamo shiremasen ne.","trans":"Begitu ya. Mungkin dia takut membuat kesalahan."},
  {"speaker":"サリ","text":"以前、発音を笑われたことがあったようです。","reading":"いぜん、はつおんをわらわれたことがあったようです。","romaji":"Izen, hatsuon o warawareta koto ga atta you desu.","trans":"Sepertinya dulu pengucapannya pernah ditertawakan."},
  {"speaker":"先生","text":"それは把握しておりませんでした。教えていただき助かります。","reading":"それははあくしておりませんでした。おしえていただきたすかります。","romaji":"Sore wa haaku shite orimasen deshita. Oshiete itadaki tasukarimasu.","trans":"Saya belum mengetahui hal itu. Terima kasih sudah memberitahu."},
  {"speaker":"サリ","text":"本人は大したことではないと言うのですが、気になっておりまして。","reading":"ほんにんはたいしたことではないというのですが、きになっておりまして。","romaji":"Honnin wa taishita koto dewa nai to iu no desu ga, ki ni natte orimashite.","trans":"Anaknya bilang bukan hal besar, tapi saya tetap khawatir."},
  {"speaker":"先生","text":"クラス全体に、話し方の違いについて話す機会を設けようと思います。","reading":"クラスぜんたいに、はなしかたのちがいについてはなすきかいをもうけようとおもいます。","romaji":"Kurasu zentai ni, hanashikata no chigai ni tsuite hanasu kikai o moukeyou to omoimasu.","trans":"Saya berencana membuat kesempatan untuk membahas perbedaan cara bicara ke seluruh kelas."},
  {"speaker":"サリ","text":"息子が特別扱いされる形にならなければ、ありがたいです。","reading":"むすこがとくべつあつかいされるかたちにならなければ、ありがたいです。","romaji":"Musuko ga tokubetsu atsukai sareru katachi ni naranakereba, arigatai desu.","trans":"Kalau tidak sampai membuat anak saya diperlakukan khusus, saya berterima kasih."},
  {"speaker":"先生","text":"もちろんです。名前は出さず、一般的な話として扱います。","reading":"もちろんです。なまえはださず、いっぱんてきなはなしとしてあつかいます。","romaji":"Mochiron desu. Namae wa dasazu, ippanteki na hanashi toshite atsukaimasu.","trans":"Tentu. Tanpa menyebut nama, saya bahas sebagai topik umum."},
  {"speaker":"サリ","text":"よろしくお願いいたします。家でも様子を見ておきます。","reading":"よろしくおねがいいたします。いえでもようすをみておきます。","romaji":"Yoroshiku onegai itashimasu. Ie demo yousu o mite okimasu.","trans":"Mohon bantuannya. Di rumah pun saya akan mengamati keadaannya."}
 ]'::jsonb,
 '[
  {"word":"発言","reading":"はつげん (hatsugen)","meaning":"pernyataan, berbicara di forum"},
  {"word":"把握する","reading":"はあくする (haaku suru)","meaning":"memahami, menangkap situasi"},
  {"word":"設ける","reading":"もうける (moukeru)","meaning":"mengadakan, menyediakan"},
  {"word":"特別扱い","reading":"とくべつあつかい (tokubetsu atsukai)","meaning":"perlakuan khusus"}
 ]'::jsonb, false),

(4, 'Mengurus Klaim Asuransi Kecelakaan', 'daily',
 '[
  {"speaker":"ブディ","text":"自転車で接触事故を起こしまして、保険の件でご相談したいのですが。","reading":"じてんしゃでせっしょくじこをおこしまして、ほけんのけんでごそうだんしたいのですが。","romaji":"Jitensha de sesshoku jiko o okoshimashite, hoken no ken de gosoudan shitai no desu ga.","trans":"Saya mengalami senggolan dengan sepeda, ingin konsultasi soal asuransi."},
  {"speaker":"担当者","text":"お怪我はございませんか。","reading":"おけがはございませんか。","romaji":"Okega wa gozaimasen ka.","trans":"Apakah Anda terluka?"},
  {"speaker":"ブディ","text":"私は大丈夫ですが、相手の方が転倒され、手を打たれました。","reading":"わたしはだいじょうぶですが、あいてのかたがてんとうされ、てをうたれました。","romaji":"Watashi wa daijoubu desu ga, aite no kata ga tentou sare, te o utaremashita.","trans":"Saya tidak apa-apa, tapi pihak lain terjatuh dan tangannya terbentur."},
  {"speaker":"担当者","text":"警察には届け出をされましたか。","reading":"けいさつにはとどけでをされましたか。","romaji":"Keisatsu ni wa todokede o saremashita ka.","trans":"Apakah sudah melapor ke polisi?"},
  {"speaker":"ブディ","text":"はい、その場で呼びました。事故証明も取得済みです。","reading":"はい、そのばでよびました。じこしょうめいもしゅとくずみです。","romaji":"Hai, sono ba de yobimashita. Jiko shoumei mo shutoku zumi desu.","trans":"Ya, saya panggil di tempat. Surat keterangan kecelakaan juga sudah saya dapatkan."},
  {"speaker":"担当者","text":"適切なご対応です。それがないと、保険金の支払いができかねます。","reading":"てきせつなごたいおうです。それがないと、ほけんきんのしはらいができかねます。","romaji":"Tekisetsu na gotaiou desu. Sore ga nai to, hokenkin no shiharai ga dekikanemasu.","trans":"Tindakan Anda tepat. Tanpa itu, kami tidak dapat membayarkan klaimnya."},
  {"speaker":"ブディ","text":"補償の範囲は、どこまででしょうか。","reading":"ほしょうのはんいは、どこまででしょうか。","romaji":"Hoshou no han-i wa, doko made deshou ka.","trans":"Sejauh mana cakupan pertanggungannya?"},
  {"speaker":"担当者","text":"相手の治療費と、自転車の修理代が対象です。上限は一億円です。","reading":"あいてのちりょうひと、じてんしゃのしゅうりだいがたいしょうです。じょうげんはいちおくえんです。","romaji":"Aite no chiryouhi to, jitensha no shuuridai ga taishou desu. Jougen wa ichiokuen desu.","trans":"Biaya pengobatan pihak lain dan perbaikan sepedanya. Batas maksimalnya 100 juta yen."},
  {"speaker":"ブディ","text":"私自身の怪我は含まれないのですね。","reading":"わたしじしんのけがはふくまれないのですね。","romaji":"Watashi jishin no kega wa fukumarenai no desu ne.","trans":"Jadi luka saya sendiri tidak termasuk ya."},
  {"speaker":"担当者","text":"この契約では対象外です。傷害特約を付けていらっしゃれば別ですが。","reading":"このけいやくではたいしょうがいです。しょうがいとくやくをつけていらっしゃればべつですが。","romaji":"Kono keiyaku de wa taishougai desu. Shougai tokuyaku o tsukete irassharu nara betsu desu ga.","trans":"Dalam kontrak ini tidak tercakup. Lain halnya kalau Anda menambahkan klausul cedera."},
  {"speaker":"ブディ","text":"今後のために、付けておいたほうがよさそうですね。","reading":"こんごのために、つけておいたほうがよさそうですね。","romaji":"Kongo no tame ni, tsukete oita hou ga yosasou desu ne.","trans":"Untuk ke depan, sepertinya lebih baik saya tambahkan."},
  {"speaker":"担当者","text":"月額二百円ほどで付けられます。書類をお送りしましょうか。","reading":"げつがくにひゃくえんほどでつけられます。しょるいをおおくりしましょうか。","romaji":"Getsugaku nihyaku en hodo de tsukeraremasu. Shorui o ookuri shimashou ka.","trans":"Bisa ditambahkan sekitar 200 yen per bulan. Perlu saya kirimkan dokumennya?"}
 ]'::jsonb,
 '[
  {"word":"事故証明","reading":"じこしょうめい (jiko shoumei)","meaning":"surat keterangan kecelakaan dari polisi"},
  {"word":"～かねます","reading":"kanemasu","meaning":"tidak dapat ~ (penolakan halus formal)"},
  {"word":"補償","reading":"ほしょう (hoshou)","meaning":"pertanggungan, ganti rugi"},
  {"word":"特約","reading":"とくやく (tokuyaku)","meaning":"klausul tambahan polis"}
 ]'::jsonb, false),

(4, 'Menghadiri Pertemuan Wali Murid', 'daily',
 '[
  {"speaker":"役員","text":"来年度のPTA役員を、どなたかにお願いしたいのですが。","reading":"らいねんどのピーティーエーやくいんを、どなたかにおねがいしたいのですが。","romaji":"Rainendo no piitiiee yakuin o, donata ka ni onegai shitai no desu ga.","trans":"Kami ingin meminta seseorang menjadi pengurus PTA tahun ajaran depan."},
  {"speaker":"デウィ","text":"具体的には、どのような業務でしょうか。","reading":"ぐたいてきには、どのようなぎょうむでしょうか。","romaji":"Gutaiteki ni wa, dono you na gyoumu deshou ka.","trans":"Secara konkret, tugasnya seperti apa?"},
  {"speaker":"役員","text":"月一回の会議と、行事の際の手伝いが中心です。","reading":"つきいっかいのかいぎと、ぎょうじのさいのてつだいがちゅうしんです。","romaji":"Tsuki ikkai no kaigi to, gyouji no sai no tetsudai ga chuushin desu.","trans":"Terutama rapat sebulan sekali dan membantu saat ada acara sekolah."},
  {"speaker":"デウィ","text":"平日の昼間でしたら、勤務があるため難しいと思います。","reading":"へいじつのひるまでしたら、きんむがあるためむずかしいとおもいます。","romaji":"Heijitsu no hiruma deshitara, kinmu ga aru tame muzukashii to omoimasu.","trans":"Kalau siang hari kerja, saya rasa sulit karena harus bekerja."},
  {"speaker":"役員","text":"最近は夜や休日に開催することも増えております。","reading":"さいきんはよるやきゅうじつにかいさいすることもふえております。","romaji":"Saikin wa yoru ya kyuujitsu ni kaisai suru koto mo fuete orimasu.","trans":"Belakangan makin sering diadakan malam atau hari libur."},
  {"speaker":"デウィ","text":"それでしたら、検討の余地はあります。ただ、不安な点があります。","reading":"それでしたら、けんとうのよちはあります。ただ、ふあんなてんがあります。","romaji":"Sore deshitara, kentou no yochi wa arimasu. Tada, fuan na ten ga arimasu.","trans":"Kalau begitu, masih ada ruang untuk saya pertimbangkan. Tapi ada yang saya khawatirkan."},
  {"speaker":"役員","text":"何なりとおっしゃってください。","reading":"なんなりとおっしゃってください。","romaji":"Nannari to osshatte kudasai.","trans":"Silakan sampaikan apa pun."},
  {"speaker":"デウィ","text":"配布物の日本語が難しく、書類作成が務まるか自信がありません。","reading":"はいふぶつのにほんごがむずかしく、しょるいさくせいがつとまるかじしんがありません。","romaji":"Haifubutsu no nihongo ga muzukashiku, shorui sakusei ga tsutomaru ka jishin ga arimasen.","trans":"Bahasa Jepang di lembaran edaran sulit, saya tidak yakin sanggup membuat dokumen."},
  {"speaker":"役員","text":"書類は他の役員が担当しますので、ご心配には及びません。","reading":"しょるいはほかのやくいんがたんとうしますので、ごしんぱいにはおよびません。","romaji":"Shorui wa hoka no yakuin ga tantou shimasu node, goshinpai ni wa oyobimasen.","trans":"Dokumen ditangani pengurus lain, jadi tidak perlu khawatir."},
  {"speaker":"デウィ","text":"それを伺って、少し安心しました。","reading":"それをうかがって、すこしあんしんしました。","romaji":"Sore o ukagatte, sukoshi anshin shimashita.","trans":"Mendengar itu, saya sedikit lega."},
  {"speaker":"役員","text":"むしろ、外国のご家庭の視点を教えていただけると助かります。","reading":"むしろ、がいこくのごかていのしてんをおしえていただけるとたすかります。","romaji":"Mushiro, gaikoku no gokatei no shiten o oshiete itadakeru to tasukarimasu.","trans":"Justru kami terbantu kalau Anda berbagi sudut pandang keluarga asing."},
  {"speaker":"デウィ","text":"それでしたら、お引き受けできるかもしれません。一度持ち帰らせてください。","reading":"それでしたら、おひきうけできるかもしれません。いちどもちかえらせてください。","romaji":"Sore deshitara, ohikiuke dekiru kamo shiremasen. Ichido mochikaerasete kudasai.","trans":"Kalau begitu, mungkin saya bisa menerimanya. Izinkan saya pikirkan dulu di rumah."}
 ]'::jsonb,
 '[
  {"word":"検討の余地","reading":"けんとうのよち (kentou no yochi)","meaning":"ruang untuk dipertimbangkan"},
  {"word":"務まる","reading":"つとまる (tsutomaru)","meaning":"sanggup menjalankan tugas"},
  {"word":"ご心配には及びません","reading":"ごしんぱいにはおよびません (goshinpai ni wa oyobimasen)","meaning":"tidak perlu khawatir (formal)"},
  {"word":"持ち帰る","reading":"もちかえる (mochikaeru)","meaning":"membawa pulang untuk dipertimbangkan"}
 ]'::jsonb, false),

(4, 'Mengusulkan Perbaikan Alur Kerja', 'work',
 '[
  {"speaker":"アリ","text":"入荷作業について、提案させていただきたいことがあります。","reading":"にゅうかさぎょうについて、ていあんさせていただきたいことがあります。","romaji":"Nyuuka sagyou ni tsuite, teian sasete itadakitai koto ga arimasu.","trans":"Soal pekerjaan penerimaan barang, ada yang ingin saya usulkan."},
  {"speaker":"主任","text":"どうぞ。現場からの意見はありがたい。","reading":"どうぞ。げんばからのいけんはありがたい。","romaji":"Douzo. Genba kara no iken wa arigatai.","trans":"Silakan. Masukan dari lapangan itu berharga."},
  {"speaker":"アリ","text":"現在、検品と棚入れを別の人が行っていますが、二度手間が生じています。","reading":"げんざい、けんぴんとたないれをべつのひとがおこなっていますが、にどでまがしょうじています。","romaji":"Genzai, kenpin to tanaire o betsu no hito ga okonatte imasu ga, nidodema ga shoujite imasu.","trans":"Saat ini pengecekan dan penataan rak dikerjakan orang berbeda, sehingga terjadi pekerjaan ganda."},
  {"speaker":"主任","text":"具体的には、どのあたりが。","reading":"ぐたいてきには、どのあたりが。","romaji":"Gutaiteki ni wa, dono atari ga.","trans":"Konkretnya, di bagian mana?"},
  {"speaker":"アリ","text":"検品後に一度床に置き、棚入れの際にまた持ち上げております。","reading":"けんぴんごにいちどゆかにおき、たないれのさいにまたもちあげております。","romaji":"Kenpingo ni ichido yuka ni oki, tanaire no sai ni mata mochiagete orimasu.","trans":"Setelah dicek, barang diletakkan di lantai dulu, lalu diangkat lagi saat ditata."},
  {"speaker":"主任","text":"確かに無駄だな。どう変えればいいと思う。","reading":"たしかにむだだな。どうかえればいいとおもう。","romaji":"Tashika ni muda da na. Dou kaereba ii to omou.","trans":"Memang mubazir. Menurutmu bagaimana mengubahnya?"},
  {"speaker":"アリ","text":"検品する人がそのまま棚まで運べば、持ち上げる回数が半分になります。","reading":"けんぴんするひとがそのままたなまではこべば、もちあげるかいすうがはんぶんになります。","romaji":"Kenpin suru hito ga sono mama tana made hakobeba, mochiageru kaisuu ga hanbun ni narimasu.","trans":"Kalau yang mengecek langsung membawa ke rak, jumlah angkatannya jadi setengah."},
  {"speaker":"主任","text":"腰への負担も減るわけか。試算はしてみたか。","reading":"こしへのふたんもへるわけか。しさんはしてみたか。","romaji":"Koshi e no futan mo heru wake ka. Shisan wa shite mita ka.","trans":"Beban pinggang juga berkurang ya. Sudah kamu hitung?"},
  {"speaker":"アリ","text":"はい。一日あたり四十分ほど短縮できる計算です。","reading":"はい。いちにちあたりよんじゅっぷんほどたんしゅくできるけいさんです。","romaji":"Hai. Ichinichi atari yonjuppun hodo tanshuku dekiru keisan desu.","trans":"Ya. Perhitungannya bisa memangkas sekitar 40 menit per hari."},
  {"speaker":"主任","text":"数字があると説得力があるな。ただ、検品の精度は落ちないか。","reading":"すうじがあるとせっとくりょくがあるな。ただ、けんぴんのせいどはおちないか。","romaji":"Suuji ga aru to settokuryoku ga aru na. Tada, kenpin no seido wa ochinai ka.","trans":"Dengan angka jadi meyakinkan. Tapi apakah akurasi pengecekan tidak turun?"},
  {"speaker":"アリ","text":"そこは懸念しています。まず一週間、試験的に行ってはいかがでしょうか。","reading":"そこはけねんしています。まずいっしゅうかん、しけんてきにおこなってはいかがでしょうか。","romaji":"Soko wa kenen shite imasu. Mazu isshuukan, shikenteki ni okonatte wa ikaga deshou ka.","trans":"Itu memang saya khawatirkan. Bagaimana kalau dicoba dulu satu minggu?"},
  {"speaker":"主任","text":"いいだろう。来週から試そう。結果を記録しておいてくれ。","reading":"いいだろう。らいしゅうからためそう。けっかをきろくしておいてくれ。","romaji":"Ii darou. Raishuu kara tamesou. Kekka o kiroku shite oite kure.","trans":"Boleh. Kita coba mulai minggu depan. Tolong catat hasilnya."}
 ]'::jsonb,
 '[
  {"word":"二度手間","reading":"にどでま (nidodema)","meaning":"pekerjaan yang terulang sia-sia"},
  {"word":"検品","reading":"けんぴん (kenpin)","meaning":"pemeriksaan barang"},
  {"word":"短縮","reading":"たんしゅく (tanshuku)","meaning":"pemangkasan waktu"},
  {"word":"懸念する","reading":"けねんする (kenen suru)","meaning":"mengkhawatirkan"}
 ]'::jsonb, false),

(4, 'Menengahi Konflik antar Rekan Kerja', 'work',
 '[
  {"speaker":"リナ","text":"お二人の間で、うまくいっていないと伺いました。","reading":"おふたりのあいだで、うまくいっていないとうかがいました。","romaji":"Ofutari no aida de, umaku itte inai to ukagaimashita.","trans":"Saya dengar hubungan kalian berdua sedang tidak baik."},
  {"speaker":"社員A","text":"彼はいつも指示を無視するんです。","reading":"かれはいつもしじをむしするんです。","romaji":"Kare wa itsumo shiji o mushi suru n desu.","trans":"Dia selalu mengabaikan instruksi saya."},
  {"speaker":"社員B","text":"無視ではありません。やり方が毎回変わるので、混乱しているだけです。","reading":"むしではありません。やりかたがまいかいかわるので、こんらんしているだけです。","romaji":"Mushi dewa arimasen. Yarikata ga maikai kawaru node, konran shite iru dake desu.","trans":"Bukan mengabaikan. Caranya berubah setiap kali, jadi saya bingung."},
  {"speaker":"リナ","text":"少々お待ちください。まず、事実を一つずつ確認させてください。","reading":"しょうしょうおまちください。まず、じじつをひとつずつかくにんさせてください。","romaji":"Shoushou omachi kudasai. Mazu, jijitsu o hitotsu zutsu kakunin sasete kudasai.","trans":"Mohon tunggu sebentar. Pertama, izinkan saya memastikan faktanya satu per satu."},
  {"speaker":"社員A","text":"昨日は、私が言ったのと違う場所に置かれていました。","reading":"きのうは、わたしがいったのとちがうばしょにおかれていました。","romaji":"Kinou wa, watashi ga itta no to chigau basho ni okarete imashita.","trans":"Kemarin barangnya diletakkan di tempat yang berbeda dari yang saya katakan."},
  {"speaker":"社員B","text":"先週は、そこに置くように言われたんです。","reading":"せんしゅうは、そこにおくようにいわれたんです。","romaji":"Senshuu wa, soko ni oku you ni iwareta n desu.","trans":"Minggu lalu saya justru disuruh meletakkannya di situ."},
  {"speaker":"リナ","text":"なるほど。つまり、指示の内容が週によって変わっていたわけですね。","reading":"なるほど。つまり、しじのないようがしゅうによってかわっていたわけですね。","romaji":"Naruhodo. Tsumari, shiji no naiyou ga shuu ni yotte kawatte ita wake desu ne.","trans":"Begitu. Jadi isi instruksinya memang berubah tiap minggu ya."},
  {"speaker":"社員A","text":"……言われてみれば、棚の配置を変えたときに指示も変えました。","reading":"……いわれてみれば、たなのはいちをかえたときにしじもかえました。","romaji":"...Iwarete mireba, tana no haichi o kaeta toki ni shiji mo kaemashita.","trans":"...Kalau dipikir-pikir, waktu tata letak rak diubah, instruksinya juga saya ubah."},
  {"speaker":"リナ","text":"その変更は、口頭だけでお伝えになりましたか。","reading":"そのへんこうは、こうとうだけでおつたえになりましたか。","romaji":"Sono henkou wa, koutou dake de otsutae ni narimashita ka.","trans":"Perubahan itu Anda sampaikan hanya secara lisan?"},
  {"speaker":"社員A","text":"はい。忙しかったので、その場で言っただけです。","reading":"はい。いそがしかったので、そのばでいっただけです。","romaji":"Hai. Isogashikatta node, sono ba de itta dake desu.","trans":"Ya. Karena sibuk, saya hanya menyampaikannya di tempat."},
  {"speaker":"リナ","text":"では、原因は人ではなく、伝達の方法にありそうですね。","reading":"では、げんいんはひとではなく、でんたつのほうほうにありそうですね。","romaji":"Dewa, gen-in wa hito dewa naku, dentatsu no houhou ni arisou desu ne.","trans":"Kalau begitu, akar masalahnya bukan pada orangnya, tapi pada cara penyampaiannya."},
  {"speaker":"社員B","text":"変更点を紙に貼っていただければ、私も助かります。","reading":"へんこうてんをかみにはっていただければ、わたしもたすかります。","romaji":"Henkouten o kami ni hatte itadakereba, watashi mo tasukarimasu.","trans":"Kalau perubahannya ditempel di kertas, saya juga terbantu."}
 ]'::jsonb,
 '[
  {"word":"無視する","reading":"むしする (mushi suru)","meaning":"mengabaikan"},
  {"word":"口頭","reading":"こうとう (koutou)","meaning":"secara lisan"},
  {"word":"伝達","reading":"でんたつ (dentatsu)","meaning":"penyampaian informasi"},
  {"word":"～わけですね","reading":"wake desu ne","meaning":"jadi artinya ~ ya (menyimpulkan)"}
 ]'::jsonb, false),

(4, 'Wawancara Pengunduran Diri', 'work',
 '[
  {"speaker":"人事","text":"退職のご意向と伺いました。差し支えなければ理由をお聞かせください。","reading":"たいしょくのごいこうとうかがいました。さしつかえなければりゆうをおきかせください。","romaji":"Taishoku no goikou to ukagaimashita. Sashitsukae nakereba riyuu o okikase kudasai.","trans":"Saya dengar Anda berniat mengundurkan diri. Kalau tidak keberatan, boleh tahu alasannya?"},
  {"speaker":"ブディ","text":"家族の事情で、実家に近い地域へ移らざるを得ない状況です。","reading":"かぞくのじじょうで、じっかにちかいちいきへうつらざるをえないじょうきょうです。","romaji":"Kazoku no jijou de, jikka ni chikai chiiki e utsurazaru o enai joukyou desu.","trans":"Karena urusan keluarga, saya terpaksa pindah ke daerah dekat rumah orang tua."},
  {"speaker":"人事","text":"そうでしたか。当社の勤務条件が理由ではないということですね。","reading":"そうでしたか。とうしゃのきんむじょうけんがりゆうではないということですね。","romaji":"Sou deshita ka. Tousha no kinmu jouken ga riyuu dewa nai to iu koto desu ne.","trans":"Begitu ya. Jadi bukan karena kondisi kerja di perusahaan kami."},
  {"speaker":"ブディ","text":"はい。職場には大変よくしていただきました。","reading":"はい。しょくばにはたいへんよくしていただきました。","romaji":"Hai. Shokuba ni wa taihen yoku shite itadakimashita.","trans":"Ya. Saya diperlakukan dengan sangat baik di tempat kerja ini."},
  {"speaker":"人事","text":"転勤という形での継続は、ご検討いただけませんでしょうか。","reading":"てんきんというかたちでのけいぞくは、ごけんとういただけませんでしょうか。","romaji":"Tenkin to iu katachi de no keizoku wa, gokentou itadakemasen deshou ka.","trans":"Bisakah Anda mempertimbangkan melanjutkan dalam bentuk mutasi?"},
  {"speaker":"ブディ","text":"そのような選択肢があるとは存じませんでした。","reading":"そのようなせんたくしがあるとはぞんじませんでした。","romaji":"Sono you na sentakushi ga aru to wa zonjimasen deshita.","trans":"Saya tidak tahu ada pilihan seperti itu."},
  {"speaker":"人事","text":"来春、そちらの地域に新店舗を出す計画がございます。","reading":"らいしゅん、そちらのちいきにしんてんぽをだすけいかくがございます。","romaji":"Raishun, sochira no chiiki ni shintenpo o dasu keikaku ga gozaimasu.","trans":"Musim semi depan ada rencana membuka toko baru di daerah tersebut."},
  {"speaker":"ブディ","text":"魅力的なお話ですが、移動は今月中を予定しております。","reading":"みりょくてきなおはなしですが、いどうはこんげつちゅうをよていしております。","romaji":"Miryokuteki na ohanashi desu ga, idou wa kongetsuchuu o yotei shite orimasu.","trans":"Tawaran yang menarik, tapi kepindahan saya dijadwalkan bulan ini."},
  {"speaker":"人事","text":"時期が合いませんか。無理にお引き留めするつもりはございません。","reading":"じきがあいませんか。むりにおひきとめするつもりはございません。","romaji":"Jiki ga aimasen ka. Muri ni ohikitome suru tsumori wa gozaimasen.","trans":"Waktunya tidak cocok ya. Kami tidak bermaksud menahan Anda secara paksa."},
  {"speaker":"ブディ","text":"お気持ちはありがたく受け止めております。","reading":"おきもちはありがたくうけとめております。","romaji":"Okimochi wa arigataku uketomete orimasu.","trans":"Saya menerima niat baik Anda dengan penuh syukur."},
  {"speaker":"人事","text":"では、引き継ぎの計画を立てましょう。後任への指導をお願いできますか。","reading":"では、ひきつぎのけいかくをたてましょう。こうにんへのしどうをおねがいできますか。","romaji":"Dewa, hikitsugi no keikaku o tatemashou. Kounin e no shidou o onegai dekimasu ka.","trans":"Kalau begitu mari susun rencana serah terima. Bisa saya minta Anda membimbing penggantinya?"},
  {"speaker":"ブディ","text":"もちろんです。最終日まで責任を持って務めます。","reading":"もちろんです。さいしゅうびまでせきにんをもってつとめます。","romaji":"Mochiron desu. Saishuubi made sekinin o motte tsutomemasu.","trans":"Tentu saja. Saya akan bekerja dengan penuh tanggung jawab sampai hari terakhir."}
 ]'::jsonb,
 '[
  {"word":"退職","reading":"たいしょく (taishoku)","meaning":"pengunduran diri"},
  {"word":"～ざるを得ない","reading":"ざるをえない (zaru o enai)","meaning":"terpaksa harus ~"},
  {"word":"引き継ぎ","reading":"ひきつぎ (hikitsugi)","meaning":"serah terima pekerjaan"},
  {"word":"後任","reading":"こうにん (kounin)","meaning":"orang pengganti"}
 ]'::jsonb, false),

(4, 'Menjelaskan Penyakit Kronis ke Dokter Baru', 'hospital',
 '[
  {"speaker":"医師","text":"初診ですね。現在治療中のご病気はございますか。","reading":"しょしんですね。げんざいちりょうちゅうのごびょうきはございますか。","romaji":"Shoshin desu ne. Genzai chiryouchuu no gobyouki wa gozaimasu ka.","trans":"Ini kunjungan pertama ya. Ada penyakit yang sedang Anda obati saat ini?"},
  {"speaker":"サリ","text":"はい。三年前から甲状腺の機能が低下しており、薬を服用しています。","reading":"はい。さんねんまえからこうじょうせんのきのうがていかしており、くすりをふくようしています。","romaji":"Hai. Sannen mae kara koujousen no kinou ga teika shite ori, kusuri o fukuyou shite imasu.","trans":"Ya. Sejak tiga tahun lalu fungsi tiroid saya menurun dan saya minum obat."},
  {"speaker":"医師","text":"お薬の名前と量は分かりますか。","reading":"おくすりのなまえとりょうはわかりますか。","romaji":"Okusuri no namae to ryou wa wakarimasu ka.","trans":"Apakah tahu nama dan dosis obatnya?"},
  {"speaker":"サリ","text":"お薬手帳を持参しております。こちらです。","reading":"おくすりてちょうをじさんしております。こちらです。","romaji":"Okusuri techou o jisan shite orimasu. Kochira desu.","trans":"Saya membawa buku catatan obat. Ini dia."},
  {"speaker":"医師","text":"助かります。血液検査は、直近ではいつ受けられましたか。","reading":"たすかります。けつえきけんさは、ちょっきんではいつうけられましたか。","romaji":"Tasukarimasu. Ketsueki kensa wa, chokkin de wa itsu ukeraremashita ka.","trans":"Sangat membantu. Tes darah terakhir kapan Anda jalani?"},
  {"speaker":"サリ","text":"二か月前です。数値は安定していると言われました。","reading":"にかげつまえです。すうちはあんていしているといわれました。","romaji":"Nikagetsu mae desu. Suuchi wa antei shite iru to iwaremashita.","trans":"Dua bulan lalu. Katanya angkanya stabil."},
  {"speaker":"医師","text":"承知しました。今回の症状との関連も考えられます。","reading":"しょうちしました。こんかいのしょうじょうとのかんれんもかんがえられます。","romaji":"Shouchi shimashita. Konkai no shoujou to no kanren mo kangaeraremasu.","trans":"Baik. Ada kemungkinan berkaitan dengan gejala kali ini."},
  {"speaker":"サリ","text":"疲れやすいのも、そのせいでしょうか。","reading":"つかれやすいのも、そのせいでしょうか。","romaji":"Tsukareyasui no mo, sono sei deshou ka.","trans":"Apakah mudah lelah juga karena itu?"},
  {"speaker":"医師","text":"可能性はあります。ただ、他の要因も否定できません。","reading":"かのうせいはあります。ただ、ほかのよういんもひていできません。","romaji":"Kanousei wa arimasu. Tada, hoka no youin mo hitei dekimasen.","trans":"Ada kemungkinan. Tapi faktor lain juga belum bisa disingkirkan."},
  {"speaker":"サリ","text":"前の病院に問い合わせていただくことは可能でしょうか。","reading":"まえのびょういんにといあわせていただくことはかのうでしょうか。","romaji":"Mae no byouin ni toiawasete itadaku koto wa kanou deshou ka.","trans":"Apakah bisa menghubungi rumah sakit saya sebelumnya?"},
  {"speaker":"医師","text":"紹介状をご用意いただければ、経過が正確に把握できます。","reading":"しょうかいじょうをごよういいただければ、けいかがせいかくにはあくできます。","romaji":"Shoukaijou o goyoui itadakereba, keika ga seikaku ni haaku dekimasu.","trans":"Kalau Anda siapkan surat rujukan, riwayatnya bisa kami pahami dengan akurat."},
  {"speaker":"サリ","text":"次回までに取り寄せておきます。","reading":"じかいまでにとりよせておきます。","romaji":"Jikai made ni toriyosete okimasu.","trans":"Akan saya mintakan sebelum kunjungan berikutnya."}
 ]'::jsonb,
 '[
  {"word":"服用する","reading":"ふくようする (fukuyou suru)","meaning":"mengonsumsi obat"},
  {"word":"お薬手帳","reading":"おくすりてちょう (okusuri techou)","meaning":"buku catatan riwayat obat"},
  {"word":"紹介状","reading":"しょうかいじょう (shoukaijou)","meaning":"surat rujukan antar dokter"},
  {"word":"経過","reading":"けいか (keika)","meaning":"perjalanan penyakit"}
 ]'::jsonb, false),

(4, 'Membahas Pilihan Pengobatan', 'hospital',
 '[
  {"speaker":"医師","text":"検査の結果、二つの治療方針が考えられます。","reading":"けんさのけっか、ふたつのちりょうほうしんがかんがえられます。","romaji":"Kensa no kekka, futatsu no chiryou houshin ga kangaeraremasu.","trans":"Dari hasil pemeriksaan, ada dua opsi pendekatan pengobatan."},
  {"speaker":"アリ","text":"それぞれのご説明をお願いできますか。","reading":"それぞれのごせつめいをおねがいできますか。","romaji":"Sorezore no gosetsumei o onegai dekimasu ka.","trans":"Bisa dijelaskan masing-masing?"},
  {"speaker":"医師","text":"一つは手術です。根本的に解決できますが、入院が二週間必要です。","reading":"ひとつはしゅじゅつです。こんぽんてきにかいけつできますが、にゅういんがにしゅうかんひつようです。","romaji":"Hitotsu wa shujutsu desu. Konponteki ni kaiketsu dekimasu ga, nyuuin ga nishuukan hitsuyou desu.","trans":"Satu adalah operasi. Bisa menyelesaikan akar masalahnya, tapi perlu rawat inap dua minggu."},
  {"speaker":"アリ","text":"もう一つは。","reading":"もうひとつは。","romaji":"Mou hitotsu wa.","trans":"Yang satunya?"},
  {"speaker":"医師","text":"薬による治療です。入院は不要ですが、完治までに半年ほどかかります。","reading":"くすりによるちりょうです。にゅういんはふようですが、かんちまでにはんとしほどかかります。","romaji":"Kusuri ni yoru chiryou desu. Nyuuin wa fuyou desu ga, kanchi made ni hantoshi hodo kakarimasu.","trans":"Pengobatan dengan obat. Tidak perlu rawat inap, tapi butuh sekitar setengah tahun sampai sembuh."},
  {"speaker":"アリ","text":"薬の場合、再発の可能性はどの程度でしょうか。","reading":"くすりのばあい、さいはつのかのうせいはどのていどでしょうか。","romaji":"Kusuri no baai, saihatsu no kanousei wa dono teido deshou ka.","trans":"Kalau dengan obat, seberapa besar kemungkinan kambuh?"},
  {"speaker":"医師","text":"統計上、三割程度の方が数年以内に再発されています。","reading":"とうけいじょう、さんわりていどのかたがすうねんいないにさいはつされています。","romaji":"Toukeijou, sanwari teido no kata ga suunen inai ni saihatsu sarete imasu.","trans":"Secara statistik, sekitar 30 persen pasien kambuh dalam beberapa tahun."},
  {"speaker":"アリ","text":"手術のリスクについても伺いたいのですが。","reading":"しゅじゅつのリスクについてもうかがいたいのですが。","romaji":"Shujutsu no risuku ni tsuite mo ukagaitai no desu ga.","trans":"Saya juga ingin tahu soal risiko operasinya."},
  {"speaker":"医師","text":"合併症の確率は数パーセントです。ご説明の資料をお渡しします。","reading":"がっぺいしょうのかくりつはすうパーセントです。ごせつめいのしりょうをおわたしします。","romaji":"Gappeishou no kakuritsu wa suupaasento desu. Gosetsumei no shiryou o owatashi shimasu.","trans":"Probabilitas komplikasi beberapa persen. Saya berikan materi penjelasannya."},
  {"speaker":"アリ","text":"仕事を二週間休むのは、正直に申し上げて厳しいです。","reading":"しごとをにしゅうかんやすむのは、しょうじきにもうしあげてきびしいです。","romaji":"Shigoto o nishuukan yasumu no wa, shoujiki ni moushiagete kibishii desu.","trans":"Terus terang, libur kerja dua minggu itu berat bagi saya."},
  {"speaker":"医師","text":"傷病手当金という制度があります。相談員にご案内させましょう。","reading":"しょうびょうてあてきんというせいどがあります。そうだんいんにごあんないさせましょう。","romaji":"Shoubyou teatekin to iu seido ga arimasu. Soudanin ni goannai sasemashou.","trans":"Ada sistem tunjangan sakit. Saya minta konselor menjelaskannya pada Anda."},
  {"speaker":"アリ","text":"それを伺った上で、家族と相談して決めたいと思います。","reading":"それをうかがったうえで、かぞくとそうだんしてきめたいとおもいます。","romaji":"Sore o ukagatta ue de, kazoku to soudan shite kimetai to omoimasu.","trans":"Setelah mendengar itu, saya ingin memutuskan setelah berdiskusi dengan keluarga."}
 ]'::jsonb,
 '[
  {"word":"治療方針","reading":"ちりょうほうしん (chiryou houshin)","meaning":"arah/pendekatan pengobatan"},
  {"word":"再発","reading":"さいはつ (saihatsu)","meaning":"kekambuhan"},
  {"word":"合併症","reading":"がっぺいしょう (gappeishou)","meaning":"komplikasi"},
  {"word":"傷病手当金","reading":"しょうびょうてあてきん (shoubyou teatekin)","meaning":"tunjangan selama tidak bisa bekerja karena sakit"}
 ]'::jsonb, false),

(4, 'Meminta Surat Keterangan Sakit', 'hospital',
 '[
  {"speaker":"デウィ","text":"診断書を発行していただきたいのですが。","reading":"しんだんしょをはっこうしていただきたいのですが。","romaji":"Shindansho o hakkou shite itadakitai no desu ga.","trans":"Saya ingin dibuatkan surat keterangan dokter."},
  {"speaker":"受付","text":"提出先はどちらでしょうか。用途により様式が異なります。","reading":"ていしゅつさきはどちらでしょうか。ようとによりようしきがことなります。","romaji":"Teishutsusaki wa dochira deshou ka. Youto ni yori youshiki ga kotonarimasu.","trans":"Diserahkan ke mana? Formatnya berbeda tergantung keperluan."},
  {"speaker":"デウィ","text":"勤務先です。一週間の休職を申請するために必要だと言われました。","reading":"きんむさきです。いっしゅうかんのきゅうしょくをしんせいするためにひつようだといわれました。","romaji":"Kinmusaki desu. Isshuukan no kyuushoku o shinsei suru tame ni hitsuyou da to iwaremashita.","trans":"Ke tempat kerja. Katanya diperlukan untuk mengajukan cuti sakit satu minggu."},
  {"speaker":"受付","text":"会社指定の用紙はお持ちですか。","reading":"かいしゃしていのようしはおもちですか。","romaji":"Kaisha shitei no youshi wa omochi desu ka.","trans":"Apakah membawa formulir yang ditentukan perusahaan?"},
  {"speaker":"デウィ","text":"はい、こちらです。医師の記入欄と押印欄がございます。","reading":"はい、こちらです。いしのきにゅうらんとおういんらんがございます。","romaji":"Hai, kochira desu. Ishi no kinyuuran to ouinran ga gozaimasu.","trans":"Ya, ini. Ada kolom isian dokter dan kolom stempel."},
  {"speaker":"受付","text":"承知しました。発行までに三日から一週間ほど頂戴します。","reading":"しょうちしました。はっこうまでにみっかからいっしゅうかんほどちょうだいします。","romaji":"Shouchi shimashita. Hakkou made ni mikka kara isshuukan hodo choudai shimasu.","trans":"Baik. Penerbitannya memerlukan waktu tiga hari sampai satu minggu."},
  {"speaker":"デウィ","text":"そんなにかかるのですか。会社には明日提出するよう言われております。","reading":"そんなにかかるのですか。かいしゃにはあすていしゅつするよういわれております。","romaji":"Sonna ni kakaru no desu ka. Kaisha ni wa asu teishutsu suru you iwarete orimasu.","trans":"Selama itu? Perusahaan meminta saya menyerahkannya besok."},
  {"speaker":"受付","text":"お急ぎでしたら、特急扱いも可能です。追加料金が発生いたしますが。","reading":"おいそぎでしたら、とっきゅうあつかいもかのうです。ついかりょうきんがはっせいいたしますが。","romaji":"Oisogi deshitara, tokkyuu atsukai mo kanou desu. Tsuika ryoukin ga hassei itashimasu ga.","trans":"Kalau mendesak, bisa dipercepat. Namun ada biaya tambahan."},
  {"speaker":"デウィ","text":"いくらになりますでしょうか。","reading":"いくらになりますでしょうか。","romaji":"Ikura ni narimasu deshou ka.","trans":"Berapa biayanya?"},
  {"speaker":"受付","text":"通常五千円のところ、特急ですと八千円です。","reading":"つうじょうごせんえんのところ、とっきゅうですとはっせんえんです。","romaji":"Tsuujou gosen en no tokoro, tokkyuu desu to hassen en desu.","trans":"Normalnya 5000 yen, kalau dipercepat menjadi 8000 yen."},
  {"speaker":"デウィ","text":"やむを得ませんね。特急でお願いいたします。","reading":"やむをえませんね。とっきゅうでおねがいいたします。","romaji":"Yamu o emasen ne. Tokkyuu de onegai itashimasu.","trans":"Mau bagaimana lagi. Tolong yang dipercepat."},
  {"speaker":"受付","text":"かしこまりました。明日の午後三時以降にお渡しできます。","reading":"かしこまりました。あすのごごさんじいこうにおわたしできます。","romaji":"Kashikomarimashita. Asu no gogo sanji ikou ni owatashi dekimasu.","trans":"Baik. Bisa kami serahkan besok setelah pukul tiga sore."}
 ]'::jsonb,
 '[
  {"word":"診断書","reading":"しんだんしょ (shindansho)","meaning":"surat keterangan dokter"},
  {"word":"休職","reading":"きゅうしょく (kyuushoku)","meaning":"cuti panjang dari pekerjaan"},
  {"word":"押印","reading":"おういん (ouin)","meaning":"pembubuhan stempel"},
  {"word":"やむを得ない","reading":"やむをえない (yamu o enai)","meaning":"tidak ada pilihan lain"}
 ]'::jsonb, false),

(4, 'Menegosiasi Ulang Harga Kontrak', 'biz',
 '[
  {"speaker":"リナ","text":"原材料費の高騰により、価格の見直しをお願いせざるを得ない状況です。","reading":"げんざいりょうひのこうとうにより、かかくのみなおしをおねがいせざるをえないじょうきょうです。","romaji":"Genzairyouhi no koutou ni yori, kakaku no minaoshi o onegai sezaru o enai joukyou desu.","trans":"Akibat lonjakan biaya bahan baku, kami terpaksa meminta peninjauan harga."},
  {"speaker":"客先","text":"率直に伺いますが、何パーセントの値上げをお考えですか。","reading":"そっちょくにうかがいますが、なんパーセントのねあげをおかんがえですか。","romaji":"Socchoku ni ukagaimasu ga, nanpaasento no neage o okangae desu ka.","trans":"Terus terang saja, kenaikan berapa persen yang Anda pikirkan?"},
  {"speaker":"リナ","text":"八パーセントを希望しております。根拠となる資料をお持ちしました。","reading":"はちパーセントをきぼうしております。こんきょとなるしりょうをおもちしました。","romaji":"Hachipaasento o kibou shite orimasu. Konkyo to naru shiryou o omochi shimashita.","trans":"Kami mengharapkan delapan persen. Saya membawa data pendukungnya."},
  {"speaker":"客先","text":"八パーセントは、正直申し上げて社内を通すのが難しい数字です。","reading":"はちパーセントは、しょうじきもうしあげてしゃないをとおすのがむずかしいすうじです。","romaji":"Hachipaasento wa, shoujiki moushiagete shanai o toosu no ga muzukashii suuji desu.","trans":"Terus terang, delapan persen adalah angka yang sulit lolos di internal kami."},
  {"speaker":"リナ","text":"どのあたりでしたら、ご検討いただけますでしょうか。","reading":"どのあたりでしたら、ごけんとういただけますでしょうか。","romaji":"Dono atari deshitara, gokentou itadakemasu deshou ka.","trans":"Di kisaran berapa yang bisa Anda pertimbangkan?"},
  {"speaker":"客先","text":"五パーセントであれば、稟議を通せる可能性があります。","reading":"ごパーセントであれば、りんぎをとおせるかのうせいがあります。","romaji":"Gopaasento de areba, ringi o tooseru kanousei ga arimasu.","trans":"Kalau lima persen, ada kemungkinan bisa lolos persetujuan internal."},
  {"speaker":"リナ","text":"五パーセントですと、現状では採算が合いません。","reading":"ごパーセントですと、げんじょうではさいさんがあいません。","romaji":"Gopaasento desu to, genjou de wa saisan ga aimasen.","trans":"Dengan lima persen, dalam kondisi sekarang kami tidak balik modal."},
  {"speaker":"客先","text":"では、発注量を増やすという形での調整はいかがでしょうか。","reading":"では、はっちゅうりょうをふやすというかたちでのちょうせいはいかがでしょうか。","romaji":"Dewa, hacchuuryou o fuyasu to iu katachi de no chousei wa ikaga deshou ka.","trans":"Kalau begitu, bagaimana kalau disesuaikan dengan menambah volume pemesanan?"},
  {"speaker":"リナ","text":"それは大変ありがたいご提案です。どの程度の増加でしょうか。","reading":"それはたいへんありがたいごていあんです。どのていどのぞうかでしょうか。","romaji":"Sore wa taihen arigatai goteian desu. Dono teido no zouka deshou ka.","trans":"Itu usulan yang sangat kami hargai. Kira-kira naik berapa banyak?"},
  {"speaker":"客先","text":"月間で二割増を想定しています。それでしたら六パーセントまで出せます。","reading":"げっかんでにわりぞうをそうていしています。それでしたらろくパーセントまでだせます。","romaji":"Gekkan de niwarizou o soutei shite imasu. Sore deshitara rokupaasento made dasemasu.","trans":"Kami perkirakan naik 20 persen per bulan. Dengan itu kami bisa sampai enam persen."},
  {"speaker":"リナ","text":"量が確保できるのであれば、六パーセントで調整可能かと存じます。","reading":"りょうがかくほできるのであれば、ろくパーセントでちょうせいかのうかとぞんじます。","romaji":"Ryou ga kakuho dekiru no de areba, rokupaasento de chousei kanou ka to zonjimasu.","trans":"Kalau volumenya bisa dipastikan, saya rasa enam persen bisa kami sesuaikan."},
  {"speaker":"客先","text":"では、その線で書面を交わしましょう。社内で確認を取ります。","reading":"では、そのせんでしょめんをかわしましょう。しゃないでかくにんをとります。","romaji":"Dewa, sono sen de shomen o kawashimashou. Shanai de kakunin o torimasu.","trans":"Kalau begitu mari kita tuangkan dalam dokumen di garis itu. Saya konfirmasi internal dulu."}
 ]'::jsonb,
 '[
  {"word":"高騰","reading":"こうとう (koutou)","meaning":"lonjakan harga"},
  {"word":"稟議","reading":"りんぎ (ringi)","meaning":"proses persetujuan berjenjang di perusahaan Jepang"},
  {"word":"採算が合う","reading":"さいさんがあう (saisan ga au)","meaning":"menutup biaya, balik modal"},
  {"word":"書面を交わす","reading":"しょめんをかわす (shomen o kawasu)","meaning":"menuangkan kesepakatan dalam dokumen"}
 ]'::jsonb, false),

(4, 'Menangani Komplain Berat dari Klien', 'biz',
 '[
  {"speaker":"客先","text":"納品された製品に不良が混じっていました。どういうことでしょうか。","reading":"のうひんされたせいひんにふりょうがまじっていました。どういうことでしょうか。","romaji":"Nouhin sareta seihin ni furyou ga majitte imashita. Dou iu koto deshou ka.","trans":"Ada produk cacat tercampur dalam kiriman. Bagaimana ini bisa terjadi?"},
  {"speaker":"アリ","text":"多大なご迷惑をおかけし、誠に申し訳ございません。","reading":"ただいなごめいわくをおかけし、まことにもうしわけございません。","romaji":"Tadai na gomeiwaku o okake shi, makoto ni moushiwake gozaimasen.","trans":"Kami sungguh mohon maaf telah menimbulkan kerepotan yang besar."},
  {"speaker":"客先","text":"謝罪よりも、原因と再発防止策を伺いたいのですが。","reading":"しゃざいよりも、げんいんとさいはつぼうしさくをうかがいたいのですが。","romaji":"Shazai yori mo, gen-in to saihatsu boushisaku o ukagaitai no desu ga.","trans":"Lebih dari permintaan maaf, saya ingin tahu penyebab dan langkah pencegahannya."},
  {"speaker":"アリ","text":"ごもっともです。現在調査中ですが、判明している範囲でご報告いたします。","reading":"ごもっともです。げんざいちょうさちゅうですが、はんめいしているはんいでごほうこくいたします。","romaji":"Gomottomo desu. Genzai chousachuu desu ga, hanmei shite iru han-i de gohoukoku itashimasu.","trans":"Anda benar sekali. Masih dalam penyelidikan, tapi saya laporkan sebatas yang sudah diketahui."},
  {"speaker":"客先","text":"お願いします。","reading":"おねがいします。","romaji":"Onegai shimasu.","trans":"Silakan."},
  {"speaker":"アリ","text":"検査工程で、担当者が一名欠員となった日がございました。","reading":"けんさこうていで、たんとうしゃがいちめいけついんとなったひがございました。","romaji":"Kensa koutei de, tantousha ga ichimei ketsuin to natta hi ga gozaimashita.","trans":"Pada tahap inspeksi, ada hari di mana satu petugas berhalangan hadir."},
  {"speaker":"客先","text":"人が足りないまま、出荷されたということですか。","reading":"ひとがたりないまま、しゅっかされたということですか。","romaji":"Hito ga tarinai mama, shukka sareta to iu koto desu ka.","trans":"Jadi tetap dikirim meski orangnya kurang?"},
  {"speaker":"アリ","text":"結果としてそうなりました。弁解の余地はございません。","reading":"けっかとしてそうなりました。べんかいのよちはございません。","romaji":"Kekka toshite sou narimashita. Benkai no yochi wa gozaimasen.","trans":"Hasilnya memang demikian. Tidak ada alasan yang bisa kami ajukan."},
  {"speaker":"客先","text":"正直に話していただけたことは評価します。で、対策は。","reading":"しょうじきにはなしていただけたことはひょうかします。で、たいさくは。","romaji":"Shoujiki ni hanashite itadaketa koto wa hyouka shimasu. De, taisaku wa.","trans":"Saya hargai kejujuran Anda. Lalu, langkah penanggulangannya?"},
  {"speaker":"アリ","text":"欠員時は出荷を止める規定を設けます。来週から運用いたします。","reading":"けついんじはしゅっかをとめるきていをもうけます。らいしゅうからうんよういたします。","romaji":"Ketsuinji wa shukka o tomeru kitei o moukemasu. Raishuu kara unyou itashimasu.","trans":"Kami buat aturan menghentikan pengiriman saat kekurangan petugas. Berlaku mulai minggu depan."},
  {"speaker":"客先","text":"書面でいただけますか。社内にも説明する必要がありますので。","reading":"しょめんでいただけますか。しゃないにもせつめいするひつようがありますので。","romaji":"Shomen de itadakemasu ka. Shanai ni mo setsumei suru hitsuyou ga arimasu node.","trans":"Bisa diberikan secara tertulis? Saya juga perlu menjelaskan ke internal kami."},
  {"speaker":"アリ","text":"明日中に報告書をお届けいたします。不良品は全数交換いたします。","reading":"あすじゅうにほうこくしょをおとどけいたします。ふりょうひんはぜんすうこうかんいたします。","romaji":"Asujuu ni houkokusho o otodoke itashimasu. Furyouhin wa zensuu koukan itashimasu.","trans":"Besok kami antarkan laporannya. Semua produk cacat akan kami ganti."}
 ]'::jsonb,
 '[
  {"word":"不良品","reading":"ふりょうひん (furyouhin)","meaning":"produk cacat"},
  {"word":"再発防止策","reading":"さいはつぼうしさく (saihatsu boushisaku)","meaning":"langkah pencegahan agar tidak terulang"},
  {"word":"欠員","reading":"けついん (ketsuin)","meaning":"kekurangan personel"},
  {"word":"弁解の余地はない","reading":"べんかいのよちはない (benkai no yochi wa nai)","meaning":"tidak ada pembelaan yang bisa diajukan"}
 ]'::jsonb, false),

(4, 'Rapat Kasus di Panti', 'kaigo',
 '[
  {"speaker":"主任","text":"本日は佐藤様のケース会議です。まず現状の共有をお願いします。","reading":"ほんじつはさとうさまのケースかいぎです。まずげんじょうのきょうゆうをおねがいします。","romaji":"Honjitsu wa Satou-sama no keesu kaigi desu. Mazu genjou no kyouyuu o onegai shimasu.","trans":"Hari ini rapat kasus Ibu Sato. Pertama, mari berbagi kondisi terkini."},
  {"speaker":"職員","text":"ここ一か月で、夜間の起床が週に四回程度まで増えております。","reading":"ここいっかげつで、やかんのきしょうがしゅうによんかいていどまでふえております。","romaji":"Koko ikkagetsu de, yakan no kishou ga shuu ni yonkai teido made fuete orimasu.","trans":"Dalam sebulan ini, bangun malam meningkat hingga sekitar empat kali seminggu."},
  {"speaker":"看護師","text":"服薬の内容に変更はありません。身体的な原因は見当たりません。","reading":"ふくやくのないようにへんこうはありません。しんたいてきなげんいんはみあたりません。","romaji":"Fukuyaku no naiyou ni henkou wa arimasen. Shintaiteki na gen-in wa miataremasen.","trans":"Tidak ada perubahan pada obat. Penyebab fisik tidak ditemukan."},
  {"speaker":"主任","text":"環境面ではいかがですか。","reading":"かんきょうめんではいかがですか。","romaji":"Kankyoumen de wa ikaga desu ka.","trans":"Bagaimana dari sisi lingkungan?"},
  {"speaker":"職員","text":"先月、隣室の方が入れ替わりました。時期が一致しております。","reading":"せんげつ、りんしつのかたがいれかわりました。じきがいっちしております。","romaji":"Sengetsu, rinshitsu no kata ga irekawarimashita. Jiki ga icchi shite orimasu.","trans":"Bulan lalu penghuni kamar sebelah berganti. Waktunya bertepatan."},
  {"speaker":"看護師","text":"それは重要な指摘ですね。物音が気になっている可能性があります。","reading":"それはじゅうようなしてきですね。ものおとがきになっているかのうせいがあります。","romaji":"Sore wa juuyou na shiteki desu ne. Monooto ga ki ni natte iru kanousei ga arimasu.","trans":"Itu poin penting. Ada kemungkinan beliau terganggu suara."},
  {"speaker":"主任","text":"ご本人はどのようにおっしゃっていますか。","reading":"ごほんにんはどのようにおっしゃっていますか。","romaji":"Gohonnin wa dono you ni osshatte imasu ka.","trans":"Apa yang dikatakan beliau sendiri?"},
  {"speaker":"職員","text":"うるさいとは言われませんが、眠れないとよくこぼされます。","reading":"うるさいとはいわれませんが、ねむれないとよくこぼされます。","romaji":"Urusai to wa iwaremasen ga, nemurenai to yoku kobosaremasu.","trans":"Beliau tidak bilang berisik, tapi sering mengeluh tidak bisa tidur."},
  {"speaker":"主任","text":"では、まず部屋の移動を検討しましょう。ご本人の同意が前提です。","reading":"では、まずへやのいどうをけんとうしましょう。ごほんにんのどういがぜんていです。","romaji":"Dewa, mazu heya no idou o kentou shimashou. Gohonnin no doui ga zentei desu.","trans":"Kalau begitu, mari pertimbangkan pindah kamar dulu. Dengan syarat beliau setuju."},
  {"speaker":"職員","text":"長年同じ部屋におられるので、抵抗を示される可能性もあります。","reading":"ながねんおなじへやにおられるので、ていこうをしめされるかのうせいもあります。","romaji":"Naganen onaji heya ni orareru node, teikou o shimesareru kanousei mo arimasu.","trans":"Karena bertahun-tahun di kamar yang sama, ada kemungkinan beliau menolak."},
  {"speaker":"看護師","text":"先に耳栓や環境音の調整を試してもよいのではないでしょうか。","reading":"さきにみみせんやかんきょうおんのちょうせいをためしてもよいのではないでしょうか。","romaji":"Saki ni mimisen ya kankyouon no chousei o tameshite mo yoi no dewa nai deshou ka.","trans":"Bukankah lebih baik mencoba penyumbat telinga atau penyesuaian suara lingkungan dulu?"},
  {"speaker":"主任","text":"そうしましょう。二週間試し、改善が見られなければ移動を再検討します。","reading":"そうしましょう。にしゅうかんためし、かいぜんがみられなければいどうをさいけんとうします。","romaji":"Sou shimashou. Nishuukan tameshi, kaizen ga mirarenakereba idou o saikentou shimasu.","trans":"Mari lakukan itu. Dicoba dua minggu, kalau tidak ada perbaikan kita tinjau ulang pemindahannya."}
 ]'::jsonb,
 '[
  {"word":"ケース会議","reading":"ケースかいぎ (keesu kaigi)","meaning":"rapat pembahasan kasus satu penghuni"},
  {"word":"指摘","reading":"してき (shiteki)","meaning":"poin yang ditunjukkan"},
  {"word":"抵抗を示す","reading":"ていこうをしめす (teikou o shimesu)","meaning":"menunjukkan penolakan"},
  {"word":"前提","reading":"ぜんてい (zentei)","meaning":"prasyarat"}
 ]'::jsonb, false),

(4, 'Menjelaskan Aturan Pengekangan Fisik', 'kaigo',
 '[
  {"speaker":"新人","text":"ベッドから落ちそうな方に、柵を四方に付けてはいけないのですか。","reading":"ベッドからおちそうなかたに、さくをしほうにつけてはいけないのですか。","romaji":"Beddo kara ochisou na kata ni, saku o shihou ni tsukete wa ikenai no desu ka.","trans":"Untuk yang berisiko jatuh dari tempat tidur, tidak boleh dipasang pagar di keempat sisi?"},
  {"speaker":"先輩","text":"それは身体拘束にあたります。原則として禁止されています。","reading":"それはしんたいこうそくにあたります。げんそくとしてきんしされています。","romaji":"Sore wa shintai kousoku ni atarimasu. Gensoku toshite kinshi sarete imasu.","trans":"Itu termasuk pengekangan fisik. Pada prinsipnya dilarang."},
  {"speaker":"新人","text":"でも、落ちて骨折されるほうが危険ではないでしょうか。","reading":"でも、おちてこっせつされるほうがきけんではないでしょうか。","romaji":"Demo, ochite kossetsu sareru hou ga kiken dewa nai deshou ka.","trans":"Tapi bukankah lebih berbahaya kalau jatuh dan patah tulang?"},
  {"speaker":"先輩","text":"当然の疑問です。ただ、拘束にも重大な害があります。","reading":"とうぜんのぎもんです。ただ、こうそくにもじゅうだいながいがあります。","romaji":"Touzen no gimon desu. Tada, kousoku ni mo juudai na gai ga arimasu.","trans":"Pertanyaan yang wajar. Tapi pengekangan pun punya bahaya besar."},
  {"speaker":"新人","text":"どのような害でしょうか。","reading":"どのようながいでしょうか。","romaji":"Dono you na gai deshou ka.","trans":"Bahaya seperti apa?"},
  {"speaker":"先輩","text":"筋力が落ち、認知症が進み、精神的にも大きな苦痛を与えます。","reading":"きんりょくがおち、にんちしょうがすすみ、せいしんてきにもおおきなくつうをあたえます。","romaji":"Kinryoku ga ochi, ninchishou ga susumi, seishinteki ni mo ookina kutsuu o ataemasu.","trans":"Kekuatan otot menurun, demensia memburuk, dan memberi penderitaan batin yang besar."},
  {"speaker":"新人","text":"では、絶対にできないのですか。","reading":"では、ぜったいにできないのですか。","romaji":"Dewa, zettai ni dekinai no desu ka.","trans":"Jadi mutlak tidak boleh dilakukan?"},
  {"speaker":"先輩","text":"三つの要件をすべて満たす場合のみ、例外的に認められます。","reading":"みっつのようけんをすべてみたすばあいのみ、れいがいてきにみとめられます。","romaji":"Mittsu no youken o subete mitasu baai nomi, reigaiteki ni mitomeraremasu.","trans":"Hanya bila ketiga syarat terpenuhi semua, baru diizinkan sebagai pengecualian."},
  {"speaker":"新人","text":"その三つとは。","reading":"そのみっつとは。","romaji":"Sono mittsu to wa.","trans":"Ketiga syarat itu apa?"},
  {"speaker":"先輩","text":"切迫性、非代替性、一時性です。一つでも欠ければ違法になります。","reading":"せっぱくせい、ひだいたいせい、いちじせいです。ひとつでもかければいほうになります。","romaji":"Seppakusei, hidaitaisei, ichijisei desu. Hitotsu demo kakereba ihou ni narimasu.","trans":"Kegentingan, ketiadaan alternatif, dan kesementaraan. Kurang satu saja jadi melanggar hukum."},
  {"speaker":"新人","text":"判断は現場の職員がするのですか。","reading":"はんだんはげんばのしょくいんがするのですか。","romaji":"Handan wa genba no shokuin ga suru no desu ka.","trans":"Penilaiannya dilakukan oleh staf lapangan?"},
  {"speaker":"先輩","text":"いいえ。チームで会議を開き、記録を残した上で決定します。","reading":"いいえ。チームでかいぎをひらき、きろくをのこしたうえでけっていします。","romaji":"Iie. Chiimu de kaigi o hiraki, kiroku o nokoshita ue de kettei shimasu.","trans":"Tidak. Diputuskan setelah rapat tim dan meninggalkan catatan tertulis."}
 ]'::jsonb,
 '[
  {"word":"身体拘束","reading":"しんたいこうそく (shintai kousoku)","meaning":"pengekangan fisik penghuni"},
  {"word":"切迫性","reading":"せっぱくせい (seppakusei)","meaning":"kegentingan, bahaya yang mendesak"},
  {"word":"非代替性","reading":"ひだいたいせい (hidaitaisei)","meaning":"tidak ada cara lain yang bisa menggantikan"},
  {"word":"一時性","reading":"いちじせい (ichijisei)","meaning":"sifat sementara"}
 ]'::jsonb, false),

(4, 'Menerima Keluhan Keluarga soal Layanan', 'kaigo',
 '[
  {"speaker":"家族","text":"面会に来るたびに、父の服が汚れているのが気になっております。","reading":"めんかいにくるたびに、ちちのふくがよごれているのがきになっております。","romaji":"Menkai ni kuru tabi ni, chichi no fuku ga yogorete iru no ga ki ni natte orimasu.","trans":"Setiap saya berkunjung, pakaian ayah saya kotor dan itu mengganggu saya."},
  {"speaker":"相談員","text":"ご指摘いただき、ありがとうございます。詳しくお聞かせください。","reading":"ごしてきいただき、ありがとうございます。くわしくおきかせください。","romaji":"Goshiteki itadaki, arigatou gozaimasu. Kuwashiku okikase kudasai.","trans":"Terima kasih telah menyampaikannya. Mohon jelaskan lebih rinci."},
  {"speaker":"家族","text":"先週も今週も、食べこぼしの跡がそのままになっていました。","reading":"せんしゅうもこんしゅうも、たべこぼしのあとがそのままになっていました。","romaji":"Senshuu mo konshuu mo, tabekoboshi no ato ga sono mama ni natte imashita.","trans":"Minggu lalu dan minggu ini, bekas makanan tumpah dibiarkan begitu saja."},
  {"speaker":"相談員","text":"申し訳ございません。面会の時間帯は、昼食直後にあたります。","reading":"もうしわけございません。めんかいのじかんたいは、ちゅうしょくちょくごにあたります。","romaji":"Moushiwake gozaimasen. Menkai no jikantai wa, chuushoku chokugo ni atarimasu.","trans":"Mohon maaf. Jam kunjungan Anda bertepatan tepat setelah makan siang."},
  {"speaker":"家族","text":"つまり、その後で着替えさせているということですか。","reading":"つまり、そのあとできがえさせているということですか。","romaji":"Tsumari, sono ato de kigaesasete iru to iu koto desu ka.","trans":"Maksudnya, penggantian bajunya dilakukan setelah itu?"},
  {"speaker":"相談員","text":"はい。ただ、それはこちらの都合であり、言い訳にはなりません。","reading":"はい。ただ、それはこちらのつごうであり、いいわけにはなりません。","romaji":"Hai. Tada, sore wa kochira no tsugou de ari, iiwake ni wa narimasen.","trans":"Ya. Namun itu kepentingan kami, dan tidak bisa dijadikan alasan pembenar."},
  {"speaker":"家族","text":"分かっていただけて助かります。父は身なりを気にする人でしたから。","reading":"わかっていただけてたすかります。ちちはみなりをきにするひとでしたから。","romaji":"Wakatte itadakete tasukarimasu. Chichi wa minari o ki ni suru hito deshita kara.","trans":"Saya lega Anda memahaminya. Ayah saya orang yang memperhatikan penampilan."},
  {"speaker":"相談員","text":"その情報は大変貴重です。ケアの記録に反映させていただきます。","reading":"そのじょうほうはたいへんきちょうです。ケアのきろくにはんえいさせていただきます。","romaji":"Sono jouhou wa taihen kichou desu. Kea no kiroku ni han-ei sasete itadakimasu.","trans":"Informasi itu sangat berharga. Akan kami cantumkan dalam catatan perawatan."},
  {"speaker":"家族","text":"具体的には、どのように改善されるのでしょうか。","reading":"ぐたいてきには、どのようにかいぜんされるのでしょうか。","romaji":"Gutaiteki ni wa, dono you ni kaizen sareru no deshou ka.","trans":"Secara konkret, bagaimana akan diperbaiki?"},
  {"speaker":"相談員","text":"食後すぐに口元と衣類を確認する手順を、明日から加えます。","reading":"しょくごすぐにくちもとといるいをかくにんするてじゅんを、あすからくわえます。","romaji":"Shokugo sugu ni kuchimoto to irui o kakunin suru tejun o, asu kara kuwaemasu.","trans":"Mulai besok kami tambahkan prosedur memeriksa mulut dan pakaian segera setelah makan."},
  {"speaker":"家族","text":"それでしたら安心です。厳しいことを申し上げてすみません。","reading":"それでしたらあんしんです。きびしいことをもうしあげてすみません。","romaji":"Sore deshitara anshin desu. Kibishii koto o moushiagete sumimasen.","trans":"Kalau begitu saya tenang. Maaf sudah menyampaikan hal yang keras."},
  {"speaker":"相談員","text":"とんでもございません。おっしゃっていただかなければ気づけませんでした。","reading":"とんでもございません。おっしゃっていただかなければきづけませんでした。","romaji":"Tondemo gozaimasen. Osshatte itadakanakereba kizukemasen deshita.","trans":"Sama sekali tidak. Kalau Anda tidak mengatakannya, kami tidak akan menyadarinya."}
 ]'::jsonb,
 '[
  {"word":"面会","reading":"めんかい (menkai)","meaning":"kunjungan menemui penghuni"},
  {"word":"言い訳","reading":"いいわけ (iiwake)","meaning":"alasan pembenar"},
  {"word":"身なり","reading":"みなり (minari)","meaning":"penampilan berpakaian"},
  {"word":"反映させる","reading":"はんえいさせる (han-ei saseru)","meaning":"mencerminkan, memasukkan ke dalam"}
 ]'::jsonb, false)

ON CONFLICT (level_id, title) DO NOTHING;
