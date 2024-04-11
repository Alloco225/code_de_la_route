<template>
  <quizz :quizz_id="$route.params.quizz_id"></quizz>
</template>

<script>
import Quizz from '~/components/Quizz.vue'
export default {
  components: { Quizz },
  name: 'QuizzDetails',
}
</script>

<style>

</style>
