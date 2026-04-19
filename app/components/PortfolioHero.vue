<script setup>
const phrases = [
  'build scalable APIs.',
  'ship pixel-perfect UIs.',
  'write clean TypeScript.',
  'solve hard problems.'
]

const displayed = ref('')
const phraseIdx = ref(0)
const charIdx   = ref(0)
const deleting  = ref(false)
const done      = ref(false)

let timer = null

function tick() {
  const current = phrases[phraseIdx.value]

  if (!deleting.value) {
    displayed.value = current.slice(0, charIdx.value + 1)
    charIdx.value++

    if (charIdx.value === current.length) {
      deleting.value = true
      timer = setTimeout(tick, 1600) // pause before deleting
      return
    }
  } else {
    displayed.value = current.slice(0, charIdx.value - 1)
    charIdx.value--

    if (charIdx.value === 0) {
      deleting.value = false
      phraseIdx.value = (phraseIdx.value + 1) % phrases.length
    }
  }

  const speed = deleting.value ? 40 : 70
  timer = setTimeout(tick, speed)
}

onMounted(() => { timer = setTimeout(tick, 800) })
onUnmounted(() => clearTimeout(timer))
</script>

<template>
  <section id="hero" class="hero" aria-label="Introduction">
    <!-- Ambient vertical labels -->
    <span class="ambient-label ambient-left" aria-hidden="true">FULL-STACK</span>
    <span class="ambient-label ambient-right" aria-hidden="true">DEVELOPER</span>

    <!-- Grid lines decoration -->
    <div class="hero-grid" aria-hidden="true">
      <div v-for="i in 6" :key="i" class="grid-line" />
    </div>

    <div class="hero-content">
      <!-- Terminal prompt line -->
      <div class="terminal-prompt animate-slide-up" aria-hidden="true">
        <span class="shell-user text-accent">henry@yusuf</span>
        <span class="shell-sep text-dim">:</span>
        <span class="shell-dir text-dim">~/portfolio</span>
        <span class="shell-dollar text-accent"> $&nbsp;</span>
        <span class="shell-cmd">whoami</span>
      </div>

      <!-- Main heading -->
      <h1 class="hero-heading animate-slide-up delay-200">
        <span class="hero-name">Henry Yusuf</span>
        <br />
        <span class="hero-role">I&nbsp;</span>
        <span class="hero-typewriter text-accent">{{ displayed }}</span>
        <span class="hero-cursor text-accent animate-blink" aria-hidden="true">█</span>
      </h1>

      <!-- Sub line -->
      <p class="hero-sub animate-slide-up delay-400">
        Full-stack developer · 1 years · TypeScript, Nuxt, Go, PHP, Laravel<br />
        Building scalable and maintainable systems.
      </p>

      <!-- CTAs -->
      <div class="hero-ctas animate-slide-up delay-600">
        <a href="#projects" class="cta-primary" id="hero-projects-cta">
          View work
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
            <path d="M5 12h14M12 5l7 7-7 7"/>
          </svg>
        </a>
        <a href="#contact" class="cta-ghost" id="hero-contact-cta">
          Get in touch
        </a>
      </div>

      <!-- Status pill -->
      <div class="status-pill animate-fade-in delay-800" aria-label="Availability status">
        <span class="status-dot" />
        Available for new projects
      </div>
    </div>

    <!-- Scroll indicator -->
    <div class="scroll-hint animate-fade-in delay-800" aria-hidden="true">
      <span class="scroll-label">scroll</span>
      <div class="scroll-line" />
    </div>
  </section>
</template>

<style scoped>
.hero {
  position: relative;
  min-height: 100dvh;
  padding: 0 2rem;
  display: flex;
  align-items: center;
  overflow: hidden;
  background: var(--bg);
}

/* ── Grid decoration ─────────────────────────────────────── */
.hero-grid {
  position: absolute;
  inset: 0;
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  pointer-events: none;
  z-index: 0;
}

.grid-line {
  border-right: 1px solid color-mix(in srgb, var(--border) 40%, transparent);
}

.grid-line:first-child {
  border-left: 1px solid color-mix(in srgb, var(--border) 40%, transparent);
}

/* ── Ambient rotated labels ──────────────────────────────── */
.ambient-label {
  position: absolute;
  font-family: var(--font-display);
  font-size: clamp(4rem, 12vw, 9rem);
  font-weight: 800;
  letter-spacing: -0.04em;
  line-height: 1;
  color: color-mix(in srgb, var(--border) 60%, transparent);
  pointer-events: none;
  user-select: none;
  z-index: 0;
}

.light .ambient-label {
  color: color-mix(in srgb, var(--border) 80%, transparent);
}

.ambient-left {
  top: 50%;
  left: -3rem;
  transform: translateY(-50%) rotate(-90deg) translateX(-50%);
  transform-origin: center right;
}

.ambient-right {
  top: 50%;
  right: -3rem;
  transform: translateY(-50%) rotate(90deg) translateX(50%);
  transform-origin: center left;
}

/* ── Content ─────────────────────────────────────────────── */
.hero-content {
  position: relative;
  z-index: 1;
  max-width: 900px;
  margin: 0 auto;
  width: 100%;
  padding-top: 5rem;
}

/* ── Terminal prompt ─────────────────────────────────────── */
.terminal-prompt {
  font-family: var(--font-mono);
  font-size: clamp(0.7rem, 1.5vw, 0.85rem);
  margin-bottom: 1.5rem;
  opacity: 0.85;
}

.shell-user { font-weight: 600; }
.shell-cmd  { color: var(--text-dim); }

/* ── Heading ──────────────────────────────────────────────── */
.hero-heading {
  font-family: var(--font-display);
  font-size: clamp(3rem, 9vw, 7.5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.05;
  color: var(--text-bright);
  margin-bottom: 1.5rem;
}

.hero-name {
  /* break the pattern — slightly dimmer than the role */
  color: color-mix(in srgb, var(--text-bright) 70%, var(--text));
}

.hero-role {
  color: var(--text-bright);
}

.hero-typewriter {
  min-width: 2ch;
  display: inline;
}

.hero-cursor {
  display: inline;
  font-size: 0.85em;
  margin-left: 1px;
  vertical-align: baseline;
}

/* ── Sub ────────────────────────────────────────────────── */
.hero-sub {
  font-family: var(--font-mono);
  font-size: clamp(0.8rem, 1.6vw, 0.95rem);
  color: var(--text-dim);
  line-height: 1.8;
  margin-bottom: 2.5rem;
}

/* ── CTAs ──────────────────────────────────────────────── */
.hero-ctas {
  display: flex;
  align-items: center;
  gap: 1rem;
  flex-wrap: wrap;
  margin-bottom: 2rem;
}

.cta-primary {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-family: var(--font-mono);
  font-size: 0.85rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  color: var(--bg);
  background: var(--accent);
  padding: 0.75rem 1.75rem;
  border: 2px solid var(--accent);
  border-radius: 2px;
  text-decoration: none;
  transition: background 0.2s, color 0.2s, box-shadow 0.2s;
  box-shadow: 0 0 0 0 var(--accent-glow);
}

.cta-primary:hover {
  background: transparent;
  color: var(--accent);
  box-shadow: 0 0 24px var(--accent-glow);
}

.cta-ghost {
  display: inline-flex;
  align-items: center;
  font-family: var(--font-mono);
  font-size: 0.85rem;
  font-weight: 500;
  letter-spacing: 0.04em;
  color: var(--text-dim);
  padding: 0.75rem 1.75rem;
  border: 1px solid var(--border);
  border-radius: 2px;
  text-decoration: none;
  transition: color 0.2s, border-color 0.2s;
}

.cta-ghost:hover {
  color: var(--text-bright);
  border-color: var(--text-dim);
}

/* ── Status pill ────────────────────────────────────────── */
.status-pill {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-family: var(--font-mono);
  font-size: 0.72rem;
  color: color-mix(in srgb, var(--accent) 80%, var(--text-dim));
  background: var(--accent-glow);
  border: 1px solid color-mix(in srgb, var(--accent) 30%, transparent);
  padding: 0.35rem 0.85rem;
  border-radius: 100px;
  letter-spacing: 0.04em;
}

.status-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%       { opacity: 0.5; transform: scale(0.7); }
}

/* ── Scroll hint ────────────────────────────────────────── */
.scroll-hint {
  position: absolute;
  bottom: 2rem;
  left: 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.scroll-label {
  font-family: var(--font-mono);
  font-size: 0.6rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--text-muted);
  writing-mode: vertical-lr;
}

.scroll-line {
  width: 1px;
  height: 3rem;
  background: linear-gradient(to bottom, var(--accent), transparent);
  animation: scroll-pulse 2s ease-in-out infinite;
}

@keyframes scroll-pulse {
  0%   { transform: scaleY(0); transform-origin: top; }
  50%  { transform: scaleY(1); transform-origin: top; }
  51%  { transform: scaleY(1); transform-origin: bottom; }
  100% { transform: scaleY(0); transform-origin: bottom; }
}

/* ── Light mode adjustments ──────────────────────────────── */
.light .hero-grid .grid-line {
  border-color: color-mix(in srgb, var(--border) 60%, transparent);
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 768px) {
  .hero { padding: 0 1.25rem; }
  .scroll-hint { display: none; }
  .ambient-left, .ambient-right { font-size: 3rem; opacity: 0.4; }
}
</style>
