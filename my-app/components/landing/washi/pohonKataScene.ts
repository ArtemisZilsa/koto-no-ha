import * as THREE from 'three'

// Daun-daun kanji N5 yang melayang di sekitar ranting hero. Depan: kanji di atas daun tinta.
// Belakang (saat di-hover/diklik): cara baca + arti.
const WORDS = [
  { k: '言', r: 'こと', m: 'kata' },
  { k: '葉', r: 'は', m: 'daun' },
  { k: '木', r: 'き', m: 'pohon' },
  { k: '山', r: 'やま', m: 'gunung' },
  { k: '水', r: 'みず', m: 'air' },
  { k: '日', r: 'ひ', m: 'hari, matahari' },
  { k: '月', r: 'つき', m: 'bulan' },
  { k: '人', r: 'ひと', m: 'orang' },
  { k: '学', r: 'がく', m: 'belajar' },
]

// Posisi di dunia 3D (kamera di z=10). Disebar di sekitar ranting ilustrasi (kanan atas → tengah).
const SPOTS: [number, number, number][] = [
  [-2.3, 1.5, 0.3], [-0.4, 1.9, -0.8], [1.5, 1.7, 0.2],
  [-1.6, -0.1, -0.4], [0.4, 0.5, 0.8], [2.2, 0.2, -0.6],
  [-0.8, -1.8, 0.3], [1.1, -1.3, -0.2], [2.3, -2.0, 0.2],
]

const TEX_W = 256
const TEX_H = 320

function leafPath(ctx: CanvasRenderingContext2D) {
  // Daun runcing dua ujung, sedikit asimetris seperti sapuan kuas.
  ctx.beginPath()
  ctx.moveTo(TEX_W / 2, 12)
  ctx.bezierCurveTo(TEX_W * 0.98, TEX_H * 0.28, TEX_W * 0.9, TEX_H * 0.78, TEX_W / 2, TEX_H - 10)
  ctx.bezierCurveTo(TEX_W * 0.06, TEX_H * 0.74, TEX_W * 0.04, TEX_H * 0.3, TEX_W / 2, 12)
  ctx.closePath()
}

type Palette = { ink: string; paper: string; crimson: string; serif: string }

function readPalette(): Palette {
  const css = getComputedStyle(document.documentElement)
  const v = (n: string, d: string) => css.getPropertyValue(n).trim() || d
  return {
    ink: v('--text', '#1a1a22'),
    paper: v('--paper', '#f6f1e7'),
    crimson: v('--crimson', '#b3122e'),
    serif: `${v('--font-noto-serif-jp', '')}, 'Hiragino Mincho ProN', 'Yu Mincho', serif`.replace(/^, /, ''),
  }
}

function drawFront(ctx: CanvasRenderingContext2D, word: (typeof WORDS)[number], red: boolean, p: Palette) {
  ctx.clearRect(0, 0, TEX_W, TEX_H)
  leafPath(ctx)
  ctx.globalAlpha = red ? 0.9 : 0.78
  ctx.fillStyle = red ? p.crimson : p.ink
  ctx.fill()
  ctx.globalAlpha = 1
  // Tulang daun
  ctx.strokeStyle = p.paper
  ctx.globalAlpha = 0.35
  ctx.lineWidth = 3
  ctx.beginPath()
  ctx.moveTo(TEX_W / 2, 24)
  ctx.quadraticCurveTo(TEX_W * 0.53, TEX_H / 2, TEX_W / 2, TEX_H - 22)
  ctx.stroke()
  ctx.globalAlpha = 1
  ctx.fillStyle = p.paper
  ctx.font = `600 118px ${p.serif}`
  ctx.textAlign = 'center'
  ctx.textBaseline = 'middle'
  ctx.fillText(word.k, TEX_W / 2, TEX_H / 2 + 4)
}

function drawBack(ctx: CanvasRenderingContext2D, word: (typeof WORDS)[number], p: Palette) {
  ctx.clearRect(0, 0, TEX_W, TEX_H)
  leafPath(ctx)
  ctx.fillStyle = p.paper
  ctx.fill()
  ctx.strokeStyle = p.crimson
  ctx.lineWidth = 5
  ctx.stroke()
  ctx.textAlign = 'center'
  ctx.textBaseline = 'middle'
  ctx.fillStyle = p.crimson
  ctx.font = `600 64px ${p.serif}`
  ctx.fillText(word.r, TEX_W / 2, TEX_H / 2 - 22)
  ctx.fillStyle = p.ink
  ctx.font = `500 30px ${p.serif}`
  // Arti panjang dipecah per koma agar tetap di dalam daun.
  word.m.split(', ').forEach((line, i) => ctx.fillText(line, TEX_W / 2, TEX_H / 2 + 42 + i * 34))
}

/** Pasang scene ke elemen. Mengembalikan fungsi bersih-bersih. */
export function mountPohonKata(host: HTMLElement): () => void {
  let renderer: THREE.WebGLRenderer
  try {
    renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
  } catch {
    return () => {} // tanpa WebGL: ilustrasi statis saja
  }
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.outputColorSpace = THREE.SRGBColorSpace
  renderer.domElement.setAttribute('aria-hidden', 'true')
  host.appendChild(renderer.domElement)

  const scene = new THREE.Scene()
  const camera = new THREE.PerspectiveCamera(35, 1, 0.1, 50)
  camera.position.z = 10

  const geometry = new THREE.PlaneGeometry(0.92, 0.92 * (TEX_H / TEX_W))
  const disposables: { dispose(): void }[] = [geometry, renderer]

  const leaves = WORDS.map((word, i) => {
    const red = i % 3 === 1
    const make = () => {
      const canvas = document.createElement('canvas')
      canvas.width = TEX_W
      canvas.height = TEX_H
      const tex = new THREE.CanvasTexture(canvas)
      tex.colorSpace = THREE.SRGBColorSpace
      tex.anisotropy = 4
      const mat = new THREE.MeshBasicMaterial({ map: tex, transparent: true, alphaTest: 0.05, side: THREE.FrontSide, depthWrite: false })
      disposables.push(tex, mat)
      return { ctx: canvas.getContext('2d')!, tex, mat }
    }
    const front = make()
    const back = make()

    const group = new THREE.Group()
    const frontMesh = new THREE.Mesh(geometry, front.mat)
    const backMesh = new THREE.Mesh(geometry, back.mat)
    backMesh.rotation.y = Math.PI
    group.add(frontMesh, backMesh)
    const [x, y, z] = SPOTS[i]
    group.position.set(x, y, z)
    group.userData.index = i
    frontMesh.userData.index = i
    backMesh.userData.index = i
    scene.add(group)

    return {
      word, red, front, back, group, base: new THREE.Vector3(x, y, z),
      phase: i * 1.7, speed: 0.5 + (i % 4) * 0.12, tilt: (i % 2 ? 1 : -1) * 0.35,
      flip: 0, pinned: false,
    }
  })

  const paint = () => {
    const p = readPalette()
    for (const l of leaves) {
      drawFront(l.front.ctx, l.word, l.red, p)
      drawBack(l.back.ctx, l.word, p)
      l.front.tex.needsUpdate = true
      l.back.tex.needsUpdate = true
    }
  }
  paint()
  document.fonts?.ready.then(paint)
  // Ganti tema (html.dark) → gambar ulang warna daun.
  const themeObserver = new MutationObserver(paint)
  themeObserver.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })

  const still = () =>
    window.matchMedia('(prefers-reduced-motion: reduce)').matches || document.documentElement.classList.contains('no-anim')

  // Hover membalik daun; klik mengunci (berguna di tablet layar sentuh).
  const raycaster = new THREE.Raycaster()
  const pointer = new THREE.Vector2(9, 9)
  let hovered = -1
  const pick = (e: PointerEvent) => {
    const r = renderer.domElement.getBoundingClientRect()
    pointer.set(((e.clientX - r.left) / r.width) * 2 - 1, -((e.clientY - r.top) / r.height) * 2 + 1)
    raycaster.setFromCamera(pointer, camera)
    const hit = raycaster.intersectObjects(leaves.map((l) => l.group), true)[0]
    hovered = hit ? (hit.object.userData.index as number) : -1
    renderer.domElement.style.cursor = hovered >= 0 ? 'pointer' : ''
  }
  const onMove = (e: PointerEvent) => pick(e)
  const onLeave = () => { hovered = -1; renderer.domElement.style.cursor = '' }
  const onClick = (e: PointerEvent) => {
    pick(e)
    if (hovered >= 0) leaves[hovered].pinned = !leaves[hovered].pinned
  }
  renderer.domElement.addEventListener('pointermove', onMove)
  renderer.domElement.addEventListener('pointerleave', onLeave)
  renderer.domElement.addEventListener('pointerup', onClick)

  const resize = () => {
    const { clientWidth: w, clientHeight: h } = host
    if (!w || !h) return
    renderer.setSize(w, h, false)
    renderer.domElement.style.width = '100%'
    renderer.domElement.style.height = '100%'
    camera.aspect = w / h
    camera.updateProjectionMatrix()
  }
  const ro = new ResizeObserver(resize)
  ro.observe(host)
  resize()

  // Hanya render saat hero terlihat dan tab aktif.
  let visible = true
  const io = new IntersectionObserver(([e]) => { visible = e.isIntersecting })
  io.observe(host)

  const clock = new THREE.Clock()
  let raf = 0
  const tick = () => {
    raf = requestAnimationFrame(tick)
    if (!visible || document.hidden) return
    const dt = Math.min(clock.getDelta(), 0.05)
    const t = still() ? 0 : clock.elapsedTime
    for (const [i, l] of leaves.entries()) {
      const target = l.pinned || hovered === i ? Math.PI : 0
      l.flip += (target - l.flip) * Math.min(1, dt * 7)
      const g = l.group
      g.position.set(
        l.base.x + Math.sin(t * l.speed * 0.6 + l.phase) * 0.12,
        l.base.y + Math.sin(t * l.speed + l.phase) * 0.18,
        l.base.z,
      )
      g.rotation.set(Math.sin(t * l.speed * 0.8 + l.phase) * 0.25, l.flip + Math.sin(t * 0.4 + l.phase) * 0.3, l.tilt + Math.sin(t * l.speed + l.phase) * 0.12)
    }
    renderer.render(scene, camera)
  }
  tick()

  return () => {
    cancelAnimationFrame(raf)
    ro.disconnect()
    io.disconnect()
    themeObserver.disconnect()
    renderer.domElement.removeEventListener('pointermove', onMove)
    renderer.domElement.removeEventListener('pointerleave', onLeave)
    renderer.domElement.removeEventListener('pointerup', onClick)
    disposables.forEach((d) => d.dispose())
    renderer.domElement.remove()
  }
}
