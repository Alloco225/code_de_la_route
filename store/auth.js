import AuthDataService from '~/services/AuthDataService'
import AuthService from '~/services/AuthDataService'
export default {
  state: ()=>({
    authUser: null,
    authMinUser: null,
    token: null,
  }),
  getters: {
    isAuthenticated(state) {
      return !!state.token
    },
    token(state) {
      return state.token
    },
    authUser(state) {
      return state.authUser
    },
    authMinUser(state) {
      return state.authMinUser
    },
  },
  mutations: {
    SET_USER(state, value) {
      state.authUser = value
    },
    SET_MIN_USER(state, value) {
      state.authMinUser = value
    },
    SET_TOKEN(state, value) {
      state.token = value
    },
    LOGOUT(state) {
      state.token = null;
      state.authUser = null;
      location.reload();
    },
  },
  actions: {
    async authenticate({ dispatch }) {
      const res = await AuthService.authenticate();
      console.log("auth.authenticate", res)
      if (!res.success) {
        dispatch('logout');
      }

      dispatch('login', res.data)
    },
    login({ commit }, { auth_user, auth_min_user, token }) {
      console.log("actions.login, auth_user", auth_user, "token", token);
      commit('SET_USER', auth_user)
      commit('SET_MIN_USER', auth_min_user)
      commit('SET_TOKEN', token)
    },
    async loginViaFacebook({ commit },) {
      console.log("auth.loginViaFacebook");
      const auth_data = await AuthDataService.loginViaFacebook()



      console.log("actions.login, auth_user", auth_data);
      // commit('SET_USER', auth_user)
      // commit('SET_MIN_USER', auth_min_user)
      // commit('SET_TOKEN', token)
    },
    logout({ commit }, redirectTo) {
      console.log("actions.logout");
      commit('LOGOUT')
    },
  }
}
