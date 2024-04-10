const state = {
  list: [
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f901ccb11b227491c3570.png",
      answers: [
        {
          content: "Panneau Rond Point",
        },
        {
          content: "Panneau Attention Virage à gauche",
        },
        {
          content: "Panneau STOP sur un poteau",
          isCorrect: true,
        },
        {
          content: "Panneau Accès interdits aux motos",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f9250cb11b227491c357d.png",
      answers: [

        {
          content: "Panneau STOP sur un poteau",
        },
        {
          content: "Panneau Rond Point",
          isCorrect: true,
        },
        {
          content: "Panneau Arrêt et stationnement interdits",
        },
        {
          content: "Panneau Céder le passage",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",
      // image: "https://assets.stickpng.com/thumbs/585f90abcb11b227491c3571.png",
      image: "/signals/585f90abcb11b227491c3571.png",
      answers: [

        {
          content: "Panneau Arrêt au poste de douane",
        },
        {
          content: "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
        },
        {
          content: "Panneau Céder le passage",
          isCorrect: true,
        },
        {
          content: "Panneau STOP sur un poteau",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8f6dcb11b227491c355c.png",
      answers: [

        {
          content: "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
          isCorrect: true,
        },
        {
          content: "Panneau Arrêt au poste de douane",
        },

        {
          content: "Panneau Arrêt et stationnement interdits",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8f49cb11b227491c3558.png",
      answers: [

        {
          content: "Panneau Arrêt au poste de douane",
        },
        {
          content: "Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué",
        },
        {
          content: "Panneau Accès interdits aux motos",
          isCorrect: true,
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8f74cb11b227491c355d.png",
      answers: [
        {
          content: "Panneau STOP sur un poteau",
        },
        {
          content: "Panneau Arrêt au poste de douane",
          isCorrect: true,
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8f29cb11b227491c3555.png",
      answers: [
        {
          content: "Panneau Accès interdits aux motos",
        },
        {
          content: "Panneau Arrêt et stationnement interdits",
          isCorrect: true,
        },

        {
          content: "Panneau Attention Virage à gauche",
        },
        {
          content: "Panneau STOP sur un poteau",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8f40cb11b227491c3557.png",
      answers: [
        {
          content: "Panneau Bouchon Possible",
        },
        {
          content: "Panneau Attention Virage à gauche",
          isCorrect: true,
        },
        {
          content: "Panneau STOP sur un poteau",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8ef8cb11b227491c3550.png",
      answers: [

        {
          content: "Panneau Attention Virage à gauche",
        },

        {
          content: "Panneau Bouchon Possible",
          isCorrect: true,
        },
        {
          content: "Panneau Chaussée glissante",
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f8fb9cb11b227491c3563.png",
      answers: [
        {
          content: "Panneau Chaussée glissante",
        },
        {
          content: "Panneau STOP sur un poteau",
        },
        {
          content: "Panneau Cassis ou dos-d'âne",
          isCorrect: true,
        },
      ]
    },
    {
      category_id: "signals",
      question: "De quel panneau s'agit-il ?",

      image: "/signals/585f900ecb11b227491c356e.png",
      answers: [

        {
          content: "Panneau Cassis ou dos-d'âne",
        },
        {
          content: "Panneau Chaussée glissante",
          isCorrect: true,
        },
        {
          content: "Panneau Bouchon Possible",
        },
        {
          content: "Panneau STOP sur un poteau",
        },
      ]
    }
  ],
}


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
