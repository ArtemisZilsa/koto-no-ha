# Compiled Spec

Target: `my-app/app/noir/page.tsx` — Next.js 16.2.6, React 19.2.4, Tailwind v4.

## Library Citation Audit (read this first)

Two ids named in the hero archetype's "Required visual elements" do **not** resolve to those names in `visual-elements.md`. Corrected rather than cited blind:

| Archetype asked for | Real resolution |
|---|---|
| `#30 Corner Bracket Frames` | `visual-elements #8 Corner Brackets` — #30 is actually "Crosshair Target" |
| `#19 Noise Particle Field` | `textures #1 Film grain (fine)` — #19 is actually "Dual Orb Glow" |
| `#26 Thin Divider Line` | **No library match.** #26 is "Rating Badge"; the only divider (`#32`) is a *gradient* divider tiered to Shinkai/Miyazaki/Coppola. Gradients are banned by this film language → the 1px chalk hairline is marked **Custom** below |

## Page: Home (`/noir`)

- Page scene thesis: A street at night where every unlearned word stands in shadow, and the visitor is handed the light.
- Signature composition: occluded Japanese word inside a fixed letterbox frame, with a movable hard-edged shadow.
- **Signature composition source id:** `hero-archetypes #4 Letterbox Cinema`
- Why this cannot collapse into a default grid: the shadow needs one uninterrupted field to travel across. Card boundaries would chop the light into unrelated rectangles and the mechanic would stop meaning anything.
- One big idea: **light reveals language.**
- **Heavy interaction:** hard-edged flashlight occlusion over the hero word.
- **Heavy interaction source id:** `interaction-effects #37 Flashlight reveal` — **JS-required**, full JS below. *Adapted:* the library's `radial-gradient(circle 100px …, transparent 0%, #000 100%)` is a soft falloff; Lang's shadows have knife edges, so the gradient uses hard colour stops (`transparent 0 → transparent 96% → #000 97%`). Timing and colours mapped to page tokens.
- **Showy reveals (2 max, both used):** `camera-shots #7 Split diopter open` (Scene 3) · `camera-shots #20 Jump cut stagger` (Scene 5)
- Restraint notes: no imagery, no video, no ambient loop, no counters, no testimonials. Brand red used exactly **3 times** (hero mark, Scene 5 active file, Scene 7 rule). ~⅓ of page height is intentionally near-empty.
- **Typography source id:** `font-moods #47 Thriller cold precision` (Inter Tight / IBM Plex Mono — "Se7en file folders"). **Custom deviation:** display face is **Jost**, not Inter Tight. Reason the library was insufficient — #47's Inter Tight is a contemporary neo-grotesque with no relationship to 1931 Berlin, whereas Jost is a direct Futura revival, the type actually contemporary with the film. Japanese reuses the project's already-loaded **Noto Serif JP** rather than adding a second face.
- **Atmosphere/background source ids:** `textures #1 Film grain (fine)` · `background-techniques C8 Vignette`
- **Colour grade source id:** `color-grades #33 German Expressionist — Metropolis (1927)`. Lang's own film; used as a *derivation reference* for the token set, not applied as a live CSS `filter` (filtering the whole page would crush the chalk text).

## Entrance Map

- Scene 1: `curtain-wipe`
- Scene 2: `fade-from-black`
- Scene 3: `split-diopter`
- Scene 4: `line-mask-ascend`
- Scene 5: `jump-cut-stagger`
- Scene 6: `none` (intentional)
- Scene 7: `highlight-wipe`
- Scene 8: `none` (intentional)

Checks: 6 distinct entrance types. No two adjacent alike. `opacity + translateY` appears **once** (Scene 5), under the limit of 2.

---

### Scene 1 — Tanda
- Beat B1 Cold Open · Function Hero · Archetype `#4 Letterbox Cinema`
- Entrance: `curtain-wipe` — **camera-shots #10**
- Interaction: **interaction-effects #37**, adapted hard-edge (JS below)
- Composition: `compositions #23 Viewport fill`
- Visual elements: `visual-elements #8 Corner Brackets`, chalk hairline (**Custom**), `textures #1` grain
- Typography: Jost 200 at `clamp(3.5rem, 12vw, 11rem)`, Noto Serif JP for 言の葉

```css
.noirHero { position: relative; height: 100svh; width: 100%; overflow: hidden;
  display: grid; grid-template-rows: var(--bar) 1fr var(--bar); }
.noirBar { background: var(--pitch); display: flex; align-items: center;
  justify-content: space-between; padding: 0 clamp(1rem, 4vw, 3rem);
  font: 500 11px/1 var(--font-display); letter-spacing: .22em; text-transform: uppercase;
  color: var(--smoke); }
.noirFrame { position: relative; overflow: hidden; background: var(--bitumen);
  clip-path: inset(0 0 0 0); }
/* entrance: camera-shots #10 curtain wipe — bars open from centre */
.noirFrame > .stage { clip-path: inset(0 50% 0 50%); transition: clip-path 1.1s cubic-bezier(.22,1,.36,1); }
.noirHero.is-in .noirFrame > .stage { clip-path: inset(0 0 0 0); }
/* interaction: #37 adapted — HARD edge, not radial falloff */
.noirShade { position: absolute; inset: 0; pointer-events: none; z-index: 2;
  background: radial-gradient(circle var(--r,42vmin) at var(--mx,32%) var(--my,44%),
    transparent 0, transparent 96%, var(--pitch) 97%, var(--pitch) 100%);
  transition: background-position .18s linear; }
```

```js
// interaction-effects #37 Flashlight reveal — JS-required, complete.
// Hard-edged adaptation: pointer sets --mx/--my; no easing on position (Lang's
// light does not drift), and touch devices get one slow scripted sweep instead.
function mountLight(el) {
  const fine = window.matchMedia('(pointer: fine)').matches
  const still = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  if (still) { el.style.setProperty('--r', '150vmax'); return () => {} }   // park it fully lit
  if (!fine) {                                                            // touch: one sweep
    let t = 0, raf = 0
    const step = () => { t += 0.0035
      el.style.setProperty('--mx', `${18 + Math.sin(t) * 32 + 32}%`)
      el.style.setProperty('--my', `${44 + Math.cos(t * 0.7) * 8}%`)
      raf = requestAnimationFrame(step) }
    raf = requestAnimationFrame(step)
    return () => cancelAnimationFrame(raf)
  }
  const onMove = (e) => {                                                 // desktop: pointer
    const r = el.getBoundingClientRect()
    el.style.setProperty('--mx', `${((e.clientX - r.left) / r.width) * 100}%`)
    el.style.setProperty('--my', `${((e.clientY - r.top) / r.height) * 100}%`)
  }
  el.addEventListener('pointermove', onMove, { passive: true })
  return () => el.removeEventListener('pointermove', onMove)
}
```

### Scene 2 — Yang Hilang
- Beat B18 · Function `Quote #40` · Archetype `QP-1 Full-Screen Monument`
- Entrance: `fade-from-black` — **camera-shots #2**, 3s (slowest on the page)
- Interaction: **none**, intentional
- Composition: `compositions #23 Viewport fill`, line held off-spine, ~85% empty

```css
.noirVoid { min-height: 92svh; display: grid; align-items: center;
  padding-inline: var(--gutter); }
.noirVoid p { max-width: 22ch; margin-left: var(--spine);
  font: 300 clamp(1.5rem, 3.4vw, 3rem)/1.28 var(--font-display); color: var(--chalk);
  opacity: 0; transition: opacity 3s ease; }
.noirVoid.is-in p { opacity: 1; }
```

### Scene 3 — Dua Jalur
- Beat B15 · Function `Category Map #15` · Archetype `CM-4 Accordion`, run as two staggered dossier columns
- Entrance: `split-diopter` — **camera-shots #7** (showy reveal 1/2)
- Interaction: **interaction-effects #24 Accordion unfold**
- Composition: `compositions #33 Clean 50/50`, right column offset down so the columns never align

```css
.noirTracks { display: grid; gap: clamp(2rem,5vw,5rem); grid-template-columns: 1fr;
  padding: clamp(4rem,10vh,9rem) var(--gutter); }
@media (min-width: 820px) { .noirTracks { grid-template-columns: 1fr 1fr; }
  .noirTracks > :nth-child(2) { margin-top: 14vh; } }   /* the deliberate misalignment */
/* entrance: camera-shots #7 split diopter open */
.noirTracks > :nth-child(1) { clip-path: inset(0 100% 0 0); }
.noirTracks > :nth-child(2) { clip-path: inset(0 0 0 100%); }
.noirTracks.is-in > * { clip-path: inset(0); transition: clip-path 1.2s cubic-bezier(.22,1,.36,1); }
/* interaction: #24 accordion unfold */
.noirRow > div { max-height: 0; overflow: hidden; opacity: 0;
  transition: max-height .6s cubic-bezier(.4,0,.2,1), opacity .4s .1s; }
.noirRow[data-open="true"] > div { max-height: 12rem; opacity: 1; }
```

### Scene 4 — Suara
- Beat B10 · Function `Scroll Story #41` · Archetype `SS-3 Progressive Reveal`
- Entrance: `line-mask-ascend` — **interaction-effects #40 Split line reveal**. *Substituted for the storyboard's #6 Rack focus:* #6 is `filter: blur(20px)`, and blur is forbidden by this page's own framing discipline. #40 is clip-based and reaches the same "arriving into legibility" result.
- Interaction: subordinate — lines resolve one at a time
- Composition: `compositions #27 Narrow column`

```css
.noirLine { overflow: hidden; }
.noirLine > span { display: block; transform: translateY(105%);
  transition: transform .7s cubic-bezier(.22,1,.36,1);
  transition-delay: calc(var(--i) * .09s); }
.noirVoice.is-in .noirLine > span { transform: translateY(0); }
```

### Scene 5 — Berkas
- Beat B8 · Function `Article Grid #1` · Archetype `AG-4 Masonry Evidence Wall`, deliberately unequal sizes
- Entrance: `jump-cut-stagger` — **camera-shots #20** (showy reveal 2/2). This is the page's only `opacity + translateY`.
- Interaction: `interaction-effects #4 Depth-of-field pop`, **adapted** — the library dims siblings with `blur()`; blur is banned here, so the hovered file gains luminance and its siblings lose it. Pure CSS, no JS.
- Composition: archive wall — the one section allowed to leave the corridor family

```css
.noirWall { display: grid; gap: 1px; background: var(--ash);
  grid-template-columns: repeat(6, 1fr); padding: 1px; }
.noirFile { background: var(--bitumen); padding: clamp(1.25rem,2.5vw,2.25rem);
  opacity: 0; transform: translateY(20px); transition: opacity .3s, transform .3s, background .35s, color .35s; }
.noirWall.is-in .noirFile { opacity: 1; transform: none; }
.noirWall.is-in .noirFile:nth-child(1){transition-delay:0s}
.noirWall.is-in .noirFile:nth-child(2){transition-delay:.05s}
.noirWall.is-in .noirFile:nth-child(3){transition-delay:.1s}
.noirWall.is-in .noirFile:nth-child(4){transition-delay:.15s}
.noirWall.is-in .noirFile:nth-child(5){transition-delay:.2s}
/* unequal spans — never a 5-across equal grid */
.noirFile:nth-child(1){grid-column:span 3} .noirFile:nth-child(2){grid-column:span 3}
.noirFile:nth-child(3){grid-column:span 2} .noirFile:nth-child(4){grid-column:span 2}
.noirFile:nth-child(5){grid-column:span 2}
@media (max-width:820px){ .noirWall{grid-template-columns:1fr} .noirFile{grid-column:span 1 !important} }
/* #4 adapted: light one, shadow the rest */
.noirWall:hover .noirFile { color: var(--smoke); }
.noirWall:hover .noirFile:hover { background: var(--slate); color: var(--chalk); }
```

### Scene 6 — (empty)
- Beat B19 · Function `Visual Break #39` · Archetype `VB-4 Empty Space`
- Entrance: **none** — it is already empty; nothing arrives
- Interaction: **none**
- Visual: grain only

```css
.noirHold { min-height: 78svh; display: grid; align-items: end;
  padding: 0 var(--gutter) clamp(4rem,12vh,10rem); }
.noirHold p { margin-left: calc(var(--spine) + 6vw); max-width: 34ch;
  font: 300 .95rem/1.85 var(--font-display); color: var(--smoke); }
```

### Scene 7 — Putusan
- Beat B20 · Function `Newsletter/CTA #32` · Archetype `NC-6 Minimal Single Line`
- Entrance: `highlight-wipe` — **interaction-effects #41**, recoloured from the library's `#ffd700` to chalk
- Interaction: the link is the only interactive element in frame
- Composition: one line on the spine

```css
.noirVerdict { min-height: 62svh; display: grid; align-items: center; padding-inline: var(--gutter); }
.noirSweep { background-image: linear-gradient(90deg, var(--chalk) 50%, transparent 50%);
  background-size: 200% 100%; background-position: 100% 0;
  -webkit-background-clip: text; background-clip: text; color: transparent;
  transition: background-position 1.1s cubic-bezier(.22,1,.36,1); }
.noirVerdict.is-in .noirSweep { background-position: 0 0; }
```

### Scene 8 — Footer
- Beat B22 · Function `Footer #48` · Archetype `FT-2 Minimal Single Row`
- Entrance: **none** · Interaction: underline only
- Composition: bottom letterbox bar mirroring Scene 1 — the frame closes (B24 The Loop, quietly)

## External Library Decision

### Q1: What is the core motion experience of this page?
Pointer-driven occlusion of type, plus seven scroll-triggered entrances. No 3D, no shaders, no particles, no page transitions.

### Q2: Can the native library entries do it?
Yes — no external library. Every effect resolves to `clip-path`, `background-position`, `transform`, or a hard-stop `radial-gradient`. Scroll triggers use one shared `IntersectionObserver`; the hero light uses one `pointermove` listener. Adding GSAP or Framer Motion for this would be pure weight.

### Q3: If an external library is used, why this one…?
n/a.

### Decision
**No external library. Native effects only.** Total added JS ≈ 40 lines.

## Shared System
*(derived last, after both signature compositions were locked)*

- **Navigation:** metadata inside the top letterbox bar. No floating bar, no backdrop blur, no background of its own.
- **Footer:** the bottom bar. Same type treatment as the nav — the frame closes where it opened.
- **Spacing rhythm:** deliberately irregular. Section min-heights `100svh / 92 / auto / auto / auto / 78 / 62 / bar`. No repeating vertical module.
- **Typography system:** Jost 200/300/500 for Latin; Noto Serif JP (already loaded) for Japanese. Two sizes only at the extremes — display `clamp(3.5rem,12vw,11rem)` and label `11px/.22em` — with `.95–1.05rem` body between. No intermediate heading scale.
- **Utility primitives:** `.is-in` (single IntersectionObserver), `--spine`, `--gutter`, `--bar`.
- **Repeated motifs allowed:** grain, spine alignment, bar metadata type, hard-edge light geometry.
- **Uniqueness check:** shares no composition, entrance, palette, or shell trait with the live homepage.

## Isolation Requirements (project-specific, mandatory)

1. `app/layout.tsx` renders `<AmbientEffects />` into `<body>` — **falling sakura petals, maple leaves and fireflies**. These would appear over the noir page and destroy the film language. Suppress with one scoped rule rather than restructuring layouts:
   `body:has(.noirRoot) .fx-layer { display: none; }`
2. The site's tokens flip with `html.dark`. The noir page must be permanently dark, so `.noirRoot` defines its **own** token set and must not reference `--paper`, `--ink`, `--text`, or any theme-flipping variable.

## Phase 3 Quality Check
- [x] Every section has complete layout CSS
- [x] Every section has complete entrance behaviour
- [x] Every section has complete interaction behaviour or an intentional `none`
- [x] JS-required effect (#37) includes complete JS
- [x] Entrance variety rules pass — 6 distinct types, none adjacent-repeating
- [x] `fadeUp` appears once (Scene 5), limit is 2
- [x] External Library Decision block complete
- [x] Library source ids present for all major moves, with three deviations explicitly marked `Custom`/`adapted` and justified

## Derived Global Tokens

```css
.noirRoot {
  --pitch:    #050506;   /* letterbox bars, shadow fill */
  --bitumen:  #08080a;   /* page ground */
  --slate:    #14161a;   /* surface step 1 */
  --ash:      #24272d;   /* surface step 2, hairlines */
  --smoke:    #4a4f57;   /* de-emphasised text */
  --silver:   #9aa0a8;   /* secondary text */
  --chalk:    #e8e6e1;   /* primary text — warm, never #fff */
  --mark:     #c8102e;   /* brand red. 3 uses on the page, no more */
  --gas:      #c9963c;   /* gaslight tint, ≤8% opacity, inside light only */
  --spine:    38%;
  --gutter:   clamp(1.25rem, 6vw, 6rem);
  --bar:      clamp(48px, 7svh, 76px);
  --font-display: var(--font-jost), ui-sans-serif, system-ui, sans-serif;
  --font-jp:      var(--font-noto-serif-jp), serif;
}
```
