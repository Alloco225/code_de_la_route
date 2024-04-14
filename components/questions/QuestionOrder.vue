<template>
  <section class="flex flex-col justify-around h-full p-4">
    <div class="flex flex-col gap-3 h-full mb-5">
      <h2 class="font-medium p-5 mb-3 text-2xl">
        {{ question?.question }}
      </h2>

      <div
        class="rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800"
      >
        <img
          :src="question?.image"
          class="object-contain h-auto w-full rounded"
          alt="Image de la question"
        />
      </div>

      <!--  -->
      <div class="text-gray-800 rounded flex gap-2" :class="gridColsCount">
        <span
          v-for="i in orderElementCount"
          @click="toggleOrderElement(selectedOrder[i - 1])"
          :key="i"
          class="grow rounded text-gray-800 bg-gray-200 shadow p-2"
          :class="{
            'bg-green-500 text-white':
              showCorrectAnswer &&
              selectedOrder.join(SEPARATOR) == question?.correctOrder,
            'bg-red-500 text-white':
              showCorrectAnswer &&
              selectedOrder.join(SEPARATOR) != question?.correctOrder,
            'bg-gray-200 text-gray-800': selectedOrder[i - 1],
            'bg-gray-600 p-5': !selectedOrder[i - 1],
          }"
        >
          {{ selectedOrder[i - 1] }}
        </span>
      </div>
      <div
        v-if="
          showCorrectAnswer &&
          selectedOrder.join(SEPARATOR) != question?.correctOrder
        "
        class="bg-gray-200 bg-opacity-10 text-gray-800 rounded flex gap-2"
        :class="gridColsCount"
      >
        <span
          v-for="(elem, i) in question?.correctOrder.split(SEPARATOR)"
          :key="i"
          class="grow rounded shadow p-2 bg-green-500 text-white"
        >
          {{ elem }}
        </span>
      </div>
    </div>

      <div v-show="!showCorrectAnswer" class="grid grid-cols-2 py-2 mt-5 gap-3">
        <button
          v-for="i in orderElementCount"
          :key="i"
          @click="toggleOrderElement(answers[i - 1])"
          class="relative rounded text-gray-800 shadow p-2"
          :class="[answers[i - 1] ? 'bg-gray-200' : 'bg-gray-600 p-5']"
        >
          <span>{{ answers[i - 1] ?? ' ' }}</span>
        </button>
      </div>
  </section>
</template>

<script>
export default {
  name: 'QuestionRange',
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
  data() {
    return {
      answers: [],
      gridColsCount: null,
      orderElementCount: null,
      selectedOrder: [],
      SEPARATOR: ', ',
    }
  },
  created() {
    this.answers = this.question.correctOrder.split(this.SEPARATOR)
    this.orderElementCount = this.answers.length
    this.shuffleArray(this.answers)

    this.$nextTick(
      () => (this.gridColsCount = 'grid-cols-' + this.orderElementCount)
    )
  },
  computed: {},
  methods: {
    toggleOrderElement(element) {
      if (!element) return

      if (this.selectedOrder.includes(element)) {
        const index = this.selectedOrder.indexOf(element)
        this.selectedOrder.splice(index, 1)
        //
        const replaceIndex = this.answers.indexOf(null)
        this.answers.splice(replaceIndex, 1, element)
      } else {
        const index = this.answers.indexOf(element)
        // this.answers.splice(index, 1)
        this.answers.splice(index, 1, null)

        this.selectedOrder.push(element)
      }

      const content = this.selectedOrder.join(this.SEPARATOR)
      let answer = {
        content,
      }

      if (this.selectedOrder.length == this.orderElementCount) {
        answer.isCorrect = content === this.question?.correctOrder
        this.$emit('answer', answer)
      } else {
        this.$emit('answer', answer)
      }
    },
  },
}
</script>

<style></style>
