/**
 * ThemeScript — inline script yang dijalankan SEBELUM React hydrate.
 * Set class `dark` di <html> berdasarkan localStorage + prefers-color-scheme,
 * dan class `no-anim` bila pengguna menonaktifkan animasi.
 * Mencegah FOUC (Flash of Unstyled Content) & flash animasi saat reload.
 */
export function ThemeScript() {
  const code = `
(function(){try{var s=localStorage.getItem('koto-theme');var d=window.matchMedia('(prefers-color-scheme: dark)').matches;var t=s||(d?'dark':'light');if(t==='dark'){document.documentElement.classList.add('dark');}if(localStorage.getItem('koto-anim')==='off'){document.documentElement.classList.add('no-anim');}}catch(e){}})();
`.trim()

  return <script dangerouslySetInnerHTML={{ __html: code }} />
}
