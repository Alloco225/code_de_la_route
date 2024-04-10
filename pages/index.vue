<template lang="pug">
  landing.h-full.bg-gray-700
</template>

<script>
import Vue from 'vue'

export default Vue.extend({
  layout: 'main',
  name: 'IndexPage',
  mounted(){
    console.log("mounted")
    setTimeout(() => {
      console.log("confetti !!");
      this.$confetti.start();
    }, 1000);
  }
})
