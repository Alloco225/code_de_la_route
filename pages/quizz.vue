<template>
  <div
    class="text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"
  >
    <!-- <countdown></countdown> -->

    <div class="p-2">
      <h2 class="text-xl">Question {{currentQuestionIndex+1}}/{{questions?.length}}</h2>

      <question-timer :pause="pauseTimer || isLoading" @time-expired="onTimeExpired"></question-timer>
    </div>

    <div
      v-if="isLoading"
      class="bg-white bg-opacity-20 rounded-lg w-10/12 mx-auto px-3 py-5 pb-10"
    >
      <h5 class="font-medium mb-5 text-2xl">Chargement..</h5>

      <div
        class="mx-auto border-4 border-blue-500 rounded-lg animate-spin h-16 w-16"
      ></div>
    </div>
    <section v-else>
      <div class="p-2 mb-5">
        <h2 class="p-5">{{ currentQuestion?.question }}</h2>

        <div
          class=" rounded flex items-center justify-center border bg-gray-200 text-gray-800"
        >
          <img :src="currentQuestion?.image" alt="Image de la question">

        </div>
      </div>

      <div class="grid grid-cols-1 p-2 gap-2">
        <button
          v-for="(answer, i) in currentQuestion?.answers"
          :key="i"
          @click="toggleSelectAnswer(answer)"
          class="relative rounded text-gray-800 shadow px-2 py-1"
          :class="[
            selectedAnswer == answer
              ? 'bg-orange-500 text-white'
              : 'bg-gray-200',
            showCorrectAnswer
              ? selectedAnswer == answer
                ? selectedAnswer.isCorrect
                  ? 'bg-green-500 text-white'
                  : 'bg-red-500 text-white'
                : 'bg-gray-700'
              : '',
            showCorrectAnswer ? (answer?.isCorrect ? 'bg-green-500 text-white' : '') : '',
          ]"
        >
          <span class="absolute left-3">{{ i + 1 }}</span>
          <span>{{ answer.content }}</span>
        </button>
      </div>
    </section>

    <div>
      <button
        @click.prevent="submitAnswer"
        class="rounded px-3 py-2"
        :class="[
          !!selectedAnswer ? 'bg-blue-600' : '',
          isLoading ? 'invisible' : 'visible',
        ]"
      >
        Continuer
      </button>
    </div>
  </div>
</template>

<script>
import QuestionTimer from '~/components/QuestionTimer.vue'
import Countdown from '~/components/StartCountdown.vue'
export default {
  components: { Countdown, QuestionTimer },
  name: 'Quizz',
  data() {
    return {
      currentQuestionIndex: 0,

      isLoading: true,
      pauseTimer: false,
      questions: [],

      selectedAnswer: null,
      showCorrectAnswer: false,
    }
  },
  mounted() {
    this.initQuizz()
  },
  computed: {
    currentQuestion() {
      return this.questions[this.currentQuestionIndex] ?? null
    },
  },
  methods: {
    clearLoading() {
      setTimeout(() => {
        this.isLoading = false
      }, 300)
    },
    initQuizz() {
      this.setLoading();
      // load questions
      this.questions = this.$store.state.quizzes.questions;
      console.log("initQuizz", this.questions);
      this.currentQuestionIndex = 0
      this.clearLoading()
    },
    loadNextQuestion() {
      this.isLoading = true
      this.currentQuestionIndex++
    },
    onTimeExpired(){
      // game over, show results;
      alert('Temps écoulé')
    },
    submitAnswer() {
      if(!this.selectedAnswer) return;
      // stop timer
      this.pauseTimer = true
      // show wrong answers
      this.showCorrectAnswer = true
      // move to next question
    },
    setLoading() {
      this.isLoading = true
    },
    toggleSelectAnswer(answer) {
      if(this.showCorrectAnswer) return;
      if (this.selectedAnswer == answer) {
        this.selectedAnswer = null
        return
      }
      this.selectedAnswer = answer
    },
  },
}
</script>

<style></style>
