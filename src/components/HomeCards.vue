<script setup>
import Card from "@/components/Card.vue"
</script>

<template>
      <!-- Developers and Employers -->
      <section class="py-4">
      <div class="container-xl lg:container m-auto">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 p-4 rounded-lg">
          <Card>
            <h2 class="text-2xl font-bold">For Students</h2>
            <p class="mt-2 mb-4">
              Browse all of your faculty's resources in one place 
            </p>
            <RouterLink
              to="Student"
              class="inline-block bg-black text-white rounded-lg px-4 py-2 hover:bg-gray-700"
            >
              Browse Existing Resources
            </RouterLink>
          </Card>
          <Card bg="bg-purple-100">
            <h2 class="text-2xl font-bold">For Lecturers</h2>
            <p class="mt-2 mb-4">
              Upload links to the resources you wish to share with the students
            </p>
            <RouterLink
              to="Lecturer"
              class="inline-block bg-purple-500 text-white rounded-lg px-4 py-2 hover:bg-purple-600"
            >
              Add New Resources
            </RouterLink>
          </Card>
        </div>
      </div>
    </section>
</template>