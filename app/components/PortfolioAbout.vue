<template>
  <section id="about" class="about-section" aria-labelledby="about-heading">
    <div class="about-inner">

      <!-- Left: identity block -->
      <div class="about-identity animate-slide-in-left">
        <!-- Avatar -->
        <div class="avatar-frame" aria-hidden="true">
          <div class="avatar-image">
            <svg viewBox="0 0 160 160" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
              <!-- Abstract developer portrait placeholder -->
              <rect width="160" height="160" fill="var(--bg-card)"/>
              <!-- Head -->
              <ellipse cx="80" cy="62" rx="32" ry="34" fill="var(--surface-raised, #1c2426)"/>
              <!-- Shoulders -->
              <path d="M20 140 C20 100 50 90 80 90 C110 90 140 100 140 140Z"
                fill="var(--surface-raised, #1c2426)"/>
              <!-- Eye details -->
              <ellipse cx="68" cy="58" rx="4" ry="5" fill="var(--accent)" opacity="0.9"/>
              <ellipse cx="92" cy="58" rx="4" ry="5" fill="var(--accent)" opacity="0.9"/>
              <!-- Terminal lines on shirt -->
              <rect x="58" y="106" width="44" height="2" rx="1" fill="var(--accent)" opacity="0.4"/>
              <rect x="62" y="114" width="36" height="2" rx="1" fill="var(--accent)" opacity="0.25"/>
              <rect x="66" y="122" width="28" height="2" rx="1" fill="var(--accent)" opacity="0.15"/>
            </svg>
          </div>
          <div class="avatar-ring" aria-hidden="true" />
        </div>

        <!-- Name card -->
        <div class="name-card">
          <div class="name-tag">
            <span class="name-tag-label">name</span>
            <span class="name-tag-value">Henry Yusuf</span>
          </div>
          <div class="name-tag">
            <span class="name-tag-label">role</span>
            <span class="name-tag-value text-accent">Full-Stack Dev</span>
          </div>
          <div class="name-tag">
            <span class="name-tag-label">base</span>
            <span class="name-tag-value">Trenggalek, ID</span>
          </div>
          <div class="name-tag">
            <span class="name-tag-label">yrs</span>
            <span class="name-tag-value">1+</span>
          </div>
        </div>
      </div>

      <!-- Right: copy -->
      <div class="about-copy">
        <div class="section-divider animate-fade-in">
          <span class="section-label">01 / about</span>
        </div>

        <h2 id="about-heading" class="about-heading animate-slide-up">
          Craft matters.<br />
          <em class="heading-em">Always has.</em>
        </h2>

        <div class="about-body animate-slide-up delay-200">
          <p>
            I build the systems behind the experiences — APIs that don't fall over, pipelines
            that don't leak money, and interfaces that don't lie to their users.
          </p>
          <p>
            One year across agency, startup, and scale-up environments. I've shipped
            fintech dashboards, real-time logistics platforms, and developer tooling
            used by thousands. I care about <em>the seams</em> as much as the surfaces.
          </p>
          <p>
            When I'm not writing code, I'm writing about it — or teaching it.
            Precision is non-negotiable.
          </p>
        </div>

        <!-- Highlights strip -->
        <div class="about-highlights animate-fade-in delay-400">
          <div
            v-for="(stat, i) in stats"
            :key="stat.label"
            class="stat-item"
            :style="`animation-delay: ${0.4 + i * 0.1}s`"
          >
            <div class="stat-value text-accent">{{ stat.value }}</div>
            <div class="stat-label">{{ stat.label }}</div>
          </div>
        </div>
      </div>

    </div>
  </section>
</template>

<script setup>
const stats = [
  { value: '1+',   label: 'Years exp.' },
  { value: '2+',  label: 'Projects shipped' },
  { value: '3',   label: 'Clients' },
  { value: '∞',    label: 'Coffee consumed' }
]
</script>

<style scoped>
.about-section {
  padding: 8rem 2rem;
  background: var(--bg);
  position: relative;
  overflow: hidden;
}

/* Faint diagonal stripe */
.about-section::before {
  content: '';
  position: absolute;
  top: 0;
  right: -10%;
  width: 45%;
  height: 100%;
  background: linear-gradient(
    135deg,
    transparent 0%,
    color-mix(in srgb, var(--accent) 3%, transparent) 50%,
    transparent 100%
  );
  pointer-events: none;
}

.about-inner {
  max-width: 1100px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 320px 1fr;
  gap: 6rem;
  align-items: start;
}

/* ── Identity left ──────────────────────────────────────── */
.about-identity {
  position: sticky;
  top: 5rem;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

/* Avatar */
.avatar-frame {
  position: relative;
  width: 180px;
}

.avatar-image {
  width: 150px;
  height: 150px;
  border-radius: 4px;
  overflow: hidden;
  border: 1px solid var(--border);
}

.avatar-image svg {
  width: 100%;
  height: 100%;
}

.avatar-ring {
  position: absolute;
  top: 12px;
  left: 12px;
  width: 150px;
  height: 150px;
  border: 1px solid color-mix(in srgb, var(--accent) 50%, transparent);
  border-radius: 4px;
  z-index: -1;
}

/* Name card */
.name-card {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 1.25rem;
  font-family: var(--font-mono);
}

.name-tag {
  display: flex;
  align-items: baseline;
  gap: 1rem;
  font-size: 0.78rem;
}

.name-tag-label {
  color: var(--text-muted);
  font-size: 0.7rem;
  letter-spacing: 0.1em;
  min-width: 3.5rem;
}

.name-tag-value {
  color: var(--text);
  font-weight: 500;
}

/* ── Copy right ─────────────────────────────────────────── */
.about-copy {
  padding-top: 0.25rem;
}

.about-heading {
  font-family: var(--font-display);
  font-size: clamp(2.2rem, 5vw, 4rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: var(--text-bright);
  margin-bottom: 2rem;
}

.heading-em {
  font-style: italic;
  color: var(--accent);
  font-weight: 400;
}

.about-body {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  font-family: var(--font-mono);
  font-size: clamp(0.82rem, 1.4vw, 0.9rem);
  color: var(--text-dim);
  line-height: 1.85;
  margin-bottom: 3rem;
}

.about-body em {
  color: var(--text);
  font-style: normal;
  font-weight: 600;
}

/* Stats strip */
.about-highlights {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 0;
  border: 1px solid var(--border);
  border-radius: 4px;
  overflow: hidden;
}

.stat-item {
  padding: 1.25rem 1rem;
  text-align: center;
  border-right: 1px solid var(--border);
  transition: background 0.2s;
}

.stat-item:last-child {
  border-right: none;
}

.stat-item:hover {
  background: var(--accent-glow);
}

.stat-value {
  font-family: var(--font-display);
  font-size: 2rem;
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1;
  margin-bottom: 0.4rem;
}

.stat-label {
  font-family: var(--font-mono);
  font-size: 0.67rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-muted);
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 900px) {
  .about-inner {
    grid-template-columns: 1fr;
    gap: 3rem;
  }

  .about-identity {
    position: static;
    flex-direction: row;
    align-items: flex-start;
    gap: 2rem;
    flex-wrap: wrap;
  }

  .about-highlights {
    grid-template-columns: repeat(2, 1fr);
  }

  .stat-item:nth-child(2) { border-right: none; }
  .stat-item:nth-child(3) { border-top: 1px solid var(--border); }
  .stat-item:nth-child(4) { border-top: 1px solid var(--border); border-right: none; }
}

@media (max-width: 480px) {
  .about-section { padding: 5rem 1.25rem; }
  .about-highlights { grid-template-columns: repeat(2, 1fr); }
}
</style>
