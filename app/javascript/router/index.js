import Vue from 'vue';
import Router from 'vue-router';
import store from '../store'

import JokeIndex from '../pages/jokes/index'
import JokeCreate from '../pages/jokes/create'
import UserRegister from '../pages/register/index'
import UserLogin from '../pages/login/index'
import TermsOfService from '../pages/shared/TermsOfService'
import NotFound from '../pages/shared/NotFound'

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
      name: 'JokeCreate',
      meta: { requiredAuth: true },
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
    {
      path: '/terms',
      component: TermsOfService,
      name: 'TermsOfService',
    },
    {
      path: '*',
      component: NotFound,
      name: 'NotFound',
    }
  ]
})

// router.beforeEachを使ってページ遷移時、リロード時に毎回この処理を実行する
// storeのfetchAuthUserを実行してログイン状態を保持する
// ログインユーザーがいないかつログイン必須のページに遷移する場合はログインページに飛ばす。
router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'UserLogin' });
      store.commit('flash/setMessage', { message: 'ログインしてください', timeout: 3000 })
    } else {
      next();
    }
  })
});

export default router
