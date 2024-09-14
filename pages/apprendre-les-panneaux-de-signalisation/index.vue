<template>
  <div class="bg-white flex flex-col h-full">
    <header class="p-4 text-center">
      <h1 class="text-2xl font-bold">Toutes les Catégories</h1>
      <p class="text-gray-500">Apprenez les panneaux de signalisation</p>
    </header>
    <main class="p-4 h-full">
      <div class="grid grid-cols-2 gap-4">
        <router-link
          :to="`/apprendre-les-panneaux-de-signalisation/${category.id}`"
          class="flex flex-col items-center gap-3 bg-gray-100 p-4 border rounded-lg shadow-md"
          v-for="category in categories"
          :key="category.id"
        >
          <img
            :src="category.image"
            :alt="category.name"
            class="w-32 h-32 object-contain"
          />
          <h2 class="text-xl font-bold">{{ category.name }}</h2>
        </router-link>
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
  </div>
</template>

<script>
export default {
  name: 'LearnSigns',
  async created() {
    console.log('created panneaux')
  },
  async mounted() {
    console.log('mounted panneaux')
  },
  computed: {
    categories() {
      return this.$store.state.categories.list

      return this.$store.getters['categories/list']
    },
  },
}
</script>

<style></style>
