<script setup>
import { ref } from 'vue';
import Table from '@/components/Table.vue';
import Upload from '@/components/UploadResource.vue';
import CC from '@/components/CreateCat.vue';
import resData from '@/ress.json';
import UserTable from '@/components/UserTable.vue';

// Manage categories and resources centrally in the parent component
const categories = ref(['Timetables', 'Official Announcements', 'Course Materials', 'News', 'Final Year Project']);
const items = ref([...resData]);

// Add a new category to the list
const addCategory = (newCategory) => {
  categories.value.push(newCategory);
};

// Remove a category
const deleteCategory = (categoryToDelete) => {
  categories.value = categories.value.filter(category => category !== categoryToDelete);
};

// Add a new resource to the table
const addResource = (newResource) => {
  items.value.push(newResource);
};
</script>

<template>
  <div>
    <!-- Create Category Component -->
    <CC 
      :categories="categories" 
      @addCategory="addCategory" 
      @deleteCategory="deleteCategory" 
    />

    <!-- Upload Resource Component -->
    <Upload 
      :categories="categories" 
      @addResource="addResource" 
    />

    <!-- Table Component -->
    <Table :items="items" />
    
  </div>

  <UserTable />
  
</template>
