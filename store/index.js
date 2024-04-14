import Vuex from 'vuex'
import categories from './categories'
import quizzes from './quizzes8'
import auth from './auth'
import ui from './ui'

new Vuex.Store({
  modules: {
    auth,
    categories,
    ui,
    quizzes,
  }
})
