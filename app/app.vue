<script setup>
useHead({
  meta: [{ name: 'viewport', content: 'width=device-width, initial-scale=1' }],
  link: [{ rel: 'icon', href: '/favicon.ico' }],
  htmlAttrs: { lang: 'en' }
})

useSeoMeta({
  title: 'Henry Baharudin Yusuf — Full-Stack Developer',
  description: 'Full-stack developer crafting precise, performant digital experiences. Specialising in PHP, Laravel, TypeScript, Nuxt, Node.js, and distributed systems.',
  ogTitle: 'Henry Baharudin Yusuf — Full-Stack Developer',
  ogDescription: 'Full-stack developer crafting precise, performant digital experiences.',
  twitterCard: 'summary_large_image'
})

const colorMode = useColorMode()
const isDark = computed(() => colorMode.value === 'dark')

function toggleMode() {
  colorMode.preference = isDark.value ? 'light' : 'dark'
}

const navLinks = [
  { label: 'About', href: '#about' },
  { label: 'Skills', href: '#skills' },
  { label: 'Projects', href: '#projects' },
  { label: 'Contact', href: '#contact' }
]

const mobileOpen = ref(false)
</script>

<template>
  <div class="noise-overlay">
    <!-- ─── NAV ──────────────────────────────────────────── -->
    <header class="nav-bar">
      <nav class="nav-inner">
        <!-- Logo / Identity -->
        <a href="#" class="nav-logo" aria-label="Home">
          <span class="nav-logo-bracket text-accent">[</span>
          <span class="nav-logo-name">hy_</span>
          <span class="nav-logo-bracket text-accent">]</span>
        </a>

        <!-- Desktop links -->
        <ul class="nav-links" role="list">
          <li v-for="link in navLinks" :key="link.href">
            <a :href="link.href" class="nav-link">{{ link.label }}</a>
          </li>
        </ul>

        <!-- Actions -->
        <div class="nav-actions">
          <button
            id="theme-toggle"
            class="icon-btn"
            :aria-label="isDark ? 'Switch to light mode' : 'Switch to dark mode'"
            @click="toggleMode"
          >
            <span v-if="isDark" aria-hidden="true">☀</span>
            <span v-else aria-hidden="true">◐</span>
          </button>

          <a
            href="https://github.com/HenryYusuf"
            target="_blank"
            rel="noopener"
            class="icon-btn"
            aria-label="GitHub profile"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path d="M12 0C5.374 0 0 5.373 0 12c0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23A11.509 11.509 0 0112 5.803c1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576C20.566 21.797 24 17.3 24 12c0-6.627-5.373-12-12-12z"/>
            </svg>
          </a>

          <!-- Mobile hamburger -->
          <button
            class="icon-btn mobile-menu-btn"
            :aria-expanded="mobileOpen"
            aria-label="Toggle navigation"
            @click="mobileOpen = !mobileOpen"
          >
            <span :class="['hamburger', mobileOpen && 'open']" />
          </button>
        </div>
      </nav>

      <!-- Mobile menu -->
      <Transition name="mobile-menu">
        <div v-if="mobileOpen" class="mobile-nav">
          <ul role="list">
            <li v-for="link in navLinks" :key="link.href">
              <a
                :href="link.href"
                class="mobile-nav-link"
                @click="mobileOpen = false"
              >
                <span class="text-accent text-xs mr-2">→</span>{{ link.label }}
              </a>
            </li>
          </ul>
        </div>
      </Transition>
    </header>

    <!-- ─── MAIN ─────────────────────────────────────────── -->
    <main id="main-content">
      <NuxtPage />
    </main>

    <!-- ─── FOOTER ───────────────────────────────────────── -->
    <footer class="site-footer">
      <div class="footer-inner">
        <p class="footer-copy">
          <span class="text-accent">©</span> {{ new Date().getFullYear() }} Henry Yusuf.
          Built with Nuxt.
        </p>
        <p class="footer-command">
          <span class="text-muted">~/portfolio</span>
          <span class="text-accent"> $</span>
          <span class="text-dim"> make something remarkable</span>
        </p>
      </div>
    </footer>
  </div>
</template>

<style scoped>
/* ── Nav ──────────────────────────────────────────────────── */
.nav-bar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: color-mix(in srgb, var(--bg) 80%, transparent);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid var(--border);
  transition: background 0.3s;
}

.nav-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  height: 56px;
  display: flex;
  align-items: center;
  gap: 2rem;
}

.nav-logo {
  font-family: var(--font-mono);
  font-size: 1.05rem;
  font-weight: 700;
  color: var(--text-bright);
  text-decoration: none;
  letter-spacing: -0.01em;
  flex-shrink: 0;
  transition: color 0.2s;
}

.nav-logo-bracket {
  font-weight: 400;
  opacity: 0.8;
}

.nav-logo-name {
  margin: 0 2px;
}

.nav-links {
  display: flex;
  list-style: none;
  gap: 0.25rem;
  margin: 0 auto 0 2rem;
  padding: 0;
}

.nav-link {
  font-family: var(--font-mono);
  font-size: 0.8rem;
  font-weight: 500;
  letter-spacing: 0.06em;
  text-decoration: none;
  color: var(--text-dim);
  padding: 0.35rem 0.75rem;
  border-radius: 3px;
  transition: color 0.2s, background 0.2s;
}

.nav-link:hover {
  color: var(--accent);
  background: var(--accent-glow);
}

.nav-actions {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-left: auto;
}

.icon-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 34px;
  height: 34px;
  border: 1px solid var(--border);
  border-radius: 4px;
  background: transparent;
  color: var(--text-dim);
  cursor: pointer;
  font-size: 0.85rem;
  transition: color 0.2s, border-color 0.2s, background 0.2s;
}

.icon-btn:hover {
  color: var(--accent);
  border-color: var(--accent);
  background: var(--accent-glow);
}

/* Mobile hamburger */
.mobile-menu-btn {
  display: none;
}

.hamburger,
.hamburger::before,
.hamburger::after {
  display: block;
  width: 14px;
  height: 1.5px;
  background: currentColor;
  transition: transform 0.25s ease;
}

.hamburger {
  position: relative;
}

.hamburger::before,
.hamburger::after {
  content: '';
  position: absolute;
  left: 0;
}

.hamburger::before { top: -4px; }
.hamburger::after  { top:  4px; }

.hamburger.open               { background: transparent; }
.hamburger.open::before { transform: rotate(45deg) translate(3px, 3px); }
.hamburger.open::after  { transform: rotate(-45deg) translate(3px, -3px); }

/* Mobile nav */
.mobile-nav {
  border-top: 1px solid var(--border);
  padding: 1rem 2rem;
  background: color-mix(in srgb, var(--bg) 95%, transparent);
  backdrop-filter: blur(20px);
}

.mobile-nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.mobile-nav-link {
  display: block;
  font-family: var(--font-mono);
  font-size: 0.85rem;
  color: var(--text-dim);
  text-decoration: none;
  padding: 0.6rem 0;
  border-bottom: 1px solid var(--border);
  transition: color 0.2s;
}

.mobile-nav-link:hover { color: var(--accent); }

/* Mobile menu transition */
.mobile-menu-enter-active,
.mobile-menu-leave-active { transition: opacity 0.2s, transform 0.2s; }
.mobile-menu-enter-from,
.mobile-menu-leave-to { opacity: 0; transform: translateY(-8px); }

/* Footer */
.site-footer {
  border-top: 1px solid var(--border);
  background: var(--bg);
}

.footer-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  flex-wrap: wrap;
}

.footer-copy,
.footer-command {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  color: var(--text-muted);
}

/* ── Responsive ──────────────────────────────────────────── */
@media (max-width: 768px) {
  .nav-links { display: none; }
  .mobile-menu-btn { display: flex; }
  .footer-command { display: none; }
}
</style>
