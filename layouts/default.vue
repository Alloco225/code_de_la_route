<template>
  <div class="h-full bg-gray-600" style="min-height: 100vh;">
    <nuxt-child class="mx-auto max-w-md"></nuxt-child>

    <div>
      <audio ref="bgm"  src="/music/bgm.mp3" preload loop></audio>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data(){
    return {
      play_bgm: false,
    }
  },
  created(){

    window.addEventListener('blur', ()=>{
      this.$refs.bgm.pause();
    });
    window.addEventListener('focus', ()=>{
      this.$refs.bgm.play();
    });

  },
  mounted(){
    console.log("mounted")
    setTimeout(() => {
      // this.bgm.play();
      this.$refs.bgm.play();
      // console.log("confetti !!");
      // this.$confetti.start();
    }, 1000);
  },
  methods: {

  }
}
</script>

<style></style>
