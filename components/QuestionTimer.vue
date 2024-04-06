<template>
  <div class="flex gap-2 mt-3 items-center">
    <div class="relative w-full">
      <div class="h-3 p-0.5 w-full rounded-xl bg-gray-200">
        <div
          v-show="percentage >= 3"
          class="z-10 h-full rounded-xl bg-blue-500 transition-all duration-300 ease-in-out"
          :style="'width:' + percentage + '%;'"
          :class="{
            'bg-yellow-500': percentage <= 80,
            'bg-orange-500' : percentage <= 50,
            'bg-red-500': percentage <= 30,
            }"
        ></div>
      </div>
    </div>
    <span class="w-5 h-5 flex justify-center items-center font-semibold text-xl">
      {{time.toFixed(0)}}
    </span>
  </div>
</template>

<script>
export default {
  name: 'QuestionTimer',
  data() {
    return {
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
      return (this.time * 100) / (this.START_TIME ?? 1)
    },
  },
  methods: {
    startTimer() {
      this.time = this.START_TIME

      this.timer = setInterval(() => {
        this.time -= .1
        if (this.time < 0.2) {
          clearInterval(this.timer)
        }
      }, 100) // 1 second
    },
  },
}
</script>

<style></style>
