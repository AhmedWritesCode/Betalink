<script setup>
import { ref } from 'vue';

const newCategory = ref('');

// Props received from the parent
const props = defineProps({
  categories: Array, // Define categories prop here
});

// Emit the new category to the parent
const emit = defineEmits();

// Add category to the list
const addCategory = () => {
  if (newCategory.value) {
    emit('addCategory', newCategory.value); // Emit event to add category
    newCategory.value = ''; // Reset input
  }
};

// Delete category from the list
const deleteCategory = (categoryToDelete) => {
  emit('deleteCategory', categoryToDelete); // Emit event to delete category
};
</script>

<template>
  <div class="container">
    <h1 class="title"> Manage Categories </h1>
    <div class="form">
      <input
        v-model="newCategory"
        placeholder="New Category"
        class="input"
        type="text"
      />
      <button @click="addCategory" class="button">Add Category</button>
    </div>
    <ul class="category-list">
      <li v-for="category in props.categories" :key="category" class="category-item">
        <span>{{ category }}</span>
        <button @click="deleteCategory(category)" class="delete-button">Delete</button>
      </li>
    </ul>
  </div>
</template>

<style scoped>

.title{
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
  color: white;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  background-color: #8A2BE2;
  box-shadow: 0 2px 4px rgba(255, 33, 203, 0.8);
  padding: 20px;
}

.container {
  margin: 0 auto;
  padding: 2rem;
  font-family: 'Arial', sans-serif;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.form {
  display: flex;
  gap: 10px;
  margin-bottom: 1rem;
}

.input {
  padding: 0.75rem;
  border: 2px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  width: 100%;
  transition: border-color 0.3s;
}

.input:focus {
  border-color: #4c6ef5;
  outline: none;
}

.button {
  padding: 0.75rem 1.25rem;
  background-color: #8A2BE2;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

.button:hover {
  background-color: #3751ff;
}

.category-list {
  list-style-type: none;
  padding: 0;
}

.category-item {
  padding: 0.5rem;
  border-bottom: 1px solid #ddd;
  font-size: 1.1rem;
  color: #333;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.category-item:last-child {
  border-bottom: none;
}

.delete-button {
  background-color: #e53e3e;
  color: white;
  border: none;
  padding: 0.25rem 0.75rem;
  font-size: 0.9rem;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.delete-button:hover {
  background-color: #c53030;
}
</style>
