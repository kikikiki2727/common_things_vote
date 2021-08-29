import Vue from 'vue';
import Router from 'vue-router';

import JokeIndex from '../pages/jokes/index'
import JokeCreate from '../pages/jokes/create'
import UserRegister from '../pages/register/index'
import UserLogin from '../pages/login/index'

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
    {
      path: '/register',
      component: UserRegister,
      name: 'UserRegister',
    },
    {
      path: '/login',
      component: UserLogin,
      name: 'UserLogin',
    },
  ]
})

export default router
