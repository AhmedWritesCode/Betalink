<script setup>
import logo from '@/assets/logo.jpg';
import { RouterLink } from 'vue-router';
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const userDetails = ref(null); // Holds user details from session storage

// Function to validate user session and redirect if needed
const validateSession = () => {
  const appStorage = JSON.parse(sessionStorage.getItem("web_fc_utm_my_ttms"));

  if (!appStorage || !appStorage.user_auth) {
    // Redirect only if not already on the login page
    if (router.currentRoute.value.path !== '/') {
      alert('Session expired. Redirecting to home ...');
      router.push('/'); // Redirect to login page
    }
  } else {
    userDetails.value = appStorage.user_auth;
  }
};

// Dashboard route logic
const dashboardRoute = computed(() => {
  if (userDetails.value) {
    switch (userDetails.value.description) {
      case 'Pelajar FSKSM':
        return { name: 'Student' }; // Named route for Student dashboard
      case 'Pensyarah':
        return { name: 'Lecturer' }; // Named route for Lecturer dashboard
      default:
        return { name: 'Home' }; // Default route if role is unknown
    }
  }
  return { name: 'Home' }; // Default route if no user details
});

// Validate session on mount
onMounted(validateSession);
</script>

<template>
  <nav class="bg-purple-700 border-b border-purple-500">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
      <div class="flex h-20 items-center justify-between">
        <div class="flex flex-1 items-center justify-center md:items-stretch md:justify-start">
          <!-- Logo -->
          <RouterLink class="flex flex-shrink-0 items-center mr-4" to="Home">
            <!--  <img class="h-10 w-auto" :src="logo" alt="βetalink" /> -->
            <span class="hidden md:block text-white text-2xl font-bold ml-2">βetalink</span>
          </RouterLink>
          <div class="md:ml-auto">
            <div class="flex space-x-2">
              <!-- Dashboard as RouterLink for active class handling -->
              <RouterLink
                :to="dashboardRoute"
                class="text-white hover:bg-purple-900 hover:text-white rounded-md px-3 py-2"
                active-class="bg-purple-900"
              >
                Home
              </RouterLink>

              <!-- Other links as RouterLink -->
              <RouterLink
                to="About"
                class="text-white hover:bg-purple-900 hover:text-white rounded-md px-3 py-2"
                active-class="bg-purple-900"
              >
                About
              </RouterLink>
              <RouterLink
                to="Account"
                class="text-white hover:bg-purple-900 hover:text-white rounded-md px-3 py-2"
                active-class="bg-purple-900"
              >
                Account
              </RouterLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>
