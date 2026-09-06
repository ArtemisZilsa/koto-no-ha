# Director's Treatment

## Anti-Convergence — Film Selection Reasoning

**Q1. What specific visual problem does this film solve for this niche?**
*M* opens by letting a man's shadow fall across a wanted poster until the shadow **swallows the printed text**. That is a concrete cinematographic mechanic — hard-edged occlusion of legible type — and it is the exact visual problem a language platform has: how do you *show* the state of not being able to read? Not "it feels premium." A specific shot solving a specific problem.

**Q2. Would this film work equally well for three unrelated niches?**
No. Shadow-over-text is only meaningful where reading *is* the product. On a fintech, architecture, or fashion site the same device is decoration. It is a literacy mechanic, and it earns its place only here.

**Q3. Am I picking the film or its reputation?**
The reasoning is built from two named scenes — the opening poster shadow, and the empty stairwell / untouched plate — not from "*M* is a famous noir." The reputation is irrelevant to every decision below.

Selection stands.

## Director Brief

- **Visual thesis:** A word you cannot read is a word in shadow. This page is a dark street where light falls on language one piece at a time.
- **Signature technique 1 — Shadow swallows the words.** Hard-edged shadow genuinely occludes type; light genuinely restores it. Implemented as the page's single heavy interaction, never as decoration.
- **Signature technique 2 — Precise geometry whose balance is a trap.** Everything aligns to one off-centre vertical spine, then breaks it once per section. No comfortable centring anywhere on the page.
- **Signature technique 3 — Empty space as the event.** One section is almost entirely black with a single line in it, and that emptiness carries the page's most important sentence.
- **Motion rules:** Stillness is the default. One heavy interaction (hero light), two attention-seeking reveals (split-diopter open, jump-cut stagger). Every other entrance is quiet. No looping ambient animation anywhere. `prefers-reduced-motion` resolves every effect to a legible static state — the hero shadow parks at a position where all text is readable.
- **Typography rules:** Latin display in **Jost** — a geometric grotesque drawn from Futura, the Weimar-era type contemporary with the film, which makes it a period-correct choice rather than a stylistic guess. Japanese in **Shippori Mincho**, a serif whose vertical stress carries the same engraved authority as the chalk mark. Chalk white `#e8e6e1` on bituminous black; tracking tight on display, open on the small uppercase labels that live in the letterbox bars.

## Site Cinematic Grammar

- **Page-shell logic:** Corridor. The page is one continuous descent, not a stack of panels. Section boundaries are defined by where light stops, never by a container edge, a card, or a horizontal rule.
- **Navigation posture:** Nav lives **inside the top letterbox bar** as small tracked uppercase metadata. It does not float, does not blur, does not have a background of its own — the bar *is* its background. This is the sharpest break from the live site's floating glass nav.
- **Framing discipline:** One off-centre vertical spine at 38% viewport width on desktop. Every element either hangs from the spine or deliberately crosses it. Light shapes are `clip-path` polygons — straight edges only. No curve, no blur, no radius above 2px, anywhere.
- **Density cadence:** Deliberately irregular. Dense → sparse → dense → near-empty. Section heights are unequal by design; a corridor has no metronome.
- **Recurring material layers:** (1) SVG `feTurbulence` film grain at low opacity across the whole page; (2) a single gaslight-amber light tint at ≤8% inside light shafts only; (3) matte unlit surfaces — nothing glossy, nothing glass.
- **Allowed composition families:** corridor (primary), archive wall (evidence section only).
- **What may repeat:** grain layer, spine alignment, letterbox bar metadata type, hard-edge light geometry.
- **What must vary section to section:** entrance behaviour, density, light origin angle, and whether the spine is honoured or crossed.
- **Demo uniqueness guardrail:** inherits nothing from the live homepage's shell — no left-copy/right-object hero, no pill badge, no rounded glass card, no aurora, no fadeUp default, no paper ground. See the shell-ban list in `decisions.md`.

## Page Narrative Arc

Director: **Fritz Lang**
Arc variant: **built from universal beats — the library has no Lang template**, so beats were selected from the 25 universal types and ordered to *M*'s own structure (the mark → the absence → the two hunts → identification → the dossier → the pause → judgment). Hash variant `1` (site-name hash `434663287 % 3`).
Hero archetype: **#4 Letterbox Cinema**, selected by site-name hash over the Lang-compatible pool `[#1, #4, #7, #10, #18, #19]` → index 1. This overrode the obvious instinct (#10 Single Word), and it is the better result: *M* was shot in near-Academy ratio, so a hard letterbox frame is the film's literal format rather than a mood.
Beat count: **8**

| # | Beat | → Function | → Archetype | Director justification |
|---|------|-----------|-------------|------------------------|
| 1 | B1 Cold Open | Hero | #4 Letterbox Cinema | *M* opens on a counting rhyme and a shadow, with zero exposition. No context, maximum unease |
| 2 | B18 The Confrontation | Quote / Pullquote #40 | QP-1 Full-Screen Monument | Lang's untouched plate: the loss is stated by what is absent from the frame, not narrated |
| 3 | B15 Parallel Stories | Category Map #15 | CM-4 Accordion / Expandable List | The police hunt and the underworld hunt run in parallel and never merge — Lang cross-cuts, he does not resolve |
| 4 | B10 Deep Dive | Scroll Story #41 | SS-3 Progressive Reveal | The whistled leitmotif — a man identified by sound before he is seen |
| 5 | B8 Evidence Wall | Article Grid #1 | AG-4 Masonry Evidence Wall | The case-file sequence: evidence in overwhelming quantity, laid out for a verdict |
| 6 | B19 Quiet Moment | Visual Break #39 | VB-4 Empty Space | The empty stairwell. Lang holds on nothing and lets it mean something |
| 7 | B20 The Invitation | Newsletter / CTA #32 | NC-6 Minimal Single Line | Judgment arrives as one sentence, not as a sales pitch |
| 8 | B22 The Farewell | Footer #48 | FT-2 Minimal Single Row | Respect the ending. Stop |

### Page: Home (`/noir`)

- **Page-role scene:** The opening reel. The whole film in one descent.
- **Page scene thesis:** A street at night where every word not yet learned is standing in shadow, and the visitor is handed the light.
- **One big idea:** **Light reveals language.** One mechanic, stated in the hero, echoed structurally by every section that follows.
- **Hero dominance statement:** A single Japanese word fills a hard letterbox frame, half-consumed by a shadow the visitor can physically move — the page withholds meaning until the reader acts, which no gradient hero can do.
- **Restraint statement:** No imagery, no video, no ambient loop, no scroll-jacking, no counters, no testimonials, no logo wall. The brand red appears **at most three times on the entire page**. Roughly a third of the page's total height is intentionally close to empty.
- **Material thesis:** Matte, unlit, granular. Everything is either bitumen (unlit surface), chalk (type), or light (a hard-edged polygon). Three materials, no fourth.
- **Typography thesis:** Type is the only ornament, so it carries all the authority. Jost's geometry gives Weimar-period correctness; Shippori Mincho gives the Japanese the weight of something engraved rather than rendered. Scale contrast is extreme — 12vw display against 11px tracked labels, with almost nothing in between.
- **Narrative arc:** the mark → the absence → the two hunts → identification by sound → the dossier → the pause → judgment → stop.
- **Signature composition:** **The occluded word inside a letterbox frame, with a movable hard-edged shadow.** The frame is fixed; the shadow is not. Meaning is a function of where the light is.
- **Grid fallback test:** Reduced to a generic card grid, the page loses its entire argument — the shadow needs an uninterrupted field to travel across, and card boundaries would chop the light into unrelated rectangles. The mechanic *cannot* survive a grid, which is the proof it is load-bearing rather than decorative.
- **Shared system holdback:** navigation, footer, spacing rhythm, and the token set are all deferred to Phase 3 and derived only after the hero and evidence-wall compositions are locked.
- **UI exposure guardrail:** the words *noir*, *Lang*, *M*, *chapter*, *director*, *film*, *scene*, and *treatment* never appear in the rendered interface. The film stays in these working files.
- **What this page must not inherit from previous demos:** every item on the shell-ban list in `decisions.md`.
- **Section sequence:** Tanda → Yang Hilang → Dua Jalur → Suara → Berkas → (empty) → Putusan → Footer

---

### Scene 1 — Tanda (the mark)
- Beat: B1 Cold Open
- Function: Hero
- Archetype: #4 Letterbox Cinema — 4:3-era light chamber inside 1.85:1 bars, nav metadata in the top bar
- Composition ref: hard letterbox frame; word set on the spine; light origin upper-left, held for the whole page
- Camera ref: #10 Curtain wipe — the bars open from centre like an aperture
- Interaction ref: **HEAVY** — pointer/scroll-driven hard-edged shadow that genuinely occludes the word. Touch devices get one slow automatic sweep; reduced-motion parks it readable
- Visual elements: #26 Thin Divider Line, #30 Corner Bracket Frames, #19 Noise Particle Field (grain)
- Copy: 言の葉 / *kotonoha* / "kata-kata" · lower-third: *Setiap kata yang belum kamu kenal masih berada dalam bayangan.*
- Why this exists: it states the entire thesis in one gesture before a single feature is named

### Scene 2 — Yang Hilang (what is missing)
- Beat: B18 The Confrontation
- Function: Quote / Pullquote #40
- Archetype: QP-1 Full-Screen Monument
- Composition ref: viewport fill, single line held off-spine, ~85% of the frame empty
- Camera ref: #2 Fade from black — 3s, the slowest entrance on the page
- Interaction ref: **none**, intentional
- Visual elements: #26 Thin Divider Line only
- Copy: *Kamu bisa mendengar seluruh kalimatnya — dan tetap tidak tahu apa yang diminta.*
- Why this exists: Lang's absence principle, and the only moment the page speaks to the reader's actual experience

### Scene 3 — Dua Jalur (two hunts)
- Beat: B15 Parallel Stories
- Function: Category Map #15
- Archetype: CM-4 Accordion / Expandable List, run as **two parallel dossier columns at staggered vertical offsets** so it never resolves into a 2×N grid
- Composition ref: 50/50 split crossing the spine; right column offset downward so the columns never align
- Camera ref: #7 Split diopter open — columns enter from opposite edges simultaneously (**showy reveal 1 of 2**)
- Interaction ref: #24 Accordion unfold, click to open one row at a time
- Visual elements: #26 Thin Divider Line, #30 Corner Bracket Frames
- Copy: *Jalur Ujian* (JLPT N5→N1: kosakata, kanji, tata bahasa, dokkai) · *Jalur Kerja* (SSW / Tokutei Ginou: 14 bidang, kosakata khusus, kaiwa tempat kerja)
- Why this exists: two investigations that never merge — and structurally honest, because these really are two separate reasons Indonesians learn Japanese

### Scene 4 — Suara (identified by sound)
- Beat: B10 Deep Dive
- Function: Scroll Story #41
- Archetype: SS-3 Progressive Reveal — background transforms as the section is read
- Composition ref: narrow column hard against the spine; light shifts origin as the dialogue advances
- Camera ref: #6 Rack focus reveal
- Interaction ref: subordinate — dialogue lines resolve one at a time on scroll
- Visual elements: #26 Thin Divider Line, grain
- Copy: kaiwa. **Honest framing required** — audio is synthesised, never described as native-speaker recording (carries forward the live site's "copy jujur" correction)
- Why this exists: the whistled leitmotif — recognition arriving through the ear before the eye

### Scene 5 — Berkas (the dossier)
- Beat: B8 Evidence Wall
- Function: Article Grid #1
- Archetype: AG-4 Masonry Evidence Wall — five case files, **deliberately unequal sizes**, no radius, no shadow
- Composition ref: archive wall (the one section permitted to leave the corridor family); pinned-evidence logic, not a card grid
- Camera ref: #20 Jump cut stagger (**showy reveal 2 of 2**)
- Interaction ref: hover raises the light on one file and drops the others into shadow — the page mechanic reused as navigation
- Visual elements: #30 Corner Bracket Frames, #26 Thin Divider Line, grain
- Copy: N5 · N4 · N3 · N2 · N1. **Every number must be verified against Supabase before shipping** — no fabricated counts
- Why this exists: density after sparseness, and the only place the page makes a quantitative claim

### Scene 6 — (empty)
- Beat: B19 Quiet Moment
- Function: Visual Break #39
- Archetype: VB-4 Empty Space
- Composition ref: near-black full viewport, one small line low and off-spine
- Camera ref: **none** — it is already empty; nothing arrives
- Interaction ref: **none**
- Visual elements: grain only
- Copy: *Dibuat satu orang, pelan-pelan. Yang belum ada, belum ada.*
- Why this exists: the empty stairwell. It is also the page's honesty, placed where it cannot be skimmed past

### Scene 7 — Putusan (the verdict)
- Beat: B20 The Invitation
- Function: Newsletter / CTA #32
- Archetype: NC-6 Minimal Single Line
- Composition ref: one line on the spine, one action, nothing else in frame
- Camera ref: a single light sweep left→right across the line
- Interaction ref: the button is the only interactive element in view
- Visual elements: #26 Thin Divider Line — brand red permitted here (use 2 of 3)
- Copy: *Mulai dari N5.* → `/learn`
- Why this exists: judgment as one sentence, not a pitch

### Scene 8 — Footer
- Beat: B22 The Farewell
- Function: Footer #48
- Archetype: FT-2 Minimal Single Row
- Composition ref: bottom letterbox bar, mirroring the nav bar in Scene 1 — the frame closes
- Camera ref: **none**
- Interaction ref: link underline only
- Visual elements: #26 Thin Divider Line
- Why this exists: B24 The Loop, quietly — the page ends inside the same frame it opened in

## Prestige Calibration Check

1. **What is remembered after 3 seconds?** A Japanese word half-eaten by a shadow that moves when you do.
2. **What is intentionally absent?** Imagery, testimonials, counters, gradients, glass, radius, ambient motion.
3. **Which detail makes it expensive?** Light direction held consistently across all eight scenes. It is invisible and it is the whole difference.
4. **Remove 30% of effects — stronger?** Already applied: an ambient dust-mote layer and a section-index scrubber were cut in this pass.
5. **Own scene or weaker copy of the homepage?** Different shell family entirely; shares no composition with the live site.
6. **Still directed with neutral palette and type?** Yes — the occlusion mechanic, the irregular cadence, and the off-centre spine survive a full greyscale strip.
7. **Turned into a 2×2 grid, what breaks?** The shadow's travel path. The mechanic cannot exist inside card boundaries.
8. **Reads as a standalone poster before the shared system?** Yes — Scene 1 is a complete poster on its own.
9. **Styling stripped, too close to the previous demo?** No. Panel stack vs. corridor; the wireframes do not resemble each other.
