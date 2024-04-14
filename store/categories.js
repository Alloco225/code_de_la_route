
import QuizzDataService from "~/services/QuizzDataService"
import CategoryDataService from "~/services/CategoryDataService"
import { CATEGORIES } from '~/resources/db.js'
const state = () => ({
  list: [
    
  ],
})


const getters = {
  list(){
    return state.list ?? JSON.parse(localStorage.getItem('categories')) ?? [];
  }
}
const mutations = {
  SET_ALL(data){
    console.log("SET_ALL", data);
    state.list = data;
  }
}

const actions = {

  async fetchAll({ commit, state, rootState, dispatch }){
    let list = [];
    if (rootState.ui.uiStates.useLocalDB){
      list = CATEGORIES
    }else{
      list = await CategoryDataService.getAll();
    }
    // mutations.SET_ALL(list)
    // state.list = list
    // commit('SET_ALL', list)
    return list;

  // console.log("COMMIT", commit('SET_ALL', 'ABDC'));
    // SET_ALL(list)
    // localStorage.setItem('categories', JSON.stringify(list));
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
