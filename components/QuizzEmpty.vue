<template>
   <div
      class="mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"
      >
      <ion-icon name="search-outline" style="font-size: 64px"></ion-icon>
      <h2 class="text-xl">Quizz non trouvé</h2>

      <button
        @click="$router.back()"
        class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow"
      >
        <ion-icon name="return-up-back-outline"></ion-icon>
        Retour
      </button>
    </div>
</template>

<script>
export default {
  name: 'QuizzEmpty',
}
</script>

<style>

</style>
