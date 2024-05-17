<template>
  <div class="flex items-start relative justify-center gap-3 mt-10">
    <mini-quizz-question
      v-for="(question, i) in questions"
      @answered="validateAnswer"
      :isActive="isActiveQuestion(i)"
      :question="question"
      :key="i"
      :style="'opacity:' + (1 - (i - activeQuestionIndex) * 0.25) + ';'"
    ></mini-quizz-question>
  </div>
</template>

<script>
export default {
  name: 'MiniQuizz',
  data() {
    return {
      activeQuestionIndex: 0,
      answers: [],
      questions: [
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',
          image: '/signalisation/585f90abcb11b227491c3571.png',
          answers: [
            {
              content: 'Panneau Arrêt au poste de douane',
            },
            {
              content:
                'Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué',
            },
            {
              content: 'Panneau Céder le passage',
              isCorrect: true,
            },
            {
              content: 'Panneau STOP sur un poteau',
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image: '/signalisation/585f8f6dcb11b227491c355c.png',
          answers: [
            {
              content:
                'Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué',
              isCorrect: true,
            },
            {
              content: 'Panneau Arrêt au poste de douane',
            },

            {
              content: 'Panneau Arrêt et stationnement interdits',
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image: '/signalisation/585f8f49cb11b227491c3558.png',
          answers: [
            {
              content: 'Panneau Arrêt au poste de douane',
            },
            {
              content:
                'Panneau Accès interdit aux véhicules pesant sur un essieu plus que le nombre indiqué',
            },
            {
              content: 'Panneau Accès interdits aux motos',
              isCorrect: true,
            },
          ],
        },
        {
          category_id: 'signalisation',
          question: "De quel panneau s'agit-il ?",
          level: '',
          type: 'image',

          image: '/signalisation/585f8f74cb11b227491c355d.png',
          answers: [
            {
              content: 'Panneau STOP sur un poteau',
            },
            {
              content: 'Panneau Arrêt au poste de douane',
              isCorrect: true,
            },
          ],
        },
      ],
    }
  },
  computed: {
    currentQuestion() {
      return this.questions[this.activeQuestionIndex]
    },
  },
  methods: {
    isActiveQuestion(index) {
      return this.activeQuestionIndex == index
    },
    isAnswerCorrect(index) {
      return this.answers[index]
    },
    nextQuestion() {
      if (this.activeQuestionIndex < this.questions.length - 1)
        this.activeQuestionIndex++
    },
    submitAnswer() {},
    validateAnswer(answer) {
      console.log('validateAnswer', answer)
      this.answers[this.activeQuestionIndex] = !!answer?.isCorrect
      console.log('answers', this.answers)

      setTimeout(() => {
        this.nextQuestion()
      }, 2000);
    },
  },
}
</script>

<style></style>
