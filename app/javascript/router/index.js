import Vue from 'vue';
import Router from 'vue-router';
import store from '../store'

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
      name: 'JokeCreate',
      meta: { requireAuth: true },
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

// router.beforeEachを使ってページ遷移時、リロード時に毎回この処理を実行する
// storeのfetchAuthUserを実行してログイン状態を保持する
// ログインユーザーがいないかつログイン必須のページに遷移する場合はログインページに飛ばす。
router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'LoginIndex' });
      alert('ログインが必要です')
    } else {
      next();
    }
  })
});

export default router
