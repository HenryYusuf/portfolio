<script setup>
const experiences = [
  {
    id: "P03",
    role: "SENIOR_FRONTEND_ENGINEER",
    status: "ACTIVE",
    node: "INTERNAL://TECH_CORP",
    uptime: "1,240d",
    logs: [
      { status: "[ OK ]", text: "Architected core UI infrastructure; reduced bundle size by 40%." },
      { status: "[ SHIP ]", text: "Orchestrated delivery cycles; maintained 99.9% deployment stability." },
      { status: "[ OK ]", text: "Established robust design system tokens mapped to framework-agnostic CSS." }
    ],
    externals: ["Vue.js", "Nuxt 3", "TypeScript", "TailwindCSS"]
  },
  {
    id: "P02",
    role: "FULL_STACK_DEVELOPER",
    status: "ARCHIVED",
    node: "EXTERNAL://STEALTH_STARTUP",
    uptime: "850d",
    logs: [
      { status: "[ OK ]", text: "Engineered real-time data synchronization using WebSockets and Redis." },
      { status: "[ OK ]", text: "Migrated legacy monolithic systems into distributed containerized services." },
      { status: "[ SHIP ]", text: "Deployed functional prototypes scaling to 10k concurrent connections." }
    ],
    externals: ["Node.js", "Express", "Vue.js", "PostgreSQL", "Docker"]
  },
  {
    id: "P01",
    role: "UI_DEVELOPER",
    status: "ARCHIVED",
    node: "EXTERNAL://AGENCY_X",
    uptime: "420d",
    logs: [
      { status: "[ OK ]", text: "Delivered 15+ high-fidelity client interfaces with pixel-perfect precision." },
      { status: "[ OK ]", text: "Implemented responsive accessibility layers achieving WCAG AA compliance." }
    ],
    externals: ["HTML5", "CSS3", "JavaScript", "Figma"]
  }
]
</script>

<template>
  <section id="experience" class="exp-section" aria-labelledby="exp-heading">
    <div class="exp-inner">
      <div class="section-divider animate-flicker-in">
        <span class="section-label">02 / experiences</span>
      </div>

      <h2 id="exp-heading" class="exp-heading animate-slide-up">
        System <span class="text-accent">uptime.</span><br />
        <span class="sub-heading">Production history</span>
      </h2>

      <div class="timeline-container">
        
        <article 
          v-for="(exp, i) in experiences" 
          :key="exp.id" 
          class="process-card animate-slide-up"
          :style="`animation-delay: ${0.2 + i * 0.15}s`"
        >
          <!-- Connection node to the timeline -->
          <div class="timeline-node" :class="{ 'node-active': exp.status === 'ACTIVE' }"></div>

          <header class="process-header">
            <h3 class="pid-title">PID: {{ exp.role }}</h3>
            <div class="telemetry-strip">
              <span class="telemetry-item">
                <span class="t-label">STATUS:</span> 
                <span :class="['t-value', `status-${exp.status.toLowerCase()}`]">[ {{ exp.status }} ]</span>
              </span>
              <span class="t-divider" aria-hidden="true">//</span>
              <span class="telemetry-item">
                <span class="t-label">NODE:</span> 
                <span class="t-value">{{ exp.node }}</span>
              </span>
              <span class="t-divider" aria-hidden="true">//</span>
              <span class="telemetry-item">
                <span class="t-label">UPTIME:</span> 
                <span class="t-value">{{ exp.uptime }}</span>
              </span>
            </div>
          </header>

          <div class="execution-logs">
            <div v-for="(log, li) in exp.logs" :key="li" class="log-entry">
              <span class="log-status">{{ log.status }}</span>
              <span class="log-text">{{ log.text }}</span>
            </div>
          </div>

          <footer class="dependency-manifest">
            <span class="t-label">EXTERNALS:</span>
            <span class="dep-bracket">[</span>
            <span v-for="(dep, di) in exp.externals" :key="dep" class="dep-item">
              <span class="dep-name">{{ dep }}</span><span v-if="di < exp.externals.length - 1" class="dep-comma">, </span>
            </span>
            <span class="dep-bracket">]</span>
          </footer>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.exp-section {
  padding: 8rem 0;
  background: var(--bg);
  position: relative;
  overflow: hidden;
}

.exp-inner {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 2rem;
}

.exp-heading {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 5.5vw, 4.5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: var(--text-bright);
  margin-bottom: 5rem;
}

.sub-heading {
  font-family: var(--font-mono);
  font-size: 0.85rem;
  letter-spacing: 0.1em;
  font-weight: 500;
  color: var(--text-dim);
  text-transform: uppercase;
  display: block;
  margin-top: 1rem;
}

/* ── Timeline Container ─────────────────────────────────────── */
.timeline-container {
  position: relative;
  padding-left: 3.5rem;
  display: flex;
  flex-direction: column;
  gap: 3rem;
}

.timeline-container::before {
  content: '';
  position: absolute;
  top: 1rem;
  bottom: 1rem;
  left: 0.5rem;
  width: 1px;
  background-image: linear-gradient(to bottom, var(--border) 50%, transparent 50%);
  background-size: 1px 8px;
  background-repeat: repeat-y;
}

/* ── Process Card ─────────────────────────────────────────────── */
.process-card {
  position: relative;
  background: var(--bg-raised);
  border: 1px solid var(--border);
  padding: 2.5rem;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.process-card:hover {
  border-color: color-mix(in srgb, var(--accent) 40%, var(--border));
  background: color-mix(in srgb, var(--bg-card) 98%, var(--accent) 2%);
}

.timeline-node {
  position: absolute;
  left: calc(-3rem - 4px); /* -3.5rem padding + 0.5rem line pos = -3rem to line center; -4px for half 8px node */
  top: 2.75rem;
  width: 8px;
  height: 8px;
  background: var(--bg-raised);
  border: 1px solid var(--border);
  transform: rotate(45deg);
  transition: all 0.3s ease;
  z-index: 2;
}

.timeline-node.node-active,
.process-card:hover .timeline-node {
  border-color: var(--accent);
  background: var(--accent);
  box-shadow: 0 0 10px var(--accent-glow);
}

/* ── Header & Telemetry ───────────────────────────────────────── */
.process-header {
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px dashed var(--border);
}

.pid-title {
  font-family: var(--font-mono);
  font-size: 1.15rem;
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--text-bright);
  margin-bottom: 1rem;
}

.process-card:hover .pid-title {
  color: var(--accent);
}

.telemetry-strip {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 1rem;
  font-family: var(--font-mono);
  font-size: 0.72rem;
  letter-spacing: 0.05em;
}

.telemetry-item {
  display: inline-flex;
  gap: 0.6rem;
}

.t-label {
  color: var(--text-muted);
}

.t-value {
  color: var(--text);
  font-weight: 600;
}

.t-divider {
  color: var(--border);
  opacity: 0.5;
}

.status-active {
  color: var(--accent);
  text-shadow: 0 0 5px color-mix(in srgb, var(--accent) 30%, transparent);
}

.status-archived {
  color: #a8b1ff;
  text-shadow: 0 0 5px color-mix(in srgb, #a8b1ff 30%, transparent);
}

/* ── Execution Logs ───────────────────────────────────────────── */
.execution-logs {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-bottom: 2.5rem;
  font-family: var(--font-mono);
  font-size: 0.82rem;
  line-height: 1.6;
}

.log-entry {
  display: flex;
  gap: 1.25rem;
  align-items: flex-start;
}

.log-status {
  color: var(--accent);
  white-space: nowrap;
  font-weight: 700;
}

/* Make archived logs slightly different colored to feel colder */
.process-card:not(:first-child) .log-status {
  color: var(--text-dim);
}
.process-card:not(:first-child):hover .log-status {
  color: #a8b1ff;
}

.log-text {
  color: var(--text-dim);
}
.process-card:hover .log-text {
  color: var(--text);
}

/* ── Dependency Manifest ─────────────────────────────────────── */
.dependency-manifest {
  font-family: var(--font-mono);
  font-size: 0.7rem;
  padding: 1.25rem;
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 2px;
  display: flex;
  flex-wrap: wrap;
  gap: 0.6rem;
  align-items: baseline;
  letter-spacing: 0.05em;
}

.dep-bracket {
  color: var(--text-muted);
}

.dep-name {
  color: var(--text-dim);
  font-weight: 600;
  transition: color 0.2s;
}

.process-card:hover .dep-name {
  color: var(--text);
}

.dep-comma {
  color: var(--text-muted);
}

/* ── Animations ─────────────────────────────────────────────── */
@keyframes flicker-in {
  0% { opacity: 0; transform: translateY(10px); }
  10% { opacity: 0.5; }
  20% { opacity: 0; }
  40% { opacity: 0.8; }
  50% { opacity: 0.2; }
  60% { opacity: 1; transform: translateY(0); }
  100% { opacity: 1; transform: translateY(0); }
}

.animate-flicker-in {
  opacity: 0;
  animation: flicker-in 0.8s ease-out forwards;
}

/* ── Responsive ─────────────────────────────────────────────── */
@media (max-width: 768px) {
  .exp-section { padding: 5rem 0; }
  .exp-heading { font-size: 2.2rem; margin-bottom: 3.5rem; }
  
  .timeline-container {
    padding-left: 2rem;
  }
  
  .timeline-node {
    left: calc(-1.5rem - 4px);
  }
  
  .process-card {
    padding: 1.5rem;
  }

  .telemetry-strip {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.6rem;
  }
  
  .t-divider {
    display: none;
  }
  
  .log-entry {
    gap: 0.75rem;
  }
}
</style>
