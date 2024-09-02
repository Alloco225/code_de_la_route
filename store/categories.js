
import QuizzDataService from "~/services/QuizzDataService"
import CategoryDataService from "~/services/CategoryDataService"
import { CATEGORIES } from '~/resources/db.js'

console.log(CATEGORIES)
const state = () => ({
  list:  CATEGORIES,
})


const getters = {
  list(){
    return state.list;
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
