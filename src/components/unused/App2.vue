<!--CC-->
<script setup>
import { ref } from 'vue';

const newCategory = ref('');
const categories = ref(['Timetables', 'Official Announcements', 'Course Materials', 'News', 'Final Year Project']);

const addCategory = () => {
  categories.value.push(newCategory.value);
  newCategory.value = ''; // Reset input
};

const deleteCategory = (categoryToDelete) => {
  categories.value = categories.value.filter(category => category !== categoryToDelete);
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
      <li v-for="category in categories" :key="category" class="category-item">
        <span>{{ category }}</span>
        <button @click="deleteCategory(category)" class="delete-button">Delete</button>
      </li>
    </ul>
  </div>
</template>
<!-- CC END-->