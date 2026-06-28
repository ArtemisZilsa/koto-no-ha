-- ============================================================
-- Koto no Ha — Seed Dokkai N2 (level_id=4): 5 bacaan (~450 huruf), tata bahasa lanjutan.
-- content_json: jp + furigana + romaji + terjemahan Indonesia (id). Re-runnable.
-- ============================================================
DELETE FROM public.dokkai_passages WHERE level_id = 4;

INSERT INTO public.dokkai_passages (level_id, order_index, title, text_content, content_json, vocab_notes, questions, is_premium) VALUES
(4, 1, '高齢化社会 — Masyarakat Menua',
 '日本は、世界でも特に高齢化が進んでいる国の一つである。高齢者が増える一方で、子どもの数は年々減少している。その結果、働く世代の負担がますます大きくなっている。介護を必要とする人が増え、人手不足も深刻だ。このため、政府は外国人労働者の受け入れを進めている。また、高齢者が元気に働き続けられる環境づくりも求められている。高齢化は避けられない課題だが、社会全体で支え合うことが重要である。',
 '[
   {"jp":"日本は、世界でも特に高齢化が進んでいる国の一つである。","furigana":"にほんは、せかいでもとくにこうれいかがすすんでいるくにのひとつである。","romaji":"Nihon wa, sekai demo tokuni koureika ga susunde iru kuni no hitotsu de aru.","id":"Jepang adalah salah satu negara yang penuaan penduduknya paling maju di dunia."},
   {"jp":"高齢者が増える一方で、子どもの数は年々減少している。","furigana":"こうれいしゃがふえるいっぽうで、こどものかずはねんねんげんしょうしている。","romaji":"Koureisha ga fueru ippou de, kodomo no kazu wa nennen genshou shite iru.","id":"Di satu sisi jumlah lansia bertambah, sementara jumlah anak menurun dari tahun ke tahun."},
   {"jp":"その結果、働く世代の負担がますます大きくなっている。","furigana":"そのけっか、はたらくせだいのふたんがますますおおきくなっている。","romaji":"Sono kekka, hataraku sedai no futan ga masumasu ookiku natte iru.","id":"Akibatnya, beban generasi pekerja semakin besar."},
   {"jp":"介護を必要とする人が増え、人手不足も深刻だ。","furigana":"かいごをひつようとするひとがふえ、ひとでぶそくもしんこくだ。","romaji":"Kaigo o hitsuyou to suru hito ga fue, hitode busoku mo shinkoku da.","id":"Orang yang membutuhkan perawatan bertambah, dan kekurangan tenaga kerja pun serius."},
   {"jp":"このため、政府は外国人労働者の受け入れを進めている。","furigana":"このため、せいふはがいこくじんろうどうしゃのうけいれをすすめている。","romaji":"Kono tame, seifu wa gaikokujin roudousha no ukeire o susumete iru.","id":"Oleh karena itu, pemerintah mendorong penerimaan pekerja asing."},
   {"jp":"また、高齢者が元気に働き続けられる環境づくりも求められている。","furigana":"また、こうれいしゃがげんきにはたらきつづけられるかんきょうづくりももとめられている。","romaji":"Mata, koureisha ga genki ni hatarakitsuzukerareru kankyou-zukuri mo motomerarete iru.","id":"Selain itu, pembangunan lingkungan agar lansia dapat terus bekerja dengan sehat pun dituntut."},
   {"jp":"高齢化は避けられない課題だが、社会全体で支え合うことが重要である。","furigana":"こうれいかはさけられないかだいだが、しゃかいぜんたいでささえあうことがじゅうようである。","romaji":"Koureika wa sakerarenai kadai da ga, shakai zentai de sasaeau koto ga juuyou de aru.","id":"Penuaan adalah persoalan yang tidak terhindarkan, tetapi saling mendukung sebagai satu masyarakat sangatlah penting."}
 ]'::jsonb,
 '[
   {"word":"高齢化","reading":"こうれいか","romaji":"koureika","meaning":"penuaan penduduk"},
   {"word":"減少","reading":"げんしょう","romaji":"genshou","meaning":"penurunan"},
   {"word":"負担","reading":"ふたん","romaji":"futan","meaning":"beban"},
   {"word":"介護","reading":"かいご","romaji":"kaigo","meaning":"perawatan (lansia)"},
   {"word":"人手不足","reading":"ひとでぶそく","romaji":"hitode busoku","meaning":"kekurangan tenaga kerja"},
   {"word":"支え合う","reading":"ささえあう","romaji":"sasaeau","meaning":"saling mendukung"}
 ]'::jsonb,
 '[
   {"q":"Apa yang terjadi pada jumlah anak di Jepang?","options":["Bertambah","Menurun tiap tahun","Tetap","Tidak disebutkan"],"answer":1,"explanation":"「子どもの数は年々減少している」."},
   {"q":"Apa langkah pemerintah menghadapi kekurangan tenaga kerja?","options":["Menaikkan pajak","Menerima pekerja asing","Menutup perusahaan","Mengurangi jumlah lansia"],"answer":1,"explanation":"「外国人労働者の受け入れを進めている」."},
   {"q":"Apa pesan akhir penulis?","options":["Penuaan dapat dihindari","Masyarakat harus saling mendukung","Lansia harus berhenti bekerja","Tidak ada solusi"],"answer":1,"explanation":"「社会全体で支え合うことが重要」."}
 ]'::jsonb,
 false),

(4, 2, 'テクノロジーと教育 — Teknologi dan Pendidikan',
 '近年、教育の現場でもテクノロジーの活用が急速に進んでいる。タブレットやオンライン授業によって、学ぶ場所や時間の制限が少なくなった。遠くに住む生徒でも、質の高い授業を受けられるようになった。一方で、画面を見る時間が長くなり、健康への影響を心配する声もある。また、機械だけに頼ると、人と人との関わりが減るおそれもある。大切なのは、技術をうまく利用しながら、人間らしい教育を守ることだ。テクノロジーは目的ではなく、より良い学びのための手段なのである。',
 '[
   {"jp":"近年、教育の現場でもテクノロジーの活用が急速に進んでいる。","furigana":"きんねん、きょういくのげんばでもテクノロジーのかつようがきゅうそくにすすんでいる。","romaji":"Kinnen, kyouiku no genba demo tekunorojii no katsuyou ga kyuusoku ni susunde iru.","id":"Belakangan ini, pemanfaatan teknologi di dunia pendidikan pun berkembang pesat."},
   {"jp":"タブレットやオンライン授業によって、学ぶ場所や時間の制限が少なくなった。","furigana":"タブレットやオンラインじゅぎょうによって、まなぶばしょやじかんのせいげんがすくなくなった。","romaji":"Taburetto ya onrain jugyou ni yotte, manabu basho ya jikan no seigen ga sukunaku natta.","id":"Berkat tablet dan kelas daring, batasan tempat dan waktu belajar menjadi berkurang."},
   {"jp":"遠くに住む生徒でも、質の高い授業を受けられるようになった。","furigana":"とおくにすむせいとでも、しつのたかいじゅぎょうをうけられるようになった。","romaji":"Tooku ni sumu seito demo, shitsu no takai jugyou o ukerareru you ni natta.","id":"Murid yang tinggal jauh pun kini bisa menerima pelajaran berkualitas tinggi."},
   {"jp":"一方で、画面を見る時間が長くなり、健康への影響を心配する声もある。","furigana":"いっぽうで、がめんをみるじかんがながくなり、けんこうへのえいきょうをしんぱいするこえもある。","romaji":"Ippou de, gamen o miru jikan ga nagaku nari, kenkou e no eikyou o shinpai suru koe mo aru.","id":"Di sisi lain, waktu menatap layar menjadi lebih lama, dan ada pula suara yang mengkhawatirkan dampaknya bagi kesehatan."},
   {"jp":"また、機械だけに頼ると、人と人との関わりが減るおそれもある。","furigana":"また、きかいだけにたよると、ひととひととのかかわりがへるおそれもある。","romaji":"Mata, kikai dake ni tayoru to, hito to hito to no kakawari ga heru osore mo aru.","id":"Selain itu, jika hanya bergantung pada mesin, ada kekhawatiran interaksi antarmanusia berkurang."},
   {"jp":"大切なのは、技術をうまく利用しながら、人間らしい教育を守ることだ。","furigana":"たいせつなのは、ぎじゅつをうまくりようしながら、にんげんらしいきょういくをまもることだ。","romaji":"Taisetsu na no wa, gijutsu o umaku riyou shinagara, ningenrashii kyouiku o mamoru koto da.","id":"Yang penting adalah memanfaatkan teknologi dengan baik sambil menjaga pendidikan yang manusiawi."},
   {"jp":"テクノロジーは目的ではなく、より良い学びのための手段なのである。","furigana":"テクノロジーはもくてきではなく、よりよいまなびのためのしゅだんなのである。","romaji":"Tekunorojii wa mokuteki de wa naku, yori yoi manabi no tame no shudan na no de aru.","id":"Teknologi bukanlah tujuan, melainkan sarana untuk pembelajaran yang lebih baik."}
 ]'::jsonb,
 '[
   {"word":"活用","reading":"かつよう","romaji":"katsuyou","meaning":"pemanfaatan"},
   {"word":"制限","reading":"せいげん","romaji":"seigen","meaning":"batasan"},
   {"word":"影響","reading":"えいきょう","romaji":"eikyou","meaning":"pengaruh/dampak"},
   {"word":"頼る","reading":"たよる","romaji":"tayoru","meaning":"bergantung"},
   {"word":"手段","reading":"しゅだん","romaji":"shudan","meaning":"sarana/cara"},
   {"word":"目的","reading":"もくてき","romaji":"mokuteki","meaning":"tujuan"}
 ]'::jsonb,
 '[
   {"q":"Apa keuntungan kelas daring menurut bacaan?","options":["Lebih murah","Mengurangi batasan tempat dan waktu belajar","Tidak perlu guru","Lebih singkat"],"answer":1,"explanation":"「学ぶ場所や時間の制限が少なくなった」."},
   {"q":"Apa kekhawatiran yang disebutkan?","options":["Biaya tinggi","Dampak kesehatan dan berkurangnya interaksi antarmanusia","Guru kehilangan pekerjaan","Internet lambat"],"answer":1,"explanation":"「健康への影響」「人と人との関わりが減る」."},
   {"q":"Bagaimana penulis memandang teknologi?","options":["Sebagai tujuan utama","Sebagai sarana untuk pembelajaran yang lebih baik","Sebagai sesuatu yang berbahaya","Sebagai pengganti guru"],"answer":1,"explanation":"「より良い学びのための手段」."}
 ]'::jsonb,
 false),

(4, 3, '食品ロス — Sampah Makanan',
 '食品ロスとは、まだ食べられるのに捨てられてしまう食べ物のことである。日本では、毎年大量の食品が無駄になっていると言われている。家庭だけでなく、レストランやスーパーからも多くの食品が捨てられている。この問題を解決するために、さまざまな取り組みが行われている。たとえば、売れ残った商品を安く売ったり、必要な人に配ったりする活動がある。わたしたちも、買いすぎないことや残さず食べることで協力できる。一人ひとりの意識が、食品ロスを減らす第一歩となるだろう。',
 '[
   {"jp":"食品ロスとは、まだ食べられるのに捨てられてしまう食べ物のことである。","furigana":"しょくひんロスとは、まだたべられるのにすてられてしまうたべもののことである。","romaji":"Shokuhin rosu to wa, mada taberareru noni suterarete shimau tabemono no koto de aru.","id":"Sampah makanan adalah makanan yang masih bisa dimakan tetapi terlanjur dibuang."},
   {"jp":"日本では、毎年大量の食品が無駄になっていると言われている。","furigana":"にほんでは、まいとしたいりょうのしょくひんがむだになっているといわれている。","romaji":"Nihon de wa, maitoshi tairyou no shokuhin ga muda ni natte iru to iwarete iru.","id":"Di Jepang, dikatakan setiap tahun makanan dalam jumlah besar terbuang sia-sia."},
   {"jp":"家庭だけでなく、レストランやスーパーからも多くの食品が捨てられている。","furigana":"かていだけでなく、レストランやスーパーからもおおくのしょくひんがすてられている。","romaji":"Katei dake de naku, resutoran ya suupaa kara mo ooku no shokuhin ga suterarete iru.","id":"Tidak hanya rumah tangga, dari restoran dan supermarket pun banyak makanan dibuang."},
   {"jp":"この問題を解決するために、さまざまな取り組みが行われている。","furigana":"このもんだいをかいけつするために、さまざまなとりくみがおこなわれている。","romaji":"Kono mondai o kaiketsu suru tame ni, samazama na torikumi ga okonawarete iru.","id":"Untuk menyelesaikan masalah ini, berbagai upaya tengah dilakukan."},
   {"jp":"たとえば、売れ残った商品を安く売ったり、必要な人に配ったりする活動がある。","furigana":"たとえば、うれのこったしょうひんをやすくうったり、ひつようなひとにくばったりするかつどうがある。","romaji":"Tatoeba, urenokotta shouhin o yasuku uttari, hitsuyou na hito ni kubattari suru katsudou ga aru.","id":"Misalnya, ada kegiatan menjual produk sisa dengan murah atau membagikannya kepada yang membutuhkan."},
   {"jp":"わたしたちも、買いすぎないことや残さず食べることで協力できる。","furigana":"わたしたちも、かいすぎないことやのこさずたべることできょうりょくできる。","romaji":"Watashitachi mo, kaisuginai koto ya nokosazu taberu koto de kyouryoku dekiru.","id":"Kita pun dapat berkontribusi dengan tidak membeli berlebihan dan menghabiskan makanan tanpa sisa."},
   {"jp":"一人ひとりの意識が、食品ロスを減らす第一歩となるだろう。","furigana":"ひとりひとりのいしきが、しょくひんロスをへらすだいいっぽとなるだろう。","romaji":"Hitorihitori no ishiki ga, shokuhin rosu o herasu daiippo to naru darou.","id":"Kesadaran setiap individu akan menjadi langkah pertama untuk mengurangi sampah makanan."}
 ]'::jsonb,
 '[
   {"word":"食品","reading":"しょくひん","romaji":"shokuhin","meaning":"bahan makanan"},
   {"word":"無駄","reading":"むだ","romaji":"muda","meaning":"sia-sia/mubazir"},
   {"word":"解決","reading":"かいけつ","romaji":"kaiketsu","meaning":"penyelesaian"},
   {"word":"取り組み","reading":"とりくみ","romaji":"torikumi","meaning":"upaya/inisiatif"},
   {"word":"売れ残った","reading":"うれのこった","romaji":"urenokotta","meaning":"tidak laku/tersisa"},
   {"word":"意識","reading":"いしき","romaji":"ishiki","meaning":"kesadaran"}
 ]'::jsonb,
 '[
   {"q":"Apa itu sampah makanan (food loss)?","options":["Makanan basi","Makanan yang masih layak tetapi dibuang","Makanan mahal","Makanan impor"],"answer":1,"explanation":"「まだ食べられるのに捨てられてしまう食べ物」."},
   {"q":"Contoh upaya mengatasi food loss?","options":["Menaikkan harga","Menjual sisa dengan murah atau membagikannya","Menutup restoran","Mengimpor makanan"],"answer":1,"explanation":"「売れ残った商品を安く売ったり、必要な人に配ったり」."},
   {"q":"Bagaimana kita bisa berkontribusi?","options":["Membeli sebanyak mungkin","Tidak membeli berlebihan dan tidak menyisakan makanan","Memasak lebih banyak","Tidak peduli"],"answer":1,"explanation":"「買いすぎないことや残さず食べること」."}
 ]'::jsonb,
 false),

(4, 4, '多様な働き方 — Cara Kerja yang Beragam',
 '最近、人々の働き方は大きく変化してきている。かつては、一つの会社で定年まで働くのが普通だった。しかし今では、転職やフリーランスを選ぶ人も珍しくない。在宅勤務が広がったことで、住む場所を自由に選べるようになった。このような変化は、仕事と生活の両立を可能にした。ただし、自由が増える分、自分で時間を管理する力が求められる。これからは、自分に合った働き方を見つけることがますます大切になる。',
 '[
   {"jp":"最近、人々の働き方は大きく変化してきている。","furigana":"さいきん、ひとびとのはたらきかたはおおきくへんかしてきている。","romaji":"Saikin, hitobito no hatarakikata wa ookiku henka shite kite iru.","id":"Belakangan ini, cara orang bekerja telah berubah secara besar-besaran."},
   {"jp":"かつては、一つの会社で定年まで働くのが普通だった。","furigana":"かつては、ひとつのかいしゃでていねんまではたらくのがふつうだった。","romaji":"Katsute wa, hitotsu no kaisha de teinen made hataraku no ga futsuu datta.","id":"Dahulu, bekerja di satu perusahaan hingga pensiun adalah hal yang biasa."},
   {"jp":"しかし今では、転職やフリーランスを選ぶ人も珍しくない。","furigana":"しかしいまでは、てんしょくやフリーランスをえらぶひともめずらしくない。","romaji":"Shikashi ima de wa, tenshoku ya furiiransu o erabu hito mo mezurashikunai.","id":"Namun sekarang, orang yang memilih pindah kerja atau menjadi pekerja lepas pun tidak jarang."},
   {"jp":"在宅勤務が広がったことで、住む場所を自由に選べるようになった。","furigana":"ざいたくきんむがひろがったことで、すむばしょをじゆうにえらべるようになった。","romaji":"Zaitaku kinmu ga hirogatta koto de, sumu basho o jiyuu ni eraberu you ni natta.","id":"Dengan meluasnya kerja dari rumah, orang menjadi bisa memilih tempat tinggal dengan bebas."},
   {"jp":"このような変化は、仕事と生活の両立を可能にした。","furigana":"このようなへんかは、しごととせいかつのりょうりつをかのうにした。","romaji":"Kono you na henka wa, shigoto to seikatsu no ryouritsu o kanou ni shita.","id":"Perubahan semacam ini memungkinkan keseimbangan antara pekerjaan dan kehidupan."},
   {"jp":"ただし、自由が増える分、自分で時間を管理する力が求められる。","furigana":"ただし、じゆうがふえるぶん、じぶんでじかんをかんりするちからがもとめられる。","romaji":"Tadashi, jiyuu ga fueru bun, jibun de jikan o kanri suru chikara ga motomerareru.","id":"Namun, seiring bertambahnya kebebasan, dituntut pula kemampuan mengatur waktu sendiri."},
   {"jp":"これからは、自分に合った働き方を見つけることがますます大切になる。","furigana":"これからは、じぶんにあったはたらきかたをみつけることがますますたいせつになる。","romaji":"Korekara wa, jibun ni atta hatarakikata o mitsukeru koto ga masumasu taisetsu ni naru.","id":"Ke depannya, menemukan cara kerja yang cocok untuk diri sendiri akan menjadi semakin penting."}
 ]'::jsonb,
 '[
   {"word":"働き方","reading":"はたらきかた","romaji":"hatarakikata","meaning":"cara bekerja"},
   {"word":"転職","reading":"てんしょく","romaji":"tenshoku","meaning":"pindah kerja"},
   {"word":"在宅勤務","reading":"ざいたくきんむ","romaji":"zaitaku kinmu","meaning":"kerja dari rumah"},
   {"word":"両立","reading":"りょうりつ","romaji":"ryouritsu","meaning":"menjalankan dua hal sekaligus"},
   {"word":"管理","reading":"かんり","romaji":"kanri","meaning":"manajemen/mengatur"},
   {"word":"変化","reading":"へんか","romaji":"henka","meaning":"perubahan"}
 ]'::jsonb,
 '[
   {"q":"Cara bekerja seperti apa yang dianggap biasa pada masa lalu?","options":["Sering pindah kerja","Bekerja di satu perusahaan hingga pensiun","Menjadi pekerja lepas","Bekerja dari rumah"],"answer":1,"explanation":"「一つの会社で定年まで働くのが普通」."},
   {"q":"Apa dampak meluasnya kerja dari rumah?","options":["Gaji naik","Bisa memilih tempat tinggal dengan bebas","Jam kerja bertambah","Tidak ada perubahan"],"answer":1,"explanation":"「住む場所を自由に選べる」."},
   {"q":"Apa yang dituntut seiring bertambahnya kebebasan?","options":["Lebih banyak uang","Kemampuan mengatur waktu sendiri","Lebih banyak rapat","Sering pindah kerja"],"answer":1,"explanation":"「自分で時間を管理する力が求められる」."}
 ]'::jsonb,
 false),

(4, 5, '読書の大切さ — Pentingnya Membaca',
 'スマートフォンの普及により、本を読む人が減っていると言われる。しかし、読書には多くの利点がある。本を読むことで、知識が増えるだけでなく、想像力も豊かになる。また、さまざまな立場の人の考え方を知ることができる。忙しい毎日でも、わずかな時間を読書に使うことはできる。寝る前の十分間だけでも、続ければ大きな差になる。読書は、心を豊かにし、人生をより深いものにしてくれる。',
 '[
   {"jp":"スマートフォンの普及により、本を読む人が減っていると言われる。","furigana":"スマートフォンのふきゅうにより、ほんをよむひとがへっているといわれる。","romaji":"Sumaatofon no fukyuu ni yori, hon o yomu hito ga hette iru to iwareru.","id":"Dengan meluasnya ponsel pintar, dikatakan orang yang membaca buku semakin berkurang."},
   {"jp":"しかし、読書には多くの利点がある。","furigana":"しかし、どくしょにはおおくのりてんがある。","romaji":"Shikashi, dokusho ni wa ooku no riten ga aru.","id":"Namun, membaca memiliki banyak manfaat."},
   {"jp":"本を読むことで、知識が増えるだけでなく、想像力も豊かになる。","furigana":"ほんをよむことで、ちしきがふえるだけでなく、そうぞうりょくもゆたかになる。","romaji":"Hon o yomu koto de, chishiki ga fueru dake de naku, souzouryoku mo yutaka ni naru.","id":"Dengan membaca buku, bukan hanya pengetahuan yang bertambah, tetapi daya imajinasi pun menjadi kaya."},
   {"jp":"また、さまざまな立場の人の考え方を知ることができる。","furigana":"また、さまざまなたちばのひとのかんがえかたをしることができる。","romaji":"Mata, samazama na tachiba no hito no kangaekata o shiru koto ga dekiru.","id":"Selain itu, kita bisa mengetahui cara berpikir orang dari berbagai posisi."},
   {"jp":"忙しい毎日でも、わずかな時間を読書に使うことはできる。","furigana":"いそがしいまいにちでも、わずかなじかんをどくしょにつかうことはできる。","romaji":"Isogashii mainichi demo, wazuka na jikan o dokusho ni tsukau koto wa dekiru.","id":"Meski setiap hari sibuk, kita tetap bisa menggunakan sedikit waktu untuk membaca."},
   {"jp":"寝る前の十分間だけでも、続ければ大きな差になる。","furigana":"ねるまえのじゅっぷんかんだけでも、つづければおおきなさになる。","romaji":"Neru mae no juppunkan dake demo, tsuzukereba ooki na sa ni naru.","id":"Bahkan hanya sepuluh menit sebelum tidur, jika diteruskan akan menjadi perbedaan besar."},
   {"jp":"読書は、心を豊かにし、人生をより深いものにしてくれる。","furigana":"どくしょは、こころをゆたかにし、じんせいをよりふかいものにしてくれる。","romaji":"Dokusho wa, kokoro o yutaka ni shi, jinsei o yori fukai mono ni shite kureru.","id":"Membaca memperkaya hati dan menjadikan hidup lebih bermakna."}
 ]'::jsonb,
 '[
   {"word":"普及","reading":"ふきゅう","romaji":"fukyuu","meaning":"penyebaran luas"},
   {"word":"読書","reading":"どくしょ","romaji":"dokusho","meaning":"membaca buku"},
   {"word":"利点","reading":"りてん","romaji":"riten","meaning":"keuntungan/manfaat"},
   {"word":"知識","reading":"ちしき","romaji":"chishiki","meaning":"pengetahuan"},
   {"word":"想像力","reading":"そうぞうりょく","romaji":"souzouryoku","meaning":"daya imajinasi"},
   {"word":"立場","reading":"たちば","romaji":"tachiba","meaning":"posisi/sudut pandang"}
 ]'::jsonb,
 '[
   {"q":"Apa yang dikatakan terjadi karena meluasnya ponsel pintar?","options":["Orang membaca lebih banyak","Orang yang membaca buku berkurang","Buku menjadi mahal","Perpustakaan tutup"],"answer":1,"explanation":"「本を読む人が減っている」."},
   {"q":"Apa manfaat membaca menurut bacaan?","options":["Hanya menambah uang","Menambah pengetahuan dan memperkaya imajinasi","Membuat lelah","Membuang waktu"],"answer":1,"explanation":"「知識が増えるだけでなく、想像力も豊かになる」."},
   {"q":"Saran konkret penulis untuk orang sibuk?","options":["Berhenti bekerja","Membaca sepuluh menit sebelum tidur","Membeli banyak buku","Membaca hanya di akhir pekan"],"answer":1,"explanation":"「寝る前の十分間だけでも、続ければ大きな差になる」."}
 ]'::jsonb,
 false);
