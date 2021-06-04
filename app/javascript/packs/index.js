import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import router from '../routes';
import App from '../index';
import Buefy from 'buefy'

Vue.use(Vuex);
Vue.use(Buefy, {});
Vue.use(VueRouter);

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#contents',
    router,
    render: (h) => h(App),
  });
});
