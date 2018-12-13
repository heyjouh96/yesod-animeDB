import Vue from 'vue';
import App from './App.vue';
import router from './router.js';
import Appheader from './components/App-header.vue'
import Appfooter from './components/App-footer.vue'


// Global Components
Vue.component('Appheader', Appheader)
Vue.component('Appfooter', Appfooter)

const vueApp = new Vue({
  el: '#app',
  router,
  render: h => h(App)
}).$mount('#app')
