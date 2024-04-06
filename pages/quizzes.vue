<template>
  <div class="bg-gray-800 h-full">
    <h3 class="text-lg text-center text-white py-5">
      Quizzes list
    </h3>

    <ul class="p-3 mt-3 h-full">
      <li v-for="(quizz, i) in quizzes" :key="i" @click="openQuizz(quizz)" class="flex gap-1 p-2 items-center border rounded bg-white">
        <span class="rounded-full w-10 h-10 text-nowrap bg-gray-800 text-white flex justify-center items-center">1</span>

        <div class="flex w-full justify-between">
          <div>
            <h4>Test 1</h4>
            <h4></h4>
          </div>

          <span class="rounded-full flex justify-center items-center">50%</span>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Quizzes',
  data(){
    return {
      quizzes: [
        {

        },
      ],
    }
  },
  methods: {
    async openQuizz(quizz){
      this.$router.push({name: 'quizz', params: {quizzId: quizz?.id} })
    }
  }
}
</script>

<style>

</style>
