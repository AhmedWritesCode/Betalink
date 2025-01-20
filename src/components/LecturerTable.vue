<script setup>
import { computed, ref } from 'vue';

// Props to receive the resources and categories
const props = defineProps({
  items: Array,
  categories: Array,
  lecturerId: String, // Add lecturerId prop
});

// Emit events for editing and deleting resources
const emit = defineEmits(['editResource', 'deleteResource']);

// State variables for search, sorting, and editing
const searchQuery = ref('');
const sortKey = ref('');
const sortOrder = ref(1); // 1 for ascending, -1 for descending
const editingResource = ref(null); // Track the resource being edited

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

// Function to handle editing a resource
const handleEdit = (resource) => {
  editingResource.value = { ...resource };
};

// Function to save the edited resource
const saveEdit = () => {
  emit('editResource', editingResource.value);
  editingResource.value = null;
};

// Function to delete a resource
const handleDelete = (id) => {
  if (confirm('Are you sure you want to delete this resource?')) {
    emit('deleteResource', { id, lecturerId: props.lecturerId }); // Pass both id and lecturerId
  }
};

// Function to change page
const changePage = (page) => {
  if (page >= 1 && page <= totalPages.value) {
    currentPage.value = page;
  }
};
</script>

<template>
  <div>
    <h1 class="title">Resources</h1>

    <!-- Search Bar -->
    <div id="searchContainer">
      <input
        v-model="searchQuery"
        type="text"
        placeholder="🔍 Type the link name or description and we will look for it..."
      />
    </div>

    <!-- Table with Sorting and Edit/Delete Actions -->
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
            <th>Actions</th>
            <th @click="sortTable('visibility')">
              Visibility <span :class="getSortIcon('visibility')"></span>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in paginatedItems" :key="item.id">
            <!-- ID -->
            <td>{{ item.id }}</td>

            <!-- Name -->
            <td v-if="editingResource?.id !== item.id">{{ item.name }}</td>
            <td v-else><input v-model="editingResource.name" /></td>

            <!-- Category -->
            <td v-if="editingResource?.id !== item.id">{{ item.category }}</td>
            <td v-else>
              <select v-model="editingResource.category">
                <option v-for="category in categories" :key="category" :value="category">
                  {{ category }}
                </option>
              </select>
            </td>

            <!-- Description -->
            <td v-if="editingResource?.id !== item.id">{{ item.description }}</td>
            <td v-else><textarea v-model="editingResource.description"></textarea></td>

            <!-- Shared By -->
            <td v-if="editingResource?.id !== item.id">{{ item.sharedBy }}</td>
            <td v-else><input v-model="editingResource.sharedBy" /></td>

            <!-- Date -->
            <td v-if="editingResource?.id !== item.id">{{ item.date }}</td>
            <td v-else><input v-model="editingResource.date" type="date" /></td>

            <!-- Resource Link -->
            <td v-if="editingResource?.id !== item.id">
              <a :href="item.resourceLink" target="_blank">View</a>
            </td>
            <td v-else><input v-model="editingResource.resourceLink" type="url" /></td>

            <!-- Actions -->
            <td>
              <button 
                v-if="editingResource?.id !== item.id" 
                @click="handleEdit(item)" 
                style="background-color: #FFBF00; color: black; border: none; padding: 5px 10px; border-radius: 4px; margin: 5px">
                Edit
              </button>

              <button v-else @click="saveEdit" style="background-color: green; color: white; border: none; padding: 5px 10px; border-radius: 4px;">Save</button>
              <button 
                v-if="item.lecturerId === lecturerId" 
                @click="handleDelete(item.id)" 
                style="background-color: red; color: white; border: none; padding: 5px 10px; border-radius: 4px;">
                Delete
              </button>
            </td>

            <td v-if="editingResource?.id !== item.id">{{ item.visibility === 1 ? 'Visible to All' : 'Lecturers Only' }}</td>
            
            <td v-else>
              <select v-model="editingResource.visibility">
                <option value="1">Visible to All</option>
                <option value="2">Lecturers Only</option>
              </select>
            </td>
            
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

/* Button Styles */
button {
  margin-right: 5px;
  padding: 5px 10px;
  background-color: #8a2be2;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #7b1fa2;
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