<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const email = ref('johndoe@mail.com')
const password = ref('@#!@#asdf1231!_!@#')

function login() {
  router.push('/dashboard')
}
</script>

<template>
  <div class="flex items-center justify-center h-screen px-6 bg-gray-200">
    <div class="w-full max-w-md p-6 bg-white rounded-md shadow-md">
      <div class="flex flex-col items-center justify-center">
        <span class="text-3xl font-semibold text-purple-700">βetalink</span>
        <span class="text-2xl font-semibold text-gray-700">Sign Up as a Student</span>
      </div>

      <form class="mt-4" @submit.prevent="login">

        <label class="block">
          <span class="text-sm text-gray-700">Name</span>
          <input
            v-model="name"
            type="text"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          >
        </label>

        <label class="block">
          <span class="text-sm text-gray-700">Email</span>
          <input
            v-model="email"
            type="email"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          >
        </label>

        <label class="block mt-3">
          <span class="text-sm text-gray-700">Password</span>
          <input
            v-model="password"
            type="password"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          >
        </label>

        <label class="block mt-3">
          <span class="text-sm text-gray-700">Confirm Password</span>
          <input
            v-model="ConfirmPassword"
            type="password"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          >
        </label>

        <div class="flex items-center justify-between mt-4">

          <div>
            <RouterLink
              class="block text-sm text-indigo-700 fontme hover:underline"
              href="#"
            >Already have an account?</RouterLink>
          </div>
        </div>

        <div class="mt-6">
          <button
            type="submit"
            class="w-full px-4 py-2 text-sm text-center text-white bg-indigo-600 rounded-md focus:outline-none hover:bg-indigo-500"
          >
            Sign Up
          </button>
        </div>
      </form>
    </div>
  </div>
</template>
