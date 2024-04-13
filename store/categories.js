
import QuizzDataService from "~/services/QuizzDataService"
import CategoryDataService from "~/services/CategoryDataService"
import { CATEGORIES } from '~/resources/db.js'
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

  async fetchAll({ commit, state, rootState }){
    let list = [];
    if (rootState.ui.uiStates.useLocalDB){
      list = CATEGORIES
    }else{
      list = await CategoryDataService.getAll();
    }
    // commit('SET_ALL', list)
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
