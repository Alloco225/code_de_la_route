<template>
<div class="h-full w-full flex flex-col justify-between px-2 mx-auto md:w-11/12 xl:w-10/12 pt-5">

    <div class="mt-5 md:my-10 text-white text-center">
      <h1 class="text-xl md:text-4xl">Quizz code de la route</h1>
      <span>v0.1.3</span>
    </div>

    <div class="grid md:grid-cols-2 gap-5 md:gap-3 md:mt-10 ">
      <article @click="gotoCategory(category)"  v-for="(category) in categories" :key="category.id" class="rounded hover:shadow-lg cursor-pointer md:rounded-lg overflow-hidden border relative h-64 md:h-32">
        <img :src="category.imageUrl" alt="" class="absolute w-full h-full object-cover">

        <div class="absolute top-0 left-0 w-full h-full bg-black bg-opacity-20"></div>
        <div class="absolute bottom-0 text-md  bg-gradient-to-b from-transparent to-black text-white p-2 py-5 w-full">
          <h3 class="text-center uppercase text-2xl">{{category.name}}</h3>
        </div>
      </article>
    </div>

    <footer class="text-center text-gray-200 mb-10 md:mb-5">
      <a class="underline text-blue-500" href="https://amane.dev">あ</a>
    </footer>
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

      this.categories = this.$store.state.categories.list;
      // load categories from firebase
      // this.categories = [
      //   {
      //     id: 'signalisation',
      //     name: 'Signalisation',
      //     image: '/signalisation.jpeg',
      //   },
      //   {
      //     id: 'degagement',
      //     name: 'Dégagement',
      //     image: '/degagement.jpg',
      //   },
      // ]
    },
    gotoCategory(category){
      this.$router.push('/quizzes/' + category.id)
    }
  }
}
</script>

<style>

</style>
