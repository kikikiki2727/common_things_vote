const state = {
  message: ''
}

const getters = {
  message: state => state.message
}

const mutations = {
  setMessage (state, { message, timeout }) {
    state.message = message

    if (typeof timeout === 'undefined') {
      timeout = 3000
    }

    setTimeout(() => (state.message = null), timeout)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
}
