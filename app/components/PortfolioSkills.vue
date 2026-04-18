<script setup>
const skillGroups = [
  {
    category: 'Frontend',
    icon: '◈',
    skills: [
      { name: 'TypeScript', level: 95 },
      { name: 'Vue / Nuxt', level: 92 },
      { name: 'React / Next', level: 85 },
      { name: 'CSS / Animation', level: 88 }
    ]
  },
  {
    category: 'Backend',
    icon: '◎',
    skills: [
      { name: 'Node.js', level: 93 },
      { name: 'Go', level: 80 },
      { name: 'PostgreSQL', level: 88 },
      { name: 'Redis', level: 82 }
    ]
  },
  {
    category: 'Infrastructure',
    icon: '◆',
    skills: [
      { name: 'AWS / CDK', level: 85 },
      { name: 'Docker', level: 90 },
      { name: 'Kubernetes', level: 72 },
      { name: 'CI/CD', level: 88 }
    ]
  },
  {
    category: 'Craft',
    icon: '◇',
    skills: [
      { name: 'Architecture', level: 88 },
      { name: 'Code Review', level: 94 },
      { name: 'Documentation', level: 90 },
      { name: 'Mentorship', level: 85 }
    ]
  }
]

const ticker = ['PHP', 'Laravel', 'TypeScript', 'Vue', 'Nuxt', 'Node.js', 'Go', 'PostgreSQL', 'Docker', 'CI/CD', 'REST', 'WebSockets', 'Linux', 'Git']
</script>

<template>
  <section id="skills" class="skills-section" aria-labelledby="skills-heading">

    <!-- Scrolling ticker strip (the diagonal grid-breaker) -->
    <div class="skills-ticker" aria-hidden="true">
      <div class="ticker-track">
        <span v-for="(t, i) in [...ticker, ...ticker, ...ticker, ...ticker]" :key="`t-${i}`" class="ticker-item">
          {{ t }}<svg width="6" height="6" viewBox="0 0 6 6" fill="var(--accent)" aria-hidden="true"><polygon points="3,0 6,6 0,6"/></svg>
        </span>
      </div>
    </div>

    <div class="skills-inner">
      <div class="section-divider animate-fade-in">
        <span class="section-label">02 / skills</span>
      </div>

      <h2 id="skills-heading" class="skills-heading animate-slide-up">
        Tools of the<br />
        <span class="text-accent">trade.</span>
      </h2>

      <div class="skills-grid">
        <article
          v-for="(group, gi) in skillGroups"
          :key="group.category"
          class="skill-group animate-slide-up"
          :style="`animation-delay: ${0.1 + gi * 0.12}s`"
        >
          <header class="skill-group-header">
            <span class="skill-icon text-accent" aria-hidden="true">{{ group.icon }}</span>
            <h3 class="skill-group-name">{{ group.category }}</h3>
          </header>

          <ul class="skill-list" role="list">
            <li
              v-for="skill in group.skills"
              :key="skill.name"
              class="skill-item"
            >
              <div class="skill-meta">
                <span class="skill-name">{{ skill.name }}</span>
                <span class="skill-pct text-accent">{{ skill.level }}</span>
              </div>
              <div class="skill-bar" :aria-label="`${skill.name}: ${skill.level}%`">
                <div
                  class="skill-fill"
                  :style="`width: ${skill.level}%`"
                />
              </div>
            </li>
          </ul>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.skills-section {
  padding: 8rem 0;
  background: var(--bg-raised);
  position: relative;
  overflow: hidden;
}

/* ── Ticker strip ─────────────────────────────────────────── */
.skills-ticker {
  position: relative;
  width: 100%;
  overflow: hidden;
  padding: 0.75rem 0;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  margin-bottom: 5rem;
  background: color-mix(in srgb, var(--accent) 4%, transparent);
}

/* Diagonal tilt — the design anchor, grid-breaking element */
.skills-ticker {
  transform: rotate(-1.8deg) scaleX(1.04);
}

.ticker-track {
  display: flex;
  width: max-content;
  animation: marquee 28s linear infinite;
  will-change: transform;
}

.ticker-item {
  display: inline-flex;
  align-items: center;
  gap: 1rem;
  margin-right: 2rem; /* Consistent spacing for seamless loop */
  font-family: var(--font-mono);
  font-size: 0.75rem;
  font-weight: 600;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--text-dim);
  white-space: nowrap;
}

/* ── Inner content ─────────────────────────────────────────── */
.skills-inner {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 2rem;
}

.skills-heading {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 5.5vw, 4.5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: var(--text-bright);
  margin-bottom: 4rem;
}

/* ── Grid ───────────────────────────────────────────────── */
.skills-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1.5px;
  background: var(--border); /* border gap trick */
  border: 1px solid var(--border);
  border-radius: 4px;
  overflow: hidden;
}

.skill-group {
  background: var(--bg-raised);
  padding: 2rem;
  transition: background 0.2s;
}

.skill-group:hover {
  background: color-mix(in srgb, var(--bg-card) 80%, var(--accent-glow));
}

.skill-group-header {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 1.75rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--border);
}

.skill-icon {
  font-size: 1.1rem;
  line-height: 1;
}

.skill-group-name {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--text-dim);
}

/* ── Skills ──────────────────────────────────────────────── */
.skill-list {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  padding: 0;
  list-style: none;
}

.skill-item {
  display: flex;
  flex-direction: column;
  gap: 0.4rem;
}

.skill-meta {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}

.skill-name {
  font-family: var(--font-mono);
  font-size: 0.82rem;
  color: var(--text);
}

.skill-pct {
  font-family: var(--font-mono);
  font-size: 0.68rem;
  font-weight: 600;
  letter-spacing: 0.05em;
}

.skill-pct::after {
  content: '%';
  opacity: 0.5;
  font-size: 0.6rem;
}

.skill-bar {
  height: 3px;
  background: var(--border);
  border-radius: 2px;
  overflow: hidden;
}

.skill-fill {
  height: 100%;
  background: linear-gradient(to right, var(--accent-dim), var(--accent));
  border-radius: 2px;
  transition: width 1.2s cubic-bezier(0.22, 1, 0.36, 1);
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 720px) {
  .skills-section { padding: 5rem 0; }
  .skills-grid { grid-template-columns: 1fr; }
  .skills-heading { font-size: 2.2rem; }
}
</style>
