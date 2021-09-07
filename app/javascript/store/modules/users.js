import { faTheaterMasks } from '@fortawesome/free-solid-svg-icons'
import axios from '../../plugins/axios'

const state = {
  authUser: null,
  users: []
}

const getters = {
  authUser: state => state.authUser,
  users: state => state.users
}

const mutations = {
  setAuthUser: (state, user) => {
    state.authUser = user
  },
  setUsers: (state, users) => {
    state.users = users
  }
}

const actions = {
  async loginUser({ commit }, user) {
    const sessionsResponse = await axios.post('sessions', user)

    localStorage.auth_token = sessionsResponse.data.token
    axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`

    const userResponse = await axios.get('users/me')
    commit('setAuthUser', userResponse.data)
  },

  logoutUser({ commit }) {
    localStorage.removeItem('auth_token')
    axios.defaults.headers.common['Authorization'] = ''
    commit('setAuthUser', null)
  },

  async fetchAuthUser({ commit, state }) {
    if(!localStorage.auth_token) return null
    if(state.authUser) return state.authUser

    const userResponse = await axios.get('users/me')
      .catch((err) => {
        return null
      })
    if (!userResponse) return null

    const authUser = userResponse.data
    if (authUser) {
      commit('setAuthUser', authUser)
      return authUser
    } else {
      commit('setAuthUser', null)
      return null
    }
  },

  fetchUsers({ commit }) {
    axios.get('users')
      .then(res => {
        commit('setUsers', res.data)
      })
      .catch(err => {
        console.log(err.response)
      })
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
