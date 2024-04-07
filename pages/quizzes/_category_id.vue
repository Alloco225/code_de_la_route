<template>
  <div
    class="text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"
  >
    <!-- <countdown></countdown> -->

    <div class="p-2">
      <h2 class="text-xl flex justify-center gap-3">Question
        <span>
          {{currentQuestionIndex+1}} / {{questions?.length ?? '--'}}
        </span>
        </h2>

      <question-timer ref="QuestionTimer" :pause="shouldPauseTimer" @time-expired="onTimeExpired"></question-timer>
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
    <section v-else class="flex flex-col justify-around h-full">
      <div class="p-2 mb-5">
        <h2 class="font-medium p-5 mb-5 text-2xl">{{ currentQuestion?.question }}</h2>

        <div
          class=" rounded flex items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"
        >
          <img :src="currentQuestion?.image" class="w-full object-contain  h-32" alt="Image de la question">

        </div>
      </div>

      <div class="grid grid-cols-1 p-2 mt-5 gap-2">
        <button
          v-for="(answer, i) in currentQuestion?.answers"
          :key="i"
          @click="toggleSelectAnswer(answer)"
          class="relative rounded text-gray-800 bg-gray-200 shadow px-2 py-1"
          :class="{
              'bg-orange-500 text-white': !showCorrectAnswer && selectedAnswer == answer,
              'bg-green-500 text-white': showCorrectAnswer && answer?.isCorrect,
              'bg-red-500 text-white': showCorrectAnswer && answer == selectedAnswer && !answer?.isCorrect,
              'bg-gray-600': showCorrectAnswer && answer != selectedAnswer && !answer?.isCorrect,
          }"
        >
          <!-- <span class="absolute left-3">{{ i + 1 }}</span> -->
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

        {{isSubmittingAnswer ? 'Question suivante...' : 'Continuer'}}
      </button>
    </div>


    <quizz-ended v-if="isQuizzOver" @restart="restartQuizz" :questionCount="questions.length" :correctAnswerCount="answersList?.filter(item => item.isCorrect).length"></quizz-ended>
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
      answersList: [],
      currentQuestionIndex: 0,

      isLoading: true,
      isQuizzOver: false,
      isSubmittingAnswer: false,
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
    isLastQuestion(){
      return this.currentQuestionIndex == this.questions.length -1;
    },
    shouldPauseTimer(){
      return this.pauseTimer || this.isLoading || this.isQuizzOver
    }
  },
  methods: {
    clearLoading() {
      setTimeout(() => {
        this.isLoading = false
      }, 300)
    },
    clearQuizzData(){
      this.answersList = [];
      this.currentQuestionIndex = 0;
      this.isLoading = false;
      this.isQuizzOver = false;
      this.isSubmittingAnswer = false;
      this.pauseTimer = false;
      this.questions = [];
      this.selectedAnswer = null;
      this.showCorrectAnswer = false;
    },

    endQuizz(){
      console.log("endQuizz")
      this.isQuizzOver = true;
      // TODO save results on server
    },
    initQuizz() {
      this.setLoading();
      // load questions
      this.questions = this.$store.state.quizzes.list.filter(item => item.category_id == this.$route.params.category_id) ?? []
      console.log("initQuizz", this.questions);
      this.currentQuestionIndex = 0
      this.clearLoading()

      console.log("this.$refs")
      this.restartTimer();
    },
    loadNextQuestion() {
      console.log("loadNext")
      this.isSubmittingAnswer = false;
      this.selectedAnswer = null;

      this.setLoading();
      if(this.isLastQuestion){
        // show end screen;
        this.endQuizz();
        this.clearLoading();
        return;
      }
      this.showCorrectAnswer = false
      this.currentQuestionIndex++;
      //
      this.clearLoading();
      this.pauseTimer = false
      this.restartTimer();
    },

    onTimeExpired(){
      // TODO add popup
      // go to next question
      this.loadNextQuestion();
    },
    restartQuizz(){
      //
      console.log("restart")
      this.clearQuizzData();
      this.initQuizz();
    },
    restartTimer(){
      this.$refs.QuestionTimer.startTimer();
    },
    submitAnswer() {
      if(!this.selectedAnswer) return;
      if(this.isSubmittingAnswer) return;
      // stop timer
      this.pauseTimer = true
      // show wrong answers
      this.showCorrectAnswer = true
      this.isSubmittingAnswer = true;
      this.answersList.push(this.selectedAnswer)
      // move to next question
      setTimeout(this.loadNextQuestion, 1000);
    },
    setLoading() {
      this.isLoading = true
    },
    toggleSelectAnswer(answer) {
      if(this.showCorrectAnswer) return;
      if (this.selectedAnswer == answer) {
        // this.selectedAnswer = null
        this.submitAnswer();
        return
      }
      this.selectedAnswer = answer
    },
  },
}
</script>

<style></style>
