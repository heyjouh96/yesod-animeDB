import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [{
      path: '/',
      name: 'home',
      component: () => import( /* webpackChunkName: "about" */ './views/Home.vue')
    },
    {
      path: '/admin',
      name: 'admin',
      component: () => import( /* webpackChunkName: "about" */ './views/Event.vue')
    },
      {path: '*', redirect: '/'}
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})