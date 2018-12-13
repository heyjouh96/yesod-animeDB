import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import Appheader from './components/App-header.vue'
import Appfooter from './components/App-footer.vue'
import './registerServiceWorker';


// Global Components
Vue.component('Appheader', Appheader)
Vue.component('Appfooter', Appfooter)

const vueApp = new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
}).$mount('#app')
