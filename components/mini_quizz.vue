<template>
  <div id="mini_quizz" class="flex flex-col">
    <div
      class="flex flex-col md:flex-row items-start relative justify-center gap-3 mt-10"
    >
      <mini-quizz-question
        v-for="(question, i) in questions"
        @answered="validateAnswer"
        :isActive="isActiveQuestion(i) && gamePlaying"
        :question="question"
        :key="i"
        :style="'opacity:' + (1 - (i - activeQuestionIndex) * 0.25) + ';'"
        :id="'mini_quizz_question_'+ i"
        class="pt-5 md:pt-0"
      ></mini-quizz-question>
    </div>

    <transition name="slide-down">
      <div v-show="showResults" class="flex flex-col items-center gap-2 mt-3">
        <div class="text-center mt-5">
          <h3 class="text-3xl font-semibold">Votre score</h3>
          <div
            id="score-container"
            class="rounded-full text-6xl mt-3 font-bold flex justify-center items-center w-24 h-24 mx-auto animated-pulse text-black"
            :class="{
              'bg-green-500': score == MARK_TOTAL,
              'bg-blue-500': score < MARK_TOTAL,
              'bg-orange-500': score <= MARK_TOTAL / 2,
              'bg-red-500': score <= MARK_TOTAL / 3,
            }"
          >
            {{ score.toFixed(0) }}/{{ MARK_TOTAL }}
          </div>
          <h5>Téléchargez l'application pour plus de quizz</h5>
        </div>
        <div class="flex justify-center gap-3 text-white">
          <button class="rounded bg-black px-2 py-1">Apple Store</button>
          <button class="rounded bg-black px-2 py-1">Play Store</button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'MiniQuizz',
  props: {
    startMiniQuizz: {
      type: Boolean,
      default: false,
    }
  },
  data() {
    return {

      MARK_TOTAL: 20,
      score: 0,
      gamePlaying: true,
      showResults: false,
      activeQuestionIndex: 0,
      answers: [],
      questions: [
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',
          image: '/signalisation/sens-giratoire-obligatoire.svg.png',
          answers: [
            {
              content: 'Panneau Céder le passage',
            },
            {
              content: 'Tourner à gauche',
            },
            {
              content: 'Sens giratoire obligatoire',
              isCorrect: true,
            },
            {
              content: 'Faire demi-tour',
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image:
            '/signalisation/panneau-d-interdictionsens-interdit-a-tout-vehicule-b1.png',
          answers: [
            {
              content: 'Arrêt et stationnement interdits',
            },
            {
              content: 'Sens Interdit',
              isCorrect: true,
            },

            {
              content: 'Interdit de passer',
            },

            {
              content: 'Interdit de circuler',
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image:
            '/signalisation/panneau-indication-circulation-a-sens-unique-c12.png',
          answers: [
            {
              content: 'Continuer tout droit',
            },
            {
              content: 'Circuler sur la voie du milieu',
            },
            {
              content: 'Direction autoroute',
            },
            {
              content: 'Circulation sens unique',
              isCorrect: true,
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image:
            '/signalisation/panneau-indication-du-caractere-prioritaire-d-une-route-ab6.jpg',
          answers: [
            {
              content: 'Indique des travaux sur la voie',
            },
            {
              content: 'Indique une route prioritaire',
              isCorrect: true,
            },
            {
              content: 'Indique un pont mobile',
            },
            {
              content: 'Indique un céder le passage',
            },
          ],
        },
      ],
    }
  },
  mounted(){

    document.addEventListener('wheel', ()=>{
      setTimeout(() => {
        this.gamePlaying = this.checkVisible('#mini_quizz');
      }, 300);
    })
  },
  computed: {
    currentQuestion() {
      return this.questions[this.activeQuestionIndex]
    },
  },
  methods: {
    checkVisible(elmId, threshold = 0, mode) {
      threshold = threshold || 0;
      mode = mode || 'visible';
      let elm = document.querySelector(elmId)
      var rect = elm.getBoundingClientRect();
      var viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight);
      var above = rect.bottom - threshold < 0;
      var below = rect.top - viewHeight + threshold >= 0;

      return mode === 'above' ? above : (mode === 'below' ? below : !above && !below);
    },
    calcScore() {
      let percentage = (this.answers.filter(r => !!r).length * 100) / (this.questions.length ?? 0);
      // find percentage value in regard to MARK_TOTAL which is 100/5
      const coefficient = 100 / this.MARK_TOTAL;
      this.score = percentage / coefficient;
      if (this.score == this.MARK_TOTAL) {
        this.throwConfetti();
      }
    },
    throwConfetti() {
      setTimeout(() => {
        this.$confetti.start();
        setTimeout(() => {
          this.$confetti.stop();
        }, 2000);
      }, 500);
    },
    isActiveQuestion(index) {
      return this.activeQuestionIndex == index
    },
    isAnswerCorrect(index) {
      return this.answers[index]
    },
    endGame() {
      this.gamePlaying = false
      this.showResults = true
      this.calcScore();
    },
    nextQuestion() {
      if (this.activeQuestionIndex < this.questions.length - 1) {
        this.activeQuestionIndex++
        try {
          let elId = 'mini_quizz_question_'+ this.activeQuestionIndex;
          document.getElementById(elId).scrollIntoView();
        } catch (error) {

        }
        return
      }
      this.endGame()
    },
    submitAnswer() {},
    validateAnswer(answer) {
      this.answers[this.activeQuestionIndex] = !!answer?.isCorrect
      setTimeout(() => {
        this.nextQuestion()
      }, 1000)
    },
  },
}
</script>

<style></style>
