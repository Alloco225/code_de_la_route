<template>
  <div>
    <div id="profile"></div>
    <button @click.prevent="facebookLogin" class="flex justify-center gap-2 px-3 py-2 rounded-lg shadow items-center bg-blue-700 hover:bg-blue-800 text-white">
        <ion-icon name="logo-facebook"></ion-icon>
        Connexion
      </button>
  </div>
</template>

<script>
export default {
  name: 'FacebookLoginButton',
  data(){
    return {
      isLoading: false,
    }
  },
  methods: {
    async facebookLogin() {
      if(this.isLoading) return;
      this.isLoading = true;
      console.log("facebookLogin");
      await this.$store.dispatch('auth/loginViaFacebook')
      this.isLoading = false;
    },
  },
}
</script>

<style></style>
