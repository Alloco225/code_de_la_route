<template>
  <section id="countdown" v-show="isVisible" class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex justify-center items-center bg-blue-700 bg-opacity-80">
      <div class="rounded-full bg-blue-700 text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse">{{time}}</div>
    </section>
</template>

<script>
export default {
  name: 'StartCountdown',
  data(){
    return {
      time: 3,
      timer: null,
    }
  },
  mounted(){
    this.startTimer();
  },
  computed: {
    isVisible(){
      return this.time > 0;
    }
  },
  methods: {
    startTimer(){
      this.timer = setInterval(() => {
        this.time--;
        if(this.time <= 0){
          clearInterval(this.timer);
        }
      }, 1000); // 1 second
    }
  }
}
</script>

<style>

</style>
