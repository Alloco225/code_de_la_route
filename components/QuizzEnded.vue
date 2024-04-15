<template>
  <section
    id="quizz-ended"
    class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90"
  >
    <h3 class="text-2xl mb-10">Quizz Terminé</h3>

    <div
      id="score-container"
      class="rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"
      :class="{
        'bg-green-500': score == MARK_TOTAL,
        'bg-blue-500': score < MARK_TOTAL,
        'bg-orange-500': score <= MARK_TOTAL / 2,
        'bg-red-500': score <= MARK_TOTAL / 3,
      }"
    >
      {{ score.toFixed(0) }}/{{ MARK_TOTAL }}
    </div>

    <div class="text-center flex flex-col justify-center items-center gap-2 mt-5">
      <span
        @click="shareScore()"
        class="rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40"
      >
        <ion-icon name="arrow-redo-outline" size="large"></ion-icon>
      </span>
      <span @click="shareScore()"> Partager mon score </span>
      <div class="flex justify-center gap-3 items-center">
        <a v-for="platform in platforms" :href="getShareLink(platform.name)" target="_blank" :key="platform.name">
          <ion-icon :name="platform.icon" size="large"></ion-icon>
        </a>
      </div>
    </div>

    <div class="flex flex-col gap-2 mt-10">
      <div class="flex gap-2">
        <button
          @click="goBackToQuizzList"
          class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500"
        >
          <ion-icon name="return-up-back-outline"></ion-icon>
          Retour
        </button>
        <button
          @click="restart"
          class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500"
        >
          <ion-icon name="refresh-outline"></ion-icon>
          Réessayer
        </button>
      </div>

      <button
        @click="goToMenu"
        class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500"
      >
        <ion-icon name="home-outline"></ion-icon>
        Menu
      </button>
    </div>
  </section>
</template>

<script>
export default {
  name: "QuizzEnded",
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
  data() {
    return {
      MARK_TOTAL: 20,
      score: 0,
      platforms: [
        {
          name: "whatsapp",
          icon: "logo-whatsapp",
        },

        {
          name: "facebook",
          icon: "logo-facebook",
          link: "",
        },
        {
          name: "twitter",
          icon: "logo-twitter",
          link: "",
        },
        {
          name: "linkedin",
          icon: "logo-linkedin",
          link: "",
        },
      ],
    };
  },
  mounted() {
    this.calcScore();
    // TODO add a gsap animation on the score calculating
  },
  computed: {},
  methods: {
    calcScore() {
      let percentage = (this.correctAnswerCount * 100) / (this.questionCount ?? 0);
      // find percentage value in regard to MARK_TOTAL which is 100/5
      const coefficient = 100 / this.MARK_TOTAL;
      this.score = percentage / coefficient;
      if (this.score == this.MARK_TOTAL) {
        this.throwConfetti();
      }
    },
    getShareLink(platform){

      if(!platform) return;

      const url = "https://code-de-la-route.amane.dev"

      const score = this.score.toFixed(0) +'/'+ this.MARK_TOTAL
      const data = {
        title: "Euss, esseu tu peux ?",
        text: "J'ai eu " +score+ " au test de Code de la Route en ligne",
        url,
      }
      const stringText = Object.keys(data).map(key => data[key]).join('\n');
      let link = url;
      if (platform == "whatsapp") {
        link = `whatsapp://send?text=${stringText}`;
      }

      if (platform == "facebook") {
        link = `https://www.facebook.com/sharer/sharer.php?u=${stringText}`;
      }
      if (platform == "linkedin") {
        link = `https://www.linkedin.com/shareArticle?url=${stringText}`;
      }
      if (platform == "twitter") {
        link = `https://twitter.com/intent/tweet?url=${stringText}`;
      }

      return link;
    },
    goBackToQuizzList() {
      this.$router.back();
    },
    goToMenu() {
      this.$router.push({ name: "index" });
    },
    restart() {
      this.$emit("restart");
    },
    async shareScore(platform) {

      console.log("shareScore", platform);
      //
      const stringToShare = "https://code-de-la-route.amane.dev";
      let link = "";

      if(!platform){
        const score = this.score.toFixed(0) +'/'+ this.MARK_TOTAL
        const data = {
          title: "Euss, esseu tu peux ?",
          text: "J'ai eu " +score+ " au test de Code de la Route en ligne",
          url: stringToShare,
        }
        const stringText = Object.keys(data).map(key => data[key]).join('\n');

        if (!navigator.canShare) {
          console.log("Sharing not supported")
          navigator.clipboard.writeText(stringText);
          // this.$toasted.show("Copié dans le presse papier")
        } else if (navigator.canShare(data)) {
          //
            try {
              await navigator.share(data);
              // this.$toasted.show("Copié dans le presse papier")
            } catch (error) {
              console.log("could not share", error);
              // this.$toasted.show("Une erreur s'est produite")
            }
        } else {
          navigator.clipboard.writeText(stringText);
          // this.$toasted.show("Copié dans le presse papier")
        }
        return;
      }
    },
    throwConfetti() {
      setTimeout(() => {
        console.log("confetti !!");
        this.$confetti.start();
        setTimeout(() => {
          this.$confetti.stop();
        }, 2000);
      }, 500);
    },
  },
};
</script>

<style></style>
