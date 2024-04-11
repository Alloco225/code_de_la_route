
import QuizzDataService from "~/services/QuizzDataService"
import QuestionDataService from "~/services/QuestionDataService"

const state = () => ({
  list: [],
})


const getters = {
  list(){
    return state.list;
  }
}
const mutations = {
  SET_ALL(data){
    state.list = data;
  }
}

const actions = {
  async fetchAll({state}){
    console.log("fetchAllQuestions");

    const list = await QuestionDataService.getAll();
    state.list = list
    console.log("state list", state.list);
  }
}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
