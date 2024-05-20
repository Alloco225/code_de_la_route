<template>
  <footer>
    <section class="bg-green-800 text-white py-10">
      <div
        class="grid grid-cols-1 md:grid-cols-3 gap-3 md:gap-5 px-5 mx-auto md:w-11/12 xl:w-10/12"
      >
        <div>
          <a href="/">
            <img src="/favicon.png" class="w-12 h-12" alt="" />
          </a>
          <a href="/" class="font-semibold text-xl">Code de la Route</a>
          <p>
            Apprennez les panneaux de signalisation, et testez vos connaissances
            à travers une série de questions variés et interactives.
          </p>
        </div>
        <div>
          <p class="font-semibold text-xl">Légal</p>
          <a href="/terms">Politique de confidentialité</a>
          <a href="/terms">Conditions d'utilisation</a>
        </div>
      </div>
    </section>
    <div class="bg-green-900 text-white py-3">
      <p class="text-center">
        &copy; 2024
        <span>-</span>
        <a href="https://amane.dev" target="_blank"> あ </a>
      </p>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'HomeFooter',
}
</script>

<style></style>
