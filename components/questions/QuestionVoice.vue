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
      <div v-if="answer" class="text-gray-800 rounded flex gap-2" :class="gridColsCount">
        <span
          class="grow rounded text-gray-800 bg-gray-200 shadow p-2"
          :class="{
            'bg-green-500 text-white':
              showCorrectAnswer &&
              isAnswerCorrect,
            'bg-red-500 text-white':
              showCorrectAnswer &&
              !isAnswerCorrect,
          }"
        >
          {{ answer ?? 'Parlez pour répondre' }}
        </span>
      </div>


    </div>

    <transition>
      <div
       class="relative flex justify-center items-center">
       <div v-if="isListening" class="transition-all duration-300 ease-out absolute rounded-full w-16 h-16 animate-ping bg-gray-900"></div>
        <button
          @click="startListening()"
          class="transition-all duration-300 ease-out relative flex justify-center items-center rounded-full shadow bg-white bg-opacity-15 w-24 h-24"
          :class="[isListening ? ' text-blue-500': 'text-white']"
        >

        <ion-icon name="mic-outline" size="large" class="" :class="[]"></ion-icon>
        </button>
      </div>
    </transition>
  </section>
</template>

<script>
export default {
  name: 'QuestionVoice',
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
      answer: null,
      gridColsCount: null,
      isListening: false,

      orderElementCount: null,
      voiceRecorder: null,
    }
  },
  created() {

    },
  mounted(){
    this.voiceRecorder = new webkitSpeechRecognition();
    if(!this.voiceRecorder) {
      console.log("no recorder");
      return;
    }

    this.voiceRecorder.lang = "fr-FR";
    this.voiceRecorder.onstart = () => {
      console.log("record started");
      this.isListening = true;
    }
    this.voiceRecorder.onresult = (e) => {
      console.log("record ended", e.results);

      try {

        var transcript = e.results[0][0].transcript;
        var confidence = e.results[0][0].confidence;

        this.answer = transcript;

        if(this.answer){
          console.log("correct answers", this.question?.correctAnswers, "answer", this.answer, "isCorrect", this.isAnswerCorrect)


          this.$emit('answer', {
            content: this.answer,
            isCorrect: this.isAnswerCorrect,
          })
        }
      } catch (error) {
        console.log("error", error);
      }

      this.isListening = false;
    }
  },

  computed: {
    isAnswerCorrect(){
      if(!this.answer) return false;
      return this.question?.correctAnswers?.filter(item => item.toLowerCase() === this.answer.toLowerCase())
    }
  },
  methods: {
    startListening(){
      this.isListening = true;
      // setTimeout(() => {
      //   this.isListening = false
      // }, 5000);
      this.voiceRecorder.start();


    },
  },
}
</script>

<style></style>
