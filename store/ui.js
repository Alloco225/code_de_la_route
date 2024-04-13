export default {
  namespaced: true,
  state: () => ({
    isLoading: {},
    uiStates: {},
  }),
  getters: {
    isLoading: (state) => (key) => {
      return state.isLoading[key] ?? false;
    },
    uiStates: (state) => (key) => {
      return state.uiStates[key] ?? null;
    },
  },
  mutations: {
    SET_STATE(state, { key, val = null }) {
      const data = { ...state.uiStates }
      data[key] = val;
      state.uiStates = data;
    },
    TOGGLE_LOADING(state, { key, val = false }) {
      const data = { ...state.isLoading }
      data[key] = val;
      state.isLoading = data;
    },
    TOGGLE_STATE(state, { key, val = null }) {
      const data = { ...state.uiStates }
      val = val ?? data[key] ?? null;
      if (val == null) {
        val = true;
      } else {
        val = !val;
      }
      data[key] = val;
      state.uiStates = data;
    },
    TOGGLE_STATE_VALUE(state, { key, val = null }) {
      const data = { ...state.uiStates }
      const currVal = data[key] ?? null;

      if (!!currVal) {
        val = false;
      }
      data[key] = val;
      state.uiStates = data;
    },
  },
  actions: {
    clearState({ commit }, { key }) {
      const val = undefined
      commit('SET_STATE', { key, val })
    },
    setState({ commit }, { key, val = null }) {
      commit('SET_STATE', { key, val })
    },
    toggleLoading({ commit }, { key, val = false }) {
      commit('TOGGLE_LOADING', { key, val })
    },
    toggleState({ commit }, { key, val = false }) {
      commit('TOGGLE_STATE', { key, val })
    },
    toggleStateValue({ commit }, { key, val = false }) {
      commit('TOGGLE_STATE_VALUE', { key, val })
    },
  }
}
