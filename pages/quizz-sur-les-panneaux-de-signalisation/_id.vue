<template lang="pug"  >
  quizz.bg-gray-700.h-full(:quizz_id="quizz.id")
</template>

<script>

export default {
  name: 'QuizzSurLeCodeDeLaRoute',
  data() {
    return {
      quizz: null,
    }
  },
  async created() {
    console.log('created quizz list')
  },
  async mounted() {
    console.log('mounted categories')
    const quizzId = this.$route.params.id
    console.log('mounted', quizzId, this.$route.params)
    console.log('quizzId', quizzId)
    this.quizz = this.$store.state.quizzes.list.find(
      (quizz) => quizz.id === quizzId
    )
    console.log('this.quizz', this.quizz)
  },
  computed: {
    signs() {
      return this.$store.state.signs.list.filter(
        (sign) => sign.quizz_id === this.quizz.id
      )
    },
  },
}
</script>

<style></style>
