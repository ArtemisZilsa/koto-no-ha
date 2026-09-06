-- 047: Silabus 介護職員 (Staf Perawatan Lansia) — pelajaran 11–20.
--
-- Lanjutan dari 046. Kesulitan naik: 11–13 = N4 (level_id 2), 14–20 = N3
-- (level_id 3). Isinya bergeser dari gerakan fisik ke penilaian dan pelaporan —
-- bagian pekerjaan yang paling sering membuat pekerja asing tersandung, karena
-- yang dituntut bukan kosakata melainkan cara berpikir.
--
-- Beberapa pelajaran di sini sengaja mengajarkan hal yang berlawanan dengan
-- naluri pemula: jangan mengangkat orang yang jatuh (12), jangan menyangkal
-- ucapan penderita demensia (15), justru laporkan kejadian yang TIDAK
-- mencelakai siapa pun (17). Itu sebabnya diletakkan setelah dasarnya kokoh.
--
-- Idempoten lewat uniq_kaiwa_job_lesson (job_slug, lesson_no) + DO NOTHING.

INSERT INTO public.kaiwa_stories
  (level_id, job_slug, lesson_no, title, goal, category, lines, vocab_highlight, is_premium) VALUES

-- ── 11 · N4 · Bantuan ekskresi ───────────────────────────────────────────────
(2, 'kaigo-shokuin', 11,
 'Membantu Buang Air dan Mencatat Pergantian Popok',
 'Kamu bisa menjaga kebersihan dan privasi saat mengganti popok, memeriksa kulit, dan menulis catatan yang berguna bagi perawat.',
 'kaigo',
 '[
  {"speaker":"田中","text":"次はおむつ交換です。手袋をしてください。","reading":"つぎはおむつこうかんです。てぶくろをしてください。","romaji":"Tsugi wa omutsu koukan desu. Tebukuro o shite kudasai.","trans":"Berikutnya ganti popok. Tolong pakai sarung tangan."},
  {"speaker":"アリ","text":"一回ごとに替えますか。","reading":"いっかいごとにかえますか。","romaji":"Ikkai goto ni kaemasu ka.","trans":"Diganti setiap kali?"},
  {"speaker":"田中","text":"替えます。一人終わったら、必ず新しいものにします。","reading":"かえます。ひとりおわったら、かならずあたらしいものにします。","romaji":"Kaemasu. Hitori owattara, kanarazu atarashii mono ni shimasu.","trans":"Diganti. Selesai satu orang, wajib ganti yang baru."},
  {"speaker":"アリ","text":"感染を防ぐためですね。","reading":"かんせんをふせぐためですね。","romaji":"Kansen o fusegu tame desu ne.","trans":"Untuk mencegah infeksi, ya."},
  {"speaker":"田中","text":"そうです。それから、カーテンを閉めて、体はタオルで隠します。","reading":"そうです。それから、カーテンをしめて、からだはタオルでかくします。","romaji":"Sou desu. Sorekara, kaaten o shimete, karada wa taoru de kakushimasu.","trans":"Betul. Selain itu, tirainya ditutup, badannya ditutupi handuk."},
  {"speaker":"アリ","text":"全部見えないようにしますか。","reading":"ぜんぶみえないようにしますか。","romaji":"Zenbu mienai you ni shimasu ka.","trans":"Ditutup semua supaya tidak terlihat?"},
  {"speaker":"田中","text":"見るのは必要なところだけです。それ以外は隠します。","reading":"みるのはひつようなところだけです。それいがいはかくします。","romaji":"Miru no wa hitsuyou na tokoro dake desu. Sore igai wa kakushimasu.","trans":"Yang dibuka hanya bagian yang perlu. Selebihnya ditutup."},
  {"speaker":"アリ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Saya mengerti."},
  {"speaker":"田中","text":"皮膚を見るのも大事な仕事です。赤くなっていないか確認してください。","reading":"ひふをみるのもだいじなしごとです。あかくなっていないかかくにんしてください。","romaji":"Hifu o miru no mo daiji na shigoto desu. Akaku natte inai ka kakunin shite kudasai.","trans":"Memeriksa kulit juga tugas penting. Tolong cek apakah ada yang memerah."},
  {"speaker":"アリ","text":"赤いとどうなりますか。","reading":"あかいとどうなりますか。","romaji":"Akai to dou narimasu ka.","trans":"Kalau memerah, kenapa?"},
  {"speaker":"田中","text":"そのままにすると、床ずれになります。治るのに何か月もかかります。","reading":"そのままにすると、とこずれになります。なおるのになんかげつもかかります。","romaji":"Sono mama ni suru to, tokozure ni narimasu. Naoru no ni nankagetsu mo kakarimasu.","trans":"Kalau dibiarkan, jadi luka baring. Sembuhnya bisa berbulan-bulan."},
  {"speaker":"アリ","text":"すぐ報告しますか。","reading":"すぐほうこくしますか。","romaji":"Sugu houkoku shimasu ka.","trans":"Langsung dilaporkan?"},
  {"speaker":"田中","text":"報告します。それから、記録に書きます。","reading":"ほうこくします。それから、きろくにかきます。","romaji":"Houkoku shimasu. Sorekara, kiroku ni kakimasu.","trans":"Dilaporkan. Lalu ditulis di catatan."},
  {"speaker":"アリ","text":"何を書きますか。","reading":"なにをかきますか。","romaji":"Nani o kakimasu ka.","trans":"Yang ditulis apa saja?"},
  {"speaker":"田中","text":"時間と、量と、色と、かたさです。出ました、だけでは足りません。","reading":"じかんと、りょうと、いろと、かたさです。でました、だけではたりません。","romaji":"Jikan to, ryou to, iro to, katasa desu. Demashita, dake dewa tarimasen.","trans":"Waktu, jumlah, warna, dan kepadatannya. Menulis sudah keluar saja tidak cukup."},
  {"speaker":"アリ","text":"細かいですね。","reading":"こまかいですね。","romaji":"Komakai desu ne.","trans":"Detail sekali, ya."},
  {"speaker":"田中","text":"便の様子で体の中が分かります。看護師はそれを見て薬を決めます。","reading":"べんのようすでからだのなかがわかります。かんごしはそれをみてくすりをきめます。","romaji":"Ben no yousu de karada no naka ga wakarimasu. Kangoshi wa sore o mite kusuri o kimemasu.","trans":"Dari kondisi tinja bisa diketahui keadaan dalam tubuhnya. Perawat menentukan obat berdasarkan itu."}
 ]'::jsonb,
 '[
  {"word":"排泄介助","reading":"はいせつかいじょ (haisetsu kaijo)","meaning":"bantuan buang air"},
  {"word":"床ずれ","reading":"とこずれ (tokozure)","meaning":"luka baring (dekubitus)"},
  {"word":"感染","reading":"かんせん (kansen)","meaning":"infeksi"},
  {"word":"皮膚","reading":"ひふ (hifu)","meaning":"kulit"}
 ]'::jsonb, false),

-- ── 12 · N4 · Menemukan penghuni terjatuh ────────────────────────────────────
(2, 'kaigo-shokuin', 12,
 'Tindakan Pertama Saat Menemukan Penghuni Terjatuh',
 'Kamu bisa menahan diri untuk tidak mengangkat, memanggil bantuan tanpa meninggalkan orangnya, dan melapor dengan asumsi paling aman.',
 'kaigo',
 '[
  {"speaker":"田中","text":"もし利用者さんが床に倒れていたら、まず何をしますか。","reading":"もしりようしゃさんがゆかにたおれていたら、まずなにをしますか。","romaji":"Moshi riyousha-san ga yuka ni taorete itara, mazu nani o shimasu ka.","trans":"Kalau kamu menemukan penghuni tergeletak di lantai, apa yang pertama kamu lakukan?"},
  {"speaker":"アリ","text":"すぐ起こします。","reading":"すぐおこします。","romaji":"Sugu okoshimasu.","trans":"Langsung saya bangunkan."},
  {"speaker":"田中","text":"それは危ないです。絶対に起こさないでください。","reading":"それはあぶないです。ぜったいにおこさないでください。","romaji":"Sore wa abunai desu. Zettai ni okosanaide kudasai.","trans":"Itu berbahaya. Jangan sekali-kali diangkat."},
  {"speaker":"アリ","text":"どうしてですか。","reading":"どうしてですか。","romaji":"Doushite desu ka.","trans":"Kenapa?"},
  {"speaker":"田中","text":"骨が折れているかもしれません。動かすと、もっとひどくなります。","reading":"ほねがおれているかもしれません。うごかすと、もっとひどくなります。","romaji":"Hone ga orete iru kamo shiremasen. Ugokasu to, motto hidoku narimasu.","trans":"Bisa jadi ada tulang yang patah. Kalau digerakkan, malah tambah parah."},
  {"speaker":"アリ","text":"では、何をしますか。","reading":"では、なにをしますか。","romaji":"Dewa, nani o shimasu ka.","trans":"Lalu, apa yang harus dilakukan?"},
  {"speaker":"田中","text":"まず声をかけます。大丈夫ですか、聞こえますか、と。","reading":"まずこえをかけます。だいじょうぶですか、きこえますか、と。","romaji":"Mazu koe o kakemasu. Daijoubu desu ka, kikoemasu ka, to.","trans":"Pertama panggil dia. Bapak tidak apa-apa? Terdengar suara saya?"},
  {"speaker":"アリ","text":"返事があったら。","reading":"へんじがあったら。","romaji":"Henji ga attara.","trans":"Kalau ada jawaban?"},
  {"speaker":"田中","text":"そのまま、そばを離れないでください。そして大きな声で人を呼びます。","reading":"そのまま、そばをはなれないでください。そしておおきなこえでひとをよびます。","romaji":"Sono mama, soba o hanarenaide kudasai. Soshite ookina koe de hito o yobimasu.","trans":"Tetap di situ, jangan tinggalkan dia. Lalu panggil orang dengan suara keras."},
  {"speaker":"アリ","text":"私が看護師を呼びに行きますか。","reading":"わたしがかんごしをよびにいきますか。","romaji":"Watashi ga kangoshi o yobi ni ikimasu ka.","trans":"Saya yang pergi memanggil perawat?"},
  {"speaker":"田中","text":"行きません。一人にすると、また動いて危ないです。その場から呼びます。","reading":"いきません。ひとりにすると、またうごいてあぶないです。そのばからよびます。","romaji":"Ikimasen. Hitori ni suru to, mata ugoite abunai desu. Sono ba kara yobimasu.","trans":"Jangan. Kalau ditinggal sendiri, dia bisa bergerak lagi dan itu berbahaya. Panggil dari tempat itu juga."},
  {"speaker":"アリ","text":"返事がないときは。","reading":"へんじがないときは。","romaji":"Henji ga nai toki wa.","trans":"Kalau tidak ada jawaban?"},
  {"speaker":"田中","text":"息をしているか見て、すぐ緊急対応です。ナースコールを押します。","reading":"いきをしているかみて、すぐきんきゅうたいおうです。ナースコールをおします。","romaji":"Iki o shite iru ka mite, sugu kinkyuu taiou desu. Naasu kooru o oshimasu.","trans":"Lihat apakah dia bernapas, lalu langsung penanganan darurat. Tekan tombol panggil perawat."},
  {"speaker":"アリ","text":"頭を打ったかどうかは、どう分かりますか。","reading":"あたまをうったかどうかは、どうわかりますか。","romaji":"Atama o utta ka dou ka wa, dou wakarimasu ka.","trans":"Bagaimana tahu kepalanya terbentur atau tidak?"},
  {"speaker":"田中","text":"見ただけでは分かりません。だから、打ったかもしれないと考えて報告します。","reading":"みただけではわかりません。だから、うったかもしれないとかんがえてほうこくします。","romaji":"Mita dake dewa wakarimasen. Dakara, utta kamo shirenai to kangaete houkoku shimasu.","trans":"Dari melihat saja tidak bisa tahu. Makanya kita laporkan dengan anggapan mungkin terbentur."},
  {"speaker":"アリ","text":"分からないときは、重いほうで考えるんですね。","reading":"わからないときは、おもいほうでかんがえるんですね。","romaji":"Wakaranai toki wa, omoi hou de kangaeru n desu ne.","trans":"Jadi kalau tidak yakin, kita ambil kemungkinan yang paling berat, ya."},
  {"speaker":"田中","text":"そうです。介護では、それが一番安全な考え方です。","reading":"そうです。かいごでは、それがいちばんあんぜんなかんがえかたです。","romaji":"Sou desu. Kaigo dewa, sore ga ichiban anzen na kangaekata desu.","trans":"Betul. Di dunia kaigo, itu cara berpikir yang paling aman."}
 ]'::jsonb,
 '[
  {"word":"転倒","reading":"てんとう (tentou)","meaning":"terjatuh"},
  {"word":"骨が折れる","reading":"ほねがおれる (hone ga oreru)","meaning":"patah tulang"},
  {"word":"緊急対応","reading":"きんきゅうたいおう (kinkyuu taiou)","meaning":"penanganan darurat"},
  {"word":"ナースコール","reading":"naasu kooru","meaning":"tombol panggil perawat"}
 ]'::jsonb, false),

-- ── 13 · N4 · Menulis kiroku ─────────────────────────────────────────────────
(2, 'kaigo-shokuin', 13,
 'Menulis Catatan: Memisahkan Fakta dari Pendapat',
 'Kamu bisa menulis kiroku yang bisa dipercaya: fakta yang terukur dulu, pendapatmu terpisah setelahnya.',
 'kaigo',
 '[
  {"speaker":"田中","text":"今日は記録の書き方です。これが一番むずかしいかもしれません。","reading":"きょうはきろくのかきかたです。これがいちばんむずかしいかもしれません。","romaji":"Kyou wa kiroku no kakikata desu. Kore ga ichiban muzukashii kamo shiremasen.","trans":"Hari ini soal cara menulis catatan. Ini mungkin yang paling sulit."},
  {"speaker":"アリ","text":"見たことを書けばいいですよね。","reading":"みたことをかけばいいですよね。","romaji":"Mita koto o kakeba ii desu yo ne.","trans":"Tinggal tulis apa yang dilihat, kan?"},
  {"speaker":"田中","text":"そうですが、事実と自分の考えを分けて書きます。","reading":"そうですが、じじつとじぶんのかんがえをわけてかきます。","romaji":"Sou desu ga, jijitsu to jibun no kangae o wakete kakimasu.","trans":"Betul, tapi fakta dan pendapatmu harus ditulis terpisah."},
  {"speaker":"アリ","text":"分けるとは。","reading":"わけるとは。","romaji":"Wakeru to wa.","trans":"Terpisah maksudnya bagaimana?"},
  {"speaker":"田中","text":"例えば、元気がなさそうだった、は、あなたの感想です。","reading":"たとえば、げんきがなさそうだった、は、あなたのかんそうです。","romaji":"Tatoeba, genki ga nasasou datta, wa, anata no kansou desu.","trans":"Misalnya, tampak kurang bersemangat, itu kesanmu."},
  {"speaker":"アリ","text":"事実ではありませんか。","reading":"じじつではありませんか。","romaji":"Jijitsu dewa arimasen ka.","trans":"Bukan fakta?"},
  {"speaker":"田中","text":"事実は、朝食を半分残した、声をかけても返事が少なかった、です。","reading":"じじつは、ちょうしょくをはんぶんのこした、こえをかけてもへんじがすくなかった、です。","romaji":"Jijitsu wa, choushoku o hanbun nokoshita, koe o kakete mo henji ga sukunakatta, desu.","trans":"Faktanya: menyisakan setengah sarapan, dipanggil pun jarang menjawab."},
  {"speaker":"アリ","text":"数字や動きを書くんですね。","reading":"すうじやうごきをかくんですね。","romaji":"Suuji ya ugoki o kaku n desu ne.","trans":"Jadi yang ditulis angka dan perilakunya, ya."},
  {"speaker":"田中","text":"そうです。読む人が、同じ場面を思い浮かべられるように書きます。","reading":"そうです。よむひとが、おなじばめんをおもいうかべられるようにかきます。","romaji":"Sou desu. Yomu hito ga, onaji bamen o omoiukaberareru you ni kakimasu.","trans":"Betul. Ditulis supaya pembacanya bisa membayangkan situasi yang sama."},
  {"speaker":"アリ","text":"私の考えは書いてはいけませんか。","reading":"わたしのかんがえはかいてはいけませんか。","romaji":"Watashi no kangae wa kaite wa ikemasen ka.","trans":"Pendapat saya tidak boleh ditulis?"},
  {"speaker":"田中","text":"書いてもいいです。でも、事実のあとに、分けて書きます。","reading":"かいてもいいです。でも、じじつのあとに、わけてかきます。","romaji":"Kaite mo ii desu. Demo, jijitsu no ato ni, wakete kakimasu.","trans":"Boleh ditulis. Tapi setelah fakta, dan dipisahkan."},
  {"speaker":"アリ","text":"どうして分けるんですか。","reading":"どうしてわけるんですか。","romaji":"Doushite wakeru n desu ka.","trans":"Kenapa harus dipisah?"},
  {"speaker":"田中","text":"記録は、あとで事故があったときに読まれます。裁判で使うこともあります。","reading":"きろくは、あとでじこがあったときによまれます。さいばんでつかうこともあります。","romaji":"Kiroku wa, ato de jiko ga atta toki ni yomaremasu. Saiban de tsukau koto mo arimasu.","trans":"Catatan itu dibaca kalau nanti terjadi insiden. Kadang dipakai di pengadilan."},
  {"speaker":"アリ","text":"そんなに大事なんですか。","reading":"そんなにだいじなんですか。","romaji":"Sonna ni daiji na n desu ka.","trans":"Sepenting itu?"},
  {"speaker":"田中","text":"大事です。書いていないことは、しなかったことになります。","reading":"だいじです。かいていないことは、しなかったことになります。","romaji":"Daiji desu. Kaite inai koto wa, shinakatta koto ni narimasu.","trans":"Sangat penting. Yang tidak ditulis dianggap tidak pernah dikerjakan."},
  {"speaker":"アリ","text":"覚えておきます。","reading":"おぼえておきます。","romaji":"Oboete okimasu.","trans":"Saya ingat baik-baik."},
  {"speaker":"田中","text":"それから、消しゴムで消さないでください。間違えたら、線を引いて直します。","reading":"それから、けしゴムでけさないでください。まちがえたら、せんをひいてなおします。","romaji":"Sorekara, keshigomu de kesanaide kudasai. Machigaetara, sen o hiite naoshimasu.","trans":"Selain itu, jangan dihapus pakai penghapus. Kalau salah, coret dengan garis lalu perbaiki."}
 ]'::jsonb,
 '[
  {"word":"記録","reading":"きろく (kiroku)","meaning":"catatan kerja"},
  {"word":"事実","reading":"じじつ (jijitsu)","meaning":"fakta"},
  {"word":"感想","reading":"かんそう (kansou)","meaning":"kesan, pendapat pribadi"},
  {"word":"裁判","reading":"さいばん (saiban)","meaning":"persidangan"}
 ]'::jsonb, false),

-- ── 14 · N3 · Hou-Ren-Sou ────────────────────────────────────────────────────
(3, 'kaigo-shokuin', 14,
 'Melapor, Menginformasikan, dan Berkonsultasi ke Perawat',
 'Kamu bisa memakai prinsip hou-ren-sou dan menyampaikan laporan dengan kesimpulan lebih dulu.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、ホウレンソウという言葉を知っていますか。","reading":"アリさん、ホウレンソウということばをしっていますか。","romaji":"Ari-san, hourensou to iu kotoba o shitte imasu ka.","trans":"Ari, kamu tahu istilah hou-ren-sou?"},
  {"speaker":"アリ","text":"野菜ですか。","reading":"やさいですか。","romaji":"Yasai desu ka.","trans":"Bukannya itu nama sayur?"},
  {"speaker":"田中","text":"野菜ではありません。報告、連絡、相談の頭文字です。","reading":"やさいではありません。ほうこく、れんらく、そうだんのかしらもじです。","romaji":"Yasai dewa arimasen. Houkoku, renraku, soudan no kashiramoji desu.","trans":"Bukan sayur. Itu singkatan dari houkoku, renraku, soudan."},
  {"speaker":"アリ","text":"仕事の言葉なんですね。","reading":"しごとのことばなんですね。","romaji":"Shigoto no kotoba na n desu ne.","trans":"Jadi istilah kerja, ya."},
  {"speaker":"田中","text":"そうです。介護では、これができないと事故になります。","reading":"そうです。かいごでは、これができないとじこになります。","romaji":"Sou desu. Kaigo dewa, kore ga dekinai to jiko ni narimasu.","trans":"Betul. Di kaigo, kalau ini tidak jalan, ujungnya kecelakaan."},
  {"speaker":"アリ","text":"報告は、終わったことを言うんですか。","reading":"ほうこくは、おわったことをいうんですか。","romaji":"Houkoku wa, owatta koto o iu n desu ka.","trans":"Houkoku itu melaporkan yang sudah selesai?"},
  {"speaker":"田中","text":"そうです。言われた仕事が終わったら、その場で報告します。","reading":"そうです。いわれたしごとがおわったら、そのばでほうこくします。","romaji":"Sou desu. Iwareta shigoto ga owattara, sono ba de houkoku shimasu.","trans":"Betul. Begitu tugas yang diminta selesai, langsung dilaporkan saat itu juga."},
  {"speaker":"アリ","text":"連絡は。","reading":"れんらくは。","romaji":"Renraku wa.","trans":"Kalau renraku?"},
  {"speaker":"田中","text":"事実を、関係のある人みんなに伝えます。自分の意見は入れません。","reading":"じじつを、かんけいのあるひとみんなにつたえます。じぶんのいけんはいれません。","romaji":"Jijitsu o, kankei no aru hito minna ni tsutaemasu. Jibun no iken wa iremasen.","trans":"Menyampaikan fakta ke semua yang berkepentingan. Tanpa memasukkan pendapat sendiri."},
  {"speaker":"アリ","text":"相談は。","reading":"そうだんは。","romaji":"Soudan wa.","trans":"Kalau soudan?"},
  {"speaker":"田中","text":"迷ったとき、分からないとき、自分で決める前に聞くことです。","reading":"まよったとき、わからないとき、じぶんできめるまえにきくことです。","romaji":"Mayotta toki, wakaranai toki, jibun de kimeru mae ni kiku koto desu.","trans":"Saat ragu atau tidak tahu, bertanya sebelum memutuskan sendiri."},
  {"speaker":"アリ","text":"忙しそうなときも聞いていいですか。","reading":"いそがしそうなときもきいていいですか。","romaji":"Isogashisou na toki mo kiite ii desu ka.","trans":"Waktu mereka kelihatan sibuk juga boleh bertanya?"},
  {"speaker":"田中","text":"聞いてください。一番困るのは、黙って自分で決めることです。","reading":"きいてください。いちばんこまるのは、だまってじぶんできめることです。","romaji":"Kiite kudasai. Ichiban komaru no wa, damatte jibun de kimeru koto desu.","trans":"Tanyalah. Yang paling merepotkan itu diam-diam memutuskan sendiri."},
  {"speaker":"アリ","text":"怒られると思っていました。","reading":"おこられるとおもっていました。","romaji":"Okorareru to omotte imashita.","trans":"Saya kira nanti dimarahi."},
  {"speaker":"田中","text":"聞いて怒る人はいません。黙っていて、あとで大きな問題になるほうが困ります。","reading":"きいておこるひとはいません。だまっていて、あとでおおきなもんだいになるほうがこまります。","romaji":"Kiite okoru hito wa imasen. Damatte ite, ato de ookina mondai ni naru hou ga komarimasu.","trans":"Tidak ada yang marah karena ditanya. Yang merepotkan itu diam lalu jadi masalah besar."},
  {"speaker":"アリ","text":"看護師に伝えるとき、順番はありますか。","reading":"かんごしにつたえるとき、じゅんばんはありますか。","romaji":"Kangoshi ni tsutaeru toki, junban wa arimasu ka.","trans":"Saat melapor ke perawat, ada urutannya?"},
  {"speaker":"田中","text":"あります。まず結論、次に事実、最後に自分の考えです。長い話は伝わりません。","reading":"あります。まずけつろん、つぎにじじつ、さいごにじぶんのかんがえです。ながいはなしはつたわりません。","romaji":"Arimasu. Mazu ketsuron, tsugi ni jijitsu, saigo ni jibun no kangae desu. Nagai hanashi wa tsutawarimasen.","trans":"Ada. Kesimpulan dulu, lalu fakta, terakhir pendapatmu. Cerita panjang tidak akan tersampaikan."}
 ]'::jsonb,
 '[
  {"word":"報告","reading":"ほうこく (houkoku)","meaning":"melaporkan hasil pekerjaan"},
  {"word":"連絡","reading":"れんらく (renraku)","meaning":"menginformasikan fakta ke pihak terkait"},
  {"word":"相談","reading":"そうだん (soudan)","meaning":"berkonsultasi sebelum memutuskan"},
  {"word":"結論","reading":"けつろん (ketsuron)","meaning":"kesimpulan"}
 ]'::jsonb, false),

-- ── 15 · N3 · Demensia ───────────────────────────────────────────────────────
(3, 'kaigo-shokuin', 15,
 'Menghadapi Penderita Demensia Tanpa Menyangkal',
 'Kamu bisa menerima ucapan yang keliru tanpa membantah, menenangkan lebih dulu, dan mendekat dari arah yang tidak mengejutkan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"山田さんが、さっきご飯を食べたのに、食べていない、と言っています。","reading":"やまださんが、さっきごはんをたべたのに、たべていない、といっています。","romaji":"Yamada-san ga, sakki gohan o tabeta noni, tabete inai, to itte imasu.","trans":"Bu Yamada baru saja makan, tapi bilang belum makan."},
  {"speaker":"アリ","text":"さっき食べましたよ、と言いますか。","reading":"さっきたべましたよ、といいますか。","romaji":"Sakki tabemashita yo, to iimasu ka.","trans":"Saya bilang saja tadi sudah makan?"},
  {"speaker":"田中","text":"言わないでください。否定すると、もっと不安になります。","reading":"いわないでください。ひていすると、もっとふあんになります。","romaji":"Iwanaide kudasai. Hitei suru to, motto fuan ni narimasu.","trans":"Jangan. Kalau disangkal, dia malah makin cemas."},
  {"speaker":"アリ","text":"でも、うそをつくんですか。","reading":"でも、うそをつくんですか。","romaji":"Demo, uso o tsuku n desu ka.","trans":"Tapi bukankah itu berbohong?"},
  {"speaker":"田中","text":"うそではありません。その人にとっては、本当に食べていないんです。","reading":"うそではありません。そのひとにとっては、ほんとうにたべていないんです。","romaji":"Uso dewa arimasen. Sono hito ni totte wa, hontou ni tabete inai n desu.","trans":"Bukan bohong. Bagi dia, dia memang benar-benar belum makan."},
  {"speaker":"アリ","text":"記憶が消えているんですね。","reading":"きおくがきえているんですね。","romaji":"Kioku ga kiete iru n desu ne.","trans":"Ingatannya yang hilang, ya."},
  {"speaker":"田中","text":"そうです。だから、まず気持ちを受け止めます。おなかがすきましたか、と。","reading":"そうです。だから、まずきもちをうけとめます。おなかがすきましたか、と。","romaji":"Sou desu. Dakara, mazu kimochi o uketomemasu. Onaka ga sukimashita ka, to.","trans":"Betul. Makanya perasaannya diterima dulu. Ibu lapar, ya?"},
  {"speaker":"アリ","text":"それから。","reading":"それから。","romaji":"Sorekara.","trans":"Lalu?"},
  {"speaker":"田中","text":"今、準備しますね、と言って、お茶や小さいものを出します。","reading":"いま、じゅんびしますね、といって、おちゃやちいさいものをだします。","romaji":"Ima, junbi shimasu ne, to itte, ocha ya chiisai mono o dashimasu.","trans":"Bilang sebentar saya siapkan ya, lalu sajikan teh atau camilan kecil."},
  {"speaker":"アリ","text":"話をそらしますか。","reading":"はなしをそらしますか。","romaji":"Hanashi o sorashimasu ka.","trans":"Mengalihkan pembicaraan?"},
  {"speaker":"田中","text":"そらすというより、安心してもらいます。落ち着けば、忘れることも多いです。","reading":"そらすというより、あんしんしてもらいます。おちつけば、わすれることもおおいです。","romaji":"Sorasu to iu yori, anshin shite moraimasu. Ochitsukeba, wasureru koto mo ooi desu.","trans":"Bukan mengalihkan, tapi menenangkan. Kalau sudah tenang, sering kali dia lupa sendiri."},
  {"speaker":"アリ","text":"何度も同じことを聞かれたら、疲れませんか。","reading":"なんどもおなじことをきかれたら、つかれませんか。","romaji":"Nandomo onaji koto o kikaretara, tsukaremasen ka.","trans":"Kalau ditanya hal yang sama berkali-kali, tidak lelah?"},
  {"speaker":"田中","text":"疲れます。でも、その人は初めて聞いているつもりです。","reading":"つかれます。でも、そのひとははじめてきいているつもりです。","romaji":"Tsukaremasu. Demo, sono hito wa hajimete kiite iru tsumori desu.","trans":"Lelah. Tapi bagi dia, dia merasa baru pertama kali bertanya."},
  {"speaker":"アリ","text":"私も初めてのように答えるんですね。","reading":"わたしもはじめてのようにこたえるんですね。","romaji":"Watashi mo hajimete no you ni kotaeru n desu ne.","trans":"Jadi saya juga menjawab seperti baru pertama kali, ya."},
  {"speaker":"田中","text":"そうです。それに、名前を呼んで、目を見て、ゆっくり話すと落ち着きます。","reading":"そうです。それに、なまえをよんで、めをみて、ゆっくりはなすとおちつきます。","romaji":"Sou desu. Sore ni, namae o yonde, me o mite, yukkuri hanasu to ochitsukimasu.","trans":"Betul. Selain itu, panggil namanya, tatap matanya, bicara pelan — dia akan tenang."},
  {"speaker":"アリ","text":"後ろから急に触るのはだめですか。","reading":"うしろからきゅうにさわるのはだめですか。","romaji":"Ushiro kara kyuu ni sawaru no wa dame desu ka.","trans":"Menyentuh mendadak dari belakang tidak boleh?"},
  {"speaker":"田中","text":"だめです。びっくりして、怒ることがあります。必ず前から近づきます。","reading":"だめです。びっくりして、おこることがあります。かならずまえからちかづきます。","romaji":"Dame desu. Bikkuri shite, okoru koto ga arimasu. Kanarazu mae kara chikazukimasu.","trans":"Tidak boleh. Dia kaget dan bisa jadi marah. Wajib mendekat dari depan."}
 ]'::jsonb,
 '[
  {"word":"認知症","reading":"にんちしょう (ninchishou)","meaning":"demensia"},
  {"word":"否定する","reading":"ひていする (hitei suru)","meaning":"menyangkal, membantah"},
  {"word":"受け止める","reading":"うけとめる (uketomeru)","meaning":"menerima (perasaan orang lain)"},
  {"word":"落ち着く","reading":"おちつく (ochitsuku)","meaning":"menjadi tenang"}
 ]'::jsonb, false),

-- ── 16 · N3 · Batas menjawab keluarga ────────────────────────────────────────
(3, 'kaigo-shokuin', 16,
 'Sejauh Mana Kamu Boleh Menjawab Pertanyaan Keluarga',
 'Kamu bisa membedakan apa yang boleh kamu jawab sendiri dan apa yang harus dilempar ke perawat, serta menjaga kerahasiaan penghuni lain.',
 'kaigo',
 '[
  {"speaker":"田中","text":"ご家族から質問されたとき、気をつけることがあります。","reading":"ごかぞくからしつもんされたとき、きをつけることがあります。","romaji":"Gokazoku kara shitsumon sareta toki, ki o tsukeru koto ga arimasu.","trans":"Saat ditanya oleh keluarga penghuni, ada hal yang perlu diperhatikan."},
  {"speaker":"アリ","text":"何でも答えてはいけませんか。","reading":"なんでもこたえてはいけませんか。","romaji":"Nandemo kotaete wa ikemasen ka.","trans":"Tidak boleh menjawab semuanya?"},
  {"speaker":"田中","text":"体の状態や薬のことは、看護師か相談員が答えます。","reading":"からだのじょうたいやくすりのことは、かんごしかそうだんいんがこたえます。","romaji":"Karada no joutai ya kusuri no koto wa, kangoshi ka soudanin ga kotaemasu.","trans":"Soal kondisi tubuh dan obat, yang menjawab perawat atau konselor."},
  {"speaker":"アリ","text":"私は答えられませんか。","reading":"わたしはこたえられませんか。","romaji":"Watashi wa kotaeraremasen ka.","trans":"Saya tidak boleh menjawab?"},
  {"speaker":"田中","text":"今日の様子は答えられます。よく食べました、よく眠りました、などです。","reading":"きょうのようすはこたえられます。よくたべました、よくねむりました、などです。","romaji":"Kyou no yousu wa kotaeraremasu. Yoku tabemashita, yoku nemurimashita, nado desu.","trans":"Keadaan hari ini boleh. Misalnya makannya lahap, tidurnya nyenyak."},
  {"speaker":"アリ","text":"見たことだけですね。","reading":"みたことだけですね。","romaji":"Mita koto dake desu ne.","trans":"Hanya yang saya lihat sendiri, ya."},
  {"speaker":"田中","text":"そうです。病気の名前や、これからどうなるかは、言ってはいけません。","reading":"そうです。びょうきのなまえや、これからどうなるかは、いってはいけません。","romaji":"Sou desu. Byouki no namae ya, korekara dou naru ka wa, itte wa ikemasen.","trans":"Betul. Nama penyakit atau bagaimana nanti perkembangannya, tidak boleh disebut."},
  {"speaker":"アリ","text":"もし聞かれたら。","reading":"もしきかれたら。","romaji":"Moshi kikaretara.","trans":"Kalau tetap ditanya?"},
  {"speaker":"田中","text":"看護師に確認して、あとでお伝えします、と言います。","reading":"かんごしにかくにんして、あとでおつたえします、といいます。","romaji":"Kangoshi ni kakunin shite, ato de otsutae shimasu, to iimasu.","trans":"Bilang saja, saya konfirmasi ke perawat dulu, nanti saya sampaikan."},
  {"speaker":"アリ","text":"分からないと言うのは、失礼ではありませんか。","reading":"わからないというのは、しつれいではありませんか。","romaji":"Wakaranai to iu no wa, shitsurei dewa arimasen ka.","trans":"Bilang tidak tahu itu tidak sopan?"},
  {"speaker":"田中","text":"失礼ではありません。まちがったことを伝えるほうが、ずっと問題になります。","reading":"しつれいではありません。まちがったことをつたえるほうが、ずっともんだいになります。","romaji":"Shitsurei dewa arimasen. Machigatta koto o tsutaeru hou ga, zutto mondai ni narimasu.","trans":"Tidak. Menyampaikan hal yang keliru jauh lebih bermasalah."},
  {"speaker":"アリ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Saya mengerti."},
  {"speaker":"田中","text":"それから、ほかの利用者さんの話は絶対にしません。名前も出しません。","reading":"それから、ほかのりようしゃさんのはなしはぜったいにしません。なまえもだしません。","romaji":"Sorekara, hoka no riyousha-san no hanashi wa zettai ni shimasen. Namae mo dashimasen.","trans":"Selain itu, jangan sekali-kali membicarakan penghuni lain. Namanya pun tidak disebut."},
  {"speaker":"アリ","text":"個人情報ですね。","reading":"こじんじょうほうですね。","romaji":"Kojin jouhou desu ne.","trans":"Data pribadi, ya."},
  {"speaker":"田中","text":"そうです。家に帰ってからも、SNSにも書きません。写真も撮りません。","reading":"そうです。いえにかえってからも、エスエヌエスにもかきません。しゃしんもとりません。","romaji":"Sou desu. Ie ni kaette kara mo, esu-enu-esu ni mo kakimasen. Shashin mo torimasen.","trans":"Betul. Sepulang ke rumah pun, jangan ditulis di media sosial. Jangan memotret juga."},
  {"speaker":"アリ","text":"気をつけます。","reading":"きをつけます。","romaji":"Ki o tsukemasu.","trans":"Saya akan hati-hati."},
  {"speaker":"田中","text":"ここで見たことは、ここに置いていく。それが決まりです。","reading":"ここでみたことは、ここにおいていく。それがきまりです。","romaji":"Koko de mita koto wa, koko ni oite iku. Sore ga kimari desu.","trans":"Apa yang kamu lihat di sini, tinggalkan di sini. Itu aturannya."}
 ]'::jsonb,
 '[
  {"word":"家族対応","reading":"かぞくたいおう (kazoku taiou)","meaning":"penanganan komunikasi dengan keluarga"},
  {"word":"個人情報","reading":"こじんじょうほう (kojin jouhou)","meaning":"data pribadi"},
  {"word":"相談員","reading":"そうだんいん (soudanin)","meaning":"konselor kehidupan di panti"},
  {"word":"決まり","reading":"きまり (kimari)","meaning":"aturan, ketentuan"}
 ]'::jsonb, false),

-- ── 17 · N3 · Hiyari-hatto ───────────────────────────────────────────────────
(3, 'kaigo-shokuin', 17,
 'Melaporkan Nyaris Celaka (Hiyari-Hatto)',
 'Kamu bisa melaporkan kejadian yang tidak sampai mencederai siapa pun, dan menuliskannya sebagai masalah sistem, bukan kesalahan orang.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、ヒヤリハットという報告書を知っていますか。","reading":"アリさん、ヒヤリハットというほうこくしょをしっていますか。","romaji":"Ari-san, hiyari hatto to iu houkokusho o shitte imasu ka.","trans":"Ari, kamu tahu laporan yang namanya hiyari-hatto?"},
  {"speaker":"アリ","text":"事故の報告ですか。","reading":"じこのほうこくですか。","romaji":"Jiko no houkoku desu ka.","trans":"Laporan kecelakaan?"},
  {"speaker":"田中","text":"事故になる前の報告です。あぶなかったけれど、けががなかったとき。","reading":"じこになるまえのほうこくです。あぶなかったけれど、けががなかったとき。","romaji":"Jiko ni naru mae no houkoku desu. Abunakatta keredo, kega ga nakatta toki.","trans":"Laporan sebelum jadi kecelakaan. Saat sudah nyaris, tapi tidak ada yang terluka."},
  {"speaker":"アリ","text":"何もなかったのに、書くんですか。","reading":"なにもなかったのに、かくんですか。","romaji":"Nani mo nakatta noni, kaku n desu ka.","trans":"Tidak terjadi apa-apa pun tetap ditulis?"},
  {"speaker":"田中","text":"書きます。ヒヤリ、ハッと、した、という意味です。","reading":"かきます。ヒヤリ、ハッと、した、といういみです。","romaji":"Kakimasu. Hiyari, hatto, shita, to iu imi desu.","trans":"Ditulis. Artinya sempat merinding dan terkesiap."},
  {"speaker":"アリ","text":"例えば、どんなときですか。","reading":"たとえば、どんなときですか。","romaji":"Tatoeba, donna toki desu ka.","trans":"Contohnya situasi seperti apa?"},
  {"speaker":"田中","text":"車いすのブレーキを忘れて、動きそうになった。でも、間に合った。","reading":"くるまいすのブレーキをわすれて、うごきそうになった。でも、まにあった。","romaji":"Kurumaisu no bureeki o wasurete, ugokisou ni natta. Demo, ma ni atta.","trans":"Lupa mengunci rem kursi roda, hampir bergerak. Tapi masih sempat ditahan."},
  {"speaker":"アリ","text":"それも書きますか。","reading":"それもかきますか。","romaji":"Sore mo kakimasu ka.","trans":"Itu pun ditulis?"},
  {"speaker":"田中","text":"書きます。同じことが、次は間に合わないかもしれません。","reading":"かきます。おなじことが、つぎはまにあわないかもしれません。","romaji":"Kakimasu. Onaji koto ga, tsugi wa ma ni awanai kamo shiremasen.","trans":"Ditulis. Hal yang sama, lain kali mungkin sudah tidak sempat."},
  {"speaker":"アリ","text":"怒られませんか。","reading":"おこられませんか。","romaji":"Okoraremasen ka.","trans":"Tidak akan dimarahi?"},
  {"speaker":"田中","text":"怒りません。書いた人をせめる職場は、報告が出なくなります。","reading":"おこりません。かいたひとをせめるしょくばは、ほうこくがでなくなります。","romaji":"Okorimasen. Kaita hito o semeru shokuba wa, houkoku ga denaku narimasu.","trans":"Tidak. Tempat kerja yang menyalahkan pelapor, lama-lama tidak ada yang melapor."},
  {"speaker":"アリ","text":"出ないほうが危ないですね。","reading":"でないほうがあぶないですね。","romaji":"Denai hou ga abunai desu ne.","trans":"Justru tidak ada laporan itu yang berbahaya, ya."},
  {"speaker":"田中","text":"そうです。ヒヤリハットが多い職場は、実は安全な職場です。","reading":"そうです。ヒヤリハットがおおいしょくばは、じつはあんぜんなしょくばです。","romaji":"Sou desu. Hiyari hatto ga ooi shokuba wa, jitsu wa anzen na shokuba desu.","trans":"Betul. Tempat kerja dengan banyak laporan hiyari-hatto justru tempat yang aman."},
  {"speaker":"アリ","text":"隠さないからですね。","reading":"かくさないからですね。","romaji":"Kakusanai kara desu ne.","trans":"Karena tidak ada yang disembunyikan, ya."},
  {"speaker":"田中","text":"そうです。書くときは、誰が悪いかではなく、なぜ起きたかを書きます。","reading":"そうです。かくときは、だれがわるいかではなく、なぜおきたかをかきます。","romaji":"Sou desu. Kaku toki wa, dare ga warui ka dewa naku, naze okita ka o kakimasu.","trans":"Betul. Saat menulis, bukan siapa yang salah, melainkan kenapa itu bisa terjadi."},
  {"speaker":"アリ","text":"人ではなく、しくみを見るんですね。","reading":"ひとではなく、しくみをみるんですね。","romaji":"Hito dewa naku, shikumi o miru n desu ne.","trans":"Yang dilihat sistemnya, bukan orangnya, ya."},
  {"speaker":"田中","text":"そのとおりです。人を責めても、同じことがまた起きます。","reading":"そのとおりです。ひとをせめても、おなじことがまたおきます。","romaji":"Sono toori desu. Hito o semete mo, onaji koto ga mata okimasu.","trans":"Tepat sekali. Menyalahkan orang tidak mencegah hal yang sama terulang."}
 ]'::jsonb,
 '[
  {"word":"ヒヤリハット","reading":"hiyari hatto","meaning":"kejadian nyaris celaka yang wajib dilaporkan"},
  {"word":"報告書","reading":"ほうこくしょ (houkokusho)","meaning":"formulir laporan"},
  {"word":"責める","reading":"せめる (semeru)","meaning":"menyalahkan"},
  {"word":"しくみ","reading":"shikumi","meaning":"sistem, mekanisme kerja"}
 ]'::jsonb, false),

-- ── 18 · N3 · Fase akhir hayat ───────────────────────────────────────────────
(3, 'kaigo-shokuin', 18,
 'Mendampingi di Fase Akhir Hayat',
 'Kamu bisa merawat seperti biasa di fase mitori, menjaga ucapan di dekat penghuni, dan memberi ruang bagi keluarga.',
 'kaigo',
 '[
  {"speaker":"田中","text":"三〇二号室の佐藤さんは、看取りの段階に入りました。","reading":"さんまるにごうしつのさとうさんは、みとりのだんかいにはいりました。","romaji":"San-maru-ni goushitsu no Satou-san wa, mitori no dankai ni hairimashita.","trans":"Bu Sato di kamar 302 sudah masuk fase mitori."},
  {"speaker":"アリ","text":"看取りとは、どういう意味ですか。","reading":"みとりとは、どういういみですか。","romaji":"Mitori to wa, dou iu imi desu ka.","trans":"Mitori itu artinya apa?"},
  {"speaker":"田中","text":"治療で治すのではなく、最後まで穏やかに過ごしてもらうことです。","reading":"ちりょうでなおすのではなく、さいごまでおだやかにすごしてもらうことです。","romaji":"Chiryou de naosu no dewa naku, saigo made odayaka ni sugoshite morau koto desu.","trans":"Bukan menyembuhkan lewat pengobatan, tapi menemani agar tenang sampai akhir."},
  {"speaker":"アリ","text":"何をすればいいですか。","reading":"なにをすればいいですか。","romaji":"Nani o sureba ii desu ka.","trans":"Apa yang harus saya lakukan?"},
  {"speaker":"田中","text":"特別なことはしません。いつもどおり、声をかけて、口の中をきれいにします。","reading":"とくべつなことはしません。いつもどおり、こえをかけて、くちのなかをきれいにします。","romaji":"Tokubetsu na koto wa shimasen. Itsumo doori, koe o kakete, kuchi no naka o kirei ni shimasu.","trans":"Tidak ada yang istimewa. Seperti biasa: menyapa, membersihkan mulutnya."},
  {"speaker":"アリ","text":"話しかけてもいいんですか。眠っていますが。","reading":"はなしかけてもいいんですか。ねむっていますが。","romaji":"Hanashikakete mo ii n desu ka. Nemutte imasu ga.","trans":"Boleh diajak bicara? Padahal beliau sedang tertidur."},
  {"speaker":"田中","text":"話しかけてください。耳は最後まで聞こえると言われています。","reading":"はなしかけてください。みみはさいごまできこえるといわれています。","romaji":"Hanashikakete kudasai. Mimi wa saigo made kikoeru to iwarete imasu.","trans":"Ajak bicara. Konon pendengaran itu bertahan sampai akhir."},
  {"speaker":"アリ","text":"そうなんですか。","reading":"そうなんですか。","romaji":"Sou nan desu ka.","trans":"Begitu, ya."},
  {"speaker":"田中","text":"はい。だから、そばで悲しい話や、仕事のぐちは言いません。","reading":"はい。だから、そばでかなしいはなしや、しごとのぐちはいいません。","romaji":"Hai. Dakara, soba de kanashii hanashi ya, shigoto no guchi wa iimasen.","trans":"Ya. Makanya di dekat beliau, jangan bicara hal sedih atau mengeluh soal pekerjaan."},
  {"speaker":"アリ","text":"気をつけます。","reading":"きをつけます。","romaji":"Ki o tsukemasu.","trans":"Saya akan berhati-hati."},
  {"speaker":"田中","text":"ご家族が来られたら、静かに席をはずします。二人の時間が大切です。","reading":"ごかぞくがこられたら、しずかにせきをはずします。ふたりのじかんがたいせつです。","romaji":"Gokazoku ga koraretara, shizuka ni seki o hazushimasu. Futari no jikan ga taisetsu desu.","trans":"Kalau keluarganya datang, undur diri diam-diam. Waktu berdua itu berharga."},
  {"speaker":"アリ","text":"私は何もしなくていいんですか。","reading":"わたしはなにもしなくていいんですか。","romaji":"Watashi wa nani mo shinakute ii n desu ka.","trans":"Saya tidak perlu melakukan apa-apa?"},
  {"speaker":"田中","text":"何もしないことも仕事です。でも、遠くから見ています。何かあればすぐ行けるように。","reading":"なにもしないこともしごとです。でも、とおくからみています。なにかあればすぐいけるように。","romaji":"Nani mo shinai koto mo shigoto desu. Demo, tooku kara mite imasu. Nanika areba sugu ikeru you ni.","trans":"Tidak melakukan apa-apa juga bagian dari pekerjaan. Tapi kita tetap mengawasi dari jauh, supaya bisa langsung datang kalau ada apa-apa."},
  {"speaker":"アリ","text":"正直に言うと、少し怖いです。","reading":"しょうじきにいうと、すこしこわいです。","romaji":"Shoujiki ni iu to, sukoshi kowai desu.","trans":"Terus terang, saya agak takut."},
  {"speaker":"田中","text":"私も最初は怖かったです。怖いのは、その人を大事に思っているからです。","reading":"わたしもさいしょはこわかったです。こわいのは、そのひとをだいじにおもっているからです。","romaji":"Watashi mo saisho wa kowakatta desu. Kowai no wa, sono hito o daiji ni omotte iru kara desu.","trans":"Saya juga takut waktu pertama kali. Rasa takut itu muncul karena kamu menyayangi orangnya."},
  {"speaker":"アリ","text":"慣れますか。","reading":"なれますか。","romaji":"Naremasu ka.","trans":"Nanti terbiasa?"},
  {"speaker":"田中","text":"慣れなくていいです。慣れてしまう人のほうが、心配です。","reading":"なれなくていいです。なれてしまうひとのほうが、しんぱいです。","romaji":"Narenakute ii desu. Narete shimau hito no hou ga, shinpai desu.","trans":"Tidak perlu terbiasa. Justru orang yang sampai terbiasa itu yang mengkhawatirkan."}
 ]'::jsonb,
 '[
  {"word":"看取り","reading":"みとり (mitori)","meaning":"pendampingan di fase akhir hayat"},
  {"word":"段階","reading":"だんかい (dankai)","meaning":"tahap, fase"},
  {"word":"穏やか","reading":"おだやか (odayaka)","meaning":"tenang, damai"},
  {"word":"席をはずす","reading":"せきをはずす (seki o hazusu)","meaning":"undur diri dari tempat itu"}
 ]'::jsonb, false),

-- ── 19 · N3 · Shift malam ────────────────────────────────────────────────────
(3, 'kaigo-shokuin', 19,
 'Ronda Shift Malam dan Menghubungi Saat Kondisi Memburuk',
 'Kamu bisa berkeliling tanpa membangunkan, menilai sendirian dengan aman, dan berani menelepon perawat saat ragu.',
 'kaigo',
 '[
  {"speaker":"田中","text":"今日は夜勤の説明です。夜は職員が少なくなります。","reading":"きょうはやきんのせつめいです。よるはしょくいんがすくなくなります。","romaji":"Kyou wa yakin no setsumei desu. Yoru wa shokuin ga sukunaku narimasu.","trans":"Hari ini penjelasan soal shift malam. Malam hari jumlah stafnya lebih sedikit."},
  {"speaker":"アリ","text":"何人ですか。","reading":"なんにんですか。","romaji":"Nannin desu ka.","trans":"Berapa orang?"},
  {"speaker":"田中","text":"二人で二階全部を見ます。だから、朝より判断が重くなります。","reading":"ふたりでにかいぜんぶをみます。だから、あさよりはんだんがおもくなります。","romaji":"Futari de nikai zenbu o mimasu. Dakara, asa yori handan ga omoku narimasu.","trans":"Berdua menangani seluruh lantai dua. Jadi bobot keputusanmu lebih berat daripada pagi."},
  {"speaker":"アリ","text":"巡回は何時間ごとですか。","reading":"じゅんかいはなんじかんごとですか。","romaji":"Junkai wa nanjikan goto desu ka.","trans":"Rondanya tiap berapa jam?"},
  {"speaker":"田中","text":"二時間ごとです。部屋を回って、息をしているか、姿勢はどうかを見ます。","reading":"にじかんごとです。へやをまわって、いきをしているか、しせいはどうかをみます。","romaji":"Nijikan goto desu. Heya o mawatte, iki o shite iru ka, shisei wa dou ka o mimasu.","trans":"Tiap dua jam. Keliling kamar, cek apakah bernapas dan bagaimana posisi tidurnya."},
  {"speaker":"アリ","text":"電気をつけますか。","reading":"でんきをつけますか。","romaji":"Denki o tsukemasu ka.","trans":"Lampunya dinyalakan?"},
  {"speaker":"田中","text":"つけません。小さいライトを使います。起こしてしまいますから。","reading":"つけません。ちいさいライトをつかいます。おこしてしまいますから。","romaji":"Tsukemasen. Chiisai raito o tsukaimasu. Okoshite shimaimasu kara.","trans":"Jangan. Pakai senter kecil. Kalau tidak, mereka jadi terbangun."},
  {"speaker":"アリ","text":"起きている人がいたら。","reading":"おきているひとがいたら。","romaji":"Okite iru hito ga itara.","trans":"Kalau ada yang terjaga?"},
  {"speaker":"田中","text":"声をかけます。トイレか、眠れないか、どちらかが多いです。","reading":"こえをかけます。トイレか、ねむれないか、どちらかがおおいです。","romaji":"Koe o kakemasu. Toire ka, nemurenai ka, dochira ka ga ooi desu.","trans":"Kita sapa. Biasanya kalau tidak mau ke toilet, ya tidak bisa tidur."},
  {"speaker":"アリ","text":"眠れないときは、どうしますか。","reading":"ねむれないときは、どうしますか。","romaji":"Nemurenai toki wa, dou shimasu ka.","trans":"Kalau tidak bisa tidur, bagaimana?"},
  {"speaker":"田中","text":"少し話を聞きます。あとで記録に、何時に起きていた、と書きます。","reading":"すこしはなしをききます。あとできろくに、なんじにおきていた、とかきます。","romaji":"Sukoshi hanashi o kikimasu. Ato de kiroku ni, nanji ni okite ita, to kakimasu.","trans":"Dengarkan sebentar ceritanya. Nanti dicatat, jam berapa dia terjaga."},
  {"speaker":"アリ","text":"急に具合が悪くなったら、私はどうすればいいですか。","reading":"きゅうにぐあいがわるくなったら、わたしはどうすればいいですか。","romaji":"Kyuu ni guai ga waruku nattara, watashi wa dou sureba ii desu ka.","trans":"Kalau kondisinya mendadak memburuk, saya harus bagaimana?"},
  {"speaker":"田中","text":"まず、その場を離れずに、もう一人を呼びます。それから看護師に電話します。","reading":"まず、そのばをはなれずに、もうひとりをよびます。それからかんごしにでんわします。","romaji":"Mazu, sono ba o hanarezu ni, mou hitori o yobimasu. Sorekara kangoshi ni denwa shimasu.","trans":"Pertama, jangan tinggalkan tempatnya, panggil rekan satunya. Lalu telepon perawat."},
  {"speaker":"アリ","text":"夜でも電話していいんですか。","reading":"よるでもでんわしていいんですか。","romaji":"Yoru demo denwa shite ii n desu ka.","trans":"Malam-malam pun boleh menelepon?"},
  {"speaker":"田中","text":"いいです。迷ったら電話する。それが夜勤の決まりです。","reading":"いいです。まよったらでんわする。それがやきんのきまりです。","romaji":"Ii desu. Mayottara denwa suru. Sore ga yakin no kimari desu.","trans":"Boleh. Ragu, telepon. Itu aturan shift malam."},
  {"speaker":"アリ","text":"呼んで、何もなかったら申し訳ないです。","reading":"よんで、なにもなかったらもうしわけないです。","romaji":"Yonde, nani mo nakattara moushiwake nai desu.","trans":"Kalau sudah dipanggil ternyata tidak ada apa-apa, saya jadi tidak enak."},
  {"speaker":"田中","text":"何もないほうがいいんです。呼ばずに手遅れになるより、百倍いいです。","reading":"なにもないほうがいいんです。よばずにておくれになるより、ひゃくばいいいです。","romaji":"Nani mo nai hou ga ii n desu. Yobazu ni teokure ni naru yori, hyakubai ii desu.","trans":"Justru bagus kalau tidak ada apa-apa. Seratus kali lebih baik daripada tidak memanggil lalu terlambat."}
 ]'::jsonb,
 '[
  {"word":"夜勤","reading":"やきん (yakin)","meaning":"shift malam"},
  {"word":"巡回","reading":"じゅんかい (junkai)","meaning":"ronda, berkeliling memeriksa"},
  {"word":"急変","reading":"きゅうへん (kyuuhen)","meaning":"perubahan kondisi yang mendadak memburuk"},
  {"word":"手遅れ","reading":"ておくれ (teokure)","meaning":"terlambat ditangani"}
 ]'::jsonb, false),

-- ── 20 · N3 · Menutup hari ───────────────────────────────────────────────────
(3, 'kaigo-shokuin', 20,
 'Merangkum Satu Hari Kerja dalam Operan Shift',
 'Kamu bisa menyampaikan operan shift secara ringkas: yang berbeda dulu, dengan angka, lalu apa yang sudah kamu kerjakan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"一日おつかれさまでした。最後に申し送りをします。","reading":"いちにちおつかれさまでした。さいごにもうしおくりをします。","romaji":"Ichinichi otsukaresama deshita. Saigo ni moushiokuri o shimasu.","trans":"Terima kasih untuk kerja hari ini. Terakhir, kita lakukan operan shift."},
  {"speaker":"アリ","text":"朝、聞いたものですね。今度は私が話すんですか。","reading":"あさ、きいたものですね。こんどはわたしがはなすんですか。","romaji":"Asa, kiita mono desu ne. Kondo wa watashi ga hanasu n desu ka.","trans":"Yang saya dengarkan pagi tadi, ya. Sekarang giliran saya yang bicara?"},
  {"speaker":"田中","text":"そうです。次の人に、必要なことだけ渡します。","reading":"そうです。つぎのひとに、ひつようなことだけわたします。","romaji":"Sou desu. Tsugi no hito ni, hitsuyou na koto dake watashimasu.","trans":"Betul. Serahkan ke petugas berikutnya, hanya yang perlu saja."},
  {"speaker":"アリ","text":"全部話しますか。","reading":"ぜんぶはなしますか。","romaji":"Zenbu hanashimasu ka.","trans":"Semuanya diceritakan?"},
  {"speaker":"田中","text":"全部は要りません。いつもと違ったことを、先に言います。","reading":"ぜんぶはいりません。いつもとちがったことを、さきにいいます。","romaji":"Zenbu wa irimasen. Itsumo to chigatta koto o, saki ni iimasu.","trans":"Tidak perlu semuanya. Yang berbeda dari biasanya disebut lebih dulu."},
  {"speaker":"アリ","text":"例えば。","reading":"たとえば。","romaji":"Tatoeba.","trans":"Contohnya?"},
  {"speaker":"田中","text":"二〇三の鈴木さんは、昼食を三分の一しか召し上がりませんでした。","reading":"にいまるさんのすずきさんは、ちゅうしょくをさんぶんのいちしかめしあがりませんでした。","romaji":"Nii-maru-san no Suzuki-san wa, chuushoku o sanbun no ichi shika meshiagarimasen deshita.","trans":"Pak Suzuki kamar 203 hanya menghabiskan sepertiga makan siangnya."},
  {"speaker":"アリ","text":"数字で言うんですね。","reading":"すうじでいうんですね。","romaji":"Suuji de iu n desu ne.","trans":"Disebutkan dengan angka, ya."},
  {"speaker":"田中","text":"そうです。あまり食べなかった、では、次の人が判断できません。","reading":"そうです。あまりたべなかった、では、つぎのひとがはんだんできません。","romaji":"Sou desu. Amari tabenakatta, dewa, tsugi no hito ga handan dekimasen.","trans":"Betul. Kalau cuma bilang kurang makan, petugas berikutnya tidak bisa menilai."},
  {"speaker":"アリ","text":"そのあとは。","reading":"そのあとは。","romaji":"Sono ato wa.","trans":"Setelah itu?"},
  {"speaker":"田中","text":"そのあとに、自分がしたことを言います。お茶をすすめ、看護師に報告しました、と。","reading":"そのあとに、じぶんがしたことをいいます。おちゃをすすめ、かんごしにほうこくしました、と。","romaji":"Sono ato ni, jibun ga shita koto o iimasu. Ocha o susume, kangoshi ni houkoku shimashita, to.","trans":"Setelah itu, sebutkan apa yang sudah kamu kerjakan. Saya tawarkan teh dan sudah melapor ke perawat."},
  {"speaker":"アリ","text":"したことも言うんですか。","reading":"したこともいうんですか。","romaji":"Shita koto mo iu n desu ka.","trans":"Yang sudah dikerjakan juga disebut?"},
  {"speaker":"田中","text":"言います。次の人は、続きからやります。同じことを二回しないためです。","reading":"いいます。つぎのひとは、つづきからやります。おなじことをにかいしないためです。","romaji":"Iimasu. Tsugi no hito wa, tsuzuki kara yarimasu. Onaji koto o nikai shinai tame desu.","trans":"Disebut. Petugas berikutnya melanjutkan dari situ. Supaya hal yang sama tidak dikerjakan dua kali."},
  {"speaker":"アリ","text":"何も変わったことがない人は。","reading":"なにもかわったことがないひとは。","romaji":"Nani mo kawatta koto ga nai hito wa.","trans":"Kalau ada yang tidak ada perubahan apa pun?"},
  {"speaker":"田中","text":"変わりありません、で十分です。短くていいです。","reading":"かわりありません、でじゅうぶんです。みじかくていいです。","romaji":"Kawari arimasen, de juubun desu. Mijikakute ii desu.","trans":"Cukup bilang tidak ada perubahan. Boleh singkat."},
  {"speaker":"アリ","text":"話す順番は決まっていますか。","reading":"はなすじゅんばんはきまっていますか。","romaji":"Hanasu junban wa kimatte imasu ka.","trans":"Urutan bicaranya sudah ditentukan?"},
  {"speaker":"田中","text":"部屋番号の順です。そうすれば、聞くほうも書くほうも迷いません。","reading":"へやばんごうのじゅんです。そうすれば、きくほうもかくほうもまよいません。","romaji":"Heya bangou no jun desu. Sou sureba, kiku hou mo kaku hou mo mayoimasen.","trans":"Urut nomor kamar. Dengan begitu, yang mendengar maupun yang mencatat tidak bingung."},
  {"speaker":"アリ","text":"分かりました。ありがとうございました。","reading":"わかりました。ありがとうございました。","romaji":"Wakarimashita. Arigatou gozaimashita.","trans":"Saya mengerti. Terima kasih banyak."},
  {"speaker":"田中","text":"よくがんばりました。明日もその調子で。","reading":"よくがんばりました。あしたもそのちょうしで。","romaji":"Yoku ganbarimashita. Ashita mo sono choushi de.","trans":"Kerja bagus. Besok pertahankan seperti ini."}
 ]'::jsonb,
 '[
  {"word":"召し上がる","reading":"めしあがる (meshiagaru)","meaning":"makan (bentuk hormat untuk penghuni)"},
  {"word":"判断","reading":"はんだん (handan)","meaning":"penilaian, keputusan"},
  {"word":"変わりありません","reading":"かわりありません (kawari arimasen)","meaning":"tidak ada perubahan"},
  {"word":"順番","reading":"じゅんばん (junban)","meaning":"urutan"}
 ]'::jsonb, false)

-- Predikat WHERE wajib ditulis ulang: uniq_kaiwa_job_lesson adalah partial
-- index, dan Postgres hanya bisa menyimpulkannya kalau predikatnya disebut.
ON CONFLICT (job_slug, lesson_no) WHERE job_slug IS NOT NULL DO NOTHING;
