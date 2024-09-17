<template>
  <div class="p-3 flex flex-col h-full">
    <h2 class="text-2xl font-bold mb-4 text-white">Quizz List</h2>
    <ul class="flex-grow overflow-y-auto">
      <router-link
        :to="'/quizz-sur-les-panneaux-de-signalisation/' + quizz.id"
        v-for="(quizz, index) in quizzList"
        :key="quizz.id"
        class="mb-2 bg-white p-3 rounded-md shadow-md flex justify-between items-center"
      >
        <div class="flex justify-between items-center gap-3">
          <div class="w-10 h-10">
            <img :src="quizz.image" alt="Quizz" class="w-full h-full" />
          </div>
          <div class="flex flex-col">
            <span class="text-lg font-bold">{{ 'Quizz ' + index }}</span>
            <span class="text-sm text-gray-500">
              {{ quizz.progression ? quizz.progression + '%' : 'Pas commencé' }}
            </span>
          </div>
        </div>
        <button class="bg-blue-500 text-white px-4 py-2 rounded-md">
          Commencer
        </button>
      </router-link>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'QuizzList',
  computed: {
    quizzList() {
      return this.$store.state.quizzes.list
    },
  },
  data() {
    return {}
  },
}
</script>

<style scoped></style>
