if (process.env.NODE_ENV !== "production") require("dotenv").config();
export default {
  env: {
    API_SECRET_KEY: process.env.API_SECRET_KEY,
    // MAP_ACCESS_TOKEN: process.env.MAP_ACCESS_TOKEN,
    MAP_ACCESS_TOKEN:
      "pk.eyJ1IjoiLWEtYS0iLCJhIjoiY2twaTd2Ym5nMDc2bTJwcG52Zzg5YWw1bCJ9.Vkws2QfR0bUq3PI4dd-9Kw",
    BASE_URL: "https://nuxtjs.org",
    API_SECRET: "1234",
    API_URL: "https://alloco225-api.amane.dev/v1",
    // API_URL: "http://localhost:8008/v1"
    API_KEY: process.env.API_KEY,
    AUTH_DOMAIN: process.env.AUTH_DOMAIN,
    PROJECT_ID: process.env.PROJECT_ID,
    STORAGE_BUCKET: process.env.STORAGE_BUCKET,
    MESSAGING_SENDER_ID: process.env.MESSAGING_SENDER_ID,
    APP_ID: process.env.APP_ID,
    MEASUREMENT_ID: process.env.MEASUREMENT_ID,
  },
  routeRules: {
    '/v1/**': { proxy: { to: "http://localhost:8008/v1/**" } }
  },
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: "Alloco225",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: "" },
      { name: "format-detection", content: "telephone=no" },
    ],
    link: [
      {
        rel: "stylesheet",
        href: "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css",
      },
      { rel: "icon", type: "image/x-icon", href: "/favicon.ico" },
      {
        rel: "stylesheet",
        href: "https://fonts.googleapis.com/icon?family=Material+Icons+Outlined",
      },
      {
        rel: "stylesheet",
        href: "/css/main.js",
      },
      {
        rel: "stylesheet",
        href: "https://fonts.googleapis.com/icon?family=Material+Icons",
      },
      {
        rel: "preconnect",
        href: "https://fonts.googleapis.com",
      },
      {
        rel: "preconnect",
        href: "https://fonts.gstatic.com",
        crossorigin: true,
      },
      {
        href: "https://fonts.googleapis.com/css2?family=Exo:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap",
        rel: "stylesheet",
      },
      {
        // ? Splide carousel
        rel: "stylesheet",
        href: "https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css",
      },
    ],
    script: [
      {
        defer: true,
        // ? Splidejs for carousel animation
        src: "https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js",
      },

      {
        type: "module",
        // ? IonIcons - Icons
        src: "https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js",
      },
      {
        // ? IonIcons - Icons
        src: "https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js",
      },
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    // { src: '~/plugins/firebase.js', ssr: false }
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/tailwindcss
    "@nuxtjs/tailwindcss",
    // ["@nuxtjs/dotenv", { filename: ".env" }],
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    "@nuxtjs/axios",

    // https://go.nuxtjs.dev/pwa
    "@nuxtjs/pwa",
    // https://go.nuxtjs.dev/content
    "@nuxt/content",
    // {src: "@splidejs/splide", mode: 'client'}
    // {src: '~/plugins/splide.js', mode: 'client'}
    '@nuxtjs/toast',

    '@nuxtjs/firebase',
    
  ],
  firebase: {
    config: {
      // apiKey: process.env.API_KEY,
      // authDomain: process.env.AUTH_DOMAIN,
      // projectId: process.env.PROJECT_ID,
      // storageBucket: process.env.STORAGE_BUCKET,
      // messagingSenderId: process.env.MESSAGING_SENDER_ID,
      // appId: process.env.APP_ID,
      // measurementId: process.env.MEASUREMENT_ID
      apiKey: "AIzaSyDWRoAoE7hviPq-n4D7CKRpzBIfOQr70Kg",
      authDomain: "alloco225-2de3a.firebaseapp.com",
      projectId: "alloco225-2de3a",
      storageBucket: "alloco225-2de3a.appspot.com",
      messagingSenderId: "37323225424",
      appId: "1:37323225424:web:7b03f1b6b3fd0aee7d9455",
      measurementId: "G-JYS5JFYXZ7",
    },
    services: {
      auth: true,
      firestore: true,
      // functions: true,
      // storage: true,
      // database: true,
      // messaging: true,
      // performance: true,
      // appCheck: true,
      // analytics: true,
      // remoteConfig: true,
    }
  },
  // toast module config
  toast: {
    position: 'bottom-left',
    register: [ // Register custom toasts
      {
        name: 'error',
        message: "Oups...Une erreur s'est produite",
        options: {
          type: 'error'
        }
      }
    ]
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    // baseurl: 'https://api.github.com',
    proxyheaders: false,
    credentials: false
  },

  // PWA module configuration: https://go.nuxtjs.dev/pwa
  pwa: {
    manifest: {
      lang: "en",
    },
  },

  // Content module configuration: https://go.nuxtjs.dev/config-content
  content: {},

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},

  // Router config for auth guard
  // TODO add router guard for profile pages
  // router: {
  //   routes: [
  //     {
  //       path: "/protected",
  //       component: "pages/protected.vue",
  //       middleware: "auth",
  //     },
  //   ],
  // },
};
