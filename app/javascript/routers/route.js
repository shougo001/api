import Vue from 'vue'
import Router from 'vue-router'
import Mutters from '../views/mutters.vue'
import Login from '../views/login.vue'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/login',
      component: Login
    },
    {
      path: '/mutters',
      component: Mutters
    },
    // {
    //   path: '/app_vue',
    //   component: App
    // },
  ]
});
export default router;