import type { LevelData } from './types'

export const n2Data: LevelData = {
  level: 'N2',
  name: 'Lanjutan',
  subtitle: 'Penguasaan Lanjutan',
  bgKanji: '究',
  accentColor: 'var(--gold)',
  accentBg: 'var(--gold-bg)',

  // Kanji + vocab N2 di-fetch dari database (Supabase)
  kanji: [],
  vocab: [],

  // ─── 50 POLA TATA BAHASA N2 ─────────────────────────────────────────────
  grammar: [
    {
      pattern: '～にもかかわらず',
      reading: '~ni mo kakawarazu',
      meaning: 'Meskipun ~, Walaupun ~',
      explanation:
        'Menyatakan hasil yang tidak terduga atau bertentangan dengan ekspektasi. Lebih formal dari ～のに. Sering dipakai dalam tulisan atau berita.',
      examples: [
        { sentence: '雨にもかかわらず、試合は行われた。', hiragana: 'あめにもかかわらず、しあいはおこなわれた。', meaning: 'Meskipun hujan, pertandingan tetap dilangsungkan.' },
        { sentence: '努力したにもかかわらず失敗した。', hiragana: 'どりょくしたにもかかわらずしっぱいした。', meaning: 'Walaupun sudah berusaha, tetap saja gagal.' },
      ],
      level: 'N2',
      tags: ['kontras', 'meskipun', 'formal'],
    },
    {
      pattern: '～くせに',
      reading: '~kuse ni',
      meaning: 'Padahal ~, Walaupun ~ (negatif/kesal)',
      explanation:
        'Menyatakan kontras dengan nuansa kekesalan atau celaan. Subjek harus orang. Lebih casual dan negatif dari ～のに.',
      examples: [
        { sentence: '知っているくせに教えてくれない。', hiragana: 'しっているくせにおしえてくれない。', meaning: 'Padahal tahu, tapi tidak mau memberitahu.' },
        { sentence: '子供のくせに偉そうだ。', hiragana: 'こどものくせにえらそうだ。', meaning: 'Padahal masih anak-anak, tapi sok hebat.' },
      ],
      level: 'N2',
      tags: ['kontras', 'kesal', 'negatif'],
    },
    {
      pattern: '～わりに',
      reading: '~wari ni',
      meaning: 'Mengingat ~, Untuk ukuran ~',
      explanation:
        'Menyatakan hasil yang tidak sesuai dengan ekspektasi berdasarkan suatu standar. Sering bermakna "lebih dari yang diharapkan".',
      examples: [
        { sentence: 'この店は高いわりにおいしくない。', hiragana: 'このみせはたかいわりにおいしくない。', meaning: 'Mengingat harganya mahal, restoran ini tidak terlalu enak.' },
        { sentence: '年のわりに若く見える。', hiragana: 'としのわりにわかくみえる。', meaning: 'Untuk usianya, dia terlihat muda.' },
      ],
      level: 'N2',
      tags: ['kontras', 'standar'],
    },
    {
      pattern: '～にしては',
      reading: '~ni shite wa',
      meaning: 'Untuk ukuran ~, Mengingat ~',
      explanation:
        'Mirip ～わりに tapi lebih spesifik membandingkan dengan standar yang konkret. Sering dipakai untuk kekaguman atau ketidaksesuaian.',
      examples: [
        { sentence: '初心者にしては上手だ。', hiragana: 'しょしんしゃにしてはじょうずだ。', meaning: 'Untuk pemula, dia hebat.' },
        { sentence: '冬にしては暖かい日だ。', hiragana: 'ふゆにしてはあたたかいひだ。', meaning: 'Untuk musim dingin, harinya hangat.' },
      ],
      level: 'N2',
      tags: ['kontras', 'standar'],
    },
    {
      pattern: '～ものの',
      reading: '~mono no',
      meaning: 'Meskipun ~, Walaupun ~ (formal)',
      explanation:
        'Menyatakan kontras formal. Mengakui fakta di klausa pertama tapi memberikan twist di klausa kedua. Lebih literal/tulisan.',
      examples: [
        { sentence: '行くと言ったものの、まだ準備していない。', hiragana: 'いくといったものの、まだじゅんびしていない。', meaning: 'Meskipun sudah bilang akan pergi, belum bersiap.' },
        { sentence: '免許は持っているものの、運転しない。', hiragana: 'めんきょはもっているものの、うんてんしない。', meaning: 'Walaupun punya SIM, tidak menyetir.' },
      ],
      level: 'N2',
      tags: ['kontras', 'formal'],
    },
    {
      pattern: '～せいで',
      reading: '~sei de',
      meaning: 'Gara-gara ~, Karena ~ (negatif)',
      explanation:
        'Menyatakan sebab dengan nuansa menyalahkan atau hasil negatif. Lawan dari ～おかげで yang positif.',
      examples: [
        { sentence: '雨のせいで電車が遅れた。', hiragana: 'あめのせいででんしゃがおくれた。', meaning: 'Gara-gara hujan, kereta terlambat.' },
        { sentence: '寝坊したせいで遅刻した。', hiragana: 'ねぼうしたせいでちこくした。', meaning: 'Karena kesiangan, saya terlambat.' },
      ],
      level: 'N2',
      tags: ['sebab-akibat', 'negatif'],
    },
    {
      pattern: '～おかげで',
      reading: '~okage de',
      meaning: 'Berkat ~, Karena bantuan ~',
      explanation:
        'Menyatakan sebab dengan nuansa positif atau berterima kasih. Lawan dari ～せいで.',
      examples: [
        { sentence: '先生のおかげで合格できた。', hiragana: 'せんせいのおかげでごうかくできた。', meaning: 'Berkat bantuan guru, saya bisa lulus.' },
        { sentence: 'あなたのおかげで助かった。', hiragana: 'あなたのおかげでたすかった。', meaning: 'Berkat Anda, saya tertolong.' },
      ],
      level: 'N2',
      tags: ['sebab-akibat', 'positif', 'berterima kasih'],
    },
    {
      pattern: '～ばかりに',
      reading: '~bakari ni',
      meaning: 'Hanya gara-gara ~',
      explanation:
        'Menyatakan sebab tunggal yang membuat hasil negatif terjadi. Mengandung penyesalan. Lebih kuat dari ～せいで.',
      examples: [
        { sentence: '一言多かったばかりに彼を怒らせた。', hiragana: 'ひとことおおかったばかりにかれをおこらせた。', meaning: 'Hanya karena bicara satu kata lebih, saya membuatnya marah.' },
        { sentence: '油断したばかりに事故を起こした。', hiragana: 'ゆだんしたばかりにじこをおこした。', meaning: 'Hanya gara-gara lengah, terjadi kecelakaan.' },
      ],
      level: 'N2',
      tags: ['sebab-akibat', 'penyesalan'],
    },
    {
      pattern: '～あまり',
      reading: '~amari',
      meaning: 'Terlalu ~ sampai ~',
      explanation:
        'Menyatakan tingkat emosi/aksi yang berlebihan menyebabkan suatu hasil. Sering dengan kata kerja perasaan.',
      examples: [
        { sentence: '驚きのあまり声が出なかった。', hiragana: 'おどろきのあまりこえがでなかった。', meaning: 'Saking terkejutnya, saya tidak bisa bersuara.' },
        { sentence: '心配のあまり眠れなかった。', hiragana: 'しんぱいのあまりねむれなかった。', meaning: 'Karena terlalu khawatir, saya tidak bisa tidur.' },
      ],
      level: 'N2',
      tags: ['sebab-akibat', 'intensitas'],
    },
    {
      pattern: '～ゆえに',
      reading: '~yue ni',
      meaning: 'Oleh karena itu ~, Karena ~ (formal/sastra)',
      explanation:
        'Versi sangat formal dan literal dari ～から. Sering dipakai dalam dokumen resmi, pidato, atau tulisan akademis.',
      examples: [
        { sentence: '若さゆえに失敗した。', hiragana: 'わかさゆえにしっぱいした。', meaning: 'Karena masih muda, saya gagal.' },
        { sentence: 'これゆえに彼は有名になった。', hiragana: 'これゆえにかれはゆうめいになった。', meaning: 'Oleh karena inilah dia menjadi terkenal.' },
      ],
      level: 'N2',
      tags: ['sebab-akibat', 'formal', 'sastra'],
    },
    {
      pattern: '～ば～ほど',
      reading: '~ba ~hodo',
      meaning: 'Semakin ~, Semakin ~',
      explanation:
        'Menyatakan korelasi: ketika satu hal meningkat, hal lain juga meningkat secara paralel. Kata kerja diulang dalam dua bentuk.',
      examples: [
        { sentence: '勉強すればするほど面白くなる。', hiragana: 'べんきょうすればするほどおもしろくなる。', meaning: 'Semakin belajar, semakin menarik.' },
        { sentence: '考えれば考えるほどわからなくなる。', hiragana: 'かんがえればかんがえるほどわからなくなる。', meaning: 'Semakin dipikir, semakin tidak mengerti.' },
      ],
      level: 'N2',
      tags: ['kondisional', 'paralel'],
    },
    {
      pattern: '～さえ～ば',
      reading: '~sae ~ba',
      meaning: 'Asalkan ~, Cukup dengan ~',
      explanation:
        'Menyatakan kondisi minimum/cukup. "Cukup dengan X saja, Y akan terjadi."',
      examples: [
        { sentence: 'お金さえあれば何でもできる。', hiragana: 'おかねさえあればなんでもできる。', meaning: 'Asalkan punya uang, apapun bisa dilakukan.' },
        { sentence: '時間さえあれば手伝います。', hiragana: 'じかんさえあればてつだいます。', meaning: 'Asalkan ada waktu, saya akan membantu.' },
      ],
      level: 'N2',
      tags: ['kondisional', 'cukup'],
    },
    {
      pattern: '～なくしては',
      reading: '~naku shite wa',
      meaning: 'Tanpa ~, ~ tidak mungkin',
      explanation:
        'Menyatakan ketidakmungkinan tanpa sesuatu. Pola: 〜なくして(は)〜ない. Formal dan tegas.',
      examples: [
        { sentence: '努力なくしては成功はない。', hiragana: 'どりょくなくしてはせいこうはない。', meaning: 'Tanpa usaha, tidak ada keberhasilan.' },
        { sentence: '彼女の協力なくして完成しなかった。', hiragana: 'かのじょのきょうりょくなくしてかんせいしなかった。', meaning: 'Tanpa kerjasamanya, tidak akan selesai.' },
      ],
      level: 'N2',
      tags: ['kondisional', 'negatif', 'formal'],
    },
    {
      pattern: '～たら最後',
      reading: '~tara saigo',
      meaning: 'Sekali ~, Begitu ~ (negatif)',
      explanation:
        'Menyatakan bahwa begitu sesuatu terjadi, konsekuensi negatif tidak bisa dihindari. Mirip dengan "once X happens, there\'s no turning back."',
      examples: [
        { sentence: '彼が話し始めたら最後、止まらない。', hiragana: 'かれがはなしはじめたらさいご、とまらない。', meaning: 'Sekali dia mulai bicara, tidak akan berhenti.' },
        { sentence: '甘いものを食べ始めたら最後、やめられない。', hiragana: 'あまいものをたべはじめたらさいご、やめられない。', meaning: 'Sekali mulai makan manisan, tidak bisa berhenti.' },
      ],
      level: 'N2',
      tags: ['kondisional', 'irreversible'],
    },
    {
      pattern: '～にしろ～にしろ',
      reading: '~ni shiro ~ni shiro',
      meaning: 'Baik ~ maupun ~',
      explanation:
        'Menyatakan bahwa apapun pilihannya, kesimpulan tetap sama. Pola listing dengan dua opsi.',
      examples: [
        { sentence: '行くにしろ行かないにしろ、連絡してください。', hiragana: 'いくにしろいかないにしろ、れんらくしてください。', meaning: 'Baik akan pergi maupun tidak, tolong kabari.' },
        { sentence: '雨にしろ雪にしろ、出発します。', hiragana: 'あめにしろゆきにしろ、しゅっぱつします。', meaning: 'Baik hujan maupun salju, kami akan berangkat.' },
      ],
      level: 'N2',
      tags: ['listing', 'pilihan'],
    },
    {
      pattern: '～たとたん',
      reading: '~ta totan',
      meaning: 'Begitu ~, Saat itu juga ~',
      explanation:
        'Menyatakan dua kejadian yang langsung berurutan tanpa jeda. Klausa kedua harus mengejutkan atau di luar dugaan.',
      examples: [
        { sentence: 'ドアを開けたとたん犬が飛び出した。', hiragana: 'ドアをあけたとたんいぬがとびだした。', meaning: 'Begitu pintu dibuka, anjing langsung melompat keluar.' },
        { sentence: '立ち上がったとたんめまいがした。', hiragana: 'たちあがったとたんめまいがした。', meaning: 'Begitu berdiri, saya merasa pusing.' },
      ],
      level: 'N2',
      tags: ['waktu', 'segera'],
    },
    {
      pattern: '～次第',
      reading: '~shidai',
      meaning: 'Segera setelah ~, Sesuai dengan ~',
      explanation:
        'Dua makna: (1) "segera setelah" untuk waktu, (2) "tergantung pada" untuk hasil. Sangat formal.',
      examples: [
        { sentence: '着き次第連絡します。', hiragana: 'つきしだいれんらくします。', meaning: 'Saya akan menghubungi segera setelah tiba.' },
        { sentence: '結果は努力次第だ。', hiragana: 'けっかはどりょくしだいだ。', meaning: 'Hasilnya tergantung pada usaha.' },
      ],
      level: 'N2',
      tags: ['waktu', 'tergantung', 'formal'],
    },
    {
      pattern: '～以来',
      reading: '~irai',
      meaning: 'Sejak ~',
      explanation:
        'Menyatakan periode waktu sejak suatu kejadian sampai sekarang. Lebih formal dari ～てから.',
      examples: [
        { sentence: '入社して以来一度も休んでいない。', hiragana: 'にゅうしゃしていらいいちどもやすんでいない。', meaning: 'Sejak masuk perusahaan, belum pernah cuti sekali pun.' },
        { sentence: '卒業以来彼に会っていない。', hiragana: 'そつぎょういらいかれにあっていない。', meaning: 'Sejak lulus, saya tidak pernah bertemu dia.' },
      ],
      level: 'N2',
      tags: ['waktu', 'durasi'],
    },
    {
      pattern: '～最中',
      reading: '~saichū',
      meaning: 'Sedang ~, Di tengah-tengah ~',
      explanation:
        'Menyatakan saat suatu aktivitas sedang berlangsung di puncaknya. Sering dipakai untuk konteks gangguan.',
      examples: [
        { sentence: '食事の最中に電話が鳴った。', hiragana: 'しょくじのさいちゅうにでんわがなった。', meaning: 'Di tengah makan, telepon berdering.' },
        { sentence: '会議の最中だから後で話そう。', hiragana: 'かいぎのさいちゅうだからあとではなそう。', meaning: 'Sedang rapat, jadi mari bicara nanti.' },
      ],
      level: 'N2',
      tags: ['waktu', 'sedang berlangsung'],
    },
    {
      pattern: '～かと思うと',
      reading: '~ka to omou to',
      meaning: 'Baru saja ~, eh ~',
      explanation:
        'Menyatakan dua kejadian yang berturut-turut dengan cepat dan tidak terduga. Mengejutkan pembicara.',
      examples: [
        { sentence: '泣いたかと思うと笑い始めた。', hiragana: 'ないたかとおもうとわらいはじめた。', meaning: 'Baru saja menangis, eh sudah tertawa.' },
        { sentence: '帰ってきたかと思うとまた出かけた。', hiragana: 'かえってきたかとおもうとまたでかけた。', meaning: 'Baru saja pulang, eh sudah keluar lagi.' },
      ],
      level: 'N2',
      tags: ['waktu', 'kejutan'],
    },
    {
      pattern: '～やら～やら',
      reading: '~yara ~yara',
      meaning: '~ dan juga ~ (campuran)',
      explanation:
        'Menyatakan daftar contoh dengan nuansa banyak/membingungkan. Sering pakai dua atau lebih hal yang bersifat mirip.',
      examples: [
        { sentence: '泣くやら笑うやら大忙しだった。', hiragana: 'なくやらわらうやらおおいそがしだった。', meaning: 'Menangis dan tertawa, sangat sibuk.' },
        { sentence: '宿題やら掃除やらでくたくただ。', hiragana: 'しゅくだいやらそうじやらでくたくただ。', meaning: 'Karena PR dan beres-beres, capek sekali.' },
      ],
      level: 'N2',
      tags: ['listing', 'banyak hal'],
    },
    {
      pattern: '～にしても～にしても',
      reading: '~ni shite mo ~ni shite mo',
      meaning: 'Baik ~ maupun ~',
      explanation:
        'Mirip ～にしろ～にしろ. Menyatakan apa pun pilihannya, hasilnya tidak berubah. Sedikit lebih halus.',
      examples: [
        { sentence: '勝つにしても負けるにしても全力を尽くす。', hiragana: 'かつにしてもまけるにしてもぜんりょくをつくす。', meaning: 'Baik menang maupun kalah, saya akan berusaha sekuat tenaga.' },
        { sentence: '行くにしても行かないにしても決めて。', hiragana: 'いくにしてもいかないにしてもきめて。', meaning: 'Apakah akan pergi atau tidak, putuskan.' },
      ],
      level: 'N2',
      tags: ['listing', 'pilihan'],
    },
    {
      pattern: '～や否や',
      reading: '~ya ina ya',
      meaning: 'Begitu ~, langsung ~',
      explanation:
        'Sangat formal dan literal. Menyatakan dua aksi yang terjadi hampir bersamaan. Sering dipakai dalam tulisan.',
      examples: [
        { sentence: '彼は家を出るや否や走り出した。', hiragana: 'かれはいえをでるやいなやはしりだした。', meaning: 'Begitu keluar rumah, dia langsung berlari.' },
        { sentence: '電車に乗るや否や寝てしまった。', hiragana: 'でんしゃにのるやいなやねてしまった。', meaning: 'Begitu naik kereta, langsung tertidur.' },
      ],
      level: 'N2',
      tags: ['waktu', 'segera', 'sastra'],
    },
    {
      pattern: '～に限って',
      reading: '~ni kagitte',
      meaning: 'Khususnya ~, Justru ~',
      explanation:
        'Menyatakan bahwa pada saat tertentu (yang spesifik), justru terjadi sesuatu yang tidak diinginkan/terduga.',
      examples: [
        { sentence: '急いでいる時に限って電車が遅れる。', hiragana: 'いそいでいるときにかぎってでんしゃがおくれる。', meaning: 'Justru saat sedang terburu-buru, kereta terlambat.' },
        { sentence: '彼に限ってそんなことはしない。', hiragana: 'かれにかぎってそんなことはしない。', meaning: 'Khususnya dia, tidak akan melakukan hal seperti itu.' },
      ],
      level: 'N2',
      tags: ['limitasi', 'pengecualian'],
    },
    {
      pattern: '～に限り',
      reading: '~ni kagiri',
      meaning: 'Hanya ~, Khusus ~',
      explanation:
        'Menyatakan batasan ketat. "Khusus untuk ini saja". Sering dipakai dalam iklan/promosi.',
      examples: [
        { sentence: '本日に限り全品半額です。', hiragana: 'ほんじつにかぎりぜんぴんはんがくです。', meaning: 'Khusus hari ini, semua barang setengah harga.' },
        { sentence: '会員に限り入場無料です。', hiragana: 'かいいんにかぎりにゅうじょうむりょうです。', meaning: 'Khusus member, masuk gratis.' },
      ],
      level: 'N2',
      tags: ['limitasi', 'eksklusif'],
    },
    {
      pattern: '～ことなしに',
      reading: '~koto nashi ni',
      meaning: 'Tanpa ~, ~ tidak akan ~',
      explanation:
        'Menyatakan kondisi negatif: tanpa melakukan A, B tidak akan tercapai. Pola formal.',
      examples: [
        { sentence: '努力することなしに成功はない。', hiragana: 'どりょくすることなしにせいこうはない。', meaning: 'Tanpa berusaha, tidak ada keberhasilan.' },
        { sentence: '練習することなしに上達しない。', hiragana: 'れんしゅうすることなしにじょうたつしない。', meaning: 'Tanpa berlatih, tidak akan menjadi mahir.' },
      ],
      level: 'N2',
      tags: ['kondisional', 'negatif', 'formal'],
    },
    {
      pattern: '～ざるを得ない',
      reading: '~zaru wo enai',
      meaning: 'Mau tidak mau harus ~, Terpaksa ~',
      explanation:
        'Menyatakan keterpaksaan formal. Tidak ada pilihan lain. Pola lampau yang sering dipakai di tulisan resmi.',
      examples: [
        { sentence: '台風で旅行を中止せざるを得ない。', hiragana: 'たいふうでりょこうをちゅうしせざるをえない。', meaning: 'Karena topan, mau tidak mau perjalanan dibatalkan.' },
        { sentence: '事実を認めざるを得ない。', hiragana: 'じじつをみとめざるをえない。', meaning: 'Terpaksa harus mengakui faktanya.' },
      ],
      level: 'N2',
      tags: ['kewajiban', 'terpaksa', 'formal'],
    },
    {
      pattern: '～ずにはいられない',
      reading: '~zu ni wa irarenai',
      meaning: 'Tidak bisa tidak ~',
      explanation:
        'Menyatakan dorongan kuat yang tidak bisa ditahan. Bersifat emosional/impulsif.',
      examples: [
        { sentence: 'その話を聞いて笑わずにはいられなかった。', hiragana: 'そのはなしをきいてわらわずにはいられなかった。', meaning: 'Mendengar cerita itu, tidak bisa tidak tertawa.' },
        { sentence: '困っている人を助けずにはいられない。', hiragana: 'こまっているひとをたすけずにはいられない。', meaning: 'Tidak bisa tidak membantu orang yang kesulitan.' },
      ],
      level: 'N2',
      tags: ['emosi', 'tidak tertahan'],
    },
    {
      pattern: '～てはならない',
      reading: '~te wa naranai',
      meaning: 'Tidak boleh ~',
      explanation:
        'Larangan formal yang absolut. Lebih kuat dari ～てはいけない. Sering dipakai dalam aturan atau hukum.',
      examples: [
        { sentence: '嘘をついてはならない。', hiragana: 'うそをついてはならない。', meaning: 'Tidak boleh berbohong.' },
        { sentence: 'ここに立ち入ってはならない。', hiragana: 'ここにたちいってはならない。', meaning: 'Tidak boleh masuk ke sini.' },
      ],
      level: 'N2',
      tags: ['larangan', 'formal'],
    },
    {
      pattern: '～にとって',
      reading: '~ni totte',
      meaning: 'Bagi ~, Untuk ~',
      explanation:
        'Menyatakan sudut pandang seseorang/sesuatu. "Dari perspektif ~".',
      examples: [
        { sentence: '私にとって家族は一番大切だ。', hiragana: 'わたしにとってかぞくはいちばんたいせつだ。', meaning: 'Bagi saya, keluarga adalah yang paling penting.' },
        { sentence: '彼にとって日本語は難しい。', hiragana: 'かれにとってにほんごはむずかしい。', meaning: 'Bagi dia, bahasa Jepang itu sulit.' },
      ],
      level: 'N2',
      tags: ['sudut pandang'],
    },
    {
      pattern: '～において',
      reading: '~ni oite',
      meaning: 'Di ~, Pada ~, Dalam hal ~',
      explanation:
        'Versi formal dari ～で untuk tempat, waktu, atau bidang. Sering dipakai di tulisan resmi/akademik.',
      examples: [
        { sentence: '会議は東京において行われる。', hiragana: 'かいぎはとうきょうにおいておこなわれる。', meaning: 'Rapat akan diadakan di Tokyo.' },
        { sentence: 'スポーツにおいて彼は一流だ。', hiragana: 'スポーツにおいてかれはいちりゅうだ。', meaning: 'Dalam hal olahraga, dia kelas atas.' },
      ],
      level: 'N2',
      tags: ['lokasi', 'formal'],
    },
    {
      pattern: '～にあたって',
      reading: '~ni atatte',
      meaning: 'Pada saat ~, Menyambut ~',
      explanation:
        'Formal. Menyatakan momen khusus saat melakukan sesuatu yang penting. Sering untuk acara/keputusan besar.',
      examples: [
        { sentence: '入学にあたって挨拶をする。', hiragana: 'にゅうがくにあたってあいさつをする。', meaning: 'Pada saat masuk sekolah, saya memberi sambutan.' },
        { sentence: '出発にあたって注意事項を確認する。', hiragana: 'しゅっぱつにあたってちゅういじこうをかくにんする。', meaning: 'Menjelang keberangkatan, mengecek hal-hal penting.' },
      ],
      level: 'N2',
      tags: ['momen', 'formal'],
    },
    {
      pattern: '～に際して',
      reading: '~ni saishite',
      meaning: 'Pada kesempatan ~, Pada momen ~',
      explanation:
        'Sangat formal. Mirip ～にあたって. Sering di pidato/dokumen resmi untuk momen penting.',
      examples: [
        { sentence: 'ご結婚に際して心からお祝い申し上げます。', hiragana: 'ごけっこんにさいしてこころからおいわいもうしあげます。', meaning: 'Pada momen pernikahan, saya mengucapkan selamat dengan tulus.' },
        { sentence: '退職に際して一言申し上げます。', hiragana: 'たいしょくにさいしてひとこともうしあげます。', meaning: 'Pada momen pensiun, saya ingin menyampaikan satu hal.' },
      ],
      level: 'N2',
      tags: ['momen', 'sangat formal'],
    },
    {
      pattern: '～どころか',
      reading: '~dokoro ka',
      meaning: 'Apalagi ~, Jauh dari ~',
      explanation:
        'Menyatakan kontras kuat: bukan hanya tidak A, malah B. Sering untuk negasi kuat.',
      examples: [
        { sentence: '上手どころか下手だ。', hiragana: 'じょうずどころかへただ。', meaning: 'Jauh dari mahir, malah jelek.' },
        { sentence: '休むどころか働きづめだ。', hiragana: 'やすむどころかはたらきづめだ。', meaning: 'Jauh dari istirahat, malah kerja terus.' },
      ],
      level: 'N2',
      tags: ['kontras', 'negasi kuat'],
    },
    {
      pattern: '～からこそ',
      reading: '~kara koso',
      meaning: 'Justru karena ~',
      explanation:
        'Menekankan sebab khusus. "Justru karena inilah, itu terjadi/begitu". Bermakna positif/penegasan.',
      examples: [
        { sentence: '愛しているからこそ厳しくする。', hiragana: 'あいしているからこそきびしくする。', meaning: 'Justru karena mencintai, saya tegas.' },
        { sentence: '友達だからこそ言うんだ。', hiragana: 'ともだちだからこそいうんだ。', meaning: 'Justru karena teman, saya katakan ini.' },
      ],
      level: 'N2',
      tags: ['sebab', 'penekanan'],
    },
    {
      pattern: '～ばこそ',
      reading: '~ba koso',
      meaning: 'Justru karena ~ (formal)',
      explanation:
        'Versi formal/literal dari ～からこそ. Sering di tulisan/pidato.',
      examples: [
        { sentence: '健康であればこそ仕事ができる。', hiragana: 'けんこうであればこそしごとができる。', meaning: 'Justru karena sehat, bisa bekerja.' },
        { sentence: '努力したればこそ成功した。', hiragana: 'どりょくしたればこそせいこうした。', meaning: 'Justru karena berusaha, jadi berhasil.' },
      ],
      level: 'N2',
      tags: ['sebab', 'formal'],
    },
    {
      pattern: '～にしても',
      reading: '~ni shite mo',
      meaning: 'Meskipun ~, Bahkan jika ~',
      explanation:
        'Menyatakan kontras dengan dugaan ringan. "Meski begitu, hasilnya begini".',
      examples: [
        { sentence: '忙しいにしても電話くらいはできる。', hiragana: 'いそがしいにしてもでんわくらいはできる。', meaning: 'Meski sibuk, paling tidak bisa menelepon.' },
        { sentence: '冗談にしても言いすぎだ。', hiragana: 'じょうだんにしてもいいすぎだ。', meaning: 'Meskipun bercanda, itu terlalu berlebihan.' },
      ],
      level: 'N2',
      tags: ['kontras'],
    },
    {
      pattern: '～にもまして',
      reading: '~ni mo mashite',
      meaning: 'Lebih dari ~',
      explanation:
        'Menyatakan tingkat yang melampaui sesuatu. "Bahkan lebih dari ~". Untuk perbandingan formal.',
      examples: [
        { sentence: '今年は去年にもまして暑い。', hiragana: 'ことしはきょねんにもましてあつい。', meaning: 'Tahun ini lebih panas dari tahun lalu.' },
        { sentence: '何にもまして健康が大事だ。', hiragana: 'なににもましてけんこうがだいじだ。', meaning: 'Lebih dari apa pun, kesehatan itu penting.' },
      ],
      level: 'N2',
      tags: ['perbandingan'],
    },
    {
      pattern: '～にほかならない',
      reading: '~ni hoka naranai',
      meaning: 'Tak lain adalah ~',
      explanation:
        'Penegasan kuat bahwa sesuatu adalah X dan bukan yang lain. Formal.',
      examples: [
        { sentence: '成功は努力の結果にほかならない。', hiragana: 'せいこうはどりょくのけっかにほかならない。', meaning: 'Sukses tak lain adalah hasil dari usaha.' },
        { sentence: 'これは奇跡にほかならない。', hiragana: 'これはきせきにほかならない。', meaning: 'Ini tak lain adalah keajaiban.' },
      ],
      level: 'N2',
      tags: ['penegasan', 'formal'],
    },
    {
      pattern: '～に違いない',
      reading: '~ni chigai nai',
      meaning: 'Pasti ~, Tak diragukan ~',
      explanation:
        'Menyatakan kepastian dengan kuat berdasarkan bukti/intuisi. Lebih kuat dari ～はずだ.',
      examples: [
        { sentence: '彼は来るに違いない。', hiragana: 'かれはくるにちがいない。', meaning: 'Dia pasti datang.' },
        { sentence: 'これは本物に違いない。', hiragana: 'これはほんものにちがいない。', meaning: 'Ini pasti asli.' },
      ],
      level: 'N2',
      tags: ['kepastian'],
    },
    {
      pattern: '～かねない',
      reading: '~kanenai',
      meaning: 'Bisa saja ~, Tidak menutup kemungkinan ~',
      explanation:
        'Menyatakan kemungkinan terjadinya hal negatif. Pola peringatan/kekhawatiran.',
      examples: [
        { sentence: 'そんなことをしたら怪我しかねない。', hiragana: 'そんなことをしたらけがしかねない。', meaning: 'Kalau begitu, bisa saja terluka.' },
        { sentence: '彼ならそう言いかねない。', hiragana: 'かれならそういいかねない。', meaning: 'Kalau dia, bisa saja mengatakan itu.' },
      ],
      level: 'N2',
      tags: ['kemungkinan', 'kekhawatiran'],
    },
    {
      pattern: '～かねる',
      reading: '~kaneru',
      meaning: 'Sulit ~, Tidak bisa ~ (sopan)',
      explanation:
        'Sopan dan tidak langsung menolak. Berbeda dari ～ない karena ada nuansa "ingin tapi sulit".',
      examples: [
        { sentence: 'そのご依頼はお引き受けしかねます。', hiragana: 'そのごいらいはおひきうけしかねます。', meaning: 'Maaf, permintaan tersebut sulit kami terima.' },
        { sentence: '何とも言いかねます。', hiragana: 'なんともいいかねます。', meaning: 'Tidak bisa berkata apa-apa.' },
      ],
      level: 'N2',
      tags: ['penolakan sopan', 'formal'],
    },
    {
      pattern: '～ものか',
      reading: '~mono ka',
      meaning: 'Mana mungkin ~, Tidak akan ~',
      explanation:
        'Menyatakan penyangkalan kuat secara emosional. Bisa sangat informal/casual.',
      examples: [
        { sentence: 'そんなこと信じるものか。', hiragana: 'そんなことしんじるものか。', meaning: 'Mana mungkin saya percaya hal seperti itu.' },
        { sentence: '二度と来るものか。', hiragana: 'にどとくるものか。', meaning: 'Tidak akan pernah datang lagi.' },
      ],
      level: 'N2',
      tags: ['penyangkalan', 'emosional'],
    },
    {
      pattern: '～ないことはない',
      reading: '~nai koto wa nai',
      meaning: 'Bukan berarti tidak ~',
      explanation:
        'Penyangkalan ganda yang melunakkan penolakan. "Tidak juga tidak ~". Sopan dan tidak tegas.',
      examples: [
        { sentence: '辛い物が食べられないことはない。', hiragana: 'からいものがたべられないことはない。', meaning: 'Bukan berarti tidak bisa makan pedas.' },
        { sentence: '行けないことはないが、忙しい。', hiragana: 'いけないことはないが、いそがしい。', meaning: 'Bukannya tidak bisa pergi, tapi sibuk.' },
      ],
      level: 'N2',
      tags: ['penyangkalan ganda', 'lunak'],
    },
    {
      pattern: '～どころではない',
      reading: '~dokoro de wa nai',
      meaning: 'Bukan saatnya ~, Jangankan ~',
      explanation:
        'Menyatakan bahwa situasi tidak memungkinkan untuk melakukan sesuatu. Lebih kuat dari ～どころか.',
      examples: [
        { sentence: '忙しくて旅行どころではない。', hiragana: 'いそがしくてりょこうどころではない。', meaning: 'Sibuk, bukan saatnya bepergian.' },
        { sentence: '勉強どころではなかった。', hiragana: 'べんきょうどころではなかった。', meaning: 'Saat itu jangankan belajar.' },
      ],
      level: 'N2',
      tags: ['situasi tidak memungkinkan'],
    },
    {
      pattern: '～た上で',
      reading: '~ta ue de',
      meaning: 'Setelah ~, Berdasarkan ~',
      explanation:
        'Menyatakan urutan: setelah melakukan A dengan sungguh-sungguh, baru lakukan B. Formal.',
      examples: [
        { sentence: 'よく考えた上で決めます。', hiragana: 'よくかんがえたうえできめます。', meaning: 'Setelah dipikirkan baik-baik, akan diputuskan.' },
        { sentence: '相談した上でお返事します。', hiragana: 'そうだんしたうえでおへんじします。', meaning: 'Setelah berdiskusi, saya akan menjawab.' },
      ],
      level: 'N2',
      tags: ['urutan', 'pertimbangan'],
    },
    {
      pattern: '～次第で',
      reading: '~shidai de',
      meaning: 'Tergantung pada ~',
      explanation:
        'Menyatakan bahwa hasil tergantung pada sesuatu yang spesifik. Formal.',
      examples: [
        { sentence: '結果は天気次第で決まる。', hiragana: 'けっかはてんきしだいできまる。', meaning: 'Hasil tergantung pada cuaca.' },
        { sentence: '使い方次第で便利になる。', hiragana: 'つかいかたしだいでべんりになる。', meaning: 'Tergantung cara pakainya, bisa jadi praktis.' },
      ],
      level: 'N2',
      tags: ['tergantung'],
    },
    {
      pattern: '～うえに',
      reading: '~ue ni',
      meaning: 'Tidak hanya ~, Selain itu ~',
      explanation:
        'Menyatakan tambahan informasi yang searah (sama-sama positif atau negatif).',
      examples: [
        { sentence: 'この店は安いうえにおいしい。', hiragana: 'このみせはやすいうえにおいしい。', meaning: 'Restoran ini tidak hanya murah, juga enak.' },
        { sentence: '雨が降っているうえに風も強い。', hiragana: 'あめがふっているうえにかぜもつよい。', meaning: 'Selain hujan, anginnya juga kencang.' },
      ],
      level: 'N2',
      tags: ['tambahan', 'paralel'],
    },
    {
      pattern: '～に応じて',
      reading: '~ni ōjite',
      meaning: 'Sesuai dengan ~',
      explanation:
        'Menyatakan penyesuaian terhadap situasi/kondisi. Formal dan fleksibel.',
      examples: [
        { sentence: '収入に応じて税金が変わる。', hiragana: 'しゅうにゅうにおうじてぜいきんがかわる。', meaning: 'Pajak berubah sesuai pendapatan.' },
        { sentence: '状況に応じて対応する。', hiragana: 'じょうきょうにおうじてたいおうする。', meaning: 'Menanggapi sesuai situasi.' },
      ],
      level: 'N2',
      tags: ['penyesuaian', 'formal'],
    },
  ],
}
