<template>
  <section id="tu-veux-abandonner" class="fixed z-10 transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90">
      <div class="flex flex-col justify-around h-full px-10">

        <h3 class="text-4xl md:text-9xl mb-10 glitch"
        :class="{'blink': isVideoVisible}"
        >
        {{ titleText}}
        </h3>


        <transition>
          <div v-show="isVideoVisible" class="fixed z-10 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col justify-center items-center">
            <div class="mx-auto">
              <video id="tu_veux_abandonner" @ended="onVideoEnded" width="200px" height="400px" controls>
                <source src="/video/tu_veux_abandonner.mp4" type="">
              </video>
            </div>
          </div>
        </transition>

        <div></div>

        <div v-if="videoPlayedCompletely" class="flex flex-col items-center gap-5 mt-16">
          <button @click="close" class="flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500">
            OKAY
          </button>
        </div>
        <div v-else class="flex flex-col items-center gap-5 mt-16">
            <button @click="close" class="flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500">
              <!-- <ion-icon name="checkmark-circle-outline" ></ion-icon> -->
              NON, JAMAIS
            </button>


          <button @click="giveUp" class="flex w-full items-center justify-center uppercase gap-2 px-3 py-2 rounded bg-red-500">
            <!-- <ion-icon name="alert-circle-outline" ></ion-icon> -->
            Abandonner
          </button>

        </div>
      </div>

  </section>
</template>

<script>
export default {
  name: 'TuVeuxAbandonner',
  data(){
    return {
      isVideoVisible: false,
      videoPlayedCompletely: false,
      titleText: "Tu veux abandonner ????",
    }
  },
  methods: {
    close(){
      this.reset('tu_veux_abandonner')

      setTimeout(() => {
        this.isVideoVisible = false;
      }, 500);

      // close this window



    },
    giveUp(){
      this.isVideoVisible = true;

      setTimeout(() => {
        this.play('tu_veux_abandonner')
        setTimeout(() => {
          this.titleText = "Est-ce que tu veux abandonner ?????"
        }, 2600);
      }, 500);
      // this.play('dontgiveup')
    },
    onVideoEnded(){
      // alert('ended')
      this.videoPlayedCompletely = true;
      this.titleText = "Tu n'as pas le droit d'abandonner!!!"
    },
    pause(){
      this.pause('tu_veux_abandonner')
    }
  }
}
</script>

<style scoped>

.glitch {
  font-weight: 700;
  text-transform: uppercase;
  position: relative;

  text-shadow: 0.05em 0 0 rgba(255, 0, 0, 0.75),
    -0.025em -0.05em 0 rgba(0, 255, 0, 0.75),
    0.025em 0.05em 0 rgba(0, 0, 255, 0.75);

  animation: glitch 500ms infinite;
}

.glitch span {
  position: absolute;
  top: 0;
  left: 0;
}

.glitch span:first-child {
  animation: glitch 650ms infinite;
  clip-path: polygon(0 0, 100% 0, 100% 45%, 0 45%);
  transform: translate(-0.025em, -0.0125em);
  /* color: green; */
  opacity: 0.8;
}

.glitch span:last-child {
  animation: glitch 375ms infinite;
  clip-path: polygon(0 80%, 100% 20%, 100% 100%, 0 100%);
  transform: translate(0.0125em, 0.025em);
  /* color: red; */
  opacity: 0.8;
}

/* https://web.dev/prefers-reduced-motion/#(bonus)-forcing-reduced-motion-on-all-websites */

@keyframes glitch {
  0% {
    text-shadow: 0.05em 0 0 rgba(255, 0, 0, 0.75),
      -0.05em -0.025em 0 rgba(0, 255, 0, 0.75),
      -0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
  }
  14% {
    text-shadow: 0.05em 0 0 rgba(255, 0, 0, 0.75),
      -0.05em -0.025em 0 rgba(0, 255, 0, 0.75),
      -0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
  }
  15% {
    text-shadow: -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
      0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
      -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
  }
  49% {
    text-shadow: -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
      0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
      -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
  }
  50% {
    text-shadow: 0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
      0.05em 0 0 rgba(0, 255, 0, 0.75), 0 -0.05em 0 rgba(0, 0, 255, 0.75);
  }
  99% {
    text-shadow: 0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
      0.05em 0 0 rgba(0, 255, 0, 0.75), 0 -0.05em 0 rgba(0, 0, 255, 0.75);
  }
  100% {
    text-shadow: -0.025em 0 0 rgba(255, 0, 0, 0.75),
      -0.025em -0.025em 0 rgba(0, 255, 0, 0.75),
      -0.025em -0.05em 0 rgba(0, 0, 255, 0.75);
  }
}

@media (prefers-reduced-motion: reduce) {
  *,
  ::before,
  ::after {
    animation-delay: -1ms !important;
    animation-duration: 1ms !important;
    animation-iteration-count: 1 !important;
    background-attachment: initial !important;
    scroll-behavior: auto !important;
    transition-duration: 0s !important;
    transition-delay: 0s !important;
  }
}


.blink {
  animation: blink 1s step-end 2.6s 2;
}

@keyframes blink {
  50% {
    opacity: 0;
  }
  70% {
    opacity: 100;
  }
  80% {
    opacity: 0;
  }
  90% {
    opacity: 100;
  }
  95% {
    opacity: 0;
  }
}
</style>
