import type { LevelData } from './types'

export const n1Data: LevelData = {
  level: 'N1',
  name: 'Mahir',
  subtitle: 'Penguasaan Tingkat Mahir',
  bgKanji: '極',
  accentColor: 'var(--red)',
  accentBg: 'var(--red-bg)',

  // Kanji + vocab N1 di-fetch dari database (Supabase)
  kanji: [],
  vocab: [],

  // ─── 30 POLA TATA BAHASA N1 ─────────────────────────────────────────────
  grammar: [
    {
      pattern: '～べからず',
      reading: '~bekarazu',
      meaning: 'Tidak boleh ~ (klasik/formal)',
      explanation:
        'Larangan sangat formal dan klasik. Sering ditemukan di papan pengumuman, peraturan, atau tulisan kuno. Setara dengan ～てはいけない modern.',
      examples: [
        { sentence: 'ここで写真を撮るべからず。', hiragana: 'ここでしゃしんをとるべからず。', meaning: 'Dilarang mengambil foto di sini.' },
        { sentence: '芝生に入るべからず。', hiragana: 'しばふにはいるべからず。', meaning: 'Dilarang masuk ke rumput.' },
      ],
      level: 'N1',
      tags: ['larangan', 'klasik', 'formal'],
    },
    {
      pattern: '～べくもない',
      reading: '~beku mo nai',
      meaning: 'Mustahil ~, Tidak mungkin ~',
      explanation:
        'Menyatakan ketidakmungkinan absolut. Sangat formal/sastra. Sering dipakai dalam tulisan akademis atau berita.',
      examples: [
        { sentence: '勝利は望むべくもなかった。', hiragana: 'しょうりはのぞむべくもなかった。', meaning: 'Kemenangan mustahil untuk diharapkan.' },
        { sentence: '真実を知るべくもない。', hiragana: 'しんじつをしるべくもない。', meaning: 'Tidak mungkin mengetahui kebenarannya.' },
      ],
      level: 'N1',
      tags: ['ketidakmungkinan', 'sastra'],
    },
    {
      pattern: '～まじき',
      reading: '~majiki',
      meaning: 'Tidak pantas ~, Tidak boleh ~',
      explanation:
        'Menyatakan ketidakpantasan moral/etika. Klasik, sering untuk profesi atau status tertentu.',
      examples: [
        { sentence: '教師にあるまじき行為だ。', hiragana: 'きょうしにあるまじきこうこういだ。', meaning: 'Perilaku yang tidak pantas dilakukan seorang guru.' },
        { sentence: '武士にあるまじき振る舞いだ。', hiragana: 'ぶしにあるまじきふるまいだ。', meaning: 'Tingkah yang tidak pantas bagi seorang samurai.' },
      ],
      level: 'N1',
      tags: ['moral', 'klasik'],
    },
    {
      pattern: '～んがため',
      reading: '~n ga tame',
      meaning: 'Demi ~, Agar ~',
      explanation:
        'Versi klasik dari ～ために. Menyatakan tujuan dengan formal/literatur. Sering dipakai dalam pidato/tulisan resmi.',
      examples: [
        { sentence: '夢を実現せんがため努力する。', hiragana: 'ゆめをじつげんせんがためどりょくする。', meaning: 'Berusaha demi mewujudkan mimpi.' },
        { sentence: '勝たんがため練習を重ねる。', hiragana: 'かたんがためれんしゅうをかさねる。', meaning: 'Berlatih demi menang.' },
      ],
      level: 'N1',
      tags: ['tujuan', 'klasik'],
    },
    {
      pattern: '～や否や',
      reading: '~ya ina ya',
      meaning: 'Begitu ~, langsung ~',
      explanation:
        'Klasik dan sangat literal. Dua aksi yang terjadi hampir bersamaan tanpa jeda.',
      examples: [
        { sentence: '彼は家に着くや否や倒れた。', hiragana: 'かれはいえにつくやいなやたおれた。', meaning: 'Begitu sampai rumah, dia langsung jatuh.' },
        { sentence: 'ベルが鳴るや否や生徒は走り出した。', hiragana: 'ベルがなるやいなやせいとははしりだした。', meaning: 'Begitu bel berbunyi, murid langsung lari.' },
      ],
      level: 'N1',
      tags: ['waktu', 'segera', 'sastra'],
    },
    {
      pattern: '～が早いか',
      reading: '~ga hayai ka',
      meaning: 'Tepat saat ~, langsung ~',
      explanation:
        'Menyatakan dua aksi berurutan yang sangat cepat. Mirip ～や否や tapi lebih lazim di percakapan formal.',
      examples: [
        { sentence: '彼は座るが早いか食べ始めた。', hiragana: 'かれはすわるがはやいかたべはじめた。', meaning: 'Begitu duduk, dia langsung mulai makan.' },
        { sentence: '電車のドアが開くが早いか飛び乗った。', hiragana: 'でんしゃのドアがあくがはやいかとびのった。', meaning: 'Begitu pintu kereta terbuka, langsung melompat masuk.' },
      ],
      level: 'N1',
      tags: ['waktu', 'segera'],
    },
    {
      pattern: '～ものを',
      reading: '~mono wo',
      meaning: 'Padahal ~ sebenarnya bisa ~',
      explanation:
        'Menyatakan penyesalan atas hasil yang seharusnya bisa berbeda. "Sebenarnya ~ tapi malah ~". Emosional.',
      examples: [
        { sentence: '言ってくれれば手伝ったものを。', hiragana: 'いってくれればてつだったものを。', meaning: 'Padahal kalau bilang, saya akan bantu.' },
        { sentence: '早く来ればよかったものを。', hiragana: 'はやくくればよかったものを。', meaning: 'Padahal lebih baik datang lebih awal.' },
      ],
      level: 'N1',
      tags: ['penyesalan', 'kontras'],
    },
    {
      pattern: '～たるもの',
      reading: '~taru mono',
      meaning: 'Sebagai seorang ~',
      explanation:
        'Klasik. Menekankan tanggung jawab atau ekspektasi seseorang berdasarkan posisi/status.',
      examples: [
        { sentence: '医者たるもの患者を第一に考えるべきだ。', hiragana: 'いしゃたるものかんじゃをだいいちにかんがえるべきだ。', meaning: 'Sebagai dokter, harus mengutamakan pasien.' },
        { sentence: 'リーダーたるもの責任を持つべきだ。', hiragana: 'リーダーたるものせきにんをもつべきだ。', meaning: 'Sebagai pemimpin, harus bertanggung jawab.' },
      ],
      level: 'N1',
      tags: ['status', 'tanggung jawab', 'klasik'],
    },
    {
      pattern: '～ともあろう',
      reading: '~to mo arō',
      meaning: 'Selevel ~ seharusnya tidak ~',
      explanation:
        'Menyatakan keterkejutan/kecaman bahwa orang dengan status tinggi malah melakukan hal di luar dugaan (biasanya negatif).',
      examples: [
        { sentence: '政治家ともあろう人がそんなことを言うとは。', hiragana: 'せいじかともあろうひとがそんなことをいうとは。', meaning: 'Selevel politikus malah mengatakan hal seperti itu.' },
        { sentence: '社長ともあろう人が遅刻するなんて。', hiragana: 'しゃちょうともあろうひとがちこくするなんて。', meaning: 'Setingkat direktur malah terlambat.' },
      ],
      level: 'N1',
      tags: ['kecaman', 'status'],
    },
    {
      pattern: '～と言えども',
      reading: '~to iedomo',
      meaning: 'Meskipun ~, Walau ~',
      explanation:
        'Klasik dan sangat formal. Mirip ～でも tapi lebih literatur. Sering di pidato/dokumen.',
      examples: [
        { sentence: '子供と言えども油断はできない。', hiragana: 'こどもといえどもゆだんはできない。', meaning: 'Meskipun anak-anak, tidak boleh lengah.' },
        { sentence: '専門家と言えども間違うことがある。', hiragana: 'せんもんかといえどもまちがうことがある。', meaning: 'Walaupun pakar, kadang bisa salah.' },
      ],
      level: 'N1',
      tags: ['kontras', 'klasik'],
    },
    {
      pattern: '～を余儀なくされる',
      reading: '~wo yogi naku sareru',
      meaning: 'Terpaksa ~ (tanpa pilihan)',
      explanation:
        'Sangat formal. Menyatakan situasi yang memaksa seseorang tanpa pilihan. Sering di berita atau dokumen.',
      examples: [
        { sentence: '台風で旅行の中止を余儀なくされた。', hiragana: 'たいふうでりょこうのちゅうしをよぎなくされた。', meaning: 'Karena topan, terpaksa membatalkan perjalanan.' },
        { sentence: '健康上の理由で退職を余儀なくされた。', hiragana: 'けんこうじょうのりゆうでたいしょくをよぎなくされた。', meaning: 'Terpaksa pensiun karena alasan kesehatan.' },
      ],
      level: 'N1',
      tags: ['keterpaksaan', 'formal'],
    },
    {
      pattern: '～を禁じ得ない',
      reading: '~wo kinji enai',
      meaning: 'Tidak bisa menahan ~',
      explanation:
        'Formal/sastra. Menyatakan emosi yang tidak bisa ditahan. Mirip ～ずにはいられない tapi lebih formal.',
      examples: [
        { sentence: '彼の話を聞いて涙を禁じ得なかった。', hiragana: 'かれのはなしをきいてなみだをきんじえなかった。', meaning: 'Mendengar ceritanya, tidak bisa menahan air mata.' },
        { sentence: '怒りを禁じ得ない事件だ。', hiragana: 'いかりをきんじえないじけんだ。', meaning: 'Insiden yang tidak bisa menahan kemarahan.' },
      ],
      level: 'N1',
      tags: ['emosi', 'sastra'],
    },
    {
      pattern: '～極まりない',
      reading: '~kiwamari nai',
      meaning: 'Sangat sekali ~ (ekstrem)',
      explanation:
        'Menyatakan tingkat ekstrim, biasanya untuk hal negatif. Sangat formal/sastra.',
      examples: [
        { sentence: '危険極まりない行為だ。', hiragana: 'きけんきわまりないこういだ。', meaning: 'Perbuatan yang sangat berbahaya.' },
        { sentence: '失礼極まりない態度だ。', hiragana: 'しつれいきわまりないたいどだ。', meaning: 'Sikap yang sangat tidak sopan.' },
      ],
      level: 'N1',
      tags: ['intensitas', 'ekstrim'],
    },
    {
      pattern: '～の至り',
      reading: '~no itari',
      meaning: 'Puncak dari ~, Sangat ~',
      explanation:
        'Sangat formal. Menyatakan kondisi/perasaan di puncak. Sering di pidato/surat formal.',
      examples: [
        { sentence: '光栄の至りでございます。', hiragana: 'こうえいのいたりでございます。', meaning: 'Sangat terhormat sekali.' },
        { sentence: '感激の至りです。', hiragana: 'かんげきのいたりです。', meaning: 'Sangat tersanjung.' },
      ],
      level: 'N1',
      tags: ['puncak', 'sangat formal'],
    },
    {
      pattern: '～かたわら',
      reading: '~katawara',
      meaning: 'Sambil ~, Selain ~',
      explanation:
        'Menyatakan dua aktivitas paralel yang dijalani satu orang. Lebih formal dari ～ながら.',
      examples: [
        { sentence: '会社員のかたわら小説を書いている。', hiragana: 'かいしゃいんのかたわらしょうせつをかいている。', meaning: 'Sambil bekerja kantoran, menulis novel.' },
        { sentence: '教師のかたわら研究を続ける。', hiragana: 'きょうしのかたわらけんきゅうをつづける。', meaning: 'Sambil mengajar, melanjutkan riset.' },
      ],
      level: 'N1',
      tags: ['paralel', 'aktivitas'],
    },
    {
      pattern: '～にたえる/たえない',
      reading: '~ni taeru / taenai',
      meaning: 'Layak ~ / Tidak tahan ~',
      explanation:
        'Dua makna tergantung konteks: ～にたえる (layak untuk), ～にたえない (tidak tahan/tidak layak). Formal.',
      examples: [
        { sentence: 'この映画は鑑賞にたえる作品だ。', hiragana: 'このえいがはかんしょうにたえるさくひんだ。', meaning: 'Film ini layak untuk ditonton.' },
        { sentence: 'あまりにひどくて見るにたえない。', hiragana: 'あまりにひどくてみるにたえない。', meaning: 'Terlalu buruk, tidak tahan untuk dilihat.' },
      ],
      level: 'N1',
      tags: ['kelayakan', 'formal'],
    },
    {
      pattern: '～にあって',
      reading: '~ni atte',
      meaning: 'Di tengah ~, Dalam situasi ~',
      explanation:
        'Sangat formal. Mirip ～において tapi lebih dramatis. Sering untuk konteks situasi krusial.',
      examples: [
        { sentence: '危機にあっても冷静さを保つ。', hiragana: 'ききにあってもれいせいさをたもつ。', meaning: 'Tetap tenang di tengah krisis.' },
        { sentence: 'この時代にあって貴重な存在だ。', hiragana: 'このじだいにあってきちょうなそんざいだ。', meaning: 'Sosok yang berharga di era ini.' },
      ],
      level: 'N1',
      tags: ['situasi', 'sangat formal'],
    },
    {
      pattern: '～たりとも',
      reading: '~taritomo',
      meaning: 'Bahkan satu ~ pun tidak ~',
      explanation:
        'Penegasan negasi. "Bahkan satu pun (jumlah kecil) tidak akan ditolerir". Sering setelah angka 1.',
      examples: [
        { sentence: '一秒たりとも無駄にしない。', hiragana: 'いちびょうたりともむだにしない。', meaning: 'Tidak akan menyia-nyiakan walau sedetik pun.' },
        { sentence: '一円たりとも貸さない。', hiragana: 'いちえんたりともかさない。', meaning: 'Tidak akan meminjamkan walau satu yen pun.' },
      ],
      level: 'N1',
      tags: ['penegasan', 'negasi'],
    },
    {
      pattern: '～あっての',
      reading: '~atte no',
      meaning: 'Karena ada ~, ~ tergantung pada',
      explanation:
        'Menyatakan ketergantungan: A ada karena B. Tanpa B, A tidak ada.',
      examples: [
        { sentence: 'お客様あっての商売です。', hiragana: 'おきゃくさまあってのしょうばいです。', meaning: 'Bisnis ini ada karena pelanggan.' },
        { sentence: '健康あっての人生だ。', hiragana: 'けんこうあってのじんせいだ。', meaning: 'Hidup yang berarti karena ada kesehatan.' },
      ],
      level: 'N1',
      tags: ['ketergantungan'],
    },
    {
      pattern: '～ともなれば',
      reading: '~to mo nareba',
      meaning: 'Begitu jadi ~, Pada saat menjadi ~',
      explanation:
        'Menyatakan situasi yang berubah ketika mencapai tingkat tertentu. Sering untuk perubahan status.',
      examples: [
        { sentence: '社長ともなれば責任も重い。', hiragana: 'しゃちょうともなればせきにんもおもい。', meaning: 'Begitu jadi direktur, tanggung jawabnya pun berat.' },
        { sentence: '冬ともなれば雪が降る。', hiragana: 'ふゆともなればゆきがふる。', meaning: 'Begitu memasuki musim dingin, salju turun.' },
      ],
      level: 'N1',
      tags: ['perubahan status'],
    },
    {
      pattern: '～と相まって',
      reading: '~to aimatte',
      meaning: 'Berkombinasi dengan ~',
      explanation:
        'Sangat formal. Menyatakan kombinasi dua faktor yang menghasilkan efek lebih besar.',
      examples: [
        { sentence: '才能と努力が相まって成功した。', hiragana: 'さいのうとどりょくがあいまってせいこうした。', meaning: 'Berkombinasi antara bakat dan usaha, dia sukses.' },
        { sentence: '景色は天気と相まって素晴らしい。', hiragana: 'けしきはてんきとあいまってすばらしい。', meaning: 'Pemandangan berkombinasi dengan cuaca, sangat indah.' },
      ],
      level: 'N1',
      tags: ['kombinasi', 'formal'],
    },
    {
      pattern: '～と思いきや',
      reading: '~to omoi kiya',
      meaning: 'Saya pikir ~, ternyata ~',
      explanation:
        'Menyatakan keterkejutan saat dugaan berbeda dengan kenyataan. Sastra/casual literal.',
      examples: [
        { sentence: '簡単だと思いきや、難しかった。', hiragana: 'かんたんだとおもいきや、むずかしかった。', meaning: 'Saya pikir mudah, ternyata sulit.' },
        { sentence: '雨が降ると思いきや、晴れた。', hiragana: 'あめがふるとおもいきや、はれた。', meaning: 'Saya pikir akan hujan, ternyata cerah.' },
      ],
      level: 'N1',
      tags: ['kejutan', 'kontras'],
    },
    {
      pattern: '～にひきかえ',
      reading: '~ni hikikae',
      meaning: 'Berbeda dengan ~, Sebaliknya dari ~',
      explanation:
        'Menyatakan kontras kuat antara dua hal. Lebih formal dari ～に対して.',
      examples: [
        { sentence: '兄にひきかえ弟は静かだ。', hiragana: 'あににひきかえおとうとはしずかだ。', meaning: 'Berbeda dengan kakaknya, adiknya tenang.' },
        { sentence: '去年にひきかえ今年は忙しい。', hiragana: 'きょねんにひきかえことしはいそがしい。', meaning: 'Berbeda dari tahun lalu, tahun ini sibuk.' },
      ],
      level: 'N1',
      tags: ['kontras', 'formal'],
    },
    {
      pattern: '～にして',
      reading: '~ni shite',
      meaning: 'Setingkat ~ pun ~, Baru ~',
      explanation:
        'Klasik. Menekankan bahwa bahkan seseorang/sesuatu yang setingkat itu pun ~. Atau "baru pada ~".',
      examples: [
        { sentence: '天才にして努力家だ。', hiragana: 'てんさいにしてどりょくかだ。', meaning: 'Selain jenius, juga pekerja keras.' },
        { sentence: '七十歳にしてマラソンに挑戦する。', hiragana: 'ななじゅっさいにしてマラソンにちょうせんする。', meaning: 'Pada usia 70 tahun, baru mencoba maraton.' },
      ],
      level: 'N1',
      tags: ['status', 'klasik'],
    },
    {
      pattern: '～につけ',
      reading: '~ni tsuke',
      meaning: 'Setiap kali ~, Setiap melihat ~',
      explanation:
        'Klasik. Menyatakan respon emosional setiap kali sesuatu terjadi.',
      examples: [
        { sentence: 'この写真を見るにつけ思い出す。', hiragana: 'このしゃしんをみるにつけおもいだす。', meaning: 'Setiap melihat foto ini, jadi teringat.' },
        { sentence: '何かにつけて文句を言う。', hiragana: 'なにかにつけてもんくをいう。', meaning: 'Setiap kesempatan, mengeluh.' },
      ],
      level: 'N1',
      tags: ['kebiasaan', 'klasik'],
    },
    {
      pattern: '～ながらに',
      reading: '~nagara ni',
      meaning: 'Sambil ~, Sejak ~',
      explanation:
        'Klasik. Dua makna: (1) sambil melakukan sesuatu, (2) sejak lahir/awal. Formal.',
      examples: [
        { sentence: '生まれながらに才能がある。', hiragana: 'うまれながらにさいのうがある。', meaning: 'Berbakat sejak lahir.' },
        { sentence: '涙ながらに語った。', hiragana: 'なみだながらにかたった。', meaning: 'Bercerita sambil meneteskan air mata.' },
      ],
      level: 'N1',
      tags: ['paralel', 'klasik'],
    },
    {
      pattern: '～ともなしに',
      reading: '~to mo nashi ni',
      meaning: 'Tanpa sengaja ~, Begitu saja ~',
      explanation:
        'Klasik. Menyatakan tindakan tidak disengaja/tanpa niat khusus. Pola sastra.',
      examples: [
        { sentence: '見るともなしに窓の外を見ていた。', hiragana: 'みるともなしにまどのそとをみていた。', meaning: 'Tanpa sengaja melihat ke luar jendela.' },
        { sentence: '聞くともなしに会話を聞いていた。', hiragana: 'きくともなしにかいわをきいていた。', meaning: 'Tanpa sengaja mendengar percakapannya.' },
      ],
      level: 'N1',
      tags: ['tidak sengaja', 'sastra'],
    },
    {
      pattern: '～でなくてなんであろう',
      reading: '~de nakute nan de arō',
      meaning: 'Kalau bukan ~, apa lagi?',
      explanation:
        'Penegasan retoris sangat formal. Menyatakan bahwa sesuatu pastilah X.',
      examples: [
        { sentence: 'これは奇跡でなくてなんであろう。', hiragana: 'これはきせきでなくてなんであろう。', meaning: 'Kalau ini bukan keajaiban, apa lagi?' },
        { sentence: 'これが愛でなくてなんであろう。', hiragana: 'これがあいでなくてなんであろう。', meaning: 'Kalau ini bukan cinta, apa lagi?' },
      ],
      level: 'N1',
      tags: ['retoris', 'sangat formal'],
    },
    {
      pattern: '～をもって',
      reading: '~wo motte',
      meaning: 'Dengan ~, Pada ~',
      explanation:
        'Sangat formal. Menyatakan cara/sarana atau titik waktu resmi. Sering di pengumuman.',
      examples: [
        { sentence: '本日をもって閉店いたします。', hiragana: 'ほんじつをもってへいてんいたします。', meaning: 'Mulai hari ini, kami tutup.' },
        { sentence: '誠意をもって対応する。', hiragana: 'せいいをもってたいおうする。', meaning: 'Menanggapi dengan ketulusan.' },
      ],
      level: 'N1',
      tags: ['cara', 'sangat formal'],
    },
    {
      pattern: '～いかんで',
      reading: '~ikan de',
      meaning: 'Tergantung pada ~',
      explanation:
        'Sangat formal. Versi tertinggi dari ～によって. Menyatakan ketergantungan.',
      examples: [
        { sentence: '結果いかんで対応を決める。', hiragana: 'けっかいかんでたいおうをきめる。', meaning: 'Memutuskan tindakan tergantung hasilnya.' },
        { sentence: '天気いかんで予定が変わる。', hiragana: 'てんきいかんでよていがかわる。', meaning: 'Jadwal berubah tergantung cuaca.' },
      ],
      level: 'N1',
      tags: ['tergantung', 'sangat formal'],
    },
  ],
}
