
import { QUIZZES } from "~/resources/db";
import QuizzDataService from "~/services/QuizzDataService"

const state = () => ({
  list: [],
})


const getters = {
  list() {
    return state.list;
  }
}
const mutations = {
  SET_ALL(data) {
    state.list = data;
  }
}

const actions = {
  async fetchAll({ commit, state, rootState }) {
    let list = [];
    if (rootState.ui.uiStates.useLocalDB) {
      list = QUIZZES
    } else {
      list = await QuizzDataService.getAll();
    }
    // commit('SET_ALL', list)
    state.list = list
    console.log("state list", state.list);
  },
  async fetch({ state }, category_id) {
    console.log("fetchQuizz");
    const list = await QuizzDataService.get(category_id);
    state.list = list
    console.log("category quizz", state.list);
  },
}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
