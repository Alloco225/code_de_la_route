<template>
  <div class="flex gap-2 mt-3 items-center">
    <span @click="$emit('game-paused')" class="w-5 h-5 flex justify-center items-center">
      <ion-icon name="pause-outline" size="large"></ion-icon>
    </span>
    <div class="relative w-full">
      <div class="h-3 p-0.5 w-full rounded-xl bg-gray-200">
        <div
          v-show="percentage >= 3"
          class="z-10 h-full rounded-xl  transition-all duration-300 ease-in-out"
          :style="'width:' + percentage + '%;'"
          :class="[percentageColor]"
        ></div>
      </div>
    </div>
    <span @click="forcePause =! forcePause" class="w-5 h-5 flex justify-center items-center font-semibold text-xl">
      {{time.toFixed(0)}}
    </span>
  </div>
</template>

<script>
export default {
  name: 'QuestionTimer',
  props: {
    pause: { type: Boolean, default: false,},
    countDownTime: {type: Number, default: null}
  },
  data() {
    return {
      forcePause: false,
      START_TIME: 10, // seconds
      time: 0, // seconds,
      timer: null,

    }
  },
  mounted() {
    this.startTimer()
  },
  computed: {
    isVisible() {
      return this.time > 0
    },
    percentage() {
      return (this.time * 100) / (this.remainingTime ?? 1)
    },
    percentageColor(){
      if(this.percentage <= 30)
        return 'bg-red-500';
      if(this.percentage <= 50)
        return 'bg-orange-500';
      if(this.percentage <= 80)
        return 'bg-yellow-500'

      return 'bg-blue-500';
    },
    remainingTime(){
      return this.countDownTime ?? this.START_TIME;
    }
  },
  methods: {
    startTimer() {
      console.log("startTimer")
      this.time = this.remainingTime

      clearInterval(this.timer);

      this.timer = setInterval(() => {
        if(this.state('pause')) return;
        if(this.pause || this.forcePause) return;
        this.time -= .1
        if (this.time < 0.2) {
          //

          clearInterval(this.timer)

          this.$emit('time-expired', this.time);
        }
      }, 100) // 1 second
    },
  },
}
</script>

<style></style>
