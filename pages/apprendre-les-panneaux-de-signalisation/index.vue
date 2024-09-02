<template>
  <div class="bg-white h-full">
    <header class="p-4 text-center">

      <h1 class="text-2xl font-bold">Toutes les Catégories</h1>
      <p class="text-gray-500">Apprenez les panneaux de signalisation</p>
    </header>
    <main class="p-4 mt-10">
      <div class="grid grid-cols-2 gap-4">
        <router-link
          :to="`/apprendre-les-panneaux-de-signalisation/${category.id}`"
         class="flex flex-col items-center gap-3 bg-gray-100 p-4 border rounded-lg shadow-md" v-for="category in categories" :key="category.id">
          <img :src="category.image" alt="Catégorie 1">
          <h2 class="text-xl font-bold">{{ category.name }}</h2>
        </router-link>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: 'LearnSigns',

  computed: {
    categories() {
      return this.$store.state.categories.list

      return this.$store.getters['categories/list'];
    }
  }
}
</script>

<style>

</style>
