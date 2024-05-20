<template>
<div class="flex flex-col ">
        <div class="flex justify-center">
          <div v-for="i in 2" :key="i" class="w-24 h-24">
            <img src="/favicon.png" alt="" />
          </div>
        </div>
        <div class="flex justify-center">
          <div v-for="i in 3" :key="i" class="w-24 h-24">
            <img src="/favicon.png" alt="" />
          </div>
        </div>

        <div class="flex justify-center">
          <div v-for="i in 2" :key="i" class="w-24 h-24">
            <img src="/favicon.png" alt="" />
          </div>
        </div>
      </div>
</template>

<script>
export default {
  name: 'FlipImageGroup',
}
</script>

<style>

</style>
