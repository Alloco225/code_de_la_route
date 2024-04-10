<template>
<div class="h-full w-full flex flex-col justify-between px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5">

    <div class="mt-5 md:my-10 text-white text-center px-2">

      <img src="/logo.png" alt="" class="h-auto w-full">
      <span>v0.1.3</span>
    </div>

    <div class="flex flex-col gap-3">
      <!-- <h4 class="text-center text-white text-xl uppercase font-medium">Categories</h4> -->

      <div class="grid md:grid-cols-2 gap-5 md:gap-3 md:mt-10 ">
        <article @click="gotoCategory(category)"  v-for="(category) in categories" :key="category.id" class="group rounded hover:shadow-lg cursor-pointer md:rounded-lg overflow-hidden border relative h-64 md:h-32">
          <img :src="category.image" alt="" class="absolute w-full h-full object-cover">

          <div class="absolute group-hover:hidden top-0 left-0 w-full h-full bg-black bg-opacity-20"></div>
          <div class="absolute bottom-0 text-md  bg-gradient-to-b from-transparent to-black text-white p-2 py-3 w-full">
            <h3 class="text-center uppercase text-2xl">{{category.name}}</h3>
          </div>
        </article>
      </div>


    </div>

    <div class="flex justify-center items-center">
      <button class="flex justify-center gap-2 px-3 py-2 rounded-lg shadow items-center bg-blue-700 hover:bg-blue-800 text-white">
        <ion-icon name="logo-facebook"></ion-icon>
        Connexion
      </button>
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
    }
  },
  created(){
    this.fetchCategories();
  },
  mounted(){
    console.log("mounted")

  },
  computed: {
    categories(){
      return this.$store.state.categories.list;
    }
  },
  methods: {
    async fetchCategories(){
      await this.$store.dispatch('categories/fetchAll');
    },
    gotoCategory(category){
      this.$router.push('/quizzes/' + category.id)
    }
  }
}
</script>

<style>

</style>
