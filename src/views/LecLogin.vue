<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

const router = useRouter()
const email = ref('')
const password = ref('')
const ajaxURL = "http://web.fc.utm.my/ttms/web_man_webservice_json.cgi?"

function getEpoch() {
  return Math.round(new Date().getTime() / 1000)
}

async function login() {
  if (!email.value || !password.value) {
    alert("Please fill in both email and password.")
    return
  }

  const authData = {
    entity: 'authentication',
    login: email.value,
    password: password.value
  }

  try {
    const response = await axios.get(ajaxURL, { params: authData })
    const auth = response.data

    if (auth && auth.length > 0) {
      const appStorage = {
        user_auth: auth[0],
        epoch_last: getEpoch(),
        data: {}
      }
      sessionStorage.setItem("web_fc_utm_my_ttms", JSON.stringify(appStorage))
      router.push('/Lecturer') // Redirect to the Student dashboard
    } else {
      alert("Incorrect email or password. Please try again.")
    }
  } catch (error) {
    console.error("Login failed:", error)
    alert("An error occurred during login. Please try again later.")
  }
}
</script>

<template>
  <div class="flex items-center justify-center h-screen px-6 bg-gray-200">
    <div class="w-full max-w-md p-6 bg-white rounded-md shadow-md">
      <div class="flex flex-col items-center justify-center">
        <span class="text-3xl font-semibold text-purple-700">βetalink</span>
        <span class="text-2xl font-semibold text-gray-700">Login as a Lecturer</span>
      </div>

      <form class="mt-4" @submit.prevent="login">
        <label class="block">
          <span class="text-sm text-gray-700">User</span>
          <input
            v-model="email"
            type="text"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          />
        </label>

        <label class="block mt-3">
          <span class="text-sm text-gray-700">Password</span>
          <input
            v-model="password"
            type="password"
            class="block w-full mt-1 border-gray-200 rounded-md focus:border-indigo-600 focus:ring focus:ring-opacity-40 focus:ring-indigo-500"
          />
        </label>

        <div class="flex items-center justify-between mt-4">
          <RouterLink
            class="block text-sm text-indigo-700 fontme hover:underline"
            to="#"
          >
            Forgot your password?
          </RouterLink>
        </div>

        <div class="mt-6">
          <button
            type="submit"
            class="w-full px-4 py-2 text-sm text-center text-white bg-indigo-600 rounded-md focus:outline-none hover:bg-indigo-500"
          >
            Sign in
          </button>
        </div>
      </form>
    </div>
  </div>
</template>