<script setup>
import logo from '@/assets/logo.jpg';
import { RouterLink } from 'vue-router';
</script>

<template>

      <nav class="bg-purple-700 border-b border-purple-500">
      <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="flex h-20 items-center justify-between">
          <div
            class="flex flex-1 items-center justify-center md:items-stretch md:justify-start"
          >
            <!-- Logo -->
            <RouterLink class="flex flex-shrink-0 items-center mr-4" to="Home">
            <!--  <img class="h-10 w-auto" :src="logo" alt="βetalink" /> -->
              <span class="hidden md:block text-white text-2xl font-bold ml-2"
                >βetalink</span
              >
            </RouterLink>
            <div class="md:ml-auto">
              <div class="flex space-x-2">
                <RouterLink
                  to="#"
                  class="text-white bg-purple-900 hover:bg-gray-900 hover:text-white rounded-md px-3 py-2"
                  >Dashboard</RouterLink
                >
                <RouterLink
                  to="About"
                  class="text-white hover:bg-purple-900 hover:text-white rounded-md px-3 py-2"
                  >About</RouterLink
                >
                <RouterLink
                  to="Settingz"
                  class="text-white hover:bg-purple-900 hover:text-white rounded-md px-3 py-2"
                  >Account</RouterLink
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>

</template>