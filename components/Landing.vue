<template>
  <div
    class="transition duration-200 ease-out h-full w-full flex flex-col px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5"
    :class="[isLoading('initApp') ? 'justify-center' : 'justify-between']"
  >
    <div
      class="mt-5 md:my-10 mx-5 text-white text-center px-2 transition duration-200 ease-out"
    >
      <img src="/logo.png" alt="" class="h-auto w-full" />
      <h1 class="font-genos text-5xl font-medium">Code de la Route</h1>
      <span>v0.8.3</span>
    </div>

    <transition>
      <div class="flex flex-col gap-10 px-10 items-center justify-center">
        <router-link
          to="/apprendre-les-panneaux-de-signalisation"
          class="bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center"
        >
          <ion-icon name="trail-sign-outline" size="large"></ion-icon>
          <h3 class="text-center uppercase text-2xl">Panneaux</h3>
        </router-link>
        <router-link
          to="/quizz-sur-le-code-de-la-route"
          class="bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center"
        >
          <ion-icon name="help-outline" size="large"></ion-icon>
          <h3 class="text-center uppercase text-2xl">Quizz</h3>
        </router-link>
        <router-link
          to="/mon-profil"
          class="bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center"
        >
          <ion-icon name="person-outline" size="large"></ion-icon>
          <h3 class="text-center uppercase text-2xl">Profil</h3>
        </router-link>
      </div>
    </transition>

    <div class="flex justify-center items-center">
      <!-- <facebook-login-button></facebook-login-button> -->
    </div>

    <footer
      class="text-center text-gray-200 mb-10 md:mb-5 transition duration-200 ease-out"
    >
      <a class="underline text-blue-500" href="https://amane.dev">あ</a>
    </footer>
  </div>
</template>

<script>
import FacebookLoginButton from "./FacebookLoginButton.vue";

export default {
  components: { FacebookLoginButton },
  name: "Landing",
  data() {
    return {};
  },
  async created() {
    this.toggleLoading("initApp", true);
    await this.initApp();
    this.toggleLoading("initApp", false);
  },
  mounted() {
    console.log("mounted");
  },
  computed: {
    categories() {
      return this.$store.state.categories.list;
      return this.$store.getters["categories/list"];
    },
  },
  methods: {
    async initApp() {
      console.log("initApp");

      // Initialize Facebook SDK
      window.fbAsyncInit = function () {
        FB.init({
          appId: process.env.FACEBOOK_APP_ID,
          autoLogAppEvents: process.env.FACEBOOK_AUTO_LOG_APP_EVENTS,
          xfbml: process.env.FACEBOOK_XFBML,
          version: process.env.FACEBOOK_AUTH_VERSION,
        });
      };
    },

    gotoCategory(category) {
      this.$router.push("/categories/" + category.id);
    },
  },
};
</script>

<style></style>
