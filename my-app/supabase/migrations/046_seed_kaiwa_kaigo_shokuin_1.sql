-- 046: Silabus 介護職員 (Staf Perawatan Lansia) — pelajaran 1–10.
--
-- Format mengikuti pola kursus kejuruan: satu pelajaran = satu tugas konkret di
-- tempat kerja, berurutan, kesulitan naik lewat level_id (1–7 = N5, 8–10 = N4).
--
-- Yang membedakan dialog ini dari kaiwa lepas: di dalamnya ada PENGETAHUAN
-- KERJA, bukan cuma tata bahasa. Ambang 37,5°C sebelum mandi, sudut 30° kursi
-- roda, rem yang wajib dikunci, gigi palsu yang retak kalau kering — hal-hal
-- yang membuat pelajarnya tidak melukai orang di hari pertama.
--
-- Tokoh tetap: 田中 (senpai) dan アリ (pekerja Indonesia baru), supaya pelajar
-- punya satu sosok yang diikuti sepanjang silabus.
--
-- Idempoten lewat uniq_kaiwa_job_lesson (job_slug, lesson_no) + DO NOTHING.

INSERT INTO public.kaiwa_stories
  (level_id, job_slug, lesson_no, title, goal, category, lines, vocab_highlight, is_premium) VALUES

-- ── 1 · N5 · Masuk kerja & operan shift ──────────────────────────────────────
(1, 'kaigo-shokuin', 1,
 'Masuk Kerja, Salam, dan Menerima Operan Shift',
 'Kamu bisa memulai hari kerja: absen, pasang papan nama, dan mencatat isi operan shift dari petugas malam.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、おはようございます。","reading":"アリさん、おはようございます。","romaji":"Ari-san, ohayou gozaimasu.","trans":"Ari, selamat pagi."},
  {"speaker":"アリ","text":"おはようございます。今日からよろしくお願いします。","reading":"おはようございます。きょうからよろしくおねがいします。","romaji":"Ohayou gozaimasu. Kyou kara yoroshiku onegai shimasu.","trans":"Selamat pagi. Mulai hari ini mohon bimbingannya."},
  {"speaker":"田中","text":"まず、タイムカードを押してください。","reading":"まず、タイムカードをおしてください。","romaji":"Mazu, taimu kaado o oshite kudasai.","trans":"Pertama, tolong absen dulu."},
  {"speaker":"アリ","text":"はい、押しました。","reading":"はい、おしました。","romaji":"Hai, oshimashita.","trans":"Baik, sudah."},
  {"speaker":"田中","text":"それから、エプロンと名札をつけます。","reading":"それから、エプロンとなふだをつけます。","romaji":"Sorekara, epuron to nafuda o tsukemasu.","trans":"Lalu, pakai celemek dan papan nama."},
  {"speaker":"アリ","text":"名札はどこにつけますか。","reading":"なふだはどこにつけますか。","romaji":"Nafuda wa doko ni tsukemasu ka.","trans":"Papan namanya dipasang di mana?"},
  {"speaker":"田中","text":"胸につけてください。利用者さんが名前を見ます。","reading":"むねにつけてください。りようしゃさんがなまえをみます。","romaji":"Mune ni tsukete kudasai. Riyousha-san ga namae o mimasu.","trans":"Di dada. Supaya penghuni bisa melihat namamu."},
  {"speaker":"アリ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Baik, mengerti."},
  {"speaker":"田中","text":"次は申し送りです。夜の人の話を聞きます。","reading":"つぎはもうしおくりです。よるのひとのはなしをききます。","romaji":"Tsugi wa moushiokuri desu. Yoru no hito no hanashi o kikimasu.","trans":"Berikutnya operan shift. Kita dengarkan laporan petugas malam."},
  {"speaker":"アリ","text":"何を聞きますか。","reading":"なにをききますか。","romaji":"Nani o kikimasu ka.","trans":"Yang didengarkan apa saja?"},
  {"speaker":"田中","text":"昨日の夜、よく寝ましたか。熱はありませんか。それを聞きます。","reading":"きのうのよる、よくねましたか。ねつはありませんか。それをききます。","romaji":"Kinou no yoru, yoku nemashita ka. Netsu wa arimasen ka. Sore o kikimasu.","trans":"Semalam tidurnya nyenyak atau tidak, ada demam atau tidak. Itu yang kita dengar."},
  {"speaker":"アリ","text":"メモを書いてもいいですか。","reading":"メモをかいてもいいですか。","romaji":"Memo o kaite mo ii desu ka.","trans":"Boleh saya catat?"},
  {"speaker":"田中","text":"はい、書いてください。忘れると危ないです。","reading":"はい、かいてください。わすれるとあぶないです。","romaji":"Hai, kaite kudasai. Wasureru to abunai desu.","trans":"Ya, tolong dicatat. Kalau lupa itu berbahaya."},
  {"speaker":"アリ","text":"はい、書きます。","reading":"はい、かきます。","romaji":"Hai, kakimasu.","trans":"Baik, saya catat."},
  {"speaker":"田中","text":"じゃあ、行きましょう。","reading":"じゃあ、いきましょう。","romaji":"Jaa, ikimashou.","trans":"Kalau begitu, ayo berangkat."}
 ]'::jsonb,
 '[
  {"word":"申し送り","reading":"もうしおくり (moushiokuri)","meaning":"operan shift; serah terima informasi antar giliran kerja"},
  {"word":"名札","reading":"なふだ (nafuda)","meaning":"papan nama"},
  {"word":"利用者","reading":"りようしゃ (riyousha)","meaning":"penghuni / pengguna layanan (sebutan resmi, bukan pasien)"},
  {"word":"熱","reading":"ねつ (netsu)","meaning":"demam"}
 ]'::jsonb, false),

-- ── 2 · N5 · Sapaan pagi & bantu bangun ──────────────────────────────────────
(1, 'kaigo-shokuin', 2,
 'Menyapa di Pagi Hari dan Membantu Bangun Tidur',
 'Kamu bisa masuk kamar dengan sopan, membangunkan tanpa mengagetkan, dan menunggu sebelum menegakkan badan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、朝は部屋に入る前にノックします。","reading":"アリさん、あさはへやにはいるまえにノックします。","romaji":"Ari-san, asa wa heya ni hairu mae ni nokku shimasu.","trans":"Ari, pagi hari sebelum masuk kamar kita ketuk pintu dulu."},
  {"speaker":"アリ","text":"寝ている人もノックしますか。","reading":"ねているひともノックしますか。","romaji":"Nete iru hito mo nokku shimasu ka.","trans":"Yang masih tidur juga diketuk?"},
  {"speaker":"田中","text":"はい、します。それから、おはようございます、と言います。","reading":"はい、します。それから、おはようございます、といいます。","romaji":"Hai, shimasu. Sorekara, ohayou gozaimasu, to iimasu.","trans":"Ya, tetap diketuk. Lalu kita ucapkan selamat pagi."},
  {"speaker":"アリ","text":"返事がないときは。","reading":"へんじがないときは。","romaji":"Henji ga nai toki wa.","trans":"Kalau tidak ada jawaban?"},
  {"speaker":"田中","text":"もう一度、名前を呼びます。田中さん、朝ですよ、と言います。","reading":"もういちど、なまえをよびます。たなかさん、あさですよ、といいます。","romaji":"Mou ichido, namae o yobimasu. Tanaka-san, asa desu yo, to iimasu.","trans":"Panggil namanya sekali lagi. Pak Tanaka, sudah pagi, begitu."},
  {"speaker":"アリ","text":"大きい声で言いますか。","reading":"おおきいこえでいいますか。","romaji":"Ookii koe de iimasu ka.","trans":"Diucapkan dengan suara keras?"},
  {"speaker":"田中","text":"いいえ。近くで、ゆっくり言います。大きい声はびっくりします。","reading":"いいえ。ちかくで、ゆっくりいいます。おおきいこえはびっくりします。","romaji":"Iie. Chikaku de, yukkuri iimasu. Ookii koe wa bikkuri shimasu.","trans":"Tidak. Dari dekat, pelan-pelan. Suara keras bikin kaget."},
  {"speaker":"アリ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Baik, mengerti."},
  {"speaker":"田中","text":"カーテンを開けて、明るくします。朝が分かります。","reading":"カーテンをあけて、あかるくします。あさがわかります。","romaji":"Kaaten o akete, akaruku shimasu. Asa ga wakarimasu.","trans":"Buka tirainya biar terang. Supaya terasa bahwa ini pagi."},
  {"speaker":"アリ","text":"すぐ起こしますか。","reading":"すぐおこしますか。","romaji":"Sugu okoshimasu ka.","trans":"Langsung dibangunkan?"},
  {"speaker":"田中","text":"いいえ、少し待ちます。急に起きると、ふらふらします。","reading":"いいえ、すこしまちます。きゅうにおきると、ふらふらします。","romaji":"Iie, sukoshi machimasu. Kyuu ni okiru to, furafura shimasu.","trans":"Tidak, tunggu sebentar. Kalau bangun mendadak, kepalanya pusing."},
  {"speaker":"アリ","text":"どのぐらい待ちますか。","reading":"どのぐらいまちますか。","romaji":"Dono gurai machimasu ka.","trans":"Menunggunya berapa lama?"},
  {"speaker":"田中","text":"一分ぐらいです。ベッドに座って、足を下ろします。","reading":"いっぷんぐらいです。ベッドにすわって、あしをおろします。","romaji":"Ippun gurai desu. Beddo ni suwatte, ashi o oroshimasu.","trans":"Sekitar satu menit. Duduk dulu di tempat tidur, kakinya diturunkan."},
  {"speaker":"アリ","text":"それから立ちますか。","reading":"それからたちますか。","romaji":"Sorekara tachimasu ka.","trans":"Setelah itu baru berdiri?"},
  {"speaker":"田中","text":"はい。でも、必ず立ちますよ、と言ってから立ちます。","reading":"はい。でも、かならずたちますよ、といってからたちます。","romaji":"Hai. Demo, kanarazu tachimasu yo, to itte kara tachimasu.","trans":"Ya. Tapi wajib bilang dulu saya bantu berdiri ya, baru diangkat."}
 ]'::jsonb,
 '[
  {"word":"声かけ","reading":"こえかけ (koekake)","meaning":"menyapa lebih dulu sebelum bertindak"},
  {"word":"起床介助","reading":"きしょうかいじょ (kishou kaijo)","meaning":"bantuan bangun tidur"},
  {"word":"ふらふら","reading":"furafura","meaning":"pusing berkunang, limbung"},
  {"word":"必ず","reading":"かならず (kanarazu)","meaning":"wajib, pasti"}
 ]'::jsonb, false),

-- ── 3 · N5 · Identifikasi penghuni ───────────────────────────────────────────
(1, 'kaigo-shokuin', 3,
 'Memastikan Nama, Nomor Kamar, dan Siapa yang Kamu Tangani',
 'Kamu bisa memastikan identitas penghuni dengan dua penanda, supaya tidak tertukar orang.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、この紙を見てください。今日の担当です。","reading":"アリさん、このかみをみてください。きょうのたんとうです。","romaji":"Ari-san, kono kami o mite kudasai. Kyou no tantou desu.","trans":"Ari, lihat kertas ini. Ini pembagian tugas hari ini."},
  {"speaker":"アリ","text":"私は何人担当しますか。","reading":"わたしはなんにんたんとうしますか。","romaji":"Watashi wa nannin tantou shimasu ka.","trans":"Saya menangani berapa orang?"},
  {"speaker":"田中","text":"六人です。部屋は二階の二〇一から二〇六です。","reading":"ろくにんです。へやはにかいのにいまるいちからにいまるろくです。","romaji":"Rokunin desu. Heya wa nikai no nii-maru-ichi kara nii-maru-roku desu.","trans":"Enam orang. Kamarnya di lantai dua, 201 sampai 206."},
  {"speaker":"アリ","text":"名前を覚えますか。","reading":"なまえをおぼえますか。","romaji":"Namae o oboemasu ka.","trans":"Nama-namanya harus dihafal?"},
  {"speaker":"田中","text":"はい。でも、顔と名前だけは危ないです。","reading":"はい。でも、かおとなまえだけはあぶないです。","romaji":"Hai. Demo, kao to namae dake wa abunai desu.","trans":"Ya. Tapi kalau hanya wajah dan nama saja, itu berbahaya."},
  {"speaker":"アリ","text":"どうしてですか。","reading":"どうしてですか。","romaji":"Doushite desu ka.","trans":"Kenapa?"},
  {"speaker":"田中","text":"同じ名字の人がいます。鈴木さんが二人います。","reading":"おなじみょうじのひとがいます。すずきさんがふたりいます。","romaji":"Onaji myouji no hito ga imasu. Suzuki-san ga futari imasu.","trans":"Ada yang nama keluarganya sama. Di sini ada dua Suzuki."},
  {"speaker":"アリ","text":"本当ですか。","reading":"ほんとうですか。","romaji":"Hontou desu ka.","trans":"Benarkah?"},
  {"speaker":"田中","text":"はい。だから、部屋番号も一緒に確認します。","reading":"はい。だから、へやばんごうもいっしょにかくにんします。","romaji":"Hai. Dakara, heya bangou mo issho ni kakunin shimasu.","trans":"Ya. Makanya nomor kamar juga ikut dipastikan."},
  {"speaker":"アリ","text":"二〇一の鈴木さん、ですね。","reading":"にいまるいちのすずきさん、ですね。","romaji":"Nii-maru-ichi no Suzuki-san, desu ne.","trans":"Jadi, Suzuki yang kamar 201, ya."},
  {"speaker":"田中","text":"そうです。それから、食事の前は必ず名前を聞きます。","reading":"そうです。それから、しょくじのまえはかならずなまえをききます。","romaji":"Sou desu. Sorekara, shokuji no mae wa kanarazu namae o kikimasu.","trans":"Betul. Selain itu, sebelum makan wajib tanya namanya."},
  {"speaker":"アリ","text":"利用者さんに聞きますか。","reading":"りようしゃさんにききますか。","romaji":"Riyousha-san ni kikimasu ka.","trans":"Ditanyakan ke penghuninya langsung?"},
  {"speaker":"田中","text":"はい。お名前を教えてください、と言います。","reading":"はい。おなまえをおしえてください、といいます。","romaji":"Hai. Onamae o oshiete kudasai, to iimasu.","trans":"Ya. Kita bilang, boleh sebutkan nama Bapak atau Ibu?"},
  {"speaker":"アリ","text":"分かりました。名前と部屋番号、両方見ます。","reading":"わかりました。なまえとへやばんごう、りょうほうみます。","romaji":"Wakarimashita. Namae to heya bangou, ryouhou mimasu.","trans":"Mengerti. Nama dan nomor kamar, dua-duanya saya cek."},
  {"speaker":"田中","text":"それが一番大切です。間違えると、薬も食事も違います。","reading":"それがいちばんたいせつです。まちがえると、くすりもしょくじもちがいます。","romaji":"Sore ga ichiban taisetsu desu. Machigaeru to, kusuri mo shokuji mo chigaimasu.","trans":"Itu yang paling penting. Kalau salah orang, obat dan makanannya ikut salah."}
 ]'::jsonb,
 '[
  {"word":"担当","reading":"たんとう (tantou)","meaning":"penanggung jawab; orang yang ditangani"},
  {"word":"名字","reading":"みょうじ (myouji)","meaning":"nama keluarga"},
  {"word":"確認","reading":"かくにん (kakunin)","meaning":"memastikan, mengecek"},
  {"word":"間違える","reading":"まちがえる (machigaeru)","meaning":"salah, keliru"}
 ]'::jsonb, false),

-- ── 4 · N5 · Vital sign ──────────────────────────────────────────────────────
(1, 'kaigo-shokuin', 4,
 'Mengukur Suhu, Tensi, dan Nadi lalu Melaporkannya',
 'Kamu bisa mengukur vital sign dengan benar dan tahu angka mana yang harus segera dilaporkan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"今日はバイタルを測ります。","reading":"きょうはバイタルをはかります。","romaji":"Kyou wa baitaru o hakarimasu.","trans":"Hari ini kita ukur vital sign."},
  {"speaker":"アリ","text":"バイタルは何ですか。","reading":"バイタルはなんですか。","romaji":"Baitaru wa nan desu ka.","trans":"Vital sign itu apa?"},
  {"speaker":"田中","text":"体温と血圧と脈です。朝、みんな測ります。","reading":"たいおんとけつあつとみゃくです。あさ、みんなはかります。","romaji":"Taion to ketsuatsu to myaku desu. Asa, minna hakarimasu.","trans":"Suhu badan, tekanan darah, dan nadi. Pagi hari semua diukur."},
  {"speaker":"アリ","text":"体温はどこで測りますか。","reading":"たいおんはどこではかりますか。","romaji":"Taion wa doko de hakarimasu ka.","trans":"Suhu badan diukur di mana?"},
  {"speaker":"田中","text":"わきの下です。五分ぐらいかかります。","reading":"わきのしたです。ごふんぐらいかかります。","romaji":"Waki no shita desu. Gofun gurai kakarimasu.","trans":"Di ketiak. Perlu sekitar lima menit."},
  {"speaker":"アリ","text":"三十六度五分でした。","reading":"さんじゅうろくどごぶでした。","romaji":"Sanjuu-roku-do go-bu deshita.","trans":"Hasilnya 36,5 derajat."},
  {"speaker":"田中","text":"いいですね。三十七度五分より高いとき、すぐ言ってください。","reading":"いいですね。さんじゅうななどごぶよりたかいとき、すぐいってください。","romaji":"Ii desu ne. Sanjuu-nana-do go-bu yori takai toki, sugu itte kudasai.","trans":"Bagus. Kalau lebih tinggi dari 37,5 derajat, tolong langsung lapor."},
  {"speaker":"アリ","text":"分かりました。血圧はどうですか。","reading":"わかりました。けつあつはどうですか。","romaji":"Wakarimashita. Ketsuatsu wa dou desu ka.","trans":"Mengerti. Kalau tekanan darah bagaimana?"},
  {"speaker":"田中","text":"腕に巻きます。座って、少し休んでから測ります。","reading":"うでにまきます。すわって、すこしやすんでからはかります。","romaji":"Ude ni makimasu. Suwatte, sukoshi yasunde kara hakarimasu.","trans":"Dilingkarkan di lengan. Duduk dulu, istirahat sebentar, baru diukur."},
  {"speaker":"アリ","text":"動いたあとはだめですか。","reading":"うごいたあとはだめですか。","romaji":"Ugoita ato wa dame desu ka.","trans":"Setelah bergerak tidak boleh?"},
  {"speaker":"田中","text":"だめです。高くなります。","reading":"だめです。たかくなります。","romaji":"Dame desu. Takaku narimasu.","trans":"Tidak boleh. Angkanya jadi tinggi."},
  {"speaker":"アリ","text":"数字はどこに書きますか。","reading":"すうじはどこにかきますか。","romaji":"Suuji wa doko ni kakimasu ka.","trans":"Angkanya ditulis di mana?"},
  {"speaker":"田中","text":"この記録用紙に書きます。時間も書いてください。","reading":"このきろくようしにかきます。じかんもかいてください。","romaji":"Kono kiroku youshi ni kakimasu. Jikan mo kaite kudasai.","trans":"Di lembar catatan ini. Jamnya juga tolong ditulis."},
  {"speaker":"アリ","text":"時間もですか。","reading":"じかんもですか。","romaji":"Jikan mo desu ka.","trans":"Jamnya juga?"},
  {"speaker":"田中","text":"はい。いつ測ったか分からないと、記録の意味がありません。","reading":"はい。いつはかったかわからないと、きろくのいみがありません。","romaji":"Hai. Itsu hakatta ka wakaranai to, kiroku no imi ga arimasen.","trans":"Ya. Kalau tidak diketahui kapan diukurnya, catatannya jadi tidak berarti."}
 ]'::jsonb,
 '[
  {"word":"体温","reading":"たいおん (taion)","meaning":"suhu badan"},
  {"word":"血圧","reading":"けつあつ (ketsuatsu)","meaning":"tekanan darah"},
  {"word":"脈","reading":"みゃく (myaku)","meaning":"denyut nadi"},
  {"word":"記録用紙","reading":"きろくようし (kiroku youshi)","meaning":"lembar catatan"}
 ]'::jsonb, false),

-- ── 5 · N5 · Sajian makan ────────────────────────────────────────────────────
(1, 'kaigo-shokuin', 5,
 'Menyajikan Sarapan dan Mengajak Makan',
 'Kamu bisa mengantar nampan ke orang yang tepat, mencocokkan bentuk makanan, dan mengatur posisi duduk sebelum makan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"朝ごはんの時間です。配膳をお願いします。","reading":"あさごはんのじかんです。はいぜんをおねがいします。","romaji":"Asagohan no jikan desu. Haizen o onegai shimasu.","trans":"Waktunya sarapan. Tolong bantu antar makanannya."},
  {"speaker":"アリ","text":"お盆を持っていきますか。","reading":"おぼんをもっていきますか。","romaji":"Obon o motte ikimasu ka.","trans":"Nampannya saya bawa ke sana?"},
  {"speaker":"田中","text":"はい。でも、その前に名前を見てください。","reading":"はい。でも、そのまえになまえをみてください。","romaji":"Hai. Demo, sono mae ni namae o mite kudasai.","trans":"Ya. Tapi sebelum itu, lihat dulu namanya."},
  {"speaker":"アリ","text":"名前がお盆に書いてありますか。","reading":"なまえがおぼんにかいてありますか。","romaji":"Namae ga obon ni kaite arimasu ka.","trans":"Namanya tertulis di nampan?"},
  {"speaker":"田中","text":"書いてあります。食事の形が一人一人違います。","reading":"かいてあります。しょくじのかたちがひとりひとりちがいます。","romaji":"Kaite arimasu. Shokuji no katachi ga hitori hitori chigaimasu.","trans":"Tertulis. Bentuk makanannya beda-beda tiap orang."},
  {"speaker":"アリ","text":"形ですか。","reading":"かたちですか。","romaji":"Katachi desu ka.","trans":"Bentuk?"},
  {"speaker":"田中","text":"普通のごはんの人と、やわらかいごはんの人がいます。","reading":"ふつうのごはんのひとと、やわらかいごはんのひとがいます。","romaji":"Futsuu no gohan no hito to, yawarakai gohan no hito ga imasu.","trans":"Ada yang nasi biasa, ada yang nasi lembek."},
  {"speaker":"アリ","text":"間違えたらどうなりますか。","reading":"まちがえたらどうなりますか。","romaji":"Machigaetara dou narimasu ka.","trans":"Kalau tertukar bagaimana?"},
  {"speaker":"田中","text":"のどに詰まります。とても危ないです。","reading":"のどにつまります。とてもあぶないです。","romaji":"Nodo ni tsumarimasu. Totemo abunai desu.","trans":"Bisa tersedak di tenggorokan. Sangat berbahaya."},
  {"speaker":"アリ","text":"気をつけます。","reading":"きをつけます。","romaji":"Ki o tsukemasu.","trans":"Saya akan hati-hati."},
  {"speaker":"田中","text":"食べる前に、体を起こします。寝たままは危ないです。","reading":"たべるまえに、からだをおこします。ねたままはあぶないです。","romaji":"Taberu mae ni, karada o okoshimasu. Neta mama wa abunai desu.","trans":"Sebelum makan, badannya ditegakkan. Sambil berbaring itu berbahaya."},
  {"speaker":"アリ","text":"座りますか。","reading":"すわりますか。","romaji":"Suwarimasu ka.","trans":"Harus duduk?"},
  {"speaker":"田中","text":"はい、まっすぐ座ります。それから、いただきます、と声をかけます。","reading":"はい、まっすぐすわります。それから、いただきます、とこえをかけます。","romaji":"Hai, massugu suwarimasu. Sorekara, itadakimasu, to koe o kakemasu.","trans":"Ya, duduk tegak. Lalu kita ucapkan itadakimasu bersama."},
  {"speaker":"アリ","text":"一緒に言いますか。","reading":"いっしょにいいますか。","romaji":"Issho ni iimasu ka.","trans":"Diucapkan bersama-sama?"},
  {"speaker":"田中","text":"はい。ゆっくり食べてくださいね、と言います。急ぐと危ないです。","reading":"はい。ゆっくりたべてくださいね、といいます。いそぐとあぶないです。","romaji":"Hai. Yukkuri tabete kudasai ne, to iimasu. Isogu to abunai desu.","trans":"Ya. Kita bilang, makannya pelan-pelan ya. Kalau buru-buru itu berbahaya."}
 ]'::jsonb,
 '[
  {"word":"配膳","reading":"はいぜん (haizen)","meaning":"mengantar dan menyajikan makanan"},
  {"word":"お盆","reading":"おぼん (obon)","meaning":"nampan"},
  {"word":"詰まる","reading":"つまる (tsumaru)","meaning":"tersumbat, tersedak"},
  {"word":"やわらかい","reading":"yawarakai","meaning":"lembut, lunak (bentuk makanan yang dilunakkan)"}
 ]'::jsonb, false),

-- ── 6 · N5 · Toilet & martabat ───────────────────────────────────────────────
(1, 'kaigo-shokuin', 6,
 'Mengantar ke Toilet Tanpa Melukai Harga Diri',
 'Kamu bisa mendampingi ke toilet dengan aman, membiarkan yang masih bisa dikerjakan sendiri, dan menjaga privasi.',
 'kaigo',
 '[
  {"speaker":"田中","text":"田中さんがトイレに行きたいと言いました。","reading":"たなかさんがトイレにいきたいといいました。","romaji":"Tanaka-san ga toire ni ikitai to iimashita.","trans":"Pak Tanaka bilang mau ke toilet."},
  {"speaker":"アリ","text":"すぐ行きますか。","reading":"すぐいきますか。","romaji":"Sugu ikimasu ka.","trans":"Langsung diantar sekarang?"},
  {"speaker":"田中","text":"はい。待たせると間に合いません。","reading":"はい。またせるとまにあいません。","romaji":"Hai. Mataseru to ma ni aimasen.","trans":"Ya. Kalau dibiarkan menunggu, nanti tidak keburu."},
  {"speaker":"アリ","text":"手を引きますか。","reading":"てをひきますか。","romaji":"Te o hikimasu ka.","trans":"Tangannya saya tarik?"},
  {"speaker":"田中","text":"横に立って、ゆっくり歩きます。前を引っ張らないでください。","reading":"よこにたって、ゆっくりあるきます。まえをひっぱらないでください。","romaji":"Yoko ni tatte, yukkuri arukimasu. Mae o hipparanaide kudasai.","trans":"Berdiri di sampingnya, jalan pelan-pelan. Jangan menarik dari depan."},
  {"speaker":"アリ","text":"危ないですか。","reading":"あぶないですか。","romaji":"Abunai desu ka.","trans":"Berbahaya ya?"},
  {"speaker":"田中","text":"転びます。横で支えます。","reading":"ころびます。よこでささえます。","romaji":"Korobimasu. Yoko de sasaemasu.","trans":"Bisa jatuh. Kita menopang dari samping."},
  {"speaker":"アリ","text":"トイレの中も一緒に入りますか。","reading":"トイレのなかもいっしょにはいりますか。","romaji":"Toire no naka mo issho ni hairimasu ka.","trans":"Ke dalam toilet juga ikut masuk?"},
  {"speaker":"田中","text":"入ります。でも、できることは自分でしてもらいます。","reading":"はいります。でも、できることはじぶんでしてもらいます。","romaji":"Hairimasu. Demo, dekiru koto wa jibun de shite moraimasu.","trans":"Ikut masuk. Tapi yang masih bisa dikerjakan sendiri, biarkan dia kerjakan."},
  {"speaker":"アリ","text":"全部手伝いませんか。","reading":"ぜんぶてつだいませんか。","romaji":"Zenbu tetsudaimasen ka.","trans":"Tidak dibantu semuanya?"},
  {"speaker":"田中","text":"手伝いません。自分でできる力がなくなります。","reading":"てつだいません。じぶんでできるちからがなくなります。","romaji":"Tetsudaimasen. Jibun de dekiru chikara ga naku narimasu.","trans":"Tidak. Nanti kemampuannya sendiri malah hilang."},
  {"speaker":"アリ","text":"分かりました。","reading":"わかりました。","romaji":"Wakarimashita.","trans":"Saya mengerti."},
  {"speaker":"田中","text":"それから、ドアは必ず閉めます。声も小さくします。","reading":"それから、ドアはかならずしめます。こえもちいさくします。","romaji":"Sorekara, doa wa kanarazu shimemasu. Koe mo chiisaku shimasu.","trans":"Selain itu, pintunya wajib ditutup. Suara juga dipelankan."},
  {"speaker":"アリ","text":"恥ずかしいですから。","reading":"はずかしいですから。","romaji":"Hazukashii desu kara.","trans":"Karena malu, ya."},
  {"speaker":"田中","text":"そうです。私たちには仕事ですが、その人には毎日のことです。","reading":"そうです。わたしたちにはしごとですが、そのひとにはまいにちのことです。","romaji":"Sou desu. Watashitachi ni wa shigoto desu ga, sono hito ni wa mainichi no koto desu.","trans":"Betul. Bagi kita ini pekerjaan, tapi bagi dia ini hidupnya sehari-hari."}
 ]'::jsonb,
 '[
  {"word":"転ぶ","reading":"ころぶ (korobu)","meaning":"terjatuh"},
  {"word":"支える","reading":"ささえる (sasaeru)","meaning":"menopang, menyangga"},
  {"word":"自立支援","reading":"じりつしえん (jiritsu shien)","meaning":"prinsip membantu seperlunya agar kemandirian tetap terjaga"},
  {"word":"恥ずかしい","reading":"はずかしい (hazukashii)","meaning":"malu"}
 ]'::jsonb, false),

-- ── 7 · N5 · Hidrasi ─────────────────────────────────────────────────────────
(1, 'kaigo-shokuin', 7,
 'Mengajak Minum dan Mencegah Dehidrasi',
 'Kamu bisa menawarkan minum berulang tanpa memaksa, dan mencatat berapa banyak yang benar-benar diminum.',
 'kaigo',
 '[
  {"speaker":"田中","text":"アリさん、お茶を配ってください。","reading":"アリさん、おちゃをくばってください。","romaji":"Ari-san, ocha o kubatte kudasai.","trans":"Ari, tolong bagikan tehnya."},
  {"speaker":"アリ","text":"みなさん飲みますか。","reading":"みなさんのみますか。","romaji":"Minasan nomimasu ka.","trans":"Semuanya mau minum?"},
  {"speaker":"田中","text":"飲まない人が多いです。それが問題です。","reading":"のまないひとがおおいです。それがもんだいです。","romaji":"Nomanai hito ga ooi desu. Sore ga mondai desu.","trans":"Banyak yang tidak mau minum. Itu justru masalahnya."},
  {"speaker":"アリ","text":"どうして問題ですか。","reading":"どうしてもんだいですか。","romaji":"Doushite mondai desu ka.","trans":"Kenapa jadi masalah?"},
  {"speaker":"田中","text":"年をとると、のどがかわきません。でも、体は水がいります。","reading":"としをとると、のどがかわきません。でも、からだはみずがいります。","romaji":"Toshi o toru to, nodo ga kawakimasen. Demo, karada wa mizu ga irimasu.","trans":"Kalau sudah tua, rasa haus berkurang. Padahal tubuhnya tetap butuh air."},
  {"speaker":"アリ","text":"飲まないとどうなりますか。","reading":"のまないとどうなりますか。","romaji":"Nomanai to dou narimasu ka.","trans":"Kalau tidak minum, jadi bagaimana?"},
  {"speaker":"田中","text":"熱が出ます。頭がはっきりしなくなります。","reading":"ねつがでます。あたまがはっきりしなくなります。","romaji":"Netsu ga demasu. Atama ga hakkiri shinaku narimasu.","trans":"Bisa demam. Pikirannya jadi tidak jernih."},
  {"speaker":"アリ","text":"病気みたいですね。","reading":"びょうきみたいですね。","romaji":"Byouki mitai desu ne.","trans":"Mirip orang sakit, ya."},
  {"speaker":"田中","text":"はい。だから、何時に何ミリ飲んだか、書きます。","reading":"はい。だから、なんじになんミリのんだか、かきます。","romaji":"Hai. Dakara, nanji ni nan miri nonda ka, kakimasu.","trans":"Ya. Makanya kita catat, jam berapa dan berapa mililiter yang diminum."},
  {"speaker":"アリ","text":"全部書きますか。","reading":"ぜんぶかきますか。","romaji":"Zenbu kakimasu ka.","trans":"Semuanya dicatat?"},
  {"speaker":"田中","text":"書きます。一日にどのぐらい飲んだか分かります。","reading":"かきます。いちにちにどのぐらいのんだかわかります。","romaji":"Kakimasu. Ichinichi ni dono gurai nonda ka wakarimasu.","trans":"Dicatat. Supaya ketahuan sehari totalnya berapa."},
  {"speaker":"アリ","text":"飲みたくないと言ったら。","reading":"のみたくないといったら。","romaji":"Nomitakunai to ittara.","trans":"Kalau bilang tidak mau minum?"},
  {"speaker":"田中","text":"無理に飲ませません。冷たいお茶やゼリーをすすめます。","reading":"むりにのませません。つめたいおちゃやゼリーをすすめます。","romaji":"Muri ni nomasemasen. Tsumetai ocha ya zerii o susumemasu.","trans":"Jangan dipaksa. Tawarkan teh dingin atau jeli."},
  {"speaker":"アリ","text":"種類を変えますか。","reading":"しゅるいをかえますか。","romaji":"Shurui o kaemasu ka.","trans":"Jenisnya diganti?"},
  {"speaker":"田中","text":"そうです。だめでも、あとでもう一度すすめます。","reading":"そうです。だめでも、あとでもういちどすすめます。","romaji":"Sou desu. Dame demo, ato de mou ichido susumemasu.","trans":"Betul. Kalau masih menolak, nanti ditawarkan lagi."}
 ]'::jsonb,
 '[
  {"word":"水分補給","reading":"すいぶんほきゅう (suibun hokyuu)","meaning":"pemenuhan cairan tubuh"},
  {"word":"のどがかわく","reading":"nodo ga kawaku","meaning":"merasa haus"},
  {"word":"無理に","reading":"むりに (muri ni)","meaning":"dengan paksa"},
  {"word":"すすめる","reading":"susumeru","meaning":"menawarkan, menganjurkan"}
 ]'::jsonb, false),

-- ── 8 · N4 · Transfer kursi roda ─────────────────────────────────────────────
(2, 'kaigo-shokuin', 8,
 'Memindahkan ke Kursi Roda dengan Aman',
 'Kamu bisa menyiapkan kursi roda pada sudut dan jarak yang benar, mengunci rem, dan memberi aba-aba sebelum memindahkan.',
 'kaigo',
 '[
  {"speaker":"田中","text":"今日は移乗です。ベッドから車いすに移ります。","reading":"きょうはいじょうです。ベッドからくるまいすにうつります。","romaji":"Kyou wa ijou desu. Beddo kara kurumaisu ni utsurimasu.","trans":"Hari ini soal transfer. Memindahkan dari tempat tidur ke kursi roda."},
  {"speaker":"アリ","text":"抱き上げればいいですか。","reading":"だきあげればいいですか。","romaji":"Dakiagereba ii desu ka.","trans":"Cukup diangkat saja?"},
  {"speaker":"田中","text":"だめです。腰を痛めますし、利用者さんも怖いです。","reading":"だめです。こしをいためますし、りようしゃさんもこわいです。","romaji":"Dame desu. Koshi o itamemasu shi, riyousha-san mo kowai desu.","trans":"Tidak boleh. Pinggangmu bisa cedera, dan penghuninya juga ketakutan."},
  {"speaker":"アリ","text":"どうすればいいですか。","reading":"どうすればいいですか。","romaji":"Dou sureba ii desu ka.","trans":"Lalu harus bagaimana?"},
  {"speaker":"田中","text":"まず、車いすをベッドの近くに置きます。角度は三十度ぐらいです。","reading":"まず、くるまいすをベッドのちかくにおきます。かくどはさんじゅうどぐらいです。","romaji":"Mazu, kurumaisu o beddo no chikaku ni okimasu. Kakudo wa sanjuu-do gurai desu.","trans":"Pertama, letakkan kursi roda dekat tempat tidur. Sudutnya sekitar 30 derajat."},
  {"speaker":"アリ","text":"近いほうがいいんですね。","reading":"ちかいほうがいいんですね。","romaji":"Chikai hou ga ii n desu ne.","trans":"Jadi lebih dekat itu lebih baik, ya."},
  {"speaker":"田中","text":"遠いと、体を持ち上げる時間が長くなります。","reading":"とおいと、からだをもちあげるじかんがながくなります。","romaji":"Tooi to, karada o mochiageru jikan ga nagaku narimasu.","trans":"Kalau jauh, waktu menopang badannya jadi lebih lama."},
  {"speaker":"アリ","text":"次は何をしますか。","reading":"つぎはなにをしますか。","romaji":"Tsugi wa nani o shimasu ka.","trans":"Berikutnya apa?"},
  {"speaker":"田中","text":"ブレーキをかけます。これを忘れると車いすが動いて転びます。","reading":"ブレーキをかけます。これをわすれるとくるまいすがうごいてころびます。","romaji":"Bureeki o kakemasu. Kore o wasureru to kurumaisu ga ugoite korobimasu.","trans":"Kunci remnya. Kalau ini terlupa, kursi rodanya bergerak dan orangnya jatuh."},
  {"speaker":"アリ","text":"必ず確認します。","reading":"かならずかくにんします。","romaji":"Kanarazu kakunin shimasu.","trans":"Pasti saya cek."},
  {"speaker":"田中","text":"それから、足を置くところを上げます。ぶつかりますから。","reading":"それから、あしをおくところをあげます。ぶつかりますから。","romaji":"Sorekara, ashi o oku tokoro o agemasu. Butsukarimasu kara.","trans":"Lalu, sandaran kakinya dinaikkan. Kalau tidak, kakinya terbentur."},
  {"speaker":"アリ","text":"声はかけますか。","reading":"こえはかけますか。","romaji":"Koe wa kakemasu ka.","trans":"Perlu memberi aba-aba?"},
  {"speaker":"田中","text":"かけます。立ちますよ、一、二の、三、と言ってから動きます。","reading":"かけます。たちますよ、いち、にの、さん、といってからうごきます。","romaji":"Kakemasu. Tachimasu yo, ichi, ni no, san, to itte kara ugokimasu.","trans":"Perlu. Bilang dulu, saya bantu berdiri ya, satu, dua, tiga, baru bergerak."},
  {"speaker":"アリ","text":"急に動かすと危ないんですね。","reading":"きゅうにうごかすとあぶないんですね。","romaji":"Kyuu ni ugokasu to abunai n desu ne.","trans":"Jadi memindahkan mendadak itu berbahaya, ya."},
  {"speaker":"田中","text":"危ないです。それに、心の準備ができません。体だけ動かすのは介護ではありません。","reading":"あぶないです。それに、こころのじゅんびができません。からだだけうごかすのはかいごではありません。","romaji":"Abunai desu. Sore ni, kokoro no junbi ga dekimasen. Karada dake ugokasu no wa kaigo dewa arimasen.","trans":"Berbahaya. Selain itu, dia jadi tidak siap secara batin. Memindahkan badan saja itu bukan kaigo."}
 ]'::jsonb,
 '[
  {"word":"移乗","reading":"いじょう (ijou)","meaning":"transfer; memindahkan dari satu tempat duduk ke tempat lain"},
  {"word":"車いす","reading":"くるまいす (kurumaisu)","meaning":"kursi roda"},
  {"word":"ブレーキをかける","reading":"bureeki o kakeru","meaning":"mengunci rem"},
  {"word":"腰を痛める","reading":"こしをいためる (koshi o itameru)","meaning":"mencederai pinggang"}
 ]'::jsonb, false),

-- ── 9 · N4 · Mandi ───────────────────────────────────────────────────────────
(2, 'kaigo-shokuin', 9,
 'Memeriksa Kondisi Sebelum Mandi dan Membantu Berendam',
 'Kamu bisa memutuskan kapan mandi harus dibatalkan, mengatur suhu air, dan mencegah heat shock.',
 'kaigo',
 '[
  {"speaker":"田中","text":"午後はお風呂です。でも、その前に必ずバイタルを測ります。","reading":"ごごはおふろです。でも、そのまえにかならずバイタルをはかります。","romaji":"Gogo wa ofuro desu. Demo, sono mae ni kanarazu baitaru o hakarimasu.","trans":"Sore ini jadwal mandi. Tapi sebelumnya wajib ukur vital sign."},
  {"speaker":"アリ","text":"お風呂の前もですか。","reading":"おふろのまえもですか。","romaji":"Ofuro no mae mo desu ka.","trans":"Sebelum mandi juga diukur?"},
  {"speaker":"田中","text":"熱があるとき、血圧が高いときは入りません。","reading":"ねつがあるとき、けつあつがたかいときははいりません。","romaji":"Netsu ga aru toki, ketsuatsu ga takai toki wa hairimasen.","trans":"Kalau demam atau tekanan darahnya tinggi, tidak jadi mandi."},
  {"speaker":"アリ","text":"危ないですか。","reading":"あぶないですか。","romaji":"Abunai desu ka.","trans":"Berbahaya?"},
  {"speaker":"田中","text":"お湯に入ると血圧が急に変わります。倒れることがあります。","reading":"おゆにはいるとけつあつがきゅうにかわります。たおれることがあります。","romaji":"Oyu ni hairu to ketsuatsu ga kyuu ni kawarimasu. Taoreru koto ga arimasu.","trans":"Begitu masuk air panas, tekanan darahnya berubah mendadak. Bisa sampai pingsan."},
  {"speaker":"アリ","text":"何度がだめですか。","reading":"なんどがだめですか。","romaji":"Nando ga dame desu ka.","trans":"Berapa derajat yang tidak boleh?"},
  {"speaker":"田中","text":"三十七度五分以上は中止して、看護師に相談します。","reading":"さんじゅうななどごぶいじょうはちゅうしして、かんごしにそうだんします。","romaji":"Sanjuu-nana-do go-bu ijou wa chuushi shite, kangoshi ni soudan shimasu.","trans":"37,5 derajat ke atas dibatalkan, lalu konsultasi ke perawat."},
  {"speaker":"アリ","text":"お湯の温度は。","reading":"おゆのおんどは。","romaji":"Oyu no ondo wa.","trans":"Suhu airnya sendiri berapa?"},
  {"speaker":"田中","text":"四十度ぐらいです。熱すぎると体に負担がかかります。","reading":"よんじゅうどぐらいです。あつすぎるとからだにふたんがかかります。","romaji":"Yonjuu-do gurai desu. Atsusugiru to karada ni futan ga kakarimasu.","trans":"Sekitar 40 derajat. Kalau terlalu panas, tubuhnya jadi terbebani."},
  {"speaker":"アリ","text":"私が手で確かめますか。","reading":"わたしがてでたしかめますか。","romaji":"Watashi ga te de tashikamemasu ka.","trans":"Saya cek pakai tangan?"},
  {"speaker":"田中","text":"確かめます。それから、利用者さんにも聞きます。","reading":"たしかめます。それから、りようしゃさんにもききます。","romaji":"Tashikamemasu. Sorekara, riyousha-san ni mo kikimasu.","trans":"Dicek. Lalu tanyakan juga ke penghuninya."},
  {"speaker":"アリ","text":"洗うところの順番はありますか。","reading":"あらうところのじゅんばんはありますか。","romaji":"Arau tokoro no junban wa arimasu ka.","trans":"Ada urutan bagian yang dibasuh?"},
  {"speaker":"田中","text":"足のほうから、少しずつお湯をかけます。急に肩からはかけません。","reading":"あしのほうから、すこしずつおゆをかけます。きゅうにかたからはかけません。","romaji":"Ashi no hou kara, sukoshi zutsu oyu o kakemasu. Kyuu ni kata kara wa kakemasen.","trans":"Mulai dari kaki, disiram sedikit demi sedikit. Jangan langsung dari bahu."},
  {"speaker":"アリ","text":"びっくりしますからね。","reading":"びっくりしますからね。","romaji":"Bikkuri shimasu kara ne.","trans":"Karena bisa kaget, ya."},
  {"speaker":"田中","text":"そうです。それに、脱衣所も暖かくしておきます。寒いところから熱いお湯は、一番危ないです。","reading":"そうです。それに、だついじょもあたたかくしておきます。さむいところからあついおゆは、いちばんあぶないです。","romaji":"Sou desu. Sore ni, datsuijo mo atatakaku shite okimasu. Samui tokoro kara atsui oyu wa, ichiban abunai desu.","trans":"Betul. Selain itu, ruang ganti juga dihangatkan dulu. Dari ruang dingin langsung ke air panas itu yang paling berbahaya."}
 ]'::jsonb,
 '[
  {"word":"入浴介助","reading":"にゅうよくかいじょ (nyuuyoku kaijo)","meaning":"bantuan mandi"},
  {"word":"中止","reading":"ちゅうし (chuushi)","meaning":"pembatalan, penghentian"},
  {"word":"脱衣所","reading":"だついじょ (datsuijo)","meaning":"ruang ganti pakaian"},
  {"word":"負担がかかる","reading":"ふたんがかかる (futan ga kakaru)","meaning":"menjadi beban bagi tubuh"}
 ]'::jsonb, false),

-- ── 10 · N4 · Perawatan mulut ────────────────────────────────────────────────
(2, 'kaigo-shokuin', 10,
 'Perawatan Mulut dan Menangani Gigi Palsu',
 'Kamu bisa menjelaskan kaitan kebersihan mulut dengan pneumonia aspirasi, dan merawat gigi palsu tanpa merusaknya.',
 'kaigo',
 '[
  {"speaker":"田中","text":"食事のあとは口腔ケアです。","reading":"しょくじのあとはこうくうケアです。","romaji":"Shokuji no ato wa koukuu kea desu.","trans":"Setelah makan, waktunya perawatan mulut."},
  {"speaker":"アリ","text":"歯みがきですね。","reading":"はみがきですね。","romaji":"Hamigaki desu ne.","trans":"Menyikat gigi, ya."},
  {"speaker":"田中","text":"それだけではありません。口の中をきれいにすると、肺炎を防げます。","reading":"それだけではありません。くちのなかをきれいにすると、はいえんをふせげます。","romaji":"Sore dake dewa arimasen. Kuchi no naka o kirei ni suru to, haien o fusegemasu.","trans":"Bukan cuma itu. Menjaga kebersihan mulut bisa mencegah pneumonia."},
  {"speaker":"アリ","text":"肺炎ですか。口と関係がありますか。","reading":"はいえんですか。くちとかんけいがありますか。","romaji":"Haien desu ka. Kuchi to kankei ga arimasu ka.","trans":"Pneumonia? Apa hubungannya dengan mulut?"},
  {"speaker":"田中","text":"あります。口の菌が、だ液と一緒に肺に入ります。誤嚥性肺炎といいます。","reading":"あります。くちのきんが、だえきといっしょにはいにはいります。ごえんせいはいえんといいます。","romaji":"Arimasu. Kuchi no kin ga, daeki to issho ni hai ni hairimasu. Goensei haien to iimasu.","trans":"Ada. Bakteri di mulut ikut air liur masuk ke paru-paru. Namanya pneumonia aspirasi."},
  {"speaker":"アリ","text":"知りませんでした。","reading":"しりませんでした。","romaji":"Shirimasen deshita.","trans":"Saya baru tahu."},
  {"speaker":"田中","text":"高齢者が亡くなる理由で、とても多いです。","reading":"こうれいしゃがなくなるりゆうで、とてもおおいです。","romaji":"Koureisha ga nakunaru riyuu de, totemo ooi desu.","trans":"Ini salah satu penyebab kematian lansia yang paling banyak."},
  {"speaker":"アリ","text":"義歯の人はどうしますか。","reading":"ぎしのひとはどうしますか。","romaji":"Gishi no hito wa dou shimasu ka.","trans":"Yang pakai gigi palsu bagaimana?"},
  {"speaker":"田中","text":"外して、別に洗います。口の中も、やわらかいブラシでふきます。","reading":"はずして、べつにあらいます。くちのなかも、やわらかいブラシでふきます。","romaji":"Hazushite, betsu ni araimasu. Kuchi no naka mo, yawarakai burashi de fukimasu.","trans":"Dilepas, dicuci terpisah. Bagian dalam mulut juga dibersihkan dengan sikat lembut."},
  {"speaker":"アリ","text":"義歯は熱いお湯で洗いますか。","reading":"ぎしはあついおゆであらいますか。","romaji":"Gishi wa atsui oyu de araimasu ka.","trans":"Gigi palsunya dicuci pakai air panas?"},
  {"speaker":"田中","text":"洗いません。形が変わります。水かぬるま湯です。","reading":"あらいません。かたちがかわります。みずかぬるまゆです。","romaji":"Araimasen. Katachi ga kawarimasu. Mizu ka nurumayu desu.","trans":"Jangan. Bentuknya bisa berubah. Pakai air biasa atau air suam."},
  {"speaker":"アリ","text":"歯みがき粉は。","reading":"はみがきこは。","romaji":"Hamigakiko wa.","trans":"Kalau pasta giginya?"},
  {"speaker":"田中","text":"義歯用のものを使います。普通の歯みがき粉は傷がつきます。","reading":"ぎしようのものをつかいます。ふつうのはみがきこはきずがつきます。","romaji":"Gishi you no mono o tsukaimasu. Futsuu no hamigakiko wa kizu ga tsukimasu.","trans":"Pakai yang khusus gigi palsu. Pasta gigi biasa bikin tergores."},
  {"speaker":"アリ","text":"夜は外して寝ますか。","reading":"よるははずしてねますか。","romaji":"Yoru wa hazushite nemasu ka.","trans":"Malam hari dilepas saat tidur?"},
  {"speaker":"田中","text":"外します。ケースに水を入れて、その中に入れておきます。乾くと割れます。","reading":"はずします。ケースにみずをいれて、そのなかにいれておきます。かわくとわれます。","romaji":"Hazushimasu. Keesu ni mizu o irete, sono naka ni irete okimasu. Kawaku to waremasu.","trans":"Dilepas. Wadahnya diisi air, lalu gigi palsunya direndam. Kalau kering bisa retak."}
 ]'::jsonb,
 '[
  {"word":"口腔ケア","reading":"こうくうケア (koukuu kea)","meaning":"perawatan kebersihan rongga mulut"},
  {"word":"誤嚥性肺炎","reading":"ごえんせいはいえん (goensei haien)","meaning":"pneumonia aspirasi; radang paru akibat masuknya air liur atau makanan"},
  {"word":"義歯","reading":"ぎし (gishi)","meaning":"gigi palsu"},
  {"word":"ぬるま湯","reading":"ぬるまゆ (nurumayu)","meaning":"air suam-suam kuku"}
 ]'::jsonb, false)

-- Predikat WHERE wajib ditulis ulang: uniq_kaiwa_job_lesson adalah partial
-- index, dan Postgres hanya bisa menyimpulkannya kalau predikatnya disebut.
ON CONFLICT (job_slug, lesson_no) WHERE job_slug IS NOT NULL DO NOTHING;
