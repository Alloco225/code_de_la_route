<template>
  <article
    class="relative rounded-lg border shadow transform p-3 flex flex-col gap-3 w-64 bg-white"
  >
    <!-- Timer -->
    <transition name="fade">
      <question-timer v-show="isActive && selectedAnswer == null" :pause="!isActive || isCorrect != null" @time-expired="timeExpired"></question-timer>
    </transition>

    <!--  -->
    <h4>{{question.prompt}}</h4>
    <div class="relative rounded bg-gray-600 p-2">
      <img :src="question?.image ?? '/favicon.png'" class="w-32 h-32 mx-auto" alt="" />
      <!-- States -->
      <div v-show="isCorrect != null" class="absolute top-0 left-0 w-full h-full ">
        <div class="absolute top-0 left-0 w-full h-full opacity-80 rounded" :class="['bg-'+ feedBackColor+ '-500']"></div>

        <div class="relative h-full flex flex-col items-center justify-center gap-3 text-white">
          <span class=" text-white flex justify-center items-center"  :class="['text-'+ feedBackColor+ '-500']">
            <ion-icon :name="isCorrect ? 'checkmark-outline' : 'close-outline'" style="font-size:64px;"></ion-icon>
          </span>
          <h4 class="text-2xl font-semibold ">{{feedBackText}} !</h4>
        </div>
    </div>
    </div>
    <!--  -->
    <ul class="flex flex-col gap-2">
      <button
        v-for="(answer, i) in answers"
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
      answers: [],
    }
  },
  created(){
    this.answers = [...this.question?.answers];
    this.shuffleArray(this.answers);
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
      if(this.selectedAnswer){
        return 'bg-gray-400 hover:bg-gray-400';
      }
      return '';
    },
    selectAnswer(answer){
      if(!this.isActive) return;
      this.selectedAnswer = answer;
      setTimeout(() => {
        this.submitAnswer();
      }, 100);
    },
    timeExpired(){
      console.log("time expired");
      this.selectedAnswer = {};

      this.submitAnswer();
    },
    submitAnswer(){
      this.$emit('answered', this.selectedAnswer)
    }
  },
}
</script>

<style></style>
