<script setup>
import {defineProps} from 'vue';

defineProps({
  title: {
    type: String,
    default: 'Follow-up Slogan'
  }
})
</script>

<template>
      <section class="bg-white-700 py-20 mb-4">
      <div
        class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col items-center"
      >
      <div class="relative px-6 pt-14">
      <div class="text-center">
          <h1 class="text-5xl font-semibold text-gray-900">All You Need, One Place</h1>
          <p class="mt-8 text-lg text-gray-500">Access course materials, assignments, and more—seamlessly organized and just a click away!</p>
          <div class="mt-10 flex justify-center gap-x-6">
            <RouterLink to="#" class="rounded-md bg-violet-600 px-3.5 py-2.5 text-sm font-semibold text-white hover:bg-violet-500">Get started</RouterLink>
            <RouterLink to="#" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500">Learn more →</RouterLink>
          </div>
        </div>
    </div>
      </div>
    </section>
</template>