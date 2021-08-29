import Vue from 'vue';
import Router from 'vue-router';

import JokeIndex from '../pages/jokes/index'
import JokeCreate from '../pages/jokes/create'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes:[
    {
      path: '/',
      component: JokeIndex,
      name: 'JokeIndex'
    },
    {
      path: '/joke_create',
      component: JokeCreate,
      name: 'JokeCreate'
    },
  ]
})

export default router
