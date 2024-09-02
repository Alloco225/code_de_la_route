<template>
  <div class="bg-white h-full">
    <header class="p-4 text-center">
      <h1 class="text-2xl font-bold">Panneaux de Danger</h1>
      <p class="text-gray-500">Apprenez à reconnaître les panneaux de signalisation indiquant un danger.</p>
    </header>
    <main class="p-4 mt-10">
      <div class="grid grid-cols-2 gap-4">
        <router-link
          :to="`/apprendre-les-panneaux-de-signalisation/interdiction/${sign.id}`"
              class="flex flex-col items-center gap-3 bg-gray-100 p-4 border rounded-lg shadow-md" v-for="sign in signs" :key="sign.id">
          <img :src="sign.image" alt="Panneau de danger">
          <h2 class="text-xl font-bold">{{ sign.name }}</h2>
        </router-link>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: 'DangerSigns',

  computed: {
    signs() {
      return this.$store.state.signs.list.filter(sign => sign.category_id === '1');
    }
  }
}
</script>

<style>

</style>
