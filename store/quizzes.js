
const state = {
  list: [
    {
      question: 'Quel est le nom de ce signe ?',
      image: '/degagement.jpg',
      answers: [
        {
          isCorrect: true,

          content: 'Panneau stop',
        },
        {
          content: 'Panneau passage piéton',
        },
        {
          content: 'Panneau chaussée glissante',
        },
        {
          content: 'Panneau arrêt obligatoire',
        },
      ],
    },
  ],
}


const getters = {}
const mutations = {}

const actions = {}


export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
