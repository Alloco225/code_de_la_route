<template>
  <div
    class="transition duration-200 ease-out h-full w-full flex flex-col px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5 pb-10"
  >
    <nav class="justify-between hidden">
      <img src="/favicon.png" alt="" class="w-24 h-24" />

      <ul>
        <a href="">login</a>
      </ul>
    </nav>
    <section
      class="h-full flex flex-col gap-10 justify-center mx-auto w-1/2 py-24"
    >
      <div class="flex justify-center">
        <img src="/favicon.png" alt="" />
      </div>
      <h1 class="text-4xl font-semibold text-center">
        Maitriser le Code de la Route n'a jamais été aussi facile
      </h1>
      <h2 class="text-xl text-gray-700 font-medium text-center">
        Apprennez les panneaux de signalisation, et testez vos connaissances à
        travers une série de questions variés et interactives.
      </h2>

      <div class="flex justify-center gap-3 text-white">
        <button class="rounded bg-black px-2 py-1">Apple Store</button>
        <button class="rounded bg-black px-2 py-1">Play Store</button>
      </div>
    </section>
    <section class="py-10">
      <h2 class="text-2xl font-medium text-center">
        Des quiz sur chaque sujet pour vous tester
      </h2>

      <mini-quizz></mini-quizz>
    </section>

    <!-- testimonies -->
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data() {
    return {
      email: null,
      password: null,
    }
  },
  async created() {
    console.log('menu')
    this.toggleLoading('initApp', true)
    await this.initApp()
    this.toggleLoading('initApp', false)
  },
  mounted() {
    console.log('mounted')
  },
  computed: {
    isAuth() {
      // return supabase.auth.user();
      return this.$store.state.auth.isAuth
      return this.$store.getters['categories/list']
    },
    categories() {
      return this.$store.state.categories.list
      return this.$store.getters['categories/list']
    },
    categories() {
      return this.$store.state.categories.list
      return this.$store.getters['categories/list']
    },
    menu() {
      return this.$store.state.app.menu
      return this.$store.getters['categories/list']
    },
  },
  methods: {
    async initApp() {
      console.log('initApp')

      // Initialize Facebook SDK
      window.fbAsyncInit = function () {
        FB.init({
          appId: process.env.FACEBOOK_APP_ID,
          autoLogAppEvents: process.env.FACEBOOK_AUTO_LOG_APP_EVENTS,
          xfbml: process.env.FACEBOOK_XFBML,
          version: process.env.FACEBOOK_AUTH_VERSION,
        })
      }
    },

    async login() {
      try {
        const { user, session, error } = await supabase.auth.signIn({
          email: this.email,
          password: this.password,
        })

        if (error) {
          console.error(error.message)
        } else {
          console.log('Authenticated successfully', user, session)
          // Redirect or do something else upon successful authentication
        }
      } catch (error) {
        console.error('Error signing in:', error.message)
      }
    },

    gotoCategory(category) {
      this.$router.push('/categories/' + category.id)
    },
  },
}
</script>

<style></style>
