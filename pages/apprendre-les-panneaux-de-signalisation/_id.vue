<template>
    <SignGridList :category="category" />
</template>

<script>
import SignGridList from '@/components/SignGridList.vue'
export default {
  name: 'Signs',
  components: {
    SignGridList,
  },
  data() {
    return {
      currentSign: null,
      category: null,
    }
  },
  async created() {
    console.log('created categories')
  },
  async mounted() {
    console.log('mounted categories')
    const categoryId = this.$route.params.id
    console.log('mounted', categoryId, this.$route.params)
    console.log('categoryId', categoryId)
    this.category = this.$store.state.categories.list.find(
      (category) => category.id === categoryId
    )
    console.log('this.category', this.category)
  },
  computed: {
    signs() {
      return this.$store.state.signs.list.filter(
        (sign) => sign.category_id === this.category.id
      )
    },
  },
}
</script>

<style></style>
