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
    <UContainer class="absolute top-5 flex justify-between items-center font-display text-base font-normal">
      <div>
        <img
          src="/assets/images/logo/logo.png"
          alt="Logo"
        >
      </div>
      <div class="hidden lg:flex py-4 px-9 border rounded-lg space-x-5">
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
          class="hidden md:flex items-center justify-center bg-primary text-default text-sm font-semibold rounded-xl space-x-2.5 py-3 px-5"
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

    <section
      id="hero-section"
      class="bg-secondary pt-24 pb-20 z-10"
    >
      <UContainer class="flex flex-col px-8">
        <div class="flex flex-col items-start text-white">
          <h2 class="text-4xl mb-7 font-secondary">
            <span class="font-extralight">Looking For</span> <span class="font-semibold">Fullstack Website Developer
              ?</span>
          </h2>
          <div class="mb-7">
            <img
              src="/assets/images/hero/arrow.png"
              alt="Arrow"
            >
          </div>
          <div>
            <p class="font-display text-xl font-medium leading-loose mb-7">
              My work spans across multiple disciplines,
              from
              graphic design
              and branding to web
              and user interface
              design, allowing me to craft visually compelling and functional solutions tailored to meet each
            </p>
          </div>
          <div>
            <NuxtLink
              class="flex items-center justify-center bg-primary border-primary hover:bg-white text-default text-sm font-semibold rounded-xl space-x-2.5 py-3 px-5"
            >
              <span>Explore My Works</span>
              <Icon
                name="lucide:arrow-up-right"
                size="16"
              />
            </NuxtLink>
          </div>
        </div>
        <div class="flex flex-col items-center py-4 px-4">
          <div
            class="relative z-10 my-0 mx-auto text-white pt-12 before:absolute before:top-28 before:rounded-4xl before:rotate-0 before:inset-0 before:h-4/5 before:bg-primary before:-z-10 after:absolute after:top-28 after:rounded-4xl after:rotate-6 after:inset-0 after:h-4/5 after:bg-primary after:-z-10"
          >
            <img
              src="/assets/images/person/person1.png"
              alt="Person Image"
              class=""
            >
          </div>
        </div>
      </UContainer>
    </section>

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
