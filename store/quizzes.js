
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
  async fetchAll({ state }) {
    console.log("fetchAllQuizzes");
    const list = await QuizzDataService.getAll();
    state.list = list
    console.log("state quizzes", state.list);
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
