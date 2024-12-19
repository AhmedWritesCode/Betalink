<script setup>
import { ref } from 'vue';

// Static user data for demonstration
const userName = ref('Ahmed Zaki Al-Gabaly');
const userEmail = ref('AhmedZaki@example.com');
const userProfilePic = ref('https://www.w3schools.com/w3images/avatar2.png'); // Add a real profile image URL here
</script>

<template>
  <div class="flex justify-center items-center min-h-screen bg-gray-100 p-6">
    <!-- Profile Card -->
    <div class="max-w-sm bg-white shadow-lg rounded-lg overflow-hidden w-full sm:w-96">
      <!-- Profile Image -->
      <div class="relative">
        <img :src="userProfilePic" alt="Profile" class="w-full h-48 object-cover">
        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black via-transparent to-transparent p-4">
          <h2 class="text-white text-2xl font-semibold">{{ userName }}</h2>
        </div>
      </div>

      <!-- User Info -->
      <div class="p-6">
        <div class="text-lg text-gray-700 mb-4">
          <p><strong>Email:</strong> {{ userEmail }}</p>
        </div>

        <div class="flex justify-between items-center">
          <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition duration-200">
            Logout
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Optional: If you want to tweak or add custom styles */
</style>
