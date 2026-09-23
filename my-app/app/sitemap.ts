import type { MetadataRoute } from 'next'
import { createClient } from '@supabase/supabase-js'
import { SITE_URL } from '@/lib/site'
import { CATEGORY_META, PRACTICE_CATEGORIES, PRACTICE_LEVELS, setCount } from '@/lib/data/practice'

// Menghasilkan /sitemap.xml — semua halaman PUBLIK, termasuk halaman dinamis
// dari Supabase (set soal latihan, pelajaran kaiwa, berita). Halaman privat
// (dashboard, learn, dokkai, login) tidak dimasukkan; itu diblokir di robots.ts.
// Dibangun ulang maksimal sekali sehari.
export const revalidate = 86400

type Entry = MetadataRoute.Sitemap[number]

const LEVEL_ID: Record<string, number> = { N5: 1, N4: 2, N3: 3, N2: 4, N1: 5 }

function entry(path: string, changeFrequency: Entry['changeFrequency'], priority: number, lastModified?: string | Date): Entry {
  return { url: `${SITE_URL}${path}`, lastModified: lastModified ?? new Date(), changeFrequency, priority }
}

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const staticRoutes: Entry[] = [
    entry('/', 'weekly', 1),
    entry('/latihan', 'weekly', 0.9),
    entry('/kaiwa', 'weekly', 0.8),
    entry('/kaiwa/kerja', 'weekly', 0.8),
    entry('/quiz', 'monthly', 0.7),
    entry('/ssw', 'monthly', 0.7),
    entry('/berita', 'daily', 0.6),
    ...['n5', 'n4', 'n3', 'n2', 'n1'].map((l) => entry(`/flashcard/${l}`, 'monthly', 0.6)),
    entry('/tentang', 'yearly', 0.4),
    entry('/kontak', 'yearly', 0.3),
    entry('/kebijakan-privasi', 'yearly', 0.2),
  ]

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  if (!url || !key) return staticRoutes

  // Klien tanpa cookie: sitemap tidak bergantung pada sesi user, jadi bisa di-cache.
  const supabase = createClient(url, key, { auth: { persistSession: false } })

  // Set soal latihan: jumlah set dihitung dari jumlah item per kategori+level.
  const practice = await Promise.all(
    PRACTICE_LEVELS.flatMap((level) =>
      PRACTICE_CATEGORIES.map(async (category) => {
        const table = category === 'kosakata' ? 'vocab' : category === 'kanji' ? 'kanji' : 'grammar'
        let q = supabase.from(table).select('id', { count: 'exact', head: true }).eq('level_id', LEVEL_ID[level])
        if (category === 'kosakata') q = q.is('field', null)
        const { count } = await q
        const sets = setCount(category, count ?? 0)
        return Array.from({ length: sets }, (_, i) =>
          entry(`/latihan/${CATEGORY_META[category].slug}/${level.toLowerCase()}/${i + 1}`, 'monthly', 0.7),
        )
      }),
    ),
  )

  const [lessonsRes, jobsRes, newsRes] = await Promise.all([
    supabase.from('kaiwa_stories').select('job_slug, lesson_no').not('job_slug', 'is', null),
    supabase.from('kaiwa_jobs').select('slug'),
    supabase.from('news_articles').select('id, published_at').order('published_at', { ascending: false }).limit(500),
  ])

  const lessons = (lessonsRes.data ?? []) as { job_slug: string; lesson_no: number | null }[]
  const jobsWithLessons = new Set(lessons.map((l) => l.job_slug))
  const jobs = ((jobsRes.data ?? []) as { slug: string }[]).filter((j) => jobsWithLessons.has(j.slug))

  return [
    ...staticRoutes,
    ...practice.flat(),
    ...jobs.map((j) => entry(`/kaiwa/kerja/${j.slug}`, 'monthly', 0.7)),
    ...lessons
      .filter((l) => l.lesson_no != null)
      .map((l) => entry(`/kaiwa/kerja/${l.job_slug}/${l.lesson_no}`, 'monthly', 0.6)),
    ...((newsRes.data ?? []) as { id: string; published_at: string }[]).map((n) =>
      entry(`/berita/${n.id}`, 'monthly', 0.4, n.published_at),
    ),
  ]
}
