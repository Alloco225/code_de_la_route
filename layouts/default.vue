<template>
  <div class="h-full bg-gray-600" style="min-height: 100vh;">
    <nuxt-child class="mx-auto max-w-md"></nuxt-child>

    <div>
      <audio ref="bgm" id="bgm"  src="/audio/bgm.mp3" preload loop></audio>
      <audio ref="click" id="click"  src="/audio/mouse_click.mp3" preload></audio>
      <audio ref="dontgiveup" id="dontgiveup"  src="/audio/tu_veux_abandonner.mp3" preload></audio>
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
      this.pauseAllMedia();
    });
    window.addEventListener('focus', ()=>{
      // this.$refs.bgm.play();
    });
    window.addEventListener('click', ()=>{
      // this.$refs.bgm.play();
    });
    const clickables = document.querySelectorAll('.clickable');
    clickables.forEach(el => el.addEventListener('click', event => {
      // console.log(event.target.getAttribute("data-el"));
      this.play('click');
    }));

  },
  mounted(){
    console.log("mounted")
    setTimeout(() => {
      // this.bgm.play();
      // this.$refs.bgm.play();
      // console.log("confetti !!");
      // this.$confetti.start();
    }, 1000);
  },
  methods: {
  }
}
</script>

<style></style>
