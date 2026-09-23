export default function Loading() {
  const block = { background: 'var(--surface)', border: '0.5px solid var(--border)' }

  return (
    <div role="status" aria-live="polite" className="px-5 md:px-12 py-12 max-w-5xl mx-auto">
      <span className="sr-only">Memuat…</span>
      <div className="h-8 w-56 rounded-lg animate-pulse mb-3" style={block} />
      <div className="h-4 w-80 max-w-full rounded animate-pulse mb-10" style={block} />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {Array.from({ length: 6 }, (_, i) => (
          <div key={i} className="h-28 rounded-2xl animate-pulse" style={block} />
        ))}
      </div>
    </div>
  )
}
