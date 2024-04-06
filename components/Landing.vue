<template>
<div class="w-full mx-auto md:w-11/12 xl:w-10/12 pt-10">

    <h1 class="text-4xl text-center my-10">Quizz code de la route</h1>

    <div class="grid grid-cols-4 gap-5 mt-20 ">
      <article @click="gotoCategory(category)"  v-for="(category) in categories" :key="category.id" class="rounded hover:shadow-lg cursor-pointer md:rounded-lg overflow-hidden border relative h-64">
        <img :src="category.image" alt="" class="absolute w-full h-full">

        <div class="absolute top-0 left-0 w-full h-full bg-black bg-opacity-20"></div>
        <div class="absolute bottom-0 text-xl  bg-gradient-to-b from-transparent to-black text-white p-2 w-full">
          <h3 class="text-center uppercase">{{category.name}}</h3>
        </div>
      </article>
    </div>
</div>
</template>

<script>
export default {
  name: 'Landing',
  data(){
    return {
      categories: [],
    }
  },
  created(){
    this.fetchCategories();
  },
  mounted(){

  },
  methods: {
    async fetchCategories(){
      // load categories from firebase
      this.categories = [
        {
          id: 'signalisation',
          name: 'Signalisation',
          image: '/signalisation.jpeg',
        },
        {
          id: 'degagement',
          name: 'Dégagement',
          image: '/degagement.jpg',
        },
      ]
    },
    gotoCategory(category){
      this.$router.push({name: 'quizzes', params: {category_id: category.id}})
    }
  }
}
</script>

<style>

</style>
