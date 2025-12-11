<script setup>
useHead({
  meta: [
    { name: 'viewport', content: 'width=device-width, initial-scale=1' }
  ],
  link: [
    { rel: 'icon', href: '/favicon.ico' }
  ],
  htmlAttrs: {
    lang: 'en'
  }
})

const title = 'Nuxt Starter Template'
const description = 'A production-ready starter template powered by Nuxt UI. Build beautiful, accessible, and performant applications in minutes, not hours.'

useSeoMeta({
  title,
  description,
  ogTitle: title,
  ogDescription: description,
  ogImage: 'https://ui.nuxt.com/assets/templates/nuxt/starter-light.png',
  twitterImage: 'https://ui.nuxt.com/assets/templates/nuxt/starter-light.png',
  twitterCard: 'summary_large_image'
})
</script>

<template>
  <UApp>
    <!-- <UHeader>
      <template #left>
        <NuxtLink to="/">
          <AppLogo class="w-auto h-6 shrink-0" />
        </NuxtLink>

        <TemplateMenu />
      </template>

<template #right>
        <UColorModeButton />

        <UButton
          to="https://github.com/nuxt-ui-templates/starter"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
      </template>
</UHeader> -->
    <UContainer class="sticky top-5 flex justify-between items-center font-display text-base font-normal">
      <div>
        <img
          src="/assets/images/logo/logo.png"
          alt="Logo"
        >
      </div>
      <div class="flex py-4 px-9 border rounded-lg space-x-5">
        <NuxtLink to="home">Home</NuxtLink>
        <NuxtLink to="about-me">About Me</NuxtLink>
        <NuxtLink to="portfolio">Portfolio</NuxtLink>
        <NuxtLink to="service">Service</NuxtLink>
        <NuxtLink to="blog">Blog</NuxtLink>
        <NuxtLink to="contact">Contact</NuxtLink>
      </div>
      <div class="flex items-center space-x-4">
        <NuxtLink
          to="contact"
          class="flex items-center justify-center bg-primary text-default text-sm font-semibold rounded-xl space-x-2.5 py-3 px-5"
        >
          <span>Let's Talk</span>
          <Icon name="lucide:arrow-up-right" />
        </NuxtLink>
        <div class="flex items-center bg-white rounded-xl py-3 px-2.5 text-default/70">
          <Icon
            name="lucide:text-align-end"
            class="text-2xl"
          />
        </div>
      </div>
    </UContainer>

    <UMain>
      <NuxtPage />
    </UMain>

    <USeparator icon="i-simple-icons-nuxtdotjs" />

    <UFooter>
      <template #left>
        <p class="text-sm text-muted font-secondary">
          Built with Nuxt UI • © {{ new Date().getFullYear() }}
        </p>
      </template>

      <template #right>
        <UButton
          to="https://github.com/nuxt-ui-templates/starter"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
      </template>
    </UFooter>
  </UApp>
</template>
