<template>
  <div
    class="transition duration-200 ease-out h-full w-full flex flex-col pt-5 pb-10"
  >
    <nav class="justify-between hidden px-5 mx-auto md:w-11/12 xl:w-10/12">
      <img src="/favicon.png" alt="" class="w-24 h-24" />

      <ul>
        <a href="">login</a>
      </ul>
    </nav>
    <section
      class="md:h-full flex flex-col gap-10 justify-center mx-auto px-3 md:w-1/2 py-10 md:py-24"
    >
      <div class="flex justify-center">
        <img src="/favicon.png" class="w-32 md:w-auto" alt="" />
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

    <section class="py-10 bg-gray-50">
      <div
        class="flex flex-col text-center md:text-left items-center md:grid grid-cols-2 gap-5 px-5 mx-auto md:w-11/12 xl:w-10/12"
      >
        <div
          class="font-medium flex flex-col gap-3 justify-center md:items-start"
        >
          <h2 class="text-5xl">Lessons sur les Panneaux</h2>
          <p>Révisez et apprennnez les panneaux grace à des flash cards</p>
          <div class="flex justify-center gap-3 text-white">
            <button class="rounded bg-black px-2 py-1">Apple Store</button>
            <button class="rounded bg-black px-2 py-1">Play Store</button>
          </div>
        </div>
        <!-- <flip-image-group></flip-image-group> -->
        <div class="relative flex flex-col md:flex-row gap-2">
          <img
            class="md:h-96 md:w-auto w-full h-auto"
            src="/images/shots/sign_indication_details.jpg"
            alt=""
          />
          <img
            class="md:h-96 md:w-auto w-full h-auto"
            src="/images/shots/sign_interdiction_details_2.jpg"
            alt=""
          />
          <img
            class="md:h-96 md:w-auto w-full h-auto"
            src="/images/shots/sign_obligation_details.jpg"
            alt=""
          />
        </div>
      </div>
    </section>

    <section class="py-20  bg-gray-100">
      <div class="flex flex-col px-5 mx-auto md:w-11/12 xl:w-10/12">
        <div
          class="font-medium text-center md:text-left flex flex-col items-center justify-center"
        >
          <h2 class="text-5xl">Quizz sur les Panneaux</h2>
          <p>Révisez et apprennnez les panneaux grace à des quizz</p>
        </div>
        <div>
          <mini-quizz :start="startMiniQuizz"></mini-quizz>
        </div>
      </div>
    </section>

    <home-footer></home-footer>

    <!-- testimonies -->
    <!-- <section class="py-10">
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

            <div class="flex flex-col">
              <h3 class="font-medium text-2xl">User name</h3>
              <div class="text-orange-500">
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
    </section> -->
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data() {
    return {
      email: null,
      password: null,
      startMiniQuizz: false,
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
