# Design Decisions

- Entry mode: Surprise me (director + film chosen by the skill, confirmed by research)
- Genre: Film Noir 黑色電影
- Director: Fritz Lang 🇩🇪
- Film: **M** (1931)
- Runner-up considered: Jean-Pierre Melville — *Le Samouraï* (rejected: its Japanese framing is a fabricated Bushidō epigraph, a bad foundation for a site that teaches real Japanese)
- Niche: Japanese-language learning platform for Indonesian speakers (JLPT N5–N1, kaiwa, dokkai, SSW/work-visa vocabulary)
- Pages: one — `/noir` landing page
- Major page roles: Home / landing (single role this pass)
- Image placeholders: **No.** CSS + SVG only. Light, shadow, grain and type carry the entire design.
- Copy language: Indonesian, matching the live site
- Sub-agent delegation plan: none — single page, single scene, one lead. Delegation would add coordination cost without adding coverage.

## Why this film, and not just "a noir mood"

*M* is a film about a **written character**. Its central image is a chalk letter pressed onto a coat so that a city can read a man. A site that teaches written characters gets a real conceptual bridge here, not a colour scheme.

The opening carries the second half of the bridge: Beckert's shadow falls across a wanted poster and **swallows the words**. That single frame states the product thesis of a language platform in cinema — *a word you cannot read is a word in shadow, and learning is light landing on it.* Every composition below descends from that one image.

## Demo Uniqueness Audit

- **Previous-work audit** — the live Koto no Ha homepage (`app/page.tsx`, 12 sections) establishes these recurring traits:
  - left-copy / right-object hero (copy block left, giant 学 kanji watermark right)
  - pill badge with a pulsing dot above the H1
  - washi-paper light palette (`--paper #f7f2ea`), red/gold/teal accents
  - aurora gradient blob + masked 56px dot-grid behind the hero
  - `<Reveal>` fadeUp on nearly every block — one entrance for the whole site
  - rounded glass cards, soft multi-layer shadows, generous border-radius
  - stacked full-width centred sections at an even vertical rhythm
- **Recurring traits to avoid:** centred stacked sections, rounded glass cards, soft shadows, pill badges, aurora/mesh gradients, single fadeUp entrance, warm cream paper ground.
- **Shell-ban list** (forbidden in this project):
  1. left-copy / right-object hero
  2. pill badge above the headline
  3. any `border-radius` above 2px
  4. soft or blurred drop shadows — shadows here are *hard-edged geometry*, never blur
  5. aurora / mesh / blob gradients
  6. rounded card grids of equal-size tiles
  7. fadeUp as the default entrance
  8. light paper background
- **Primary composition family:** **corridor** — the page is a descent down a lit street. Sections are pools of hard light separated by true black. Vertical continuity is the subject, not a stack of independent panels.
- **Why this family differs from the most recent output:** the live homepage is a *panel stack* — 12 self-contained centred blocks at even rhythm. A corridor has no even rhythm; it has near-dark passages and sudden lit chambers, and each section's edge is defined by where light stops, not by a container.
- **Wireframe-level uniqueness test:** strip all colour and type from both. The live homepage reduces to 12 centred rectangles with an image left/right split at the top. This page reduces to an off-centre vertical spine with asymmetric light shapes cutting across it at irregular intervals. They fail to resemble each other. Test passes.

## Research Notes

### Research Boundary
- **Film research is observational input, not a spec:** *M* is studied as cinema — how Lang lights, frames, and withholds. Its plot (a child murderer hunted by police and criminals) is never depicted, referenced, or implied in the UI. Nothing about the crime enters the page.
- **What is being translated into web language:** shadow-over-text as the central mechanic; hard-edged geometric light; negative space as meaning; overhead ordering; the parallel-search split; precise framing whose balance is deliberate.
- **What must not be flattened into product-template logic:** the light must genuinely *withhold information*, not decorate. If the shadow can be deleted without the page losing meaning, the translation failed.

### Research Sources
- Director source: [Fritz Lang — Wikipedia](https://en.wikipedia.org/wiki/Fritz_Lang)
- Film source: [M (1931 film) — Wikipedia](https://en.wikipedia.org/wiki/M_(1931_film))
- Secondary analysis: [Senses of Cinema](https://www.sensesofcinema.com/2022/cteq/m-fritz-lang-1931/) · [Offscreen](https://offscreen.com/view/m-fritz-lang-1931) · [Collider](https://collider.com/fritz-lang-m-best-noir/) · [Deep Film Analysis](https://deepfilmanalysis.com/m-1931-deep-film-analysis/)
- Niche source 1: [Awwwards — Typography winners](https://www.awwwards.com/websites/winner_category_typography/)
- Niche source 2: [10 Award-Winning Websites of 2026, Judged](https://www.hontran.dev/blog/best-award-winning-websites-2026)
- **Research quality note:** the film pass is strong — four independent analyses converge on the same visual grammar. The *niche* pass is weak: no award-winning Japanese-learning site surfaced. Recorded honestly rather than padded. The usable niche signal is that 2026 typography honours skew to Japanese editorial sites (`sakazuki`, `Nippori Seminar`) that win on confident type and restraint, not on effects or gamified SaaS UI.

### Film Palette
*M* is black-and-white, so the palette is **derived from its light behaviour**, never sampled as literal colour.

- Primary: `#08080a` bituminous black — the ground the whole page sits on
- Secondary: `#14161a` slate and `#24272d` ash — the only two surface steps that exist
- Accent: `#c8102e` — the chalk mark. Koto no Ha's existing brand red, used **at most 3 times on the page**
- Light tint: `#c9963c` at ≤8% opacity — gaslight warmth inside light shafts only, never a fill or a text colour
- Shadow: `#000000` at full opacity, hard-edged. Shadow is a *shape*, never a blur
- Text: `#e8e6e1` chalk white (warm and dusty, not `#fff`), stepping down to `#9aa0a8` silver and `#4a4f57` smoke

### Director Signatures
1. **Shadow swallows the words.** Lang opens by letting a man's shadow fall across a poster and eat its text. → Web: type that is genuinely unreadable where shadow covers it and legible where light lands. This is the page's one heavy interaction.
2. **Precise geometry whose balance is a trap.** Lang frames streets and stairwells with clean symmetry that feels wrong — clean, orderly, and suffocating. → Web: rigorous alignment to a hard spine, then one deliberate asymmetry per section. No comfortable centring.
3. **Empty space as the event.** The empty stairwell, the empty attic, the untouched plate — Lang shows absence instead of action. → Web: one section that is mostly black with a single small element, carrying real meaning rather than acting as a spacer.

### Film Translation Notes
- **Framing:** hard vertical spine, off-centre. Content hangs from it asymmetrically. Light shapes cross the spine at irregular angles via `clip-path` — straight edges only, no curves, no blur.
- **Rhythm:** irregular by design. Long dark passages, then a sudden lit chamber. Section heights deliberately unequal — a corridor has no metronome.
- **Lighting:** every light source is a hard-edged polygon with a single origin. Gaslight amber at ≤8%. One light direction held for the whole page — inconsistent light direction is the fastest way this reads as a template.
- **Space:** negative space is content. The absence section earns its emptiness.
- **Materiality:** film grain (SVG `feTurbulence`), chalk edges, matte unlit surfaces. Nothing glossy, nothing glass, nothing that catches a highlight it was not given.
- **What should stay ambiguous or restrained:** motion. Lang's dread comes from stillness broken once. Most of the page should not move. Interaction budget: **1 heavy interaction, 2 attention-seeking reveals**, everything else subordinate.

### Niche References
- URL: https://www.awwwards.com/websites/winner_category_typography/
- URL: https://www.hontran.dev/blog/best-award-winning-websites-2026

### Reference Decomposition
- **Reference A** (*M*, opening poster shot) contributes: the shadow-over-text mechanic, hard-edged light geometry, chalk-on-dark type contrast.
- **Reference B** (*M*, empty stairwell / untouched plate) contributes: negative space as a load-bearing section, permission to leave a screen almost empty.
- **Reference C** (2026 typography honours) contributes: a dimension of quality only — editorial type confidence and restraint. No layout, composition, or component borrowed.
- **What will not be copied:** the film's subject matter in any form; Sin City's single-colour-pop treatment (wrong director); Caligari's painted and skewed distortion — Lang's realism carries Expressionist DNA without warping the frame, and skewed layouts would read as costume.

### Optional Reference Site Analysis
- Section map: n/a — no reference site supplied; direction derives from the film.
- Interaction inventory: n/a
- Background techniques: n/a
- Colour and type cues: n/a
