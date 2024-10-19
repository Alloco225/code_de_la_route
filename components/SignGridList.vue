<template>
  <div class="flex flex-col bg-white h-full relative">
    <header class="p-4 text-center">
      <h1 class="text-2xl font-bold">Panneaux {{ category.name }}</h1>
      <p class="text-gray-500">
        Explorez les panneaux de signalisation de {{ category.name }}.
      </p>
    </header>
    <main class="p-4 mt-10 h-full overflow-y-auto">
      <div class="grid grid-cols-2 gap-4">
        <article
          class="cursor-pointer flex flex-col items-center gap-3 bg-gray-100 p-4 border rounded-lg shadow-md"
          v-for="sign in signs"
          :key="sign.id"
          @click="showSign(sign)"
        >
          <img
            :src="
              '/images/signalisation/' + sign.category_id + '/' + sign.image
            "
            alt="Sign"
          />
          <h2 class="text-xl text-center font-medium">{{ sign.name }}</h2>
        </article>
      </div>
    </main>
    <footer class="bg-white p-4 shadow-md">
      <div class="flex justify-between items-center w-full">
        <button
          class="flex gap-2 justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 rounded px-3 py-2 text-white"
          @click="$router.back()"
        >
          <ion-icon name="chevron-back-outline"></ion-icon> Retour
        </button>
      </div>
    </footer>
    <article
      class="absolute bottom-0 left-0 w-full h-full bg-black bg-opacity-50 flex flex-col justify-end items-stretch"
      @click="hideSign"
      v-if="currentSign"
    >
      <div @click.stop class="flex flex-col items-center justify-center pb-10  bg-white p-4 border rounded-t-3xl shadow-md">
        <img
          :src="
            '/images/signalisation/' +
            currentSign.category_id +
            '/' +
            currentSign.image
          "
          alt="Sign"
        />
        <button class="absolute top-0 right-0 m-3" @click="hideSign">
          <div
            class="h-10 w-10 flex items-center justify-center bg-gray-500 hover:bg-red-500 text-white rounded-full"
          >
            <ion-icon name="close" size="large"></ion-icon>
          </div>
        </button>
        <div class="absolute left-0 right-0">
          <div class="flex justify-between items-center w-full px-3">
            <button
              class="w-10 h-10 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded-full"
              @click="prevSign"
            >
              <ion-icon name="chevron-back-outline" size="large"></ion-icon>
            </button>
            <button
              class="w-10 h-10 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded-full"
              @click="nextSign"
            >
              <ion-icon name="chevron-forward-outline" size="large"></ion-icon>
            </button>
          </div>
        </div>
        <h2 class="text-xl font-bold mb-3 text-center">
          {{ currentSign.name }}
        </h2>
        <p class="text-gray-500 p-3 rounded-lg bg-gray-100">
          {{ currentSign.description }}
        </p>
        <div class="flex justify-around items-center w-full mt-3">
          <button
            class="px-3 py-2 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded"
          >
            <ion-icon name="bookmark-outline"></ion-icon> Ajouter à ma liste
          </button>
          <button
            class="px-3 py-2 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded"
            @click="speakSign"
          >
            <ion-icon name="volume-medium-outline"></ion-icon> Écouter
          </button>
        </div>
      </div>
    </article>
  </div>
</template>

<script>
export default {
  name: 'SignGridList',
  props: {
    category: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      currentSign: false,
      currentSignIndex: 0,
    }
  },
  computed: {
    signs() {
      return this.$store.state.signs.list.filter(
        (sign) => sign.category_id === this.category.id
      )
    },
  },
  methods: {
    showSign(sign) {
      // this.currentSign = sign
    },
    hideSign() {
      this.currentSign = false
    },
    prevSign() {
      this.currentSignIndex = (this.currentSignIndex - 1 + this.signs.length) % this.signs.length
      this.currentSign = this.signs[this.currentSignIndex]
    },
    nextSign() {
      this.currentSignIndex = (this.currentSignIndex + 1) % this.signs.length
      this.currentSign = this.signs[this.currentSignIndex]
    },
    speakSign() {
      const utterance = new SpeechSynthesisUtterance(this.currentSign.name, {
        lang: 'fr',
        voice: speechSynthesis
          .getVoices()
          .find((voice) => voice.lang === 'fr'),
      })
      speechSynthesis.speak(utterance)
      this.currentSign.isSpeaking = true
      setTimeout(() => {
        this.currentSign.isSpeaking = false
        const descriptionUtterance = new SpeechSynthesisUtterance(
          this.currentSign.description,
          {
            lang: 'fr',
          }
        )
        speechSynthesis.speak(descriptionUtterance)
      }, 3000)
    },
  },
}
</script>

<style></style>
