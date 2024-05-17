<template>
  <article
    class="relative rounded-lg border shadow transform p-3 flex flex-col gap-3 w-64 bg-white"
  >
    <!-- Timer -->

    <question-timer v-show="isActive" :pause="!isActive || isCorrect != null" @time-expired="timeExpired"></question-timer>

    <!--  -->
    <h4>{{question.prompt}}</h4>
    <div class="relative rounded bg-gray-600 p-2">
      <img :src="question?.image ?? '/favicon.png'" alt="" />
      <!-- States -->
      <div v-show="isCorrect != null" class="absolute top-0 left-0 w-full h-full ">
        <div class="absolute top-0 left-0 w-full h-full opacity-80 rounded" :class="['bg-'+ feedBackColor+ '-500']"></div>

        <div class="relative h-full flex flex-col items-center justify-center gap-3 text-white">
          <span class="rounded-full w-24 h-24 bg-white flex justify-center items-center"  :class="['text-'+ feedBackColor+ '-500']">
            <ion-icon :name="isCorrect ? 'checkmark-outline' : 'close-outline'" size="large"></ion-icon>
          </span>
          <h4 class="text-2xl font-semibold ">{{feedBackText}} !</h4>
        </div>
    </div>
    </div>
    <!--  -->
    <ul class="flex flex-col gap-2">
      <button
        v-for="(answer, i) in question?.answers"
        :key="i"
        @click="selectAnswer(answer)"
        class="border-2 hover:bg-gray-200 hover:shadow text-gray-700 w-full rounded border-gray-200 bg-gray-100 px-2 text-sm py-1 font-medium"
        :class="[
          feedbackButton(answer)
        ]"
      >
        {{answer.content}}
      </button>
    </ul>

  </article>
</template>

<script>
export default {
  name: 'MiniQuizzQuestion',
  props: {
    isActive: {
      type: Boolean,
      default: false,
    },
    question: {
      type: Object,
      default: () => ({})
    }
  },

  data(){
    return {
      selectedAnswer: null,
    }
  },
  computed: {

    isCorrect(){
      if(!this.selectedAnswer) return;
      return !!this.selectedAnswer?.isCorrect;
    },
    feedBackColor(){
      if(this.isCorrect == null) return;
      return this.isCorrect == true ? 'green' : 'red';
    },
    feedBackText(){
      if(this.isCorrect == null) return;
      return this.isCorrect == true ? 'Correct' : 'Faux';

    }
  },
  methods: {

    feedbackButton(answer){
      if(answer == this.selectedAnswer){
        if(this.isCorrect == false) return 'border-red-300 bg-red-100 hover:bg-red-200 text-red-700';
        if(this.isCorrect == true) return 'border-green-300 bg-green-100 hover:bg-green-200 text-green-700';

        return 'border-orange-300 bg-orange-100 hover:bg-orange-200 text-orange-700';
      }
      return '';
    },
    selectAnswer(answer){
      if(!this.isActive) return;
      this.selectedAnswer = answer;
    },
    timeExpired(){
      this.selectedAnswer = null;

      this.submitAnswer();
    },
    submitAnswer(){
      this.$emit('answered', this.selectedAnswer)
    }
  },
}
</script>

<style></style>
