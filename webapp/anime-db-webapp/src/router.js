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
      path: '/delecao',
      name: 'delecao',
      component: () => import( /* webpackChunkName: "about" */ './views/Delecao.vue')
    },
    {
      path: '/consulta',
      name: 'consulta',
      component: () => import( /* webpackChunkName: "about" */ './views/Consulta.vue')
    },
    {
      path: '/consulta/:input',
      name: 'consulta',
      props: true,
      component: () => import( /* webpackChunkName: "about" */ './views/Anime.vue')
    },
    {
      path: '/pesquisa/:input',
      name: 'consulta',
      props: true,
      component: () => import( /* webpackChunkName: "about" */ './views/Pesquisa.vue')
    },
    {
      path: '/comentar/:input',
      name: 'comentar',
      props: true,
      component: () => import( /* webpackChunkName: "about" */ './views/Comentar.vue')
    },
    {
      path: '/cadastro',
      name: 'cadastro',
      component: () => import( /* webpackChunkName: "about" */ './views/Cadastro.vue')
    },
    
    {
      path: '/editar/:input',
      name: 'editar',
      props: true,
      component: () => import( /* webpackChunkName: "about" */ './views/Editar.vue')
    },
      {path: '*', redirect: '/'}
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})