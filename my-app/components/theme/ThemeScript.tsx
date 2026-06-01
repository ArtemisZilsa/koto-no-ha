/**
 * ThemeScript — inline script yang dijalankan SEBELUM React hydrate.
 * Set class `dark` di <html> berdasarkan localStorage + prefers-color-scheme.
 * Mencegah FOUC (Flash of Unstyled Content) saat reload.
 */
export function ThemeScript() {
  const code = `
(function(){try{var s=localStorage.getItem('koto-theme');var d=window.matchMedia('(prefers-color-scheme: dark)').matches;var t=s||(d?'dark':'light');if(t==='dark'){document.documentElement.classList.add('dark');}}catch(e){}})();
`.trim()

  return <script dangerouslySetInnerHTML={{ __html: code }} />
}
