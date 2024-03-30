import { reactive, readonly } from "vue";
import { Loader } from "@googlemaps/js-api-loader";

import axios from "axios";
//
const app = {
  // dev: process.env.VUE_APP_DEBUG,
  // dev: false,
  dev: true,
  apiKey: "AmaneHosanna",
};

const state = reactive({
  filters: {
    location: null,
    houseType: null,
    rooms: null,
    budget_min: null,
    budget_max: null,
    amenities: [],
  },
  isPostsLoading: false,
  posts: [],
  featuredPosts: [],
  mainMap: null,
  isMapLoaded: false,

  //
  blogPosts: [],
  featuredBlogPosts: [],
});

const router = reactive({
  redirectTo: null,
});

const auth = reactive({
  authenticated: false,
  user: {},
  user_token: null,
  error: null,
  ///
});

const display = reactive({
  modals: {
    auth: false,
    login: true,
    register: false,
    post_alerts: false,
    filters: false,
    postReport: false,
  },
  stack: [],
  ///
});

const data = reactive({
  initialLocation: [-3.940990899081996, 5.347107276414015],
  filterOptions: {
    rooms: [1, 2, 3, 4, 5, "MORE"],
    // houseTypes: ["MULTI_STOREY", "SINGLE_STOREY", "VILLA", "RESIDENCE"],
    // houseTypes: ["tout","immeuble", "maison_basse", "villa", "residence"],
    houseTypes: [
      { key: "ALL", value: "tout" },
      { key: "MULTI_STOREY", value: "immeuble" },
      { key: "SINGLE_STOREY", value: "maison_basse" },
      { key: "VILLA", value: "villa" },
      { key: "RESIDENCE", value: "residence" },
    ],
  },

  posts: [],

  popular: {
    places: [
      "Abidjan",
      "Anono",
      "Angré",
      "Angré Chateau",
      "Bingerville",
      "Cocody",
      "Riviera",
    ],
    types: [
      // "Studio",
      // "Chambre salon",
      // "2 pièces",
      // "3 pièces",
      "Villa",
      "Residence meublée",
    ],
    rooms: [
      {
        1: "Studio",
      },
      { 2: "Chambre salon" },
      {
        2: "2 pièces",
      },
      {
        3: "3 pièces",
      },
    ],
  },

  amenities: [
    {
      name: "cuisine",
      icon: "kitchen",
    },
    {
      name: "parc",
      icon: "park",
    },
    {
      name: "parking",
      icon: "garage",
    },
    {
      name: "hopital",
      icon: "health_and_safety",
    },
    {
      name: "securite",
      icon: "security",
    },
    {
      name: "piscine",
      icon: "pool",
    },
  ],

  services: [
    {
      title: "Louer une maison",
      icon: "gite",
      description:
        "Plus de 300k offres/jour, louer une maison à abidjan n'a jamais été aussi facile",
      link: "/carte",
      linkText: "Trouver ma maison",
    },
    {
      title: "Mettre une maison en location",
      icon: "storefront",
      description:
        "Avec plus de 500k utilisateurs/jour, vous êtes garantie de trouver des preneurs dans la minute",
      link: "/louer",
      linkText: "Louer ma maison",
    },
  ],
});

const methods = readonly({
  filter() {},
  async initApp() {
    // Load some posts
    // this.loadPosts();
    await this.fetchPosts();

    this.filterPosts();
    // init the featured and
    state.featuredPosts = state.posts?.slice(0, 6);
  },
  async loadMap() {
    try {
      const additionalOptions = {};
      const loader = new Loader({
        // apiKey: process.env.GOOGLE_MAPS_API_KEY,
        apiKey: "AIzaSyA9JipVZJT3YBuubacA8fbr9sTw_QsmO68",
        version: "weekly",
        ...additionalOptions,
      });
      // const center = {
      //   lat: 5,
      //   lng: -3
      // }
      await loader.load();
      state.isMapLoaded = true;
      this.$emit("mapLoaded");
    } catch (error) {
      console.log("xx loadMap", error);
      state.isMapLoaded = false;
    }
  },
  async filterPosts() {
    state.posts = data.posts;
    // Filter posts and paginate
    state.isPostsLoading = true;
    let query = "?";
    Object.keys(state.filters).forEach((key) => {
      if (state.filters[key]) {
        query += key + "=" + state.filters[key];
        query += "&";
      }
    });
    console.log(">> filterPosts", query);
    const url = process.env.API_URL + "/posts" + query;
    let resp = await axios.get(url);
    state.posts = resp.data.data;
    state.isPostsLoading = false;
    //
    console.log("<< filterPosts", data.posts);
  },
  async fetchPosts() {
    console.log(">> fetchPosts");
    const url = process.env.API_URL + "/posts";
    state.isPostsLoading = true;
    
  
    let resp = await axios.get(url);
    console.log("<< fetchPosts data", resp.data);
    if(!resp.data?.success){
      // ! // TODO Display error message
    }
    data.posts = resp.data.data;
    state.isPostsLoading = false;
    

    //
    console.log("<< fetchPosts", data.posts);
  },
  async loadPosts() {
    console.log(">> loadPosts");
    let list = new Array(16).fill(0);
    for (var i = 0; i < list?.length; i++) {
      list[i] = i;
    }
    let images = Array(3).fill("");
    for (var i = 0; i < images?.length; i++) {
      images[i] = "images/" + i + ".png";
    }
    let amenities = [
      {
        name: "cuisine",
        icon: "bath",
      },
      {
        name: "parking",
        icon: "local_parking",
      },
      {
        name: "hopital",
        icon: "health_and_safety",
      },
      {
        name: "securite",
        icon: "security",
      },
      {
        name: "piscine",
        icon: "pool",
      },
      {
        name: "garage",
        icon: "garage",
      },
      {
        name: "jardin",
        icon: "yard",
      },
    ];

    state.posts = list.map((i) => ({
      id: i,
      rooms: Math.floor(Math.random() * 5),
      price: Math.floor(Math.random() * 10) * 20000,
      caution: Math.floor(Math.random() * 10) * 20000,
      priceType: "MONTHLY",
      houseType: "MULTISTOREY",
      images,
      location: "Abidjan",
      storeyNumber: 3,
      amenities,
      storeyCount: 4,
      phone: "+2250574936826",
      publisher: "Amane Hosanna",
      createdAt: new Date(),
    }));

    console.log("<< loadPosts", state.posts);
  },
  async loadBlogPosts() {
    state.blogPosts = [
      {
        title: "post",
      },
    ];
  },

  posts: {
    async incrementViews(post_id) {
      const url = process.env.API_URL + "/posts/" + post_id + "/views";
      const auth_user = auth.authenticated ? auth.user.id : auth.user_token;
      console.log(">> incrementViews ", post_id, auth_user, url);
      let resp = await axios.post(url, { auth_user });
      console.log(">> incrementViews ", post_id, resp.data.data);
    },
    async toggleFavorite(post_id) {
      const url = process.env.API_URL + "/posts/" + post_id + "/favorite";
      const auth_user = auth.authenticated ? auth.user.id : auth.user_token;
      console.log(">> toggleFavorite ", post_id, auth_user, url);
      let resp = await axios.post(url, { auth_user });
      console.log("<< toggleFavorite ", post_id, resp.data.data);
    },
  },

  notify(val) {
    console.log(">> notify", val);
    state.notification = val;
  },
  auth: {
    async login(credentials) {
      const url = process.env.API_URL + "/login";

      console.log(">> ss login", url, credentials);
      auth.error = null;
      return axios
        .post(url, credentials)
        .then(({ data }) => {
          console.log("<< login", data);

          // commit("SET_USER", data);
          if (!data.success) {
            auth.error = data.message;
            this.$toast.show(auth.error)
            return;
          }
          auth.user = data.data;
          auth.authenticated = true;
          localStorage.setItem("ALLOCO225_USER", JSON.stringify(auth.user));
          axios.defaults.headers.common[
            "Authorization"
          ] = `Bearer ${data.token}`;
          // commit("SET_AUTHENTICATED", true);
          // state.router.push({ name: "dashboard" });
        })
        .catch(({ response: { data } }) => {
          console.log("xx login", data);
          this.$toast.show("Une erreur s'est produite")

          // commit("SET_USER", {});
          auth.user = {};
          // commit("SET_AUTHENTICATED", false);
          auth.authenticated = false;
        });
    },
    logout() {
      // TODO add analytics
      auth.user = {};
      auth.authenticated = false;
      localStorage.removeItem("ALLOCO225_USER");
      axios.defaults.headers.common["Authorization"] = null;
      // location.reload();
      // commit("SET_USER", {});
      // commit("SET_AUTHENTICATED", false);
    },
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
    //? * Report Post Modal
    openPostReportModal() {
      display.modals.postReport = true;
    },
    closePostReportModal() {
      display.modals.postReport = false;
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

const sleep = function (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
};

export default {
  auth,
  app: readonly(app),
  appLog,
  display,
  data,
  methods,
  router,
  sleep,
  state,
};
