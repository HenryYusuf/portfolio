<script setup>
const form = reactive({
  name: '',
  email: '',
  reason: '',
  message: ''
})

const sent = ref(false)
const sending = ref(false)
const error = ref('')

const reasons = [
  { value: 'project', label: 'New project' },
  { value: 'fulltime', label: 'Full-time role' },
  { value: 'collab', label: 'Collaboration' },
  { value: 'other', label: 'Other' }
]

async function handleSubmit() {
  if (!form.name || !form.email || !form.message) {
    error.value = 'Please fill all required fields.'
    return
  }
  error.value = ''
  sending.value = true

  // Simulated send — replace with your actual endpoint
  await new Promise(r => setTimeout(r, 1200))

  sent.value = true
  sending.value = false
}
</script>

<template>
  <section id="contact" class="contact-section" aria-labelledby="contact-heading">
    <!-- Decorative oversized text -->
    <div class="contact-ambient" aria-hidden="true">REACH OUT</div>

    <div class="contact-inner">
      <div class="contact-left">
        <div class="section-divider animate-fade-in">
          <span class="section-label">05 / contact</span>
        </div>

        <h2 id="contact-heading" class="contact-heading animate-slide-up">
          Let's build<br />
          <span class="text-accent">together.</span>
        </h2>

        <p class="contact-sub animate-slide-up delay-200">
          Open to freelance projects, full-time roles,
          and interesting collaborations. Response time: &lt;24h.
        </p>

        <!-- Direct links -->
        <div class="contact-channels animate-slide-up delay-300">
          <a href="mailto:baharhenry10@gmail.com" class="channel-item" id="contact-email">
            <span class="channel-icon text-accent" aria-hidden="true">@</span>
            <span class="channel-label">baharhenry10@gmail.com</span>
          </a>
          <a href="https://github.com/HenryYusuf" target="_blank" rel="noopener" class="channel-item" id="contact-github">
            <span class="channel-icon text-accent" aria-hidden="true">◈</span>
            <span class="channel-label">github.com/HenryYusuf</span>
          </a>
          <a href="https://linkedin.com/in/henryby/" target="_blank" rel="noopener" class="channel-item" id="contact-linkedin">
            <span class="channel-icon text-accent" aria-hidden="true">◆</span>
            <span class="channel-label">linkedin.com/in/henryby</span>
          </a>
        </div>
      </div>

      <!-- Form -->
      <div class="contact-right animate-slide-up delay-200">
        <Transition name="form-fade" mode="out-in">
          <form
            v-if="!sent"
            class="contact-form"
            novalidate
            @submit.prevent="handleSubmit"
          >
            <div class="form-row">
              <!-- Name -->
              <div class="form-field">
                <label for="cf-name" class="form-label">
                  name <span class="req text-accent">*</span>
                </label>
                <input
                  id="cf-name"
                  v-model="form.name"
                  type="text"
                  class="form-input"
                  placeholder="Jane Smith"
                  autocomplete="name"
                  required
                />
              </div>

              <!-- Email -->
              <div class="form-field">
                <label for="cf-email" class="form-label">
                  email <span class="req text-accent">*</span>
                </label>
                <input
                  id="cf-email"
                  v-model="form.email"
                  type="email"
                  class="form-input"
                  placeholder="jane@company.com"
                  autocomplete="email"
                  required
                />
              </div>
            </div>

            <!-- Reason -->
            <div class="form-field">
              <label class="form-label">reason</label>
              <div class="reason-group" role="group" aria-label="Contact reason">
                <label
                  v-for="r in reasons"
                  :key="r.value"
                  class="reason-pill"
                  :class="{ active: form.reason === r.value }"
                >
                  <input
                    v-model="form.reason"
                    type="radio"
                    name="reason"
                    :value="r.value"
                    class="sr-only"
                  />
                  {{ r.label }}
                </label>
              </div>
            </div>

            <!-- Message -->
            <div class="form-field">
              <label for="cf-message" class="form-label">
                message <span class="req text-accent">*</span>
              </label>
              <textarea
                id="cf-message"
                v-model="form.message"
                class="form-input form-textarea"
                placeholder="Tell me about your project or opportunity..."
                rows="5"
                required
              />
            </div>

            <!-- Error -->
            <p v-if="error" class="form-error" role="alert">
              <span aria-hidden="true">⚠</span> {{ error }}
            </p>

            <!-- Submit -->
            <button
              id="contact-submit"
              type="submit"
              class="form-submit"
              :disabled="sending"
            >
              <span v-if="sending">Sending…</span>
              <span v-else>
                Send message
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <path d="M5 12h14M12 5l7 7-7 7"/>
                </svg>
              </span>
            </button>
          </form>

          <!-- Success state -->
          <div v-else class="sent-state" role="status" aria-live="polite">
            <div class="sent-icon text-accent" aria-hidden="true">✓</div>
            <h3 class="sent-heading">Message received.</h3>
            <p class="sent-sub">I'll reply within 24 hours. Until then — keep building.</p>
          </div>
        </Transition>
      </div>
    </div>
  </section>
</template>

<style scoped>
.contact-section {
  padding: 8rem 2rem;
  background: var(--bg-raised);
  position: relative;
  overflow: hidden;
}

/* Ambient large text */
.contact-ambient {
  position: absolute;
  bottom: -2rem;
  right: -2rem;
  font-family: var(--font-display);
  font-size: clamp(4rem, 14vw, 11rem);
  font-weight: 800;
  letter-spacing: -0.04em;
  color: color-mix(in srgb, var(--border) 50%, transparent);
  pointer-events: none;
  user-select: none;
  line-height: 1;
}

.contact-inner {
  max-width: 1100px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 380px 1fr;
  gap: 6rem;
  align-items: start;
  position: relative;
  z-index: 1;
}

/* ── Left ───────────────────────────────────────────────── */
.contact-heading {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 5.5vw, 4.5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: var(--text-bright);
  margin-bottom: 1.5rem;
}

.contact-sub {
  font-family: var(--font-mono);
  font-size: 0.85rem;
  color: var(--text-dim);
  line-height: 1.8;
  margin-bottom: 2.5rem;
}

.contact-channels {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.channel-item {
  display: flex;
  align-items: center;
  gap: 0.85rem;
  font-family: var(--font-mono);
  font-size: 0.82rem;
  color: var(--text-dim);
  text-decoration: none;
  padding: 0.75rem 1rem;
  border: 1px solid var(--border);
  border-radius: 3px;
  transition: color 0.2s, border-color 0.2s, background 0.2s;
}

.channel-item:hover {
  color: var(--text-bright);
  border-color: color-mix(in srgb, var(--accent) 30%, transparent);
  background: var(--accent-glow);
}

.channel-icon {
  font-size: 0.9rem;
  width: 1.2rem;
  text-align: center;
  flex-shrink: 0;
}

/* ── Form ───────────────────────────────────────────────── */
.contact-form {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 2rem;
}

.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.25rem;
}

.form-field {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.form-label {
  font-family: var(--font-mono);
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-muted);
}

.form-input {
  font-family: var(--font-mono);
  font-size: 0.85rem;
  color: var(--text);
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: 3px;
  padding: 0.7rem 0.9rem;
  outline: none;
  width: 100%;
  transition: border-color 0.2s;
  caret-color: var(--accent);
}

.form-input::placeholder { color: var(--text-muted); }

.form-input:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px var(--accent-glow);
}

.form-textarea {
  resize: vertical;
  min-height: 120px;
  line-height: 1.7;
}

/* Reason pills */
.reason-group {
  display: flex;
  flex-wrap: wrap;
  gap: 0.4rem;
}

.reason-pill {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  color: var(--text-dim);
  border: 1px solid var(--border);
  border-radius: 2px;
  padding: 0.35rem 0.75rem;
  cursor: pointer;
  transition: color 0.2s, border-color 0.2s, background 0.2s;
  user-select: none;
}

.reason-pill:hover {
  border-color: var(--text-dim);
  color: var(--text);
}

.reason-pill.active {
  color: var(--accent);
  border-color: var(--accent);
  background: var(--accent-glow);
}

/* Error */
.form-error {
  font-family: var(--font-mono);
  font-size: 0.78rem;
  color: #ff6b6b;
  background: rgba(255, 107, 107, 0.08);
  border: 1px solid rgba(255, 107, 107, 0.2);
  padding: 0.6rem 0.9rem;
  border-radius: 3px;
}

/* Submit */
.form-submit {
  font-family: var(--font-mono);
  font-size: 0.85rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  color: var(--bg);
  background: var(--accent);
  border: 2px solid var(--accent);
  border-radius: 2px;
  padding: 0.8rem 1.75rem;
  cursor: pointer;
  transition: background 0.2s, color 0.2s, box-shadow 0.2s;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  align-self: flex-start;
}

.form-submit:hover:not(:disabled) {
  background: transparent;
  color: var(--accent);
  box-shadow: 0 0 20px var(--accent-glow);
}

.form-submit:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

/* Success state */
.sent-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  min-height: 280px;
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 3rem 2rem;
  gap: 1rem;
}

.sent-icon {
  font-family: var(--font-mono);
  font-size: 3rem;
  font-weight: 100;
  line-height: 1;
}

.sent-heading {
  font-family: var(--font-display);
  font-size: 2rem;
  font-weight: 700;
  color: var(--text-bright);
  letter-spacing: -0.02em;
}

.sent-sub {
  font-family: var(--font-mono);
  font-size: 0.85rem;
  color: var(--text-dim);
  max-width: 300px;
}

/* Transition */
.form-fade-enter-active,
.form-fade-leave-active { transition: opacity 0.3s, transform 0.3s; }
.form-fade-enter-from,
.form-fade-leave-to { opacity: 0; transform: translateY(12px); }

/* Screen-reader only */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0,0,0,0);
  white-space: nowrap;
  border-width: 0;
}

/* ── Responsive ─────────────────────────────────────────── */
@media (max-width: 900px) {
  .contact-inner { grid-template-columns: 1fr; gap: 3rem; }
  .contact-ambient { font-size: 4rem; bottom: -1rem; right: -1rem; }
}

@media (max-width: 480px) {
  .contact-section { padding: 5rem 1.25rem; }
  .form-row { grid-template-columns: 1fr; }
}
</style>
