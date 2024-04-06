<template>
  <div class="text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white">

    <!-- <countdown></countdown> -->

    <div class="p-2">
      <h2>Question 2/10</h2>

      <question-timer></question-timer>
    </div>

    <div class="p-2 mb-5">
      <h2 class="p-5">{{quizz?.question}}</h2>

      <div class="h-64 rounded flex items-center justify-center border bg-gray-200 text-gray-800">
        <!-- <img src="" alt=""> -->
        Image du quizz
      </div>
    </div>

    <div class="grid grid-cols-1 p-2 gap-2">
      <button v-for="(answer, i) in quizz?.answers" :key="i" @click="toggleSelectAnswer(answer)"
        class="relative rounded  text-gray-800 shadow px-2 py-1 "
        :class="[selectedAnswer == answer ? 'bg-orange-500 text-white' : 'bg-gray-200']"
      >
        <span class="absolute left-3">{{i+1}}</span>
        <span>{{answer.content}}</span>
      </button>
    </div>

    <div>
      <button class="rounded px-3 py-2" :class="[ !!selectedAnswer ? 'bg-blue-400' : '']">Continuer</button>
    </div>

  </div>
</template>

<script>
import QuestionTimer from '~/components/QuestionTimer.vue';
import Countdown from '~/components/StartCountdown.vue'
export default {
  components: { Countdown, QuestionTimer },
  name: 'Quizz',
  data(){
    return {
      quizz: {
        question: "Quel est le nom de ce signe ?",
        answers: [
          {
            isCorrect: true,

            content: "Panneau stop",
          },
          {
            content: "Panneau passage piéton",
          },
          {
            content: "Panneau chaussée glissante",
          },
          {
            content: "Panneau arrêt obligatoire",
          },
        ]
      },
      selectedAnswer: null,

    }
  },
  methods: {
    toggleSelectAnswer(answer){
      if(this.selectedAnswer == answer){
        this.selectedAnswer = null;
        return;
      }
      this.selectedAnswer = answer;

    }
  }
}
</script>

<style>

</style>
