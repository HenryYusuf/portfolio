<script setup>
const skillGroups = [
  {
    category: 'Frontend',
    icon: '◈',
    skills: [
      { name: 'TypeScript', status: 'CORE', role: 'Type-Safe Orchestration' },
      { name: 'Vue', status: 'CORE', role: 'Reactive Frameworks' },
      { name: 'Nuxt', status: 'PROD', role: 'Server-Side Rendering' },
      { name: 'CSS / Animation', status: 'STK', role: 'Fluid Interactions' }
    ]
  },
  {
    category: 'Backend',
    icon: '◎',
    skills: [
      { name: 'PHP/Laravel', status: 'CORE', role: 'Web Application Framework' },
      { name: 'Node.js', status: 'CORE', role: 'Server Runtime' },
      { name: 'PostgreSQL', status: 'CORE', role: 'Relational Data' },
      { name: 'Go', status: 'STK', role: 'High-Performance APIs' },
    ]
  },
  {
    category: 'Infrastructure',
    icon: '◆',
    skills: [
      { name: 'Docker', status: 'CORE', role: 'Containerization' },
      { name: 'CI/CD', status: 'CORE', role: 'Delivery Pipelines' }
    ]
  },
  {
    category: 'Craft',
    icon: '◇',
    skills: [
      { name: 'Documentation', status: 'CORE', role: 'Knowledge Transfer' },
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
              <span :class="['status-tag', `status-${skill.status.toLowerCase()}`]">[ {{ skill.status }} ]</span>
              <span class="skill-name">{{ skill.name }}</span>
              <span class="leader-dots" aria-hidden="true"></span>
              <span class="skill-role">/ {{ skill.role }}</span>
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

/* ── Skills - Manifest ───────────────────────────────────── */
.skill-list {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  padding: 0;
  list-style: none;
}

.skill-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-family: var(--font-mono);
  font-size: 0.75rem;
  color: var(--text-dim);
  transition: color 0.2s;
}

.skill-item:hover {
  color: var(--text);
}

.status-tag {
  font-size: 0.6rem;
  font-weight: 600;
  letter-spacing: 0.05em;
  padding: 0.15rem 0.4rem;
  border: 1px solid var(--border);
  border-radius: 2px;
  min-width: 50px;
  text-align: center;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.status-core {
  color: var(--accent);
  border-color: color-mix(in srgb, var(--accent) 30%, transparent);
  background: color-mix(in srgb, var(--accent) 5%, transparent);
}
.status-prod {
  color: var(--text-bright);
  border-color: var(--border);
}
.status-stk {
  color: var(--text-dim);
  border-color: var(--border);
}
.status-arc {
  color: #a8b1ff;
  border-color: color-mix(in srgb, #a8b1ff 30%, transparent);
  background: color-mix(in srgb, #a8b1ff 5%, transparent);
}

.skill-item:hover .status-tag {
  border-color: var(--accent);
  box-shadow: 0 0 8px color-mix(in srgb, var(--accent) 20%, transparent);
  color: var(--accent);
}

.skill-item:hover .status-arc {
  border-color: #a8b1ff;
  box-shadow: 0 0 8px color-mix(in srgb, #a8b1ff 20%, transparent);
  color: #a8b1ff;
}

.skill-name {
  color: var(--text);
  font-weight: 500;
  white-space: nowrap;
}

.leader-dots {
  flex-grow: 1;
  min-width: 1rem;
  height: 1px;
  background-image: linear-gradient(to right, var(--text-dim) 20%, transparent 20%);
  background-size: 4px 1px;
  background-repeat: repeat-x;
  background-position: center;
  opacity: 0.3;
  transition: opacity 0.2s, background-image 0.2s;
  position: relative;
}

.skill-item:hover .leader-dots {
  opacity: 0.7;
  background-image: linear-gradient(to right, var(--accent) 20%, transparent 20%);
}

.skill-role {
  color: var(--text-dim);
  font-size: 0.7rem;
  white-space: nowrap;
  letter-spacing: 0.02em;
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 720px) {
  .skills-section { padding: 5rem 0; }
  .skills-grid { grid-template-columns: 1fr; }
  .skills-heading { font-size: 2.2rem; }
  
  .skill-item {
    gap: 0.5rem;
  }
  .status-tag {
    min-width: 44px;
    font-size: 0.55rem;
  }
  .skill-role {
    font-size: 0.65rem;
  }
}
</style>
