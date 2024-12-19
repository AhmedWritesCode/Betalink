import { createRouter, createWebHistory} from 'vue-router';
import Home from '@/views/Home.vue';
import StuLogin from '@/views/StuLogin.vue';
import LecLogin from '@/views/LecLogin.vue';
import About from '@/views/About.vue';
import SignUp from '@/views/SignUp.vue';
import Student from '@/views/Student.vue';
import Lecturer from '@/views/Lecturer.vue';
import Settings from '@/views/Settings.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/Home',
      name: 'Home',
      component: Home,
    },
    {
      path: '/StudentLogin',
      name: 'StuLogin',
      component: StuLogin,
    },
    {
      path: '/LecturerLogin',
      name: 'LecLogin',
      component: LecLogin,
    },
    {
      path: '/About',
      name: 'About',
      component: About,
    },
    {
      path: '/SignUp',
      name: 'SignUp',
      component: SignUp,
    },
    {
      path: '/Student',
      name: 'Student',
      component: Student,
    },
    {
      path: '/Lecturer',
      name: 'Lecturer',
      component: Lecturer,
    },
    {
      path: '/Settings',
      name: 'Settings',
      component: Settings,
    },
  ],
})

export default router;