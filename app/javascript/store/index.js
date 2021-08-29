import Vue from 'vue'
import Vuex from 'vuex'
import jokes from './modules/jokes'
import users from './modules/users'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    jokes,
    users,
  }
})
