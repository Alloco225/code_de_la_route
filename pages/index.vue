<template>
  <HomePage id="app" :class="bodyClass" />
</template>

<script>
import "@/static/css/transitions.css";
import display from "@/store/display";
import store from "@/store/index";
import appRoutes from "@/store/routes";
// import axios from "axios";

export default {
  head() {
    return {
      link: [
        // Add this
        {
          rel: "stylesheet",
          href: "https://fonts.googleapis.com/icon?family=Material+Icons+Outlined",
        },
        // App Transitions
        // { rel: 'stylesheet', href: '@/static/css/transitions.css' }
      ],
    };
  },
  data() {
    return {
      showPreloader: true,
    };
  },
  provide: { ss: store, ui: display, appRoutes, },
  created() {
    //
    if (typeof window !== "undefined") {
      const userString = localStorage.getItem("ALLOCO225_USER");
      if (userString) {
        const userData = JSON.parse(userString);
        store.auth.user = userData;
        store.auth.authenticated = true;
        this.loadApp = true;
      }
    }
    // axios.interceptors.response.use(
    //   (response) => response,
    //   (error) => {
    //     if (error.response) {
    //       if (error.response.status == 401) {
    //         store.methods.logout();
    //       }
    //     }
    //     Promise.reject(error);
    //   }
    // );
  },
  onMounted() {
    this.showPreloader = false;

    this.setSystemPreferredTheme();
    window
      .matchMedia("(prefers-color-scheme: dark)")
      .addListener(this.setSystemPreferredTheme);
  },
  computed: {
    theme(){
      return display.theme;
    },
    bodyClass () {
      return this.theme === 'dark' ? 'dark-mode' : ''
    }
  },
  methods: {
    fetchData() {
      store.methods.users.fetch();
      store.methods.place_categories.fetch();
      store.methods.places.fetch();
      store.methods.geojson.fetch();
    },
    setTheme(theme){
      display.theme = theme;
    },
    setSystemPreferredTheme (event) {
      const darkMode = event ? event.matches : window.matchMedia('(prefers-color-scheme: dark)').matches
      this.setTheme(darkMode ? 'dark' : 'light')
    },

    toggleTheme () {
      this.setTheme(this.theme === 'light' ? 'dark' : 'light')
    }
  },
  watch: {
    "store.auth.authenticated": function (authenticated) {
      if (authenticated) {
        this.fetchData();
      }
    },
    $route: {
      immediate: true,
      /* eslint-disable */
      handler(to, from) {
        if (process.client) {
          document.title = to.meta.title || "Alloco225";
        }
      },
    },
  },
};
</script>

<style>
html,
body,
#app,
#__nuxt,
#__layout,
#login-page,
#register-page {
  height: 100vh;
}
/* APP GLOBAL STYLES */

/* width */
::-webkit-scrollbar {
  width: 5px;
  height: 5px;
}

::-webkit-scrollbar-track {
  /* box-shadow: inset 0 0 2px rb; */
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background: rgba(118, 133, 122, 0.4);
  border-radius: 10px;
}
/* APP TRANSITIONS */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

body {
  --background-color: #fff;
  --text-color: #333;
}

.dark-mode {
  --background-color: #333;
  --text-color: #fff;
}
</style>
