<template>
  <section id="countdown" class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90">

    <h3 class="text-2xl mb-10 uppercase">Pause</h3>

      <div class="rounded-full  text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse">
      <ion-icon name="pause-circle-outline"></ion-icon>
      </div>


    <div class="flex flex-col items-center gap-8 mt-10">
      <div class="flex flex-row-reverse gap-2">


        <button @click="resumeGame" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500">
          <ion-icon name="play-outline"></ion-icon>
          Continuer
        </button>
        <button @click="toujourFuirFuirEtRefuir" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500">
          <ion-icon name="trash-bin-outline"></ion-icon>
          Abandonner
        </button>
      </div>


    </div>


  </section>
</template>

<script>
export default {
  name: 'QuizzPaused',
  props: {
    correctAnswerCount: {
      required: true,
      type: Number,
      default: 0,
    },
    questionCount: {
      required: true,
      type: Number,
      default: 0,
    },
  },
  data(){
    return {
      MARK_TOTAL: 20,
      score: 0,
      platforms: [
        {
          name: "Whatsapp",
          icon: 'logo-whatsapp',
        },

        {
          name: "Facebook",
          icon: "logo-facebook",
          link: "",
        },
        {
          name: "Twitter",
          icon: "logo-twitter",
          link: "",
        },
        {
          name: "Linkedin",
          icon: "logo-linkedin",
          link: "",
        },
      ]
    }
  },
  mounted(){
    this.calcScore();
    // TODO add a gsap animation on the score calculating
  },
  computed: {
  },
  methods: {
    calcScore(){
      let percentage = (this.correctAnswerCount * 100 )/ (this.questionCount ?? 0)
      // find percentage value in regard to MARK_TOTAL which is 100/5
      const coefficient = 100 / this.MARK_TOTAL;
      this.score = percentage / coefficient;
      if(this.score == this.MARK_TOTAL){
        this.throwConfetti();
      }
    },
    goBackToQuizzList(){
      this.$router.back();
    },
    goToMenu(){
      // show tu veux abandonner ?
      //
      return;
      this.$router.push({name: 'index'})
    },
    resumeGame(){
      this.$emit('resume')
    },
    restart(){
      this.$emit('restart')
    },
    shareScore(platform){
      //
      const indexer = {
        "Whatsapp": 'https://api.whatsapp.com/send/?text=https%3A%2F%2Fwww.tiktok.com%2F%40nimay.ndolo%2Fvideo%2F7337019111794347306%3Fis_from_webapp%3D1%26sender_device%3Dpc%26web_id%3D7354054001593927173&type=custom_url&app_absent=0',
        "Facebook": 'https://www.facebook.com/sharer/sharer.php?display=popup&sdk=joey&u=https%3A%2F%2Fwww.tiktok.com%2F%40nimay.ndolo%2Fvideo%2F7337019111794347306%3Fis_from_webapp%3D1%26sender_device%3Dpc%26web_id%3D7354054001593927173',
        "Twitter": 'https://twitter.com/intent/tweet?refer_source=https%3A%2F%2Fwww.tiktok.com%2F%40nimay.ndolo%2Fvideo%2F7337019111794347306%3Fis_from_webapp%3D1%26sender_device%3Dpc%26web_id%3D7354054001593927173&text=https%3A%2F%2Fwww.tiktok.com%2F%40nimay.ndolo%2Fvideo%2F7337019111794347306%3Fis_from_webapp%3D1%26sender_device%3Dpc%26web_id%3D7354054001593927173',
        "Linkedin": 'https://www.linkedin.com/sharing/share-offsite?url=https%3A%2F%2Fwww.tiktok.com%2F%40nimay.ndolo%2Fvideo%2F7337019111794347306%3Fis_from_webapp%3D1%26sender_device%3Dpc%26web_id%3D7354054001593927173',
      }
    },
    throwConfetti(){
      setTimeout(() => {
        console.log("confetti !!");
        this.$confetti.start();
        setTimeout(() => {
          this.$confetti.stop();
        }, 2000);
      }, 500);
    },
    toujourFuirFuirEtRefuir(){
      //
      this.$emit('quit')
    }
  }
}
</script>

<style>

</style>
