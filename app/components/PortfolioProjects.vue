<script setup>
const projects = [
  {
    id: 'p1',
    index: '01',
    title: 'Meridian',
    tagline: 'Real-time logistics intelligence platform',
    description: 'End-to-end supply chain visibility for 3PLs. Ingests 50k+ events/min via Kafka, renders live fleet maps with WebSockets, and cuts SLA breaches by 34%.',
    stack: ['Go', 'Nuxt', 'Kafka', 'TimescaleDB', 'Kubernetes'],
    accent: '#00ff87',
    links: { demo: '#', github: '#' },
    featured: true
  },
  {
    id: 'p2',
    index: '02',
    title: 'Ledgr',
    tagline: 'Developer-first fintech reconciliation API',
    description: 'Automatic multi-currency reconciliation with audit trails. Processes £2M+ monthly. Built with a focus on correctness over performance — every calculation is verified.',
    stack: ['Node.js', 'PostgreSQL', 'Redis', 'Stripe'],
    accent: '#00ff87',
    links: { demo: '#', github: '#' }
  },
  {
    id: 'p3',
    index: '03',
    title: 'Synapse',
    tagline: 'AI-powered code review CLI',
    description: 'Git hook integration that runs static analysis + LLM critique on every commit. 400+ stars. Ships as a zero-config binary.',
    stack: ['TypeScript', 'OpenAI', 'AST', 'GitHub Actions'],
    accent: '#00ff87',
    links: { github: '#' }
  },
  {
    id: 'p4',
    index: '04',
    title: 'Arca',
    tagline: 'Self-hosted media server with edge streaming',
    description: 'Transcodes, stores, and streams personal media libraries. Adaptive bitrate via HLS, mobile-first PWA, supports S3-compatible storage.',
    stack: ['Go', 'FFmpeg', 'Vue', 'SQLite', 'AWS S3'],
    accent: '#00ff87',
    links: { github: '#' }
  }
]
</script>

<template>
  <section
    id="projects"
    class="projects-section"
    aria-labelledby="projects-heading"
  >
    <div class="projects-inner">
      <div class="section-divider animate-fade-in">
        <span class="section-label">04 / projects</span>
      </div>

      <div class="projects-header animate-slide-up">
        <h2
          id="projects-heading"
          class="projects-heading"
        >
          Things I've<br>
          <span class="text-accent">built.</span>
        </h2>
        <p class="projects-sub">
          Selected work — production systems, not toys.
        </p>
      </div>

      <!-- Featured project -->
      <article
        v-for="project in projects.filter(p => p.featured)"
        :key="project.id"
        class="featured-project animate-slide-up delay-200"
        :aria-labelledby="`project-title-${project.id}`"
      >
        <div class="featured-meta">
          <span
            class="project-index text-accent"
            aria-hidden="true"
          >{{ project.index }}</span>
          <span class="project-badge">Featured</span>
        </div>
        <div class="featured-body">
          <div class="featured-content">
            <h3
              :id="`project-title-${project.id}`"
              class="project-title featured-title"
            >
              {{ project.title }}
            </h3>
            <p class="project-tagline">
              {{ project.tagline }}
            </p>
            <p class="project-description">
              {{ project.description }}
            </p>
            <div class="project-stack">
              <span
                v-for="tech in project.stack"
                :key="tech"
                class="stack-chip"
              >{{ tech }}</span>
            </div>
            <div class="project-links">
              <a
                v-if="project.links.demo"
                :id="`${project.id}-demo`"
                :href="project.links.demo"
                class="project-link-primary"
              >
                View demo
                <svg
                  width="12"
                  height="12"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2.5"
                >
                  <path d="M5 12h14M12 5l7 7-7 7" />
                </svg>
              </a>
              <a
                v-if="project.links.github"
                :id="`${project.id}-github`"
                :href="project.links.github"
                class="project-link-ghost"
              >
                GitHub
              </a>
            </div>
          </div>
          <div
            class="featured-visual"
            aria-hidden="true"
          >
            <div class="project-mockup">
              <div class="mockup-bar">
                <span class="mockup-dot" /><span class="mockup-dot" /><span class="mockup-dot" />
              </div>
              <div class="mockup-body">
                <div class="mockup-line w-3/4" />
                <div class="mockup-line w-1/2 accent" />
                <div class="mockup-spacer" />
                <div class="mockup-line w-full" />
                <div class="mockup-line w-5/6" />
                <div class="mockup-line w-2/3 accent" />
                <div class="mockup-spacer" />
                <div class="mockup-grid">
                  <div class="mockup-card" />
                  <div class="mockup-card" />
                  <div class="mockup-card" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </article>

      <!-- Regular projects grid -->
      <div class="projects-grid">
        <article
          v-for="(project, i) in projects.filter(p => !p.featured)"
          :key="project.id"
          class="project-card animate-slide-up"
          :style="`animation-delay: ${0.3 + i * 0.12}s`"
          :aria-labelledby="`project-title-${project.id}`"
        >
          <header class="card-header">
            <span
              class="project-index text-accent"
              aria-hidden="true"
            >{{ project.index }}</span>
            <div class="card-links">
              <a
                v-if="project.links.github"
                :id="`${project.id}-gh`"
                :href="project.links.github"
                class="icon-link"
                aria-label="GitHub repository"
              >
                <svg
                  width="14"
                  height="14"
                  viewBox="0 0 24 24"
                  fill="currentColor"
                >
                  <path d="M12 0C5.374 0 0 5.373 0 12c0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23A11.509 11.509 0 0112 5.803c1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576C20.566 21.797 24 17.3 24 12c0-6.627-5.373-12-12-12z" />
                </svg>
              </a>
              <a
                v-if="project.links.demo"
                :id="`${project.id}-demo-sm`"
                :href="project.links.demo"
                class="icon-link"
                aria-label="Live demo"
              >
                <svg
                  width="14"
                  height="14"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6" />
                  <polyline points="15 3 21 3 21 9" />
                  <line
                    x1="10"
                    y1="14"
                    x2="21"
                    y2="3"
                  />
                </svg>
              </a>
            </div>
          </header>

          <h3
            :id="`project-title-${project.id}`"
            class="project-title card-title"
          >
            {{ project.title }}
          </h3>
          <p class="project-tagline">
            {{ project.tagline }}
          </p>
          <p class="project-description card-desc">
            {{ project.description }}
          </p>

          <footer class="card-footer">
            <div class="project-stack">
              <span
                v-for="tech in project.stack.slice(0, 3)"
                :key="tech"
                class="stack-chip"
              >{{ tech }}</span>
              <span
                v-if="project.stack.length > 3"
                class="stack-chip stack-more"
              >
                +{{ project.stack.length - 3 }}
              </span>
            </div>
          </footer>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.projects-section {
  padding: 8rem 2rem;
  background: var(--bg-raised);
}

.projects-inner {
  max-width: 1100px;
  margin: 0 auto;
}

.projects-header {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  gap: 2rem;
  margin-bottom: 4rem;
  flex-wrap: wrap;
}

.projects-heading {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 5.5vw, 4.5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: var(--text-bright);
}

.projects-sub {
  font-family: var(--font-mono);
  font-size: 0.82rem;
  color: var(--text-muted);
  max-width: 220px;
  text-align: right;
  align-self: flex-end;
}

/* ── Project index ───────────────────────────────────────── */
.project-index {
  font-family: var(--font-mono);
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.1em;
}

/* ── Featured project ────────────────────────────────────── */
.featured-project {
  border: 1px solid var(--border);
  border-radius: 4px;
  overflow: hidden;
  margin-bottom: 1.5px;
  transition: border-color 0.3s;
}

.featured-project:hover {
  border-color: color-mix(in srgb, var(--accent) 40%, transparent);
}

.featured-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem 2rem;
  border-bottom: 1px solid var(--border);
  background: var(--bg-card);
}

.project-badge {
  font-family: var(--font-mono);
  font-size: 0.65rem;
  font-weight: 600;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--accent);
  background: var(--accent-glow);
  border: 1px solid color-mix(in srgb, var(--accent) 30%, transparent);
  padding: 0.2rem 0.6rem;
  border-radius: 2px;
}

.featured-body {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0;
}

.featured-content {
  padding: 2.5rem 2rem;
  border-right: 1px solid var(--border);
}

.featured-title {
  font-size: clamp(2rem, 4vw, 3rem) !important;
  margin-bottom: 0.5rem;
}

.project-tagline {
  font-family: var(--font-mono);
  font-size: 0.82rem;
  color: var(--text-dim);
  margin-bottom: 1.25rem;
  font-style: italic;
}

.project-description {
  font-family: var(--font-mono);
  font-size: 0.82rem;
  line-height: 1.8;
  color: var(--text-dim);
  margin-bottom: 1.75rem;
}

/* ── Stack chips ─────────────────────────────────────────── */
.project-stack {
  display: flex;
  flex-wrap: wrap;
  gap: 0.4rem;
  margin-bottom: 1.75rem;
}

.stack-chip {
  font-family: var(--font-mono);
  font-size: 0.68rem;
  font-weight: 500;
  letter-spacing: 0.06em;
  color: var(--text-dim);
  background: var(--bg-card);
  border: 1px solid var(--border);
  padding: 0.22rem 0.6rem;
  border-radius: 2px;
}

.stack-more {
  color: var(--text-muted);
}

/* ── Links ───────────────────────────────────────────────── */
.project-links {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.project-link-primary {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  font-family: var(--font-mono);
  font-size: 0.8rem;
  font-weight: 600;
  color: var(--bg);
  background: var(--accent);
  padding: 0.6rem 1.25rem;
  border-radius: 2px;
  text-decoration: none;
  transition: background 0.2s, color 0.2s;
  border: 1px solid var(--accent);
}

.project-link-primary:hover {
  background: transparent;
  color: var(--accent);
}

.project-link-ghost {
  font-family: var(--font-mono);
  font-size: 0.78rem;
  color: var(--text-dim);
  text-decoration: underline;
  text-underline-offset: 3px;
  transition: color 0.2s;
}

.project-link-ghost:hover { color: var(--text); }

/* ── Mockup visual ───────────────────────────────────────── */
.featured-visual {
  padding: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--bg-card);
}

.project-mockup {
  width: 100%;
  max-width: 340px;
  border: 1px solid var(--border);
  border-radius: 6px;
  overflow: hidden;
  background: var(--bg);
}

.mockup-bar {
  display: flex;
  align-items: center;
  gap: 5px;
  padding: 0.6rem 0.8rem;
  background: var(--bg-card);
  border-bottom: 1px solid var(--border);
}

.mockup-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--border);
}

.mockup-body {
  padding: 1.25rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.mockup-line {
  height: 8px;
  border-radius: 4px;
  background: var(--border);
}

.mockup-line.accent {
  background: color-mix(in srgb, var(--accent) 30%, transparent);
}

.mockup-line.w-3\/4 { width: 75%; }
.mockup-line.w-1\/2 { width: 50%; }
.mockup-line.w-full { width: 100%; }
.mockup-line.w-5\/6 { width: 83%; }
.mockup-line.w-2\/3 { width: 66%; }

.mockup-spacer {
  height: 0.5rem;
}

.mockup-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.5rem;
  margin-top: 0.25rem;
}

.mockup-card {
  height: 48px;
  border-radius: 4px;
  background: var(--bg-card);
  border: 1px solid var(--border);
}

/* ── Project card grid ───────────────────────────────────── */
.projects-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5px;
  background: var(--border);
  border: 1px solid var(--border);
  border-radius: 4px;
  overflow: hidden;
  margin-top: 1.5px;
}

.project-card {
  background: var(--bg);
  padding: 2rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  transition: background 0.2s;
  cursor: default;
}

.project-card:hover {
  background: color-mix(in srgb, var(--bg-card) 60%, var(--accent-glow));
}

.card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 0.5rem;
}

.card-links {
  display: flex;
  gap: 0.5rem;
}

.icon-link {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  color: var(--text-muted);
  border: 1px solid var(--border);
  border-radius: 2px;
  text-decoration: none;
  transition: color 0.2s, border-color 0.2s;
}

.icon-link:hover {
  color: var(--accent);
  border-color: var(--accent);
}

.card-title {
  font-family: var(--font-display) !important;
  font-size: 1.5rem !important;
  font-weight: 700 !important;
  letter-spacing: -0.02em;
  color: var(--text-bright);
}

.card-desc {
  flex: 1;
  -webkit-line-clamp: 3;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.card-footer {
  margin-top: auto;
  padding-top: 1.25rem;
}

.project-title {
  font-family: var(--font-display);
  font-weight: 800;
  letter-spacing: -0.02em;
  color: var(--text-bright);
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 900px) {
  .featured-body { grid-template-columns: 1fr; }
  .featured-visual { display: none; }
  .projects-grid { grid-template-columns: 1fr; }
}

@media (max-width: 600px) {
  .projects-section { padding: 5rem 1.25rem; }
  .projects-sub { display: none; }
}
</style>
