<template>
  <section id="countdown" class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90">

    <h3 class="text-2xl mb-10">Quizz Terminé</h3>

      <div class="rounded-full  text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse" :class="{
        'bg-green-500': score == MARK_TOTAL,
        'bg-blue-500': score < MARK_TOTAL,
        'bg-orange-500': score <= MARK_TOTAL / 2,
        'bg-red-500': score <= MARK_TOTAL / 3,
      }">{{score.toFixed(0)}}/{{MARK_TOTAL}}</div>



    <div class="text-center flex flex-col justify-center items-center gap-2 mt-5">
      <span class="rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40">
        <ion-icon name="arrow-redo-outline" size="large"></ion-icon>
      </span>
      <span>
        Partager mon score
      </span>
      <div class="flex justify-center gap-3 items-center">
        <span v-for="platform in platforms" :key="platform.name">
          <ion-icon :name="platform.icon" size="large"></ion-icon>
        </span>
      </div>
    </div>


    <div class="flex flex-col gap-2 mt-10">
      <div class="flex gap-2">
        <button @click="goBackToQuizzList" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500">
          <ion-icon name="return-up-back-outline"></ion-icon>
          Retour
        </button>
        <button @click="restart" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500">
          <ion-icon name="refresh-outline"></ion-icon>
          Réessayer
        </button>
      </div>

      <button @click="goToMenu" class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500">
        <ion-icon name="home-outline"></ion-icon>
        Menu
      </button>

    </div>

  </section>
</template>

<script>
export default {
  name: 'QuizzEnded',
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
      this.$router.push({name: 'index'})
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
    }
  }
}
</script>

<style>

</style>
