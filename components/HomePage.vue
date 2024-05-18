<template>
  <div
    class="transition duration-200 ease-out h-full w-full flex flex-col px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5 pb-10"
  >
    <nav class="justify-between hidden">
      <img src="/favicon.png" alt="" class="w-24 h-24" />

      <ul>
        <a href="">login</a>
      </ul>
    </nav>
    <section
      class="h-full flex flex-col gap-10 justify-center mx-auto w-1/2 py-24"
    >
      <div class="flex justify-center">
        <img src="/favicon.png" alt="" />
      </div>
      <h1 class="text-4xl font-semibold text-center">
        Maitriser le Code de la Route n'a jamais été aussi facile
      </h1>
      <h2 class="text-xl text-gray-700 font-medium text-center">
        Apprennez les panneaux de signalisation, et testez vos connaissances à
        travers une série de questions variés et interactives.
      </h2>

      <div class="flex justify-center gap-3 text-white">
        <button class="rounded bg-black px-2 py-1">Apple Store</button>
        <button class="rounded bg-black px-2 py-1">Play Store</button>
      </div>
    </section>
    <section class="py-10">
      <h2 class="text-2xl font-medium text-center">
        Des quiz sur chaque sujet pour vous tester
      </h2>

      <mini-quizz></mini-quizz>
    </section>

    <!-- testimonies -->
    <section class="py-10">
      <div class="grid grid-cols-3 gap-3">
        <article
          v-for="i in 3"
          :key="i"
          class="border rounded-xl px-3 py-5 flex flex-col gap-3"
        >
          <div>
            <div class="float-start relative h-32 w-32 -m-3">
              <img
                src="/categories/degagement.jpg"
                class="absolute left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 object-cover w-20 h-20 border-4 rounded-full"
                alt=""
              />
              <img
                src="/images/logo_frame.svg"
                class="absolute left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 object-contain w-24 h-24"
                alt=""
              />
            </div>

            <div
              class="flex flex-col"
            >
              <h3 class="font-medium text-2xl">User name</h3>
              <div class=" text-orange-500">
                <ion-icon name="star"></ion-icon>
                <ion-icon name="star"></ion-icon>
                <ion-icon name="star"></ion-icon>
                <ion-icon name="star"></ion-icon>
                <ion-icon name="star"></ion-icon>
              </div>
            </div>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nisi,
              labore qui. Quia ipsam tenetur fugiat laudantium, quis soluta,
              rerum autem voluptatibus recusandae libero et possimus optio
              ducimus reprehenderit quasi rem!
            </p>
          </div>
        </article>
      </div>
    </section>

    <!-- CTA -->
    <section class="rounded-xl p-5 flex justify-between border">
      <div class="flex flex-col gap-2">
        <div>
          <h3 class="font-medium text-xl">Lorem ipsum dolor sit amet.</h3>
          <h3 class="ont-medium text-xl">Lorem ipsum dolor sit amet.</h3>
        </div>
        <div class="flex gap-3 text-white">
          <button class="rounded bg-black px-2 py-1">Apple Store</button>
          <button class="rounded bg-black px-2 py-1">Play Store</button>
        </div>
      </div>
      <div class="h-64 w-32 transform rotate-6">
        <img src="/images/shots/3_panneaux_obligation.jpg" class="w-full h-auto" alt="">
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data() {
    return {
      email: null,
      password: null,
    }
  },
}
</script>

<style>
.mask1 {
  -webkit-mask-image: url('/images/logo frame.png');
  mask-image: url('/images/logo frame.png');
  -webkit-mask-repeat: no-repeat;
  mask-repeat: no-repeat;
}

.hexagon {
  position: relative;
  background-color: orange;
  clip-path: polygon(25% 5%, 75% 5%, 95% 50%, 75% 95%, 25% 95%, 5% 50%);
}

.hexagon img {
  position: absolute;
  top: 5px;
  left: 5px;
  width: calc(100% - 10px);
  height: calc(100% - 10px);
  clip-path: polygon(25% 5%, 75% 5%, 95% 50%, 75% 95%, 25% 95%, 5% 50%);
  border-radius: 10px; /* Smooth the corners */
}
</style>
