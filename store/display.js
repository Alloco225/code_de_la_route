import { reactive, readonly } from "vue";
import axios from "axios";
//
const app = {
  // dev: process.env.VUE_APP_DEBUG,
  // dev: false,
  dev: true,
  apiKey: "AmaneHosanna",
};

const state = reactive({
  theme: 'light',
});

const display = reactive({
  modals: {
    auth: false,
    login: true,
    register: false,
    post_alerts: false,
    filters: false,
  },
  stack: [],
  ///
});


const methods = readonly({
  setTheme(theme) {
    state.theme = theme ?? 'light';
  },
  toggleTheme() {
    state.theme = state.theme == 'light' ? 'dark': 'light';

    alert('toggleTheme', state.theme)
  },

  display: {
    //? * Auth Modals
    openLoginModal() {
      display.modals.auth = true;
      display.modals.register = false;
      display.modals.login = true;
    },
    openRegisterModal() {
      display.modals.auth = true;
      display.modals.login = false;
      display.modals.register = true;
    },
    closeAuthModal() {
      display.modals.auth = false;
      display.modals.login = false;
      display.modals.register = false;
    },
    //? * Filter Modal
    openFiltersModal() {
      display.modals.filters = true;
    },
    closeFiltersModal() {
      display.modals.filters = false;
    },
    modals: {
      open(modal) {
        display.modals[modal] = true;
      },
      close(modal) {
        display.modals[modal] = false;
        console.log(
          ">> store.methods.display.modals.close",
          modal,
          display.modals[modal]
        );
      },
    },
  },
});

const appLog = function (...args) {
  if (app.dev) {
    console.log(...args);
  }
};



export default {
  app: readonly(app),
  display,
  methods,
  state,
};
