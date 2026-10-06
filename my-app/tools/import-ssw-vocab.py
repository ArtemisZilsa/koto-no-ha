"""Bangun migrasi kosakata SSW per bidang dari tools/ssw-vocab/<slug>.txt.

Format satu baris (dipisah '|', 11 kolom; baris kosong & '#' diabaikan):
  kata|hiragana|romaji|arti|jenis|penggunaan_id|penggunaan_jp|makna_lengkap|contoh|contoh_hiragana|arti_contoh
jenis: n = Kata benda, v = Kata kerja, a = Kata sifat, x = Ungkapan

Pakai:  python tools/import-ssw-vocab.py <nomor_migrasi_baru>
Nama berkas = slug bidang = nilai vocab.field (lihat lib/data/sswSectors.ts).
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent
SRC = ROOT / 'ssw-vocab'
MIG = ROOT.parent / 'supabase' / 'migrations'
POS = {'n': 'Kata benda', 'v': 'Kata kerja', 'a': 'Kata sifat', 'x': 'Ungkapan'}
KANA = re.compile(r'^[぀-ヿー・ 　]+$')  # hiragana, katakana, ー, ・, spasi
KATAKANA = re.compile(r'^[゠-ヿー・]+$')
# Kata serapan murni katakana (ワックス): bacaannya tetap katakana, bukan わっくす.
reading = lambda word, hira: word if KATAKANA.match(word) else hira
SSW_LEVEL_ID = 6


def q(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"


def parse(path: pathlib.Path) -> list[list[str]]:
    rows, seen, errors = [], set(), []
    for n, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        cols = [c.strip() for c in line.split('|')]
        where = f'{path.name}:{n}'
        if len(cols) != 11:
            errors.append(f'{where}: {len(cols)} kolom (harus 11)')
            continue
        if any(not c for c in cols):
            errors.append(f'{where}: ada kolom kosong')
        if cols[4] not in POS:
            errors.append(f'{where}: jenis "{cols[4]}" tidak dikenal')
        if not KANA.match(cols[1]):
            errors.append(f'{where}: hiragana "{cols[1]}" mengandung kanji/latin')
        if not KANA.match(re.sub(r'[。、！？「」（）0-9０-９]', '', cols[9])):
            errors.append(f'{where}: contoh_hiragana mengandung kanji/latin')
        if cols[0] in seen:
            errors.append(f'{where}: kata "{cols[0]}" dobel')
        seen.add(cols[0])
        rows.append(cols)
    if errors:
        raise SystemExit('\n'.join(errors))
    return rows


def main() -> None:
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        raise SystemExit(__doc__)
    num = sys.argv[1].zfill(3)
    if any(MIG.glob(f'{num}_*.sql')):
        raise SystemExit(f'Nomor migrasi {num} sudah dipakai.')

    out = [
        '-- Kosakata SSW per bidang (100 per bidang). Dibangun oleh tools/import-ssw-vocab.py — jangan edit manual.',
        '-- Kata yang sama boleh muncul di beberapa bidang (mis. 安全): unik per (level, bidang, kata).',
        'DROP INDEX IF EXISTS public.uniq_vocab_level_word;',
        'CREATE UNIQUE INDEX IF NOT EXISTS uniq_vocab_level_field_word',
        '  ON public.vocab (level_id, field, word) NULLS NOT DISTINCT;',
        '',
    ]
    total = 0
    for path in sorted(SRC.glob('*.txt')):
        field = path.stem
        rows = parse(path)
        out.append(f'-- {field}: {len(rows)} kata')
        out.append(
            'INSERT INTO public.vocab (level_id, field, order_index, word, hiragana, romaji, meaning, part_of_speech, '
            'usage_id, usage_jp, full_meaning, example_sentence, example_hiragana, example_meaning) VALUES'
        )
        values = []
        for i, c in enumerate(rows, 1):
            word, hira, romaji, meaning, pos, use_id, use_jp, full, ex, ex_h, ex_m = c
            values.append(
                f'({SSW_LEVEL_ID}, {q(field)}, {i}, {q(word)}, {q(reading(word, hira))}, {q(romaji)}, {q(meaning)}, {q(POS[pos])}, '
                f'{q(use_id)}, {q(use_jp)}, {q(full)}, {q(ex)}, {q(ex_h)}, {q(ex_m)})'
            )
        out.append(',\n'.join(values))
        out.append('ON CONFLICT (level_id, field, word) DO NOTHING;\n')
        total += len(rows)
        print(f'{field}: {len(rows)}')

    dest = MIG / f'{num}_seed_vocab_ssw_bidang.sql'
    dest.write_text('\n'.join(out), encoding='utf-8', newline='\n')
    print(f'Total {total} kata -> {dest.name}')


if __name__ == '__main__':
    main()
