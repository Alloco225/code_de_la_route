<template>
  <section id="countdown" class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90">

    <h3 class="text-2xl mb-10">Quizz Terminé</h3>

      <div class="rounded-full  text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse" :class="{
        'bg-green-500': score == MARK_TOTAL,
        'bg-blue-500': score < MARK_TOTAL,
        'bg-orange-500': score <= MARK_TOTAL / 2,
        'bg-red-500': score <= MARK_TOTAL / 3,
      }">{{score.toFixed(0)}}/{{MARK_TOTAL}}</div>


    <div class="flex flex-col gap-2 mt-10">
      <div class="flex gap-2">
        <button @click="goBackToQuizzList" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500">
          <ion-icon name="return-up-back-outline"></ion-icon>
          Retour
        </button>
        <button @click="restart" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500">
          <ion-icon name="refresh-outline"></ion-icon>
          Réessayer
        </button>
      </div>

      <button @click="goToMenu" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500">
        <ion-icon name="home-outline"></ion-icon>
        Menu
      </button>

    </div>
  </section>
</template>

<script>
export default {
  name: 'QuizzEnded',
  props: {
    correctAnswerCount: {
      required: true,
      type: Number,
      default: 0,
    },
    questionCount: {
      required: true,
      type: Number,
      default: 0,
    },
  },
  data(){
    return {
      MARK_TOTAL: 20,
      score: 0,
    }
  },
  mounted(){
    this.calcScore();
    // TODO add a gsap animation on the score calculating
  },
  computed: {
  },
  methods: {
    calcScore(){
      let percentage = (this.correctAnswerCount * 100 )/ (this.questionCount ?? 0)
      // find percentage value in regard to MARK_TOTAL which is 100/5
      const coefficient = 100 / this.MARK_TOTAL;
      this.score = percentage / coefficient;
    },
    goBackToQuizzList(){
      this.$router.back();
    },
    goToMenu(){
      this.$router.push({name: 'index'})
    },
    restart(){
      this.$emit('restart')
    },
  }
}
</script>

<style>

</style>
