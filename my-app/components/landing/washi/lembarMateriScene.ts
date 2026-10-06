import * as THREE from 'three'

// Lembar materi PDF N5 sebagai kertas washi 3D yang melengkung (diadaptasi dari ide
// "3D Paper" threeui: kertas tergantung, kilau mengikuti kursor, bisa diputar dengan drag).
// Kode ditulis ulang dari nol; warna kertas tetap krem di kedua tema (kertas tetaplah kertas).

const TEX_W = 512
const TEX_H = 704
const PAPER = '#f4ecdc'
const INK = '#1e1b18'
const MUTED = '#6b645b'
const RED = '#b3122e'

function drawSheet(ctx: CanvasRenderingContext2D, serif: string) {
  ctx.fillStyle = PAPER
  ctx.fillRect(0, 0, TEX_W, TEX_H)
  // Serat washi: bintik dan goresan halus acak (seed tetap supaya tidak berubah tiap render).
  let seed = 7
  const rnd = () => ((seed = (seed * 16807) % 2147483647) / 2147483647)
  for (let i = 0; i < 900; i++) {
    ctx.fillStyle = rnd() > 0.5 ? 'rgba(120,100,70,0.07)' : 'rgba(255,255,255,0.35)'
    ctx.fillRect(rnd() * TEX_W, rnd() * TEX_H, 1 + rnd() * 2, 1 + rnd() * 6)
  }
  ctx.strokeStyle = 'rgba(30,27,24,0.35)'
  ctx.lineWidth = 1.5
  ctx.strokeRect(22, 22, TEX_W - 44, TEX_H - 44)

  // Judul vertikal di kanan (gaya dokumen Jepang).
  ctx.fillStyle = INK
  ctx.textAlign = 'center'
  ctx.textBaseline = 'middle'
  ctx.font = `600 34px ${serif}`
  ;[...'言の葉 文法'].forEach((ch, i) => ctx.fillText(ch, TEX_W - 58, 80 + i * 42))
  ctx.fillStyle = RED
  ctx.fillRect(TEX_W - 92, 60, 2, 240)

  ctx.textAlign = 'left'
  ctx.textBaseline = 'alphabetic'
  ctx.fillStyle = RED
  ctx.font = `500 15px ${serif}`
  ctx.fillText('第一課 · PELAJARAN 1 · N5', 50, 76)
  ctx.fillStyle = INK
  ctx.font = `600 54px ${serif}`
  ctx.fillText('〜は〜です', 50, 146)
  ctx.fillStyle = MUTED
  ctx.font = `400 19px ${serif}`
  ctx.fillText('"A adalah B": kalimat paling dasar.', 50, 184)

  ctx.strokeStyle = 'rgba(30,27,24,0.2)'
  ctx.beginPath(); ctx.moveTo(50, 214); ctx.lineTo(TEX_W - 120, 214); ctx.stroke()

  const examples = [
    ['わたし は がくせい です。', 'Saya (adalah) pelajar.'],
    ['これ は ほん です。', 'Ini (adalah) buku.'],
    ['たなかさん は せんせい です。', 'Pak Tanaka (adalah) guru.'],
  ]
  examples.forEach(([jp, id], i) => {
    const y = 268 + i * 92
    ctx.fillStyle = INK
    ctx.font = `500 26px ${serif}`
    ctx.fillText(jp, 50, y)
    ctx.fillStyle = MUTED
    ctx.font = `400 18px ${serif}`
    ctx.fillText(id, 50, y + 32)
  })

  // Catatan kecil
  ctx.fillStyle = INK
  ctx.font = `500 17px ${serif}`
  ctx.fillText('Catatan: は dibaca "wa" saat menjadi partikel.', 50, 560)

  // Cap merah (hanko) 言の葉
  ctx.save()
  ctx.translate(96, 628)
  ctx.rotate(-0.08)
  ctx.strokeStyle = RED
  ctx.lineWidth = 4
  ctx.strokeRect(-36, -36, 72, 72)
  ctx.fillStyle = RED
  ctx.textAlign = 'center'
  ctx.textBaseline = 'middle'
  ctx.font = `700 22px ${serif}`
  ctx.fillText('言の', 0, -12)
  ctx.fillText('葉', 0, 16)
  ctx.restore()

  ctx.fillStyle = MUTED
  ctx.textAlign = 'right'
  ctx.font = `400 14px ${serif}`
  ctx.fillText('kotonoha · materi PDF N5 · hlm. 1', TEX_W - 50, 650)
}

const vertexShader = /* glsl */ `
  uniform float uTime;
  varying vec2 vUv;
  varying vec3 vNormalV;
  varying vec3 vViewPos;
  // Lengkung kertas: busur pelan sepanjang lebar + gelombang halus yang "bernapas".
  float bend(vec2 p) {
    return 0.16 * sin(p.x * 1.9 + 0.4) + 0.05 * sin(p.y * 2.2 + uTime * 0.7) + 0.03 * sin((p.x + p.y) * 3.0 + uTime * 0.5);
  }
  void main() {
    vUv = uv;
    vec3 p = position;
    p.z += bend(p.xy);
    float e = 0.01;
    vec3 dx = vec3(e, 0.0, bend(p.xy + vec2(e, 0.0)) - bend(p.xy));
    vec3 dy = vec3(0.0, e, bend(p.xy + vec2(0.0, e)) - bend(p.xy));
    vNormalV = normalize(normalMatrix * normalize(cross(dx, dy)));
    vec4 mv = modelViewMatrix * vec4(p, 1.0);
    vViewPos = mv.xyz;
    gl_Position = projectionMatrix * mv;
  }
`

const fragmentShader = /* glsl */ `
  uniform sampler2D uMap;
  uniform vec3 uLight;     // posisi cahaya di ruang view (mengikuti kursor)
  uniform float uLightOn;  // 0..1, menyala saat kursor di atas kertas
  varying vec2 vUv;
  varying vec3 vNormalV;
  varying vec3 vViewPos;
  void main() {
    vec3 n = normalize(vNormalV);
    if (!gl_FrontFacing) n = -n;
    vec3 base = gl_FrontFacing ? texture2D(uMap, vUv).rgb : vec3(0.93, 0.89, 0.81);
    vec3 l = normalize(uLight - vViewPos);
    vec3 v = normalize(-vViewPos);
    float diff = clamp(dot(n, l), 0.0, 1.0);
    float spec = pow(clamp(dot(n, normalize(l + v)), 0.0, 1.0), 60.0);
    float ambient = 0.78 + 0.22 * diff;
    vec3 col = base * ambient + vec3(1.0, 0.97, 0.9) * spec * 0.55 * uLightOn;
    // Sedikit tembus cahaya di tepi seperti washi.
    float edge = smoothstep(0.0, 0.04, min(min(vUv.x, 1.0 - vUv.x), min(vUv.y, 1.0 - vUv.y)));
    gl_FragColor = vec4(col, mix(0.85, 0.98, edge));
    #include <colorspace_fragment>
  }
`

/** Pasang lembar 3D ke elemen. Mengembalikan fungsi bersih-bersih. */
export function mountLembarMateri(host: HTMLElement): () => void {
  let renderer: THREE.WebGLRenderer
  try {
    renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
  } catch {
    return () => {}
  }
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.outputColorSpace = THREE.SRGBColorSpace
  const canvas = renderer.domElement
  canvas.setAttribute('aria-hidden', 'true')
  canvas.style.touchAction = 'pan-y'
  canvas.style.cursor = 'grab'
  host.appendChild(canvas)

  const scene = new THREE.Scene()
  const camera = new THREE.PerspectiveCamera(30, 1, 0.1, 20)
  camera.position.z = 4.6

  const texCanvas = document.createElement('canvas')
  texCanvas.width = TEX_W
  texCanvas.height = TEX_H
  const texture = new THREE.CanvasTexture(texCanvas)
  texture.colorSpace = THREE.SRGBColorSpace
  texture.anisotropy = 8
  const serif = `${getComputedStyle(document.documentElement).getPropertyValue('--font-noto-serif-jp').trim() || 'serif'}, 'Hiragino Mincho ProN', 'Yu Mincho', serif`
  const paint = () => { drawSheet(texCanvas.getContext('2d')!, serif); texture.needsUpdate = true }
  paint()
  document.fonts?.ready.then(paint)

  const uniforms = {
    uMap: { value: texture },
    uTime: { value: 0 },
    uLight: { value: new THREE.Vector3(0.6, 0.8, -3.2) },
    uLightOn: { value: 0.35 },
  }
  const material = new THREE.ShaderMaterial({ uniforms, vertexShader, fragmentShader, transparent: true, side: THREE.DoubleSide })
  const geometry = new THREE.PlaneGeometry(1.6, 1.6 * (TEX_H / TEX_W), 40, 40)
  const paper = new THREE.Mesh(geometry, material)
  scene.add(paper)

  const REST_Y = -0.38 // sudut diam, miring seperti buku di kartu sebelah
  const REST_X = 0.08
  let rotY = REST_Y
  let velY = 0
  let tiltX = 0
  let tiltY = 0
  let dragging = false
  let lastX = 0
  let lightTarget = 0.35

  const raycaster = new THREE.Raycaster()
  const ndc = new THREE.Vector2()
  const toNdc = (e: PointerEvent) => {
    const r = canvas.getBoundingClientRect()
    ndc.set(((e.clientX - r.left) / r.width) * 2 - 1, -((e.clientY - r.top) / r.height) * 2 + 1)
  }
  const onMove = (e: PointerEvent) => {
    toNdc(e)
    if (dragging) {
      const dx = e.clientX - lastX
      lastX = e.clientX
      velY = dx * 0.012
      rotY += velY
      return
    }
    tiltX = -ndc.y * 0.12
    tiltY = ndc.x * 0.18
    // Kilau: cahaya di depan titik yang ditunjuk kursor.
    raycaster.setFromCamera(ndc, camera)
    const hit = raycaster.intersectObject(paper)[0]
    lightTarget = hit ? 1 : 0.35
    const p = hit ? hit.point.clone() : new THREE.Vector3(ndc.x * 1.5, ndc.y * 1.5, 0)
    p.z += 1.2
    uniforms.uLight.value.copy(p.applyMatrix4(camera.matrixWorldInverse))
  }
  const onDown = (e: PointerEvent) => {
    dragging = true
    lastX = e.clientX
    velY = 0
    canvas.setPointerCapture(e.pointerId)
    canvas.style.cursor = 'grabbing'
  }
  const onUp = (e: PointerEvent) => {
    dragging = false
    if (canvas.hasPointerCapture(e.pointerId)) canvas.releasePointerCapture(e.pointerId)
    canvas.style.cursor = 'grab'
  }
  const onLeave = () => { if (!dragging) { tiltX = 0; tiltY = 0; lightTarget = 0.35 } }
  canvas.addEventListener('pointermove', onMove)
  canvas.addEventListener('pointerdown', onDown)
  canvas.addEventListener('pointerup', onUp)
  canvas.addEventListener('pointercancel', onUp)
  canvas.addEventListener('pointerleave', onLeave)

  const resize = () => {
    const { clientWidth: w, clientHeight: h } = host
    if (!w || !h) return
    renderer.setSize(w, h, false)
    canvas.style.width = '100%'
    canvas.style.height = '100%'
    camera.aspect = w / h
    camera.updateProjectionMatrix()
  }
  const ro = new ResizeObserver(resize)
  ro.observe(host)
  resize()

  let visible = true
  const io = new IntersectionObserver(([e]) => { visible = e.isIntersecting })
  io.observe(host)

  const still = () =>
    window.matchMedia('(prefers-reduced-motion: reduce)').matches || document.documentElement.classList.contains('no-anim')

  const clock = new THREE.Clock()
  let raf = 0
  const tick = () => {
    raf = requestAnimationFrame(tick)
    if (!visible || document.hidden) return
    const dt = Math.min(clock.getDelta(), 0.05)
    const calm = still()
    if (!calm) uniforms.uTime.value += dt
    if (!dragging) {
      // Inersia lalu kembali pelan ke sudut diam (pegas teredam).
      velY *= calm ? 0 : Math.pow(0.04, dt)
      rotY += velY
      rotY += (REST_Y - rotY) * Math.min(1, dt * 1.6)
    }
    uniforms.uLightOn.value += (lightTarget - uniforms.uLightOn.value) * Math.min(1, dt * 6)
    paper.rotation.y += (rotY + tiltY - paper.rotation.y) * Math.min(1, dt * 8)
    paper.rotation.x += (REST_X + tiltX - paper.rotation.x) * Math.min(1, dt * 6)
    renderer.render(scene, camera)
  }
  tick()

  return () => {
    cancelAnimationFrame(raf)
    ro.disconnect()
    io.disconnect()
    canvas.removeEventListener('pointermove', onMove)
    canvas.removeEventListener('pointerdown', onDown)
    canvas.removeEventListener('pointerup', onUp)
    canvas.removeEventListener('pointercancel', onUp)
    canvas.removeEventListener('pointerleave', onLeave)
    geometry.dispose()
    material.dispose()
    texture.dispose()
    renderer.dispose()
    canvas.remove()
  }
}
