
import QuizzDataService from "~/services/QuizzDataService"
import CategoryDataService from "~/services/CategoryDataService"

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
    const list = await CategoryDataService.getAll();
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
