-- ============================================================
-- Koto no Ha — Seed Dokkai N1 (level_id=5): 5 bacaan (~600+ huruf), gaya esai formal.
-- content_json: jp + furigana + romaji + terjemahan Indonesia (id). Re-runnable.
-- ============================================================
DELETE FROM public.dokkai_passages WHERE level_id = 5;

INSERT INTO public.dokkai_passages (level_id, order_index, title, text_content, content_json, vocab_notes, questions, is_premium) VALUES
(5, 1, 'グローバル化と多文化共生 — Globalisasi dan Koeksistensi Multikultural',
 'グローバル化が進むにつれて、日本社会にも多様な背景を持つ人々が暮らすようになった。言語や習慣の異なる人々が共に生活する上で、摩擦が生じることは避けがたい。しかし、その違いを否定するのではなく、互いに理解し尊重し合う姿勢が求められている。多文化共生とは、単に異なる文化が同じ場所に存在することを指すのではない。それぞれが対等な立場で関わり合い、新たな価値を生み出していく過程こそが重要なのである。行政や教育機関の支援も欠かせないが、最終的には一人ひとりの意識が鍵を握っている。偏見にとらわれず、相手の文化に関心を持つことが、共生への第一歩となる。多様性を脅威ではなく豊かさとして捉えられるかどうかに、これからの社会の成熟が問われている。',
 '[
   {"jp":"グローバル化が進むにつれて、日本社会にも多様な背景を持つ人々が暮らすようになった。","furigana":"グローバルかがすすむにつれて、にほんしゃかいにもたようなはいけいをもつひとびとがくらすようになった。","romaji":"Guroobaruka ga susumu ni tsurete, nihon shakai ni mo tayou na haikei o motsu hitobito ga kurasu you ni natta.","id":"Seiring kemajuan globalisasi, di masyarakat Jepang pun kini hidup orang-orang dengan latar belakang yang beragam."},
   {"jp":"言語や習慣の異なる人々が共に生活する上で、摩擦が生じることは避けがたい。","furigana":"げんごやしゅうかんのことなるひとびとがともにせいかつするうえで、まさつがしょうじることはさけがたい。","romaji":"Gengo ya shuukan no kotonaru hitobito ga tomo ni seikatsu suru ue de, masatsu ga shoujiru koto wa sakegatai.","id":"Ketika orang-orang yang berbeda bahasa dan kebiasaan hidup bersama, gesekan yang timbul sulit dihindari."},
   {"jp":"しかし、その違いを否定するのではなく、互いに理解し尊重し合う姿勢が求められている。","furigana":"しかし、そのちがいをひていするのではなく、たがいにりかいしそんちょうしあうしせいがもとめられている。","romaji":"Shikashi, sono chigai o hitei suru no de wa naku, tagai ni rikai shi sonchou shiau shisei ga motomerarete iru.","id":"Namun, yang dituntut bukanlah menyangkal perbedaan itu, melainkan sikap saling memahami dan menghormati."},
   {"jp":"多文化共生とは、単に異なる文化が同じ場所に存在することを指すのではない。","furigana":"たぶんかきょうせいとは、たんにことなるぶんかがおなじばしょにそんざいすることをさすのではない。","romaji":"Tabunka kyousei to wa, tan ni kotonaru bunka ga onaji basho ni sonzai suru koto o sasu no de wa nai.","id":"Koeksistensi multikultural tidak sekadar berarti budaya-budaya berbeda berada di tempat yang sama."},
   {"jp":"それぞれが対等な立場で関わり合い、新たな価値を生み出していく過程こそが重要なのである。","furigana":"それぞれがたいとうなたちばでかかわりあい、あらたなかちをうみだしていくかていこそがじゅうようなのである。","romaji":"Sorezore ga taitou na tachiba de kakawariai, arata na kachi o umidashite iku katei koso ga juuyou na no de aru.","id":"Justru proses ketika masing-masing berinteraksi secara setara dan melahirkan nilai-nilai baru itulah yang penting."},
   {"jp":"行政や教育機関の支援も欠かせないが、最終的には一人ひとりの意識が鍵を握っている。","furigana":"ぎょうせいやきょういくきかんのしえんもかかせないが、さいしゅうてきにはひとりひとりのいしきがかぎをにぎっている。","romaji":"Gyousei ya kyouiku kikan no shien mo kakasenai ga, saishuuteki ni wa hitorihitori no ishiki ga kagi o nigitte iru.","id":"Dukungan pemerintah dan lembaga pendidikan memang tak tergantikan, tetapi pada akhirnya kesadaran tiap individulah yang memegang kunci."},
   {"jp":"偏見にとらわれず、相手の文化に関心を持つことが、共生への第一歩となる。","furigana":"へんけんにとらわれず、あいてのぶんかにかんしんをもつことが、きょうせいへのだいいっぽとなる。","romaji":"Henken ni torawarezu, aite no bunka ni kanshin o motsu koto ga, kyousei e no daiippo to naru.","id":"Tidak terbelenggu prasangka dan menaruh minat pada budaya orang lain menjadi langkah pertama menuju koeksistensi."},
   {"jp":"多様性を脅威ではなく豊かさとして捉えられるかどうかに、これからの社会の成熟が問われている。","furigana":"たようせいをきょういではなくゆたかさとしてとらえられるかどうかに、これからのしゃかいのせいじゅくがとわれている。","romaji":"Tayousei o kyoui de wa naku yutakasa to shite toraerareru ka dou ka ni, korekara no shakai no seijuku ga towarete iru.","id":"Apakah keberagaman dapat dipandang sebagai kekayaan dan bukan ancaman, di situlah kematangan masyarakat mendatang dipertaruhkan."}
 ]'::jsonb,
 '[
   {"word":"多文化共生","reading":"たぶんかきょうせい","romaji":"tabunka kyousei","meaning":"koeksistensi multikultural"},
   {"word":"摩擦","reading":"まさつ","romaji":"masatsu","meaning":"gesekan/friksi"},
   {"word":"尊重","reading":"そんちょう","romaji":"sonchou","meaning":"menghormati"},
   {"word":"対等","reading":"たいとう","romaji":"taitou","meaning":"setara/sederajat"},
   {"word":"偏見","reading":"へんけん","romaji":"henken","meaning":"prasangka"},
   {"word":"成熟","reading":"せいじゅく","romaji":"seijuku","meaning":"kematangan"}
 ]'::jsonb,
 '[
   {"q":"Menurut penulis, apa yang sulit dihindari saat orang berbeda budaya hidup bersama?","options":["Kebahagiaan","Gesekan/friksi","Kekayaan","Persahabatan"],"answer":1,"explanation":"「摩擦が生じることは避けがたい」."},
   {"q":"Apa makna sebenarnya koeksistensi multikultural menurut penulis?","options":["Budaya berbeda sekadar berada di tempat sama","Saling berinteraksi setara dan melahirkan nilai baru","Satu budaya mendominasi yang lain","Menghapus semua perbedaan"],"answer":1,"explanation":"「対等な立場で関わり合い、新たな価値を生み出していく過程こそが重要」."},
   {"q":"Apa yang pada akhirnya memegang kunci koeksistensi?","options":["Dukungan pemerintah saja","Kesadaran setiap individu","Lembaga pendidikan saja","Hukum yang ketat"],"answer":1,"explanation":"「最終的には一人ひとりの意識が鍵を握っている」."}
 ]'::jsonb,
 false),

(5, 2, 'AIと人間の役割 — Peran AI dan Manusia',
 '人工知能の発達は、わたしたちの生活や仕事のあり方を根本から変えつつある。かつて人間にしかできないと考えられていた作業の多くを、今では機械が担うようになった。その結果、効率は飛躍的に高まったが、同時に職を失う人が出るのではないかという不安も広がっている。しかし、AIがどれほど進歩しても、人間ならではの能力が失われるわけではない。創造性や共感、倫理的な判断などは、依然として人間に委ねられている領域である。重要なのは、AIを敵とみなすことではなく、いかに協働していくかを考えることだ。技術に使われるのではなく、技術を使いこなす知恵が、これまで以上に問われている。AIと人間が互いの長所を生かし合う時、社会はより豊かなものになるだろう。',
 '[
   {"jp":"人工知能の発達は、わたしたちの生活や仕事のあり方を根本から変えつつある。","furigana":"じんこうちのうのはったつは、わたしたちのせいかつやしごとのありかたをこんぽんからかえつつある。","romaji":"Jinkou chinou no hattatsu wa, watashitachi no seikatsu ya shigoto no arikata o konpon kara kaetsutsu aru.","id":"Perkembangan kecerdasan buatan tengah mengubah cara hidup dan bekerja kita secara mendasar."},
   {"jp":"かつて人間にしかできないと考えられていた作業の多くを、今では機械が担うようになった。","furigana":"かつてにんげんにしかできないとかんがえられていたさぎょうのおおくを、いまではきかいがになうようになった。","romaji":"Katsute ningen ni shika dekinai to kangaerarete ita sagyou no ooku o, ima de wa kikai ga ninau you ni natta.","id":"Banyak pekerjaan yang dahulu dianggap hanya bisa dilakukan manusia, kini telah diemban oleh mesin."},
   {"jp":"その結果、効率は飛躍的に高まったが、同時に職を失う人が出るのではないかという不安も広がっている。","furigana":"そのけっか、こうりつはひやくてきにたかまったが、どうじにしょくをうしなうひとがでるのではないかというふあんもひろがっている。","romaji":"Sono kekka, kouritsu wa hiyakuteki ni takamatta ga, douji ni shoku o ushinau hito ga deru no de wa nai ka to iu fuan mo hirogatte iru.","id":"Akibatnya, efisiensi meningkat pesat, tetapi pada saat yang sama menyebar pula kekhawatiran akan adanya orang yang kehilangan pekerjaan."},
   {"jp":"しかし、AIがどれほど進歩しても、人間ならではの能力が失われるわけではない。","furigana":"しかし、エーアイがどれほどしんぽしても、にんげんならではののうりょくがうしなわれるわけではない。","romaji":"Shikashi, eeai ga dorehodo shinpo shitemo, ningen narade wa no nouryoku ga ushinawareru wake de wa nai.","id":"Namun, sehebat apa pun AI berkembang, bukan berarti kemampuan khas manusia akan hilang."},
   {"jp":"創造性や共感、倫理的な判断などは、依然として人間に委ねられている領域である。","furigana":"そうぞうせいやきょうかん、りんりてきなはんだんなどは、いぜんとしてにんげんにゆだねられているりょういきである。","romaji":"Souzousei ya kyoukan, rinriteki na handan nado wa, izen to shite ningen ni yudanerarete iru ryouiki de aru.","id":"Kreativitas, empati, dan pertimbangan etis masih merupakan ranah yang dipercayakan kepada manusia."},
   {"jp":"重要なのは、AIを敵とみなすことではなく、いかに協働していくかを考えることだ。","furigana":"じゅうようなのは、エーアイをてきとみなすことではなく、いかにきょうどうしていくかをかんがえることだ。","romaji":"Juuyou na no wa, eeai o teki to minasu koto de wa naku, ika ni kyoudou shite iku ka o kangaeru koto da.","id":"Yang penting bukanlah memandang AI sebagai musuh, melainkan memikirkan cara berkolaborasi dengannya."},
   {"jp":"技術に使われるのではなく、技術を使いこなす知恵が、これまで以上に問われている。","furigana":"ぎじゅつにつかわれるのではなく、ぎじゅつをつかいこなすちえが、これまでいじょうにとわれている。","romaji":"Gijutsu ni tsukawareru no de wa naku, gijutsu o tsukainasu chie ga, kore made ijou ni towarete iru.","id":"Kebijaksanaan untuk menguasai teknologi, alih-alih dikendalikan olehnya, kini dipertanyakan lebih dari sebelumnya."},
   {"jp":"AIと人間が互いの長所を生かし合う時、社会はより豊かなものになるだろう。","furigana":"エーアイとにんげんがたがいのちょうしょをいかしあうとき、しゃかいはよりゆたかなものになるだろう。","romaji":"Eeai to ningen ga tagai no chousho o ikashiau toki, shakai wa yori yutaka na mono ni naru darou.","id":"Ketika AI dan manusia saling memanfaatkan kelebihan masing-masing, masyarakat akan menjadi lebih kaya."}
 ]'::jsonb,
 '[
   {"word":"人工知能","reading":"じんこうちのう","romaji":"jinkou chinou","meaning":"kecerdasan buatan (AI)"},
   {"word":"効率","reading":"こうりつ","romaji":"kouritsu","meaning":"efisiensi"},
   {"word":"創造性","reading":"そうぞうせい","romaji":"souzousei","meaning":"kreativitas"},
   {"word":"共感","reading":"きょうかん","romaji":"kyoukan","meaning":"empati"},
   {"word":"倫理的","reading":"りんりてき","romaji":"rinriteki","meaning":"etis"},
   {"word":"協働","reading":"きょうどう","romaji":"kyoudou","meaning":"kolaborasi/bekerja bersama"}
 ]'::jsonb,
 '[
   {"q":"Apa kekhawatiran yang menyebar akibat perkembangan AI?","options":["Mesin mudah rusak","Orang kehilangan pekerjaan","Efisiensi menurun","Harga naik"],"answer":1,"explanation":"「職を失う人が出るのではないかという不安」."},
   {"q":"Kemampuan apa yang menurut penulis masih menjadi ranah manusia?","options":["Perhitungan cepat","Kreativitas, empati, dan pertimbangan etis","Mengingat data","Bekerja tanpa lelah"],"answer":1,"explanation":"「創造性や共感、倫理的な判断…人間に委ねられている領域」."},
   {"q":"Apa sikap yang dianjurkan penulis terhadap AI?","options":["Memandangnya sebagai musuh","Memikirkan cara berkolaborasi dengannya","Melarang penggunaannya","Mengabaikannya"],"answer":1,"explanation":"「敵とみなすことではなく、いかに協働していくか」."}
 ]'::jsonb,
 false),

(5, 3, '言葉の変化 — Perubahan Bahasa',
 '言葉は時代とともに絶えず変化し続けるものである。若者の間で生まれる新しい表現は、しばしば年配の世代から批判の対象となる。「言葉の乱れ」として嘆く声は、いつの時代にも存在してきた。しかし、見方を変えれば、それは言葉が生きている証拠でもある。かつて誤用とされた表現が、長い年月を経て正しい用法として定着した例は数多くある。言葉の変化を一概に否定するのは、必ずしも建設的とは言えない。大切なのは、変化を受け入れつつも、言葉が持つ本来の役割を見失わないことだ。言葉とは、人と人とをつなぎ、思いを伝えるための尊い手段なのである。',
 '[
   {"jp":"言葉は時代とともに絶えず変化し続けるものである。","furigana":"ことばはじだいとともにたえずへんかしつづけるものである。","romaji":"Kotoba wa jidai to tomo ni taezu henka shitsuzukeru mono de aru.","id":"Bahasa adalah sesuatu yang terus-menerus berubah seiring zaman."},
   {"jp":"若者の間で生まれる新しい表現は、しばしば年配の世代から批判の対象となる。","furigana":"わかもののあいだでうまれるあたらしいひょうげんは、しばしばねんぱいのせだいからひはんのたいしょうとなる。","romaji":"Wakamono no aida de umareru atarashii hyougen wa, shibashiba nenpai no sedai kara hihan no taishou to naru.","id":"Ungkapan baru yang lahir di kalangan anak muda kerap menjadi sasaran kritik dari generasi yang lebih tua."},
   {"jp":"「言葉の乱れ」として嘆く声は、いつの時代にも存在してきた。","furigana":"「ことばのみだれ」としてなげくこえは、いつのじだいにもそんざいしてきた。","romaji":"Kotoba no midare to shite nageku koe wa, itsu no jidai ni mo sonzai shite kita.","id":"Suara yang meratapinya sebagai kemerosotan bahasa telah ada di setiap zaman."},
   {"jp":"しかし、見方を変えれば、それは言葉が生きている証拠でもある。","furigana":"しかし、みかたをかえれば、それはことばがいきているしょうこでもある。","romaji":"Shikashi, mikata o kaereba, sore wa kotoba ga ikite iru shouko de mo aru.","id":"Namun, jika sudut pandang diubah, hal itu justru merupakan bukti bahwa bahasa itu hidup."},
   {"jp":"かつて誤用とされた表現が、長い年月を経て正しい用法として定着した例は数多くある。","furigana":"かつてごようとされたひょうげんが、ながいねんげつをへてただしいようほうとしてていちゃくしたれいはかずおおくある。","romaji":"Katsute goyou to sareta hyougen ga, nagai nengetsu o hete tadashii youhou to shite teichaku shita rei wa kazuooku aru.","id":"Banyak contoh ungkapan yang dahulu dianggap salah kaprah, setelah melewati waktu panjang, mengakar sebagai pemakaian yang benar."},
   {"jp":"言葉の変化を一概に否定するのは、必ずしも建設的とは言えない。","furigana":"ことばのへんかをいちがいにひていするのは、かならずしもけんせつてきとはいえない。","romaji":"Kotoba no henka o ichigai ni hitei suru no wa, kanarazushimo kensetsuteki to wa ienai.","id":"Menyangkal perubahan bahasa secara serampangan tidak selalu bisa dikatakan konstruktif."},
   {"jp":"大切なのは、変化を受け入れつつも、言葉が持つ本来の役割を見失わないことだ。","furigana":"たいせつなのは、へんかをうけいれつつも、ことばがもつほんらいのやくわりをみうしなわないことだ。","romaji":"Taisetsu na no wa, henka o ukeiretsutsu mo, kotoba ga motsu honrai no yakuwari o miushinawanai koto da.","id":"Yang penting adalah tetap tidak kehilangan peran asli bahasa, sembari menerima perubahan."},
   {"jp":"言葉とは、人と人とをつなぎ、思いを伝えるための尊い手段なのである。","furigana":"ことばとは、ひととひととをつなぎ、おもいをつたえるためのとうといしゅだんなのである。","romaji":"Kotoba to wa, hito to hito to o tsunagi, omoi o tsutaeru tame no toutoi shudan na no de aru.","id":"Bahasa adalah sarana berharga untuk menghubungkan manusia dan menyampaikan perasaan."}
 ]'::jsonb,
 '[
   {"word":"表現","reading":"ひょうげん","romaji":"hyougen","meaning":"ungkapan/ekspresi"},
   {"word":"批判","reading":"ひはん","romaji":"hihan","meaning":"kritik"},
   {"word":"乱れ","reading":"みだれ","romaji":"midare","meaning":"kekacauan/kemerosotan"},
   {"word":"誤用","reading":"ごよう","romaji":"goyou","meaning":"salah pakai/salah kaprah"},
   {"word":"定着","reading":"ていちゃく","romaji":"teichaku","meaning":"mengakar/menetap"},
   {"word":"一概に","reading":"いちがいに","romaji":"ichigai ni","meaning":"secara serampangan/menyeluruh"}
 ]'::jsonb,
 '[
   {"q":"Bagaimana ungkapan baru anak muda sering dipandang generasi tua?","options":["Dipuji","Menjadi sasaran kritik","Diabaikan","Langsung ditiru"],"answer":1,"explanation":"「年配の世代から批判の対象となる」."},
   {"q":"Menurut penulis, perubahan bahasa merupakan bukti apa?","options":["Bahasa sedang rusak","Bahasa itu hidup","Anak muda malas","Zaman memburuk"],"answer":1,"explanation":"「言葉が生きている証拠でもある」."},
   {"q":"Apa yang dianggap penting oleh penulis?","options":["Menolak semua perubahan","Menerima perubahan tanpa kehilangan peran asli bahasa","Hanya memakai bahasa lama","Membiarkan bahasa rusak"],"answer":1,"explanation":"「変化を受け入れつつも、言葉が持つ本来の役割を見失わない」."}
 ]'::jsonb,
 false),

(5, 4, '地方創生 — Revitalisasi Daerah',
 '都市への人口集中が進む一方で、地方では過疎化が深刻な問題となっている。若い世代が仕事を求めて都会へ移り、農村には高齢者ばかりが残される。こうした状況を打開するため、各地でさまざまな取り組みが模索されている。地元の特産品をブランド化したり、観光資源を活用したりする動きが活発になっている。また、地方への移住を支援する制度を設ける自治体も増えてきた。ただし、一時的な支援だけでは、根本的な解決にはつながりにくい。地域が自らの魅力を再発見し、持続的に発展していく仕組みづくりが欠かせない。地方の活力を取り戻すことは、国全体の未来を左右する重要な課題なのである。',
 '[
   {"jp":"都市への人口集中が進む一方で、地方では過疎化が深刻な問題となっている。","furigana":"としへのじんこうしゅうちゅうがすすむいっぽうで、ちほうではかそかがしんこくなもんだいとなっている。","romaji":"Toshi e no jinkou shuuchuu ga susumu ippou de, chihou de wa kasoka ga shinkoku na mondai to natte iru.","id":"Di satu sisi pemusatan penduduk ke kota terus berlangsung, sementara di daerah, depopulasi menjadi masalah serius."},
   {"jp":"若い世代が仕事を求めて都会へ移り、農村には高齢者ばかりが残される。","furigana":"わかいせだいがしごとをもとめてとかいへうつり、のうそんにはこうれいしゃばかりがのこされる。","romaji":"Wakai sedai ga shigoto o motomete tokai e utsuri, nouson ni wa koureisha bakari ga nokosareru.","id":"Generasi muda pindah ke kota demi mencari pekerjaan, sehingga di desa hanya tertinggal para lansia."},
   {"jp":"こうした状況を打開するため、各地でさまざまな取り組みが模索されている。","furigana":"こうしたじょうきょうをだかいするため、かくちでさまざまなとりくみがもさくされている。","romaji":"Koushita joukyou o dakai suru tame, kakuchi de samazama na torikumi ga mosaku sarete iru.","id":"Untuk mengatasi situasi semacam ini, berbagai upaya tengah dijajaki di berbagai daerah."},
   {"jp":"地元の特産品をブランド化したり、観光資源を活用したりする動きが活発になっている。","furigana":"じもとのとくさんひんをブランドかしたり、かんこうしげんをかつようしたりするうごきがかっぱつになっている。","romaji":"Jimoto no tokusanhin o burandoka shitari, kankou shigen o katsuyou shitari suru ugoki ga kappatsu ni natte iru.","id":"Gerakan untuk membuat merek produk khas daerah dan memanfaatkan sumber daya wisata menjadi semakin aktif."},
   {"jp":"また、地方への移住を支援する制度を設ける自治体も増えてきた。","furigana":"また、ちほうへのいじゅうをしえんするせいどをもうけるじちたいもふえてきた。","romaji":"Mata, chihou e no ijuu o shien suru seido o moukeru jichitai mo fuete kita.","id":"Selain itu, pemerintah daerah yang menyediakan sistem dukungan untuk pindah ke daerah pun bertambah."},
   {"jp":"ただし、一時的な支援だけでは、根本的な解決にはつながりにくい。","furigana":"ただし、いちじてきなしえんだけでは、こんぽんてきなかいけつにはつながりにくい。","romaji":"Tadashi, ichijiteki na shien dake de wa, konponteki na kaiketsu ni wa tsunagarinikui.","id":"Namun, dukungan yang bersifat sementara saja sulit membawa pada penyelesaian yang mendasar."},
   {"jp":"地域が自らの魅力を再発見し、持続的に発展していく仕組みづくりが欠かせない。","furigana":"ちいきがみずからのみりょくをさいはっけんし、じぞくてきにはってんしていくしくみづくりがかかせない。","romaji":"Chiiki ga mizukara no miryoku o saihakken shi, jizokuteki ni hatten shite iku shikumi-zukuri ga kakasenai.","id":"Pembangunan mekanisme agar daerah menemukan kembali daya tariknya sendiri dan berkembang secara berkelanjutan menjadi tak tergantikan."},
   {"jp":"地方の活力を取り戻すことは、国全体の未来を左右する重要な課題なのである。","furigana":"ちほうのかつりょくをとりもどすことは、くにぜんたいのみらいをさゆうするじゅうようなかだいなのである。","romaji":"Chihou no katsuryoku o torimodosu koto wa, kuni zentai no mirai o sayuu suru juuyou na kadai na no de aru.","id":"Mengembalikan vitalitas daerah adalah persoalan penting yang menentukan masa depan seluruh negeri."}
 ]'::jsonb,
 '[
   {"word":"過疎化","reading":"かそか","romaji":"kasoka","meaning":"depopulasi (daerah)"},
   {"word":"打開","reading":"だかい","romaji":"dakai","meaning":"menerobos/mengatasi (kebuntuan)"},
   {"word":"特産品","reading":"とくさんひん","romaji":"tokusanhin","meaning":"produk khas daerah"},
   {"word":"移住","reading":"いじゅう","romaji":"ijuu","meaning":"perpindahan tempat tinggal/migrasi"},
   {"word":"持続的","reading":"じぞくてき","romaji":"jizokuteki","meaning":"berkelanjutan"},
   {"word":"活力","reading":"かつりょく","romaji":"katsuryoku","meaning":"vitalitas/daya hidup"}
 ]'::jsonb,
 '[
   {"q":"Apa masalah serius yang dihadapi daerah?","options":["Kemacetan","Depopulasi","Polusi udara","Banjir"],"answer":1,"explanation":"「地方では過疎化が深刻な問題」."},
   {"q":"Contoh upaya revitalisasi daerah?","options":["Menutup desa","Membuat merek produk khas dan memanfaatkan wisata","Memindahkan lansia ke kota","Menaikkan pajak"],"answer":1,"explanation":"「特産品をブランド化…観光資源を活用」."},
   {"q":"Mengapa dukungan sementara dianggap kurang memadai?","options":["Terlalu mahal","Sulit membawa penyelesaian yang mendasar","Tidak diminati warga","Dilarang pemerintah"],"answer":1,"explanation":"「一時的な支援だけでは、根本的な解決にはつながりにくい」."}
 ]'::jsonb,
 false),

(5, 5, '幸福とは何か — Apa Itu Kebahagiaan',
 '幸福とは何かという問いは、古来、多くの哲学者を悩ませてきた。物質的に豊かになれば幸せになれると、かつては広く信じられていた。しかし、経済が発展した現代においても、心の満たされない人は少なくない。このことは、幸福が必ずしも物の豊かさと比例しないことを示している。近年の研究では、人との温かいつながりこそが幸福感を高めると指摘されている。他者に感謝し、日々の小さな喜びに目を向けることが、心の充実につながるという。幸福は、どこか遠くにあるものではなく、身近な日常の中にひそんでいるのかもしれない。結局のところ、幸福とは外から与えられるものではなく、自らの心が見いだすものなのだろう。',
 '[
   {"jp":"幸福とは何かという問いは、古来、多くの哲学者を悩ませてきた。","furigana":"こうふくとはなにかというといは、こらい、おおくのてつがくしゃをなやませてきた。","romaji":"Koufuku to wa nani ka to iu toi wa, korai, ooku no tetsugakusha o nayamasete kita.","id":"Pertanyaan tentang apa itu kebahagiaan, sejak dahulu kala, telah menyusahkan banyak filsuf."},
   {"jp":"物質的に豊かになれば幸せになれると、かつては広く信じられていた。","furigana":"ぶっしつてきにゆたかになればしあわせになれると、かつてはひろくしんじられていた。","romaji":"Busshitsuteki ni yutaka ni nareba shiawase ni nareru to, katsute wa hiroku shinjirarete ita.","id":"Dahulu banyak diyakini bahwa jika menjadi kaya secara materi, orang akan bahagia."},
   {"jp":"しかし、経済が発展した現代においても、心の満たされない人は少なくない。","furigana":"しかし、けいざいがはってんしたげんだいにおいても、こころのみたされないひとはすくなくない。","romaji":"Shikashi, keizai ga hatten shita gendai ni oite mo, kokoro no mitasarenai hito wa sukunakunai.","id":"Namun, bahkan di zaman modern yang ekonominya telah maju, orang yang hatinya tidak terpenuhi tidaklah sedikit."},
   {"jp":"このことは、幸福が必ずしも物の豊かさと比例しないことを示している。","furigana":"このことは、こうふくがかならずしももののゆたかさとひれいしないことをしめしている。","romaji":"Kono koto wa, koufuku ga kanarazushimo mono no yutakasa to hirei shinai koto o shimeshite iru.","id":"Hal ini menunjukkan bahwa kebahagiaan tidak selalu berbanding lurus dengan kekayaan materi."},
   {"jp":"近年の研究では、人との温かいつながりこそが幸福感を高めると指摘されている。","furigana":"きんねんのけんきゅうでは、ひととのあたたかいつながりこそがこうふくかんをたかめるとしてきされている。","romaji":"Kinnen no kenkyuu de wa, hito to no atatakai tsunagari koso ga koufukukan o takameru to shiteki sarete iru.","id":"Dalam penelitian belakangan ini ditunjukkan bahwa justru hubungan hangat dengan sesamalah yang meningkatkan rasa bahagia."},
   {"jp":"他者に感謝し、日々の小さな喜びに目を向けることが、心の充実につながるという。","furigana":"たしゃにかんしゃし、ひびのちいさなよろこびにめをむけることが、こころのじゅうじつにつながるという。","romaji":"Tasha ni kansha shi, hibi no chiisa na yorokobi ni me o mukeru koto ga, kokoro no juujitsu ni tsunagaru to iu.","id":"Dikatakan bahwa bersyukur kepada orang lain dan memerhatikan kegembiraan kecil sehari-hari membawa pada kepenuhan hati."},
   {"jp":"幸福は、どこか遠くにあるものではなく、身近な日常の中にひそんでいるのかもしれない。","furigana":"こうふくは、どこかとおくにあるものではなく、みぢかなにちじょうのなかにひそんでいるのかもしれない。","romaji":"Koufuku wa, dokoka tooku ni aru mono de wa naku, midika na nichijou no naka ni hisonde iru no kamoshirenai.","id":"Kebahagiaan mungkin bukanlah sesuatu yang berada di tempat jauh, melainkan tersembunyi di dalam keseharian yang dekat."},
   {"jp":"結局のところ、幸福とは外から与えられるものではなく、自らの心が見いだすものなのだろう。","furigana":"けっきょくのところ、こうふくとはそとからあたえられるものではなく、みずからのこころがみいだすものなのだろう。","romaji":"Kekkyoku no tokoro, koufuku to wa soto kara ataerareru mono de wa naku, mizukara no kokoro ga miidasu mono na no darou.","id":"Pada akhirnya, kebahagiaan barangkali bukanlah sesuatu yang diberikan dari luar, melainkan sesuatu yang ditemukan oleh hati kita sendiri."}
 ]'::jsonb,
 '[
   {"word":"幸福","reading":"こうふく","romaji":"koufuku","meaning":"kebahagiaan"},
   {"word":"哲学者","reading":"てつがくしゃ","romaji":"tetsugakusha","meaning":"filsuf"},
   {"word":"物質的","reading":"ぶっしつてき","romaji":"busshitsuteki","meaning":"material/kebendaan"},
   {"word":"比例","reading":"ひれい","romaji":"hirei","meaning":"berbanding lurus/proporsional"},
   {"word":"指摘","reading":"してき","romaji":"shiteki","meaning":"menunjukkan/menyoroti"},
   {"word":"充実","reading":"じゅうじつ","romaji":"juujitsu","meaning":"kepenuhan/kepuasan batin"}
 ]'::jsonb,
 '[
   {"q":"Apa yang dahulu banyak diyakini tentang kebahagiaan?","options":["Kekayaan materi membuat bahagia","Teman membuat bahagia","Kesehatan membuat bahagia","Ilmu membuat bahagia"],"answer":0,"explanation":"「物質的に豊かになれば幸せになれると…信じられていた」."},
   {"q":"Menurut penelitian, apa yang meningkatkan rasa bahagia?","options":["Uang","Hubungan hangat dengan sesama","Pekerjaan","Ketenaran"],"answer":1,"explanation":"「人との温かいつながりこそが幸福感を高める」."},
   {"q":"Apa kesimpulan penulis tentang kebahagiaan?","options":["Diberikan dari luar","Ditemukan oleh hati sendiri","Hanya untuk orang kaya","Tidak mungkin dicapai"],"answer":1,"explanation":"「自らの心が見いだすもの」."}
 ]'::jsonb,
 false);
