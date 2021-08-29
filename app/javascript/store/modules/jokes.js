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
  addJoke: (state, joke) => {
    state.jokes.push(joke)
  },
}

const actions = {
  fetchJokes({ commit }) {
    axios.get('jokes')
      .then(res => {
        commit('setJokes', res.data)
      })
      .catch(err => console.log(err.response));
  },
  createJoke({ commit }, joke) {
    return axios.post('jokes', joke)
      .then(res => {
        commit('addJoke', res.data)
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
