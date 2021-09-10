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
  removeJoke: (state, removeJoke) => {
    state.jokes = state.jokes.filter(joke => {
      return joke.id != removeJoke.id
    })
  },
  ascSortJokes: (state) => {
    state.jokes.sort((a, b) => {
      return a.id - b.id
    })
  },
  descSortJokes: (state) => {
    state.jokes.sort((a, b) => {
      return b.id - a.id
    })
  },
  // voteSortJokes: (state) => {
  //   state.jokes.sort((a, b) => {
  //     return b.vote_count - a.vote_count
  //   })
  // },
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
    return axios.post('jokes', { joke: joke })
      .then(res => {
        commit('addJoke', res.data)
      })
  },
  deleteJoke({ commit }, joke) {
    return axios.delete(`jokes/${joke.id}`)
      .then(res => {
        commit('removeJoke', res.data)
      })
  },
  // updateVoteSortJokes({ commit }) {
  //   axios.get('jokes')
  //     .then(res => {
  //       commit('setJokes', res.data)
  //       commit('voteSortJokes')
  //     })
  // }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
