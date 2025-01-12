<template>
  <nav class="bg-purple-700 border-b border-purple-500">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
      <div class="flex h-20 items-center justify-between">
        <div class="flex flex-1 items-center justify-center md:items-stretch md:justify-start">
          <!-- Logo -->
          <RouterLink class="flex flex-shrink-0 items-center mr-4" to="Home">
            <!-- <img class="h-10 w-auto" :src="logo" alt="βetalink" /> -->
            <span class="hidden md:block text-white text-2xl font-bold ml-2">βetalink</span>
          </RouterLink>
        </div>
        <div class="flex justify-center w-full">
          <div class="text-white text-lg font-bold">
            © 2025 βetalink. All rights reserved
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>
