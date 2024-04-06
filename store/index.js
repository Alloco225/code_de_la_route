import Vuex from 'vuex'
import quizzes from './quizzes'

new Vuex.Store({
  state: () => ({
    counter: 0
  }),
  mutations: {
    increment(state) {
      state.counter++
    }
  },
  modules: {
    quizzes,
    todos: {
      namespaced: true,
      state: () => ({
        questions: []
      }),
      mutations: {
        add(state, { text }) {
          state.questions.push({
            text,
            done: false
          })
        },
        remove(state, { todo }) {
          state.questions.splice(state.questions.indexOf(todo), 1)
        },
        toggle(state, { todo }) {
          todo.done = !todo.done
        }
      }
    }
  }
})
