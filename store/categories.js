
import QuizzDataService from "~/services/QuizzDataService"
import CategoryDataService from "~/services/CategoryDataService"

const state = {
  list: [
    {
        name: "Dégagement",
        id: "debottlenecking",
        imageUrl: "https://ecoledeconduite.caaquebec.com/fileadmin/templates/ecoles/Conseils/changement_de_voie.png"
    },
    {
        name: "Signalisation",
        id: "signals",
        imageUrl: "https://img.freepik.com/vecteurs-libre/collection-icones-panneaux-routiers_1410-62.jpg"
    }
  ],
}


const getters = {}
const mutations = {
  SET_ALL(data){
    state.list = data;
  }
}

const actions = {
  async fetchAll(commit){
    const list = await CategoryDataService.getAll();
    commit('SET_ALL', list)
  }
}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
