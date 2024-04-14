<template>
  <div class="relative bg-gray-700 h-full pt-10">
    <nav
      class="absolute top-0 left-0 w-full flex items-center gap-3 px-3 py-2 border-b border-gray-900 shadow bg-gray-800"
    >
      <button
        @click="goBack"
        class="rounded bg-opacity-15 text-white bg-white flex justify-center items-center p-2"
      >
        <ion-icon name="chevron-back-outline"></ion-icon>
      </button>

      <h3 class="text-lg text-center text-white">
        {{ category?.name }}
      </h3>
    </nav>

    <loading-spinner
      v-if="isLoading('categories')"
      class="py-10 mt-20"
    ></loading-spinner>

    <section v-else class="h-full flex flex-col justify-between py-10">
      <span></span>
      <div
        v-if="quizzes.length == 0"
        class="mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"
      >
        <ion-icon name="search-outline" style="font-size: 64px"></ion-icon>
        <h2 class="text-xl">Wow such empty</h2>

        <button
          @click="$router.back()"
          class="flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow"
        >
          <ion-icon name="return-up-back-outline"></ion-icon>
          Retour
        </button>
      </div>
      <ul
        v-else
        class="p-3 flex gap-3 flex-col h-full bg-gray-700 overflow-y-scroll"
      >
        <li
          v-for="(quizz, i) in quizzes"
          :key="quizz.id"
          @click="openQuizz(quizz.id)"
          class="flex gap-1 p-2 items-center border rounded bg-white"
        >
          <span
            class="rounded-full w-10 h-10 text-nowrap bg-gray-800 text-white flex justify-center items-center"
            >{{ i + 1 }}</span
          >

          <div class="flex w-full justify-between">
            <div>
              <h4>Level {{ i + 1 }}</h4>
              <h4></h4>
            </div>

            <span class="rounded-full flex justify-center items-center"
              >50%</span
            >
          </div>
        </li>
      </ul>
    </section>
  </div>
</template>

<script>
import CategoryDataService from '~/services/CategoryDataService'
import QuizzDataService from '~/services/QuizzDataService'
export default {
  name: 'Quizzes',
  data() {
    return {
      category_id: null,
      category: null,

    }
  },
  async created() {
    this.toggleLoading('categories', true)
    console.log('_category_id', this.$route.params.category_id)

    this.category_id = this.$route.params?.category_id

    if (this.$store.state.ui.uiStates.useLocalDB) {
      this.category = this.categories.find(
        (item) => item.id == this.category_id
      )
      console.log("categories", this.categories)
      console.log("category", this.category)
      console.log("quizzes", this.quizzes)
      // this.quizzes = this.quizzes.
    } else {
      this.category = await CategoryDataService.getOne(this.category_id)
      this.quizzes = await QuizzDataService.getFromCategory(this.category_id)
    }

    // console.log("category ", this.$store.state.categories.list, this.category, "quizzes", this.quizzes.length)
    this.toggleLoading('categories', false)
  },

  computed: {
    categories(){
      return this.$store.getters['categories/list'];
    },
    quizzes(){
      return this.$store.getters['quizzes/list'];
      // .filter(
      // return this.$store.getters['quizzes/list'].filter(
      //   (item) => item.category_id == this.category_id
      // )
    },
  },
  methods: {
    goBack() {
      this.$router.push({ name: 'index' })
    },
    async openQuizz(index) {
      this.$router.push('/categories/' + this.category_id + '/quizzes/' + index)
    },
  },
}
</script>

<style></style>
