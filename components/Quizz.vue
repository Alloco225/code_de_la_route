<template>
  <div
    class="text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"
  >
    <quizz-empty v-if="questions.length == 0"></quizz-empty>
    <div v-else class="flex flex-col h-full justify-between">
      <div class="p-2">
        <h2 class="text-xl flex justify-center gap-3">
          Question
          <span>
            {{ currentQuestionIndex + 1 }} / {{ questions?.length ?? '--' }}
          </span>
        </h2>

        <question-timer
          ref="QuestionTimer"
          :pause="shouldPauseTimer"
          :countDownTime="getQuestionTimerTime(currentQuestion?.type)"
          @pause-game="onGamePaused"
          @time-expired="onTimeExpired"
        ></question-timer>
      </div>

      <loading-spinner v-if="isLoading('quizz')"></loading-spinner>

      <template v-else>
        <question-image
          v-if="currentQuestion?.type == 'image'"
          @answer="onAnswered"
          @submit-answer="submitAnswer"
          :question="currentQuestion"
          :showCorrectAnswer="showCorrectAnswer"
        ></question-image>
        <question-order
          v-if="currentQuestion?.type == 'order'"
          @answer="onAnswered"
          @submit-answer="submitAnswer"
          :question="currentQuestion"
          :showCorrectAnswer="showCorrectAnswer"
        ></question-order>
      </template>

      <div>
        <button
          @click.prevent="submitAnswer"
          class="rounded px-3 py-2 mb-10"
          :class="[
            !!selectedAnswer ? 'bg-blue-600' : '',
            isLoading('quizz') ? 'invisible' : 'visible',
          ]"
        >
          {{ isSubmittingAnswer ? 'Question suivante...' : 'Continuer' }}
        </button>
      </div>
    </div>

    <countdown
      v-if="questions.length > 0"
      ref="StartCountdown"
      @start-quizz="restartTimer"
    ></countdown>

    <quizz-ended
      v-if="isQuizzOver"
      @restart="restartQuizz"
      :questionCount="questions.length"
      :correctAnswerCount="
        answersList?.filter((item) => item?.isCorrect).length
      "
    ></quizz-ended>

    <quizz-paused
      @resume="resumeGame"
      @quit="userWantsToQuit"
      v-if="state('pause')"
    ></quizz-paused>

    <tu-veux-abandonner
      v-if="state('isUserQuitting')"
      @close="dontQuit"
    ></tu-veux-abandonner>
  </div>
</template>

<script>
import QuestionTimer from '~/components/QuestionTimer.vue'
import Countdown from '~/components/StartCountdown.vue'
import CategoryDataService from '~/services/CategoryDataService'
import QuizzDataService from '~/services/QuizzDataService'
import QuizzEnded from './QuizzEnded.vue'
import QuizzEmpty from './QuizzEmpty.vue'
import QuizzPaused from './QuizzPaused.vue'
import LoadingSpinner from './LoadingSpinner.vue'
import TuVeuxAbandonner from './TuVeuxAbandonner.vue'
import QuestionImage from './questions/QuestionImage.vue'
import QuestionOrder from './questions/QuestionOrder.vue'

export default {
  components: {
    Countdown,
    QuestionTimer,
    QuizzEmpty,
    QuizzPaused,
    TuVeuxAbandonner,
    LoadingSpinner,
    QuestionImage,
    QuestionOrder,
  },
  name: 'Quizz',
  props: {
    quizz_id: {
      type: [String, Number],
      required: true,
    },
  },
  data() {
    return {
      answersList: [],
      category: null,
      category_id: null,
      currentQuestionIndex: 0,

      isQuizzOver: false,
      isGamePaused: false,
      isSubmittingAnswer: false,
      isUserQuitting: false,
      ORDER_QUESTION_DURATION: 20,
      pauseTimer: true,
      questions: [],
      quizz: null,

      selectedAnswer: null,
      showCorrectAnswer: false,
    }
  },
  mounted() {
    this.category_id = this.$route.params.category_id
    this.initQuizz();
  },
  computed: {
    currentQuestion() {
      return this.questions[this.currentQuestionIndex] ?? null
    },
    getQuestionTimerTime(){
      if(this.currentQuestion?.type == 'order'){
        return this.ORDER_QUESTION_DURATION;
      }
      return this.IMAGE_QUESTION_DURATION;
    },
    isLastQuestion() {
      return this.currentQuestionIndex == this.questions.length - 1
    },
    shouldPauseTimer() {
      return this.pauseTimer || this.isLoading('quizz') || this.isQuizzOver
    },
  },
  methods: {
    clearLoading() {
      setTimeout(() => {
        this.toggleLoading('quizz', false)
      }, 300)
    },
    clearQuizzData() {
      this.answersList = []
      this.currentQuestionIndex = 0
      this.toggleLoading('quizz', false)
      this.isQuizzOver = false
      this.isSubmittingAnswer = false
      this.pauseTimer = false
      this.questions = []
      this.selectedAnswer = null
      this.showCorrectAnswer = false
    },
    dontQuit() {
      this.setState('isUserQuitting', false)
      this.setState('pause', false)
    },
    async fetchQuizz() {
      console.log('fetchQuizz')

    },
    endQuizz() {
      console.log('endQuizz')
      this.isQuizzOver = true
      // TODO save results on server
    },

    initQuizz() {
      this.setLoading()
      this.quizz = this.$store.state.quizzes.list.find(
        (item) =>
          item.id == this.quizz_id &&
          item.category_id == this.$route.params?.category_id
      )
      this.questions = this.quizz.questions

      // this.shuffleArray(this.questions)
      this.currentQuestionIndex = 0
      this.clearLoading()

      // this.restartTimer();
      // this.launchStartCountDown()
    },
    launchStartCountDown() {
      this.$refs.StartCountdown.startTimer()
    },
    loadNextQuestion() {
      console.log('loadNext')
      this.isSubmittingAnswer = false
      this.selectedAnswer = null

      this.setLoading()
      if (this.isLastQuestion) {
        // show end screen;
        this.endQuizz()
        this.clearLoading()
        return
      }
      this.showCorrectAnswer = false
      this.currentQuestionIndex++
      //
      this.clearLoading()
      this.pauseTimer = false
      this.restartTimer()
    },
    onAnswered(answer) {
      this.selectedAnswer = answer
      //
    },
    onGamePaused() {
      this.setState('pause', true)
    },
    onTimeExpired() {
      // TODO add popup
      // save input
      this.saveAnswer()
    },
    restartQuizz() {
      //
      console.log('restart')
      this.clearQuizzData()
      this.initQuizz()
    },
    restartTimer() {
      this.pauseTimer = false
      this.$refs.QuestionTimer.startTimer()
    },
    async resumeGame() {
      this.setState('pause', false)
      // this.pauseTimer = true;
      // this.launchStartCountDown();
      // await this.sleep(this.$refs.StartCountdown.TIME *1000)
      // this.pauseTimer = false;
    },
    saveAnswer() {
      this.showCorrectAnswer = true
      this.isSubmittingAnswer = true
      this.answersList.push(this.selectedAnswer)

      // move to next question after cooldown
      const cooldown = this.currentQuestion?.type == 'order' ? 3000 : 1000
      setTimeout(this.loadNextQuestion, cooldown)
    },

    submitAnswer({ acceptEmpty = false } = {}) {
      if (!this.selectedAnswer) return
      if (this.isSubmittingAnswer) return

      console.log('submitAnswer')
      // stop timer
      this.pauseTimer = true
      // show wrong answers
      this.saveAnswer()
    },
    setLoading() {
      this.toggleLoading('quizz', true)
    },
    userWantsToQuit() {
      this.setState('isUserQuitting', true)
    },
  },
}
</script>

<style></style>
