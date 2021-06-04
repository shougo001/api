import Vue from 'vue'
import VueRouter from 'vue-router'
import Hello from './app.vue'
import Mutters from './mutters.vue'
import Helloworlds from './hello.vue'

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/helloworlds_vue/',
      component: Helloworlds
    },
    {
      path: '/mutters_vue/',
      component: Mutters
    },
    {
      path: '/app_vue/',
      component: Hello
    },
  ],
});
