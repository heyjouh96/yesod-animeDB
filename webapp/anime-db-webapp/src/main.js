import Vue from 'vue';
import App from './App.vue';
import router from './router.js';
import Appheader from './components/App-header.vue'
import Appfooter from './components/App-footer.vue'
import VueResource from "vue-resource";


// Global Components
Vue.component('Appheader', Appheader)
Vue.component('Appfooter', Appfooter)
Vue.use(VueResource);
const vueApp = new Vue({
  el: '#app',
  router,
  render: h => h(App)
}).$mount('#app')
