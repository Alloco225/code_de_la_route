export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  vite: {
    define: {
      // dont forgot about JSON.stringify, because it adds quotes
      'process.env.APP_URL': JSON.stringify(process.env.APP_URL),
      // for example
      // 'process.env.APP_URL': '"https://myawesomesite.com"'
    }
  },
  env: {
    FACEBOOK_APP_ID: process.env.FACEBOOK_APP_ID,
    FACEBOOK_AUTO_LOG_APP_EVENTS: process.env.FACEBOOK_AUTO_LOG_APP_EVENTS,
    FACEBOOK_XFBML: process.env.FACEBOOK_XFBML,
    FACEBOOK_AUTH_VERSION: process.env.FACEBOOK_AUTH_VERSION,
  },
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Code de la Route',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.png' },
      { rel: 'stylesheet', href: '/main.css' },



    ],
    script: [
      { type:"module", src:"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"},
      { nomodule: true, src:"https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"},
      // FACEBOOK SDK
      { async:true, defer: true, crossorigin:"anonymous", src:"https://connect.facebook.net/en_US/sdk.js" }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [

  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    // {src: '~/plugins/confetti.js'}
    '~/plugins/app-mixin-plugin.js',
    '~/plugins/confetti.js',
    '~/plugins/persistent.js',
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    '@nuxt/typescript-build',
    // https://go.nuxtjs.dev/tailwindcss
    '@nuxtjs/tailwindcss',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    // https://go.nuxtjs.dev/pwa
    '@nuxtjs/pwa',
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
    baseURL: '/',
  },

  // PWA module configuration: https://go.nuxtjs.dev/pwa
  pwa: {
    manifest: {
      lang: 'en',
    },
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},
}
