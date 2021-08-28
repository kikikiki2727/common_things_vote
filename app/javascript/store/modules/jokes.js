import axios from '../../plugins/axios'

const state = {
  jokes: []
}

const getters = {
  jokes: state => state.jokes
}

const mutations = {
  setJokes: (state, jokes) => {
    state.jokes = jokes
  },
}

const actions = {
  fetchJokes({ commit }) {
    axios.get('jokes')
      .then(res => {
        commit('setJokes', res.data)
      })
      .catch(err => console.log(err.response));
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
