<script setup>
import { ref, onMounted } from 'vue';
import CCT from '@/components/cct.vue';

// Manage categories and resources centrally in the parent component
const categories = ref([]);

// Fetch categories from the API when the component is mounted
onMounted(async () => {
  try {
    const response = await fetch('http://localhost:3000/api/categories');
    if (!response.ok) {
      throw new Error('Failed to fetch categories');
    }
    const data = await response.json();
    categories.value = data.map(category => category.name); // Extract category names
  } catch (error) {
    console.error('Error fetching categories:', error);
  }
});

// Add a new category to the list and database
const addCategory = async (newCategory) => {
  try {
    const response = await fetch('http://localhost:3000/api/categories', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ name: newCategory }),
    });

    if (!response.ok) {
      throw new Error('Failed to add category');
    }

    const data = await response.json();
    categories.value.push(data.name); // Update the frontend with the new category
  } catch (error) {
    console.error('Error adding category:', error);
  }
};

// Remove a category from the list and database
const deleteCategory = async (categoryToDelete) => {
  try {
    // Find the category ID from the database (assuming categories.value stores the name only)
    const response = await fetch('http://localhost:3000/api/categories');
    if (!response.ok) {
      throw new Error('Failed to fetch categories');
    }
    const data = await response.json();
    const category = data.find(cat => cat.name === categoryToDelete);

    if (!category) {
      throw new Error('Category not found');
    }

    // Delete the category from the database
    const deleteResponse = await fetch(`http://localhost:3000/api/categories/${category.id}`, {
      method: 'DELETE',
    });

    if (!deleteResponse.ok) {
      throw new Error('Failed to delete category');
    }

    // Update the frontend by removing the category
    categories.value = categories.value.filter(category => category !== categoryToDelete);
  } catch (error) {
    console.error('Error deleting category:', error);
  }
};
</script>

<template>
  <div>

    <!-- Create Category Component -->
    <CCT 
      :categories="categories" 
      @addCategory="addCategory" 
      @deleteCategory="deleteCategory" 
    />
  </div>
</template>