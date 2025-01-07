<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';

// State variables
const userName = ref('');
const userEmail = ref('');
const userProfilePic = ref('https://www.w3schools.com/w3images/avatar2.png'); // Default profile picture

const router = useRouter();

// Function to load user data
const loadUserData = () => {
  const appStorage = JSON.parse(sessionStorage.getItem("web_fc_utm_my_ttms"));
  if (!appStorage) {
    alert('Session expired. Redirecting to login...');
    router.push('/StuLogin'); // Redirect to login page
    return;
  }

  // Extract and set user data
  userName.value = appStorage.fullName || 'Unknown User';
  userEmail.value = appStorage.email || 'No Email Provided';
  userProfilePic.value = appStorage.profilePic || userProfilePic.value;
};

// Function to handle logout
const handleLogout = () => {
  sessionStorage.removeItem("web_fc_utm_my_ttms"); // Clear user session
  router.push('/'); // Redirect to login page
};
  
// Load data on component mount
onMounted(loadUserData);
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
          <button
            @click="handleLogout"
            class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition duration-200"
          >
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
