import axios from '../../plugins/axios'

const state = {}

const getters = {}

const mutations = {}

const actions = {
  async loginUser(user) {
    const sessionsResponse = await axios.post('sessions', user)

    localStorage.auth_token = sessionsResponse.data.token

    axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
