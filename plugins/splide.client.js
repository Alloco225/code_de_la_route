// import Vue from "vue";
// import VueSplide from "@splidejs/vue-splide";

// Vue.use(VueSplide);


// import { createApp } from "vue";
// import App from "./App.vue";
// import VueSplide from "@splidejs/vue-splide";

// const app = createApp(App);
// app.use(VueSplide);
// app.mount("#app");


import Vue from "vue";
import VueSplide from "@splidejs/vue-splide";
import "@splidejs/splide/dist/css/themes/splide-default.min.css";

Vue.use(VueSplide);
new Vue({
  el: "#app",
  render: (h) => h(App),
});
