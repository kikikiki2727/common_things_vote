import Vue from 'vue';
import Router from 'vue-router';

import TopIndex from '../pages/jokes/index'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes:[
    {
      path: '/',
      component: TopIndex,
      name: 'JokeIndex'
    },
  ]
})

export default router
