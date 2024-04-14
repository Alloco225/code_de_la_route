<template>
    <section class="flex flex-col justify-around h-full p-3 px-5">
        <div class="flex flex-col gap-3 h-full mb-3">
          <h2 class="font-medium p-5 mb-1 text-2xl">
            {{ question?.question }}
          </h2>

          <div
            class="rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"
          >
            <img
              :src="question?.image"
              class="w-full object-contain h-36 md:h-32"
              alt="Image de la question"
            />
          </div>
        </div>

        <div class="grid grid-cols-1 mt-5 gap-3">
          <button
            v-for="(answer, i) in question?.answers"
            :key="i"
            @click="toggleSelectAnswer(answer)"
            class="relative rounded text-gray-800 bg-gray-200 shadow p-3"
            :class="{
              'bg-orange-500 text-white': !showCorrectAnswer && selectedAnswer == answer,
              'bg-green-500 text-white': showCorrectAnswer && answer?.isCorrect,
              'bg-red-500 text-white':
                showCorrectAnswer && answer == selectedAnswer && !answer?.isCorrect,
              'bg-gray-600':
                showCorrectAnswer && answer != selectedAnswer && !answer?.isCorrect,
            }"
          >
            <span>{{ answer.content }}</span>
          </button>
        </div>
      </section>
</template>

<script>
export default {
  name: 'QuestionImage',
  props: {
    question: {
      type: Object,
      required: true,
    },
    showCorrectAnswer: {
      type: Boolean,
      default: false,
    },
  },
  data(){
    return {
      selectedAnswer: null,
    }
  },
  methods: {

    toggleSelectAnswer(answer) {
      if (this.showCorrectAnswer) return;
      if (this.selectedAnswer == answer) {
        this.$emit('submit-answer')
        console.log("submit answer");
        return;
      }
      this.selectedAnswer = answer;
        console.log("answer");
      this.$emit('answer', this.selectedAnswer)
    },
  }
}
</script>

<style>

</style>
