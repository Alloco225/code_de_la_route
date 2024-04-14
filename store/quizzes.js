
import { QUIZZES } from "~/resources/db";
import QuizzDataService from "~/services/QuizzDataService"

const state = () => ({
  list: QUIZZES,
})


const getters = {
  list() {
    return state.list
  }
}
const mutations = {

}

const actions = {

}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
