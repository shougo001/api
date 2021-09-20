import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import router from '../routers/route';;
import Login from '../views/login.vue'
import axios from 'axios';
import VueAxios from 'vue-axios';
import Buefy from 'buefy'

Vue.use(Vuex);
Vue.use(Buefy, {});
Vue.use(VueRouter);
Vue.use(VueAxios, axios);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(Login)
  }).$mount()
  document.body.appendChild(app.$el)
  
})
