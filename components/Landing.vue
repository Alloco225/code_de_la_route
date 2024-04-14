<template>
  <div
    class="transition duration-200 ease-out h-full w-full flex flex-col  px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5"
    :class="[isLoading('initApp') ?  'justify-center':  'justify-between']"
  >
    <div class="mt-5 md:my-10 text-white text-center px-2 transition duration-200 ease-out">
      <img src="/logo.png" alt="" class="h-auto w-full" />
      <span>v0.1.3</span>
    </div>

    <transition>
      <div v-if="!isLoading('categories')" class="flex flex-col gap-3 transition duration-200 ease-out">
        <!-- <h4 class="text-center text-white text-xl uppercase font-medium">Categories</h4> -->

        <div class="grid md:grid-cols-2 gap-5 md:gap-3 md:mt-10">
          <article
            @click="gotoCategory(category)"
            v-for="category in categories"
            :key="category.id"
            class="group rounded hover:shadow-lg cursor-pointer md:rounded-lg overflow-hidden border relative h-32 md:h-32"
          >
            <img
              :src="category.image"
              alt=""
              class="absolute w-full h-full object-cover"
            />

            <div
              class="absolute group-hover:hidden top-0 left-0 w-full h-full bg-black bg-opacity-20"
            ></div>
            <div
              class="absolute bottom-0 text-md bg-gradient-to-b from-transparent to-black text-white p-2 py-3 w-full"
            >
              <h3 class="text-center uppercase text-2xl">
                {{ category.name }}
              </h3>
            </div>
          </article>
        </div>
      </div>
    </transition>

    <div class="flex justify-center items-center">
      <!-- <facebook-login-button></facebook-login-button> -->
    </div>

    <footer class="text-center text-gray-200 mb-10 md:mb-5 transition duration-200 ease-out">
      <a class="underline text-blue-500" href="https://amane.dev">あ</a>
    </footer>
  </div>
</template>

<script>
import FacebookLoginButton from './FacebookLoginButton.vue'

export default {
  components: { FacebookLoginButton },
  name: 'Landing',
  data() {
    return {

    }
  },
  async created() {
    this.toggleLoading('initApp', true)
    await this.initApp()
    this.toggleLoading('initApp', false)
  },
  mounted() {
    console.log('mounted')
  },
  computed: {
    categories() {
      return this.$store.state.categories.list
      return this.$store.getters['categories/list']
    },
  },
  methods: {
    async initApp() {
      console.log('initApp', )

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

    gotoCategory(category) {
      this.$router.push('/categories/' + category.id)
    },
  },
}
</script>

<style></style>
