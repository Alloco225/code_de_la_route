<template>
  <div class="h-full bg-gray-600" style="min-height: 100vh;">
    <nuxt-child class="mx-auto max-w-md"></nuxt-child>

    <div>
      <audio ref="bgm"  src="/music/bgm.mp3" preload loop></audio>
      <audio ref="click"  src="/sounds/mouse_click.mp3" preload></audio>
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
      // this.$refs.bgm.play();
    });
    window.addEventListener('click', ()=>{
      // this.$refs.bgm.play();
      this.play('click');
    });

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
    pause(action){
      console.log("pause", action)
      this.$refs[action].pause();
    },
    play(action){
      console.log("play", action)
      this.$refs[action].play();
    },
  }
}
</script>

<style></style>
