<template>
    <section class="flex flex-col justify-around h-full">
        <div class="flex flex-col gap-3 h-full p-2 mb-5">
          <h2 class="font-medium p-5 mb-5 text-2xl">
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

        <div class="grid grid-cols-1 p-2 mt-5 gap-3">
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
    selectedAnswer: {
      type: Object,
      required: false,
      default: () => null,
    },
    showCorrectAnswer: {
      type: Boolean,
      default: false,
    },
  }
}
</script>

<style>

</style>
