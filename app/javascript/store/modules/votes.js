import axios from '../../plugins/axios'

const state = {
  votes: []
}

const getters = {
  votes: state => state.votes
}

const mutations = {
  setVotes: (state, votes) => {
    state.votes = votes
  },
  addVote: (state, vote) => {
    state.votes.push(vote)
  }
}

const actions = {
  fetchVotes({ commit }) {
    axios.get('votes')
      .then(res => {
        commit('setVotes', res.data)
      })
      .catch(err => {
        console.log(err.response)
      })
  },
  createVote({ commit }, joke) {
    return axios.post(`jokes/${joke.id}/votes`)
      .then(res => {
        commit('addVote', res.data)
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
