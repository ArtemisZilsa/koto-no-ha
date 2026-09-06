/* ─── Batas kata untuk sorotan dokkai ────────────────────────────────────────
 * Logika murni tanpa dependensi React/Supabase, sehingga mudah diuji.
 */

const HIRAGANA_ONLY = /^[ぁ-ゟ]+$/
const KATAKANA_ONLY = /^[゠-ヿ]+$/
const isHiragana = (ch: string | undefined) => !!ch && /[ぁ-ゟ]/.test(ch)
const isKatakana = (ch: string | undefined) => !!ch && /[゠-ヿ]/.test(ch)

/**
 * Teks Jepang tidak berspasi, jadi kata yang seluruhnya kana gampang tercocok
 * di tengah kata lain: 「どう」 di dalam 「どうぞ」, 「はい」 di dalam 「私はいつも」,
 * 「いとこ」 di dalam 「いいところ」. Kata ber-kanji tidak kena masalah ini karena
 * kanji sendiri sudah jadi penanda batas.
 *
 * Kata katakana harus diapit non-katakana; partikel hiragana di belakangnya
 * sudah cukup, jadi アパートに tetap tersorot.
 *
 * Kata hiragana dinilai dari sisi kanannya dulu. Kalau tidak diikuti hiragana
 * berarti ia berhenti di batas yang wajar — diterima, termasuk 「よく」 di
 * 「私はよく本を読む」 dan 「ください」 di 「待ってください。」. Kalau masih diikuti
 * hiragana, kata 2 huruf ditolak (はい di 私はいつも, どう di どうぞ hampir pasti
 * potongan), sedangkan kata 3 huruf ke atas hanya ditolak bila sisi kirinya
 * juga hiragana — itu yang menangkap いとこ di 「いいところ」 tanpa ikut membuang
 * たくさん di 「たくさんの人」.
 *
 * Sebagian kata hiragana pendek yang sah tetap ikut tidak tersorot (mis. これ
 * sebelum は). Itu disengaja: tidak menyorot lebih baik daripada menyorot cara
 * baca yang salah, di fitur yang justru mengajarkan cara baca.
 *
 * Solusi sebenarnya butuh tokenizer morfologis (mis. kuromoji) atau menyimpan
 * offset kata per bacaan saat seed — dua-duanya di luar cakupan perbaikan ini.
 */
export function isWordBoundaryMatch(text: string, word: string, start: number): boolean {
  const prev = text[start - 1]
  const next = text[start + word.length]
  if (KATAKANA_ONLY.test(word)) return !isKatakana(prev) && !isKatakana(next)
  if (HIRAGANA_ONLY.test(word)) {
    if (!isHiragana(next)) return true
    if (word.length < 3) return false
    return !isHiragana(prev)
  }
  return true
}
