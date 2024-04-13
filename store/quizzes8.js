const state = ()=>({
  list: [],
})


const getters = {
  list(){
    return []
    return state.list.slice(0, 3)
  }
}
const mutations = {}

const actions = {

}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
