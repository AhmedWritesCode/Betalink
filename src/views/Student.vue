<script setup>
import { ref, onMounted } from 'vue';
import Table from '@/components/Table.vue';

// Create a reactive variable to store the resources
const items = ref([]);

// Fetch resources from the backend when the component is mounted
onMounted(async () => {
  try {
    const response = await fetch('http://localhost:3000/api/resources', {
      headers: {
        'user-role': 'student', // Pass user role to backend
      },
    });
    if (!response.ok) {
      throw new Error('Failed to fetch resources');
    }
    const data = await response.json();
    items.value = data;
  } catch (error) {
    console.error('Error fetching resources:', error);
  }
});
</script>

<template>
  <Table :items="items" />
</template>