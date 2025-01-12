<script setup>
import { computed, ref } from 'vue';

// Props to receive the resources
const props = defineProps({
  items: Array, // Items passed from the parent
});

// State variables for search and sorting
const searchQuery = ref('');
const sortKey = ref('');
const sortOrder = ref(1); // 1 for ascending, -1 for descending

// State variables for pagination
const currentPage = ref(1);
const itemsPerPage = ref(10); // Number of items per page

// Computed property for filtered and sorted items
const filteredItems = computed(() => {
  let filtered = props.items.filter((item) => {
    const query = searchQuery.value.toLowerCase();
    return (
      item.name.toLowerCase().includes(query) ||
      item.description.toLowerCase().includes(query)
    );
  });

  if (sortKey.value) {
    filtered.sort((a, b) => {
      const aValue = a[sortKey.value];
      const bValue = b[sortKey.value];
      if (aValue < bValue) return -1 * sortOrder.value;
      if (aValue > bValue) return 1 * sortOrder.value;
      return 0;
    });
  }

  return filtered;
});

// Computed property for paginated items
const paginatedItems = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return filteredItems.value.slice(start, end);
});

// Computed property for total pages
const totalPages = computed(() => {
  return Math.ceil(filteredItems.value.length / itemsPerPage.value);
});

// Function to handle sorting
const sortTable = (key) => {
  if (sortKey.value === key) {
    sortOrder.value *= -1;
  } else {
    sortKey.value = key;
    sortOrder.value = 1;
  }
};

// Function to get appropriate sort icon
const getSortIcon = (key) => {
  if (sortKey.value === key) {
    return sortOrder.value === 1 ? 'asc' : 'desc';
  }
  return '';
};

// Function to change page
const changePage = (page) => {
  if (page >= 1 && page <= totalPages.value) {
    currentPage.value = page;
  }
};
</script>

<template>
  <h1 class="title">Resources</h1>

  <div>
    <!-- Search Bar -->
    <div id="searchContainer">
      <input
        v-model="searchQuery"
        type="text"
        placeholder="🔍 Type the link name or description and we will look for it..."
      />
    </div>

    <!-- Table with Sorting -->
    <div class="tableclass">
      <table class="StuTable">
        <thead>
          <tr>
            <th @click="sortTable('id')">
              ID <span :class="getSortIcon('id')"></span>
            </th>
            <th @click="sortTable('name')">
              Name <span :class="getSortIcon('name')"></span>
            </th>
            <th @click="sortTable('category')">
              Category <span :class="getSortIcon('category')"></span>
            </th>
            <th @click="sortTable('description')">
              Description <span :class="getSortIcon('description')"></span>
            </th>
            <th @click="sortTable('sharedBy')">
              Shared By <span :class="getSortIcon('sharedBy')"></span>
            </th>
            <th @click="sortTable('date')">
              Date <span :class="getSortIcon('date')"></span>
            </th>
            <th>Resource Link</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in paginatedItems" :key="item.id">
            <td>{{ item.id }}</td>
            <td>{{ item.name }}</td>
            <td>{{ item.category }}</td>
            <td>{{ item.description }}</td>
            <td>{{ item.sharedBy }}</td>
            <td>{{ item.date }}</td>
            <td><a :href="item.resourceLink" target="_blank">View</a></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Pagination Controls -->
    <div class="pagination">
      <button @click="changePage(currentPage - 1)" :disabled="currentPage === 1">
        Previous
      </button>
      <span>Page {{ currentPage }} of {{ totalPages }}</span>
      <button
        @click="changePage(currentPage + 1)"
        :disabled="currentPage === totalPages"
      >
        Next
      </button>
    </div>
    <br>
  </div>
</template>

<style scoped>
/* Table Styles */
.tableclass {
  margin-top: 20px;
}

.StuTable {
  width: 100%;
  border-collapse: collapse;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.StuTable th,
.StuTable td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}

.StuTable th {
  cursor: pointer;
  background-color: #8a2be2; /* Violet for the header */
  color: white;
  font-size: 16px;
}

.StuTable td {
  background-color: #f9f9f9;
}

.StuTable tr:nth-child(even) td {
  background-color: #e6e6fa; /* Light violet for even rows */
}

.StuTable tr:hover {
  background-color: #dcd0ff; /* Hover effect with light violet */
}

/* Sorting Icons */
.asc::after {
  content: '\25B2'; /* Up arrow */
  margin-left: 5px;
}

.desc::after {
  content: '\25BC'; /* Down arrow */
  margin-left: 5px;
}

/* Search Bar Styles */
#searchContainer input {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

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

/* Pagination Styles */
.pagination {
  margin-top: 20px;
  text-align: center;
}

.pagination button {
  padding: 8px 16px;
  margin: 0 5px;
  border: none;
  background-color: #8a2be2;
  color: white;
  cursor: pointer;
  border-radius: 4px;
}

.pagination button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.pagination span {
  margin: 0 10px;
}
</style>