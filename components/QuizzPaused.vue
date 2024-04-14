<template>
  <section
    id="countdown"
    class="fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90"
  >
    <h3 class="text-2xl mb-10 uppercase">Pause</h3>

    <div
      class="rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"
    >
      <ion-icon name="pause-circle-outline"></ion-icon>
    </div>

    <div class="flex flex-col items-center gap-8 mt-10">
      <div class="flex flex-row-reverse gap-2">
        <button
          @click="resumeGame"
          class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500"
        >
          <ion-icon name="play-outline"></ion-icon>
          Continuer
        </button>
        <button
          @click="toujourFuirFuirEtRefuir"
          class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500"
        >
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
  methods: {
    resumeGame() {
      this.$emit('resume')
    },

    toujourFuirFuirEtRefuir() {
      //
      this.$emit('quit')
    },
  },
}
</script>

<style></style>
