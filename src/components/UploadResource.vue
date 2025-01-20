<template>
  <div class="upload-resource">
    <h1 class="title">Upload New Resource</h1>
    <form @submit.prevent="addResource">
      <div class="form-group">
        <label for="name">Name</label>
        <input v-model="newResource.name" type="text" id="name" required />
      </div>

      <div class="form-group">
        <label for="category">Category</label>
        <select v-model="newResource.category" id="category" required>
          <option value="" disabled>Select a category</option>
          <option v-for="category in categories" :key="category" :value="category">{{ category }}</option>
        </select>
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea v-model="newResource.description" id="description" required></textarea>
      </div>

      <div class="form-group">
        <label for="sharedBy">Shared By</label>
        <input
          v-model="newResource.sharedBy"
          type="text"
          id="sharedBy"
          required
        />
      </div>

      <div class="form-group">
        <label for="date">Date</label>
        <input
          v-model="newResource.date"
          type="date"
          id="date"
          required
        />
      </div>

      <div class="form-group">
        <label for="resourceLink">Resource Link</label>
        <input v-model="newResource.resourceLink" type="url" id="resourceLink" required />
      </div>

      <div class="form-group">
        <label for="visibility">Visibility</label>
        <select v-model="newResource.visibility" id="visibility" required>
          <option value="1">Visible to Students and Lecturers</option>
          <option value="2">Visible to Lecturers Only</option>
        </select>
      </div>

      <button type="submit">Add Resource</button>
    </form>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
const lecturerEmail = ref(''); // Store lecturer's email

const newResource = ref({
  name: '',
  category: '',
  description: '',
  sharedBy: '',
  date: '',
  resourceLink: '',
  lecturerId: '',
  visibility: 1, // Default visibility (1: visible to all)
});

// Fetch lecturerId from session storage when the component is mounted
onMounted(() => {
  const appStorage = JSON.parse(sessionStorage.getItem("web_fc_utm_my_ttms"));
  if (appStorage && appStorage.user_auth) {
    // Set lecturerId and lecturerEmail
    newResource.value.lecturerId = appStorage.user_auth.login_name;
    lecturerEmail.value = appStorage.user_auth.email || 'Unknown Email'; // Store lecturer's email

    // Set today's date as the default date
    const today = new Date().toISOString().split('T')[0]; // Format: YYYY-MM-DD
    newResource.value.date = today;

    // Set Shared By to lecturer's email
    newResource.value.sharedBy = lecturerEmail.value;

    console.log('Lecturer ID:', newResource.value.lecturerId); // Debugging
    console.log('Lecturer Email:', lecturerEmail.value); // Debugging
    console.log('Default Date:', newResource.value.date); // Debugging
  } else {
    console.error('Lecturer ID or email not found in session storage. Please log in again.');
  }
});

// Props received from the parent
const props = defineProps({
  categories: {
    type: Array,
    required: true,
  },
});

// Emit the new resource to the parent
const emit = defineEmits(['addResource']);

// Method to add the resource to the table
const addResource = () => {
  if (
    !newResource.value.name ||
    !newResource.value.category ||
    !newResource.value.description ||
    !newResource.value.sharedBy ||
    !newResource.value.date ||
    !newResource.value.resourceLink
  ) {
    alert('Please fill out all fields.');
    return;
  }

  // Ensure lecturerId is included
  if (!newResource.value.lecturerId) {
    alert('Lecturer ID is missing. Please log in again.');
    return;
  }

  // Emit the new resource to the parent component
  emit('addResource', { ...newResource.value });

  // Reset the form (retain lecturerId and reset Shared By to lecturer's email)
  newResource.value = {
    name: '',
    category: '',
    description: '',
    sharedBy: lecturerEmail.value, // Reset Shared By to lecturer's email
    date: new Date().toISOString().split('T')[0], // Reset to today's date
    resourceLink: '',
    lecturerId: newResource.value.lecturerId, // Retain lecturerId
    visibility: 1, // Reset visibility
  };
};

</script>

<style scoped>
.title {
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
  color: white;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  background-color: #8a2be2;
  box-shadow: 0 2px 4px rgba(255, 33, 203, 0.8);
  padding: 20px;
}

.upload-resource {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: bold;
}

input,
textarea,
select {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 10px 20px;
  background-color: #8a2be2;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #355aff;
}
</style>