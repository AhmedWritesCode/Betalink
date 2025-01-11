<script setup>
import { ref, onMounted } from 'vue';
import Table from '@/components/LecturerTable.vue';
import Upload from '@/components/UploadResource.vue';

// Manage resources and categories
const items = ref([]);
const categories = ref([]);

// Fetch resources and categories from the backend
onMounted(async () => {
  try {
    // Fetch categories
    const categoriesResponse = await fetch('http://localhost:3000/api/categories');
    if (!categoriesResponse.ok) throw new Error('Failed to fetch categories');
    const categoriesData = await categoriesResponse.json();
    categories.value = categoriesData.map(cat => cat.name);

    // Fetch resources
    const resourcesResponse = await fetch('http://localhost:3000/api/resources');
    if (!resourcesResponse.ok) throw new Error('Failed to fetch resources');
    const resourcesData = await resourcesResponse.json();
    items.value = resourcesData;
  } catch (error) {
    console.error('Error fetching data:', error);
  }
});

// Add a new resource
const addResource = async (newResource) => {
  try {
    const response = await fetch('http://localhost:3000/api/resources', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(newResource),
    });

    if (!response.ok) throw new Error('Failed to add resource');
    const data = await response.json();
    items.value.push(data); // Add the new resource to the list
  } catch (error) {
    console.error('Error adding resource:', error);
  }
};

// Edit a resource
const editResource = async (updatedResource) => {
  try {
    const response = await fetch(`http://localhost:3000/api/resources/${updatedResource.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(updatedResource),
    });

    if (!response.ok) throw new Error('Failed to update resource');
    const data = await response.json();

    // Update the resource in the local list
    items.value = items.value.map(resource =>
      resource.id === updatedResource.id ? data : resource
    );
  } catch (error) {
    console.error('Error updating resource:', error);
  }
};

// Delete a resource
const deleteResource = async (id) => {
  try {
    const response = await fetch(`http://localhost:3000/api/resources/${id}`, {
      method: 'DELETE',
    });

    if (!response.ok) throw new Error('Failed to delete resource');

    // Remove the resource from the local list
    items.value = items.value.filter(resource => resource.id !== id);
  } catch (error) {
    console.error('Error deleting resource:', error);
  }
};
</script>

<template>
  <div>
    <!-- Upload Resource Component -->
    <Upload :categories="categories" @addResource="addResource" />

    <!-- Display Resources in a Table -->
    <Table
      :items="items"
      :categories="categories"
      @editResource="editResource"
      @deleteResource="deleteResource"
    />
  </div>
</template>