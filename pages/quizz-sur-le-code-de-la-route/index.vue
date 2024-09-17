<template lang="pug">
  quizz-list.bg-gray-700.h-full
</template>

<script>

export default {
  name: 'ListeDesQuizzSurLeCodeDeLaRoute',
  data() {
    return {}
  },
  async created() {
    this.toggleLoading('initApp', true)
    await this.initApp()
    this.toggleLoading('initApp', false)
  },
  mounted() {
    console.log('mounted')
  },
  computed: {
    categories() {
      return this.$store.state.categories.list
      return this.$store.getters['categories/list']
    },
  },
  methods: {
    async initApp() {
      console.log('initApp')

    },

    gotoCategory(category) {
      this.$router.push('/categories/' + category.id)
    },
  },
}
</script>

<style></style>
