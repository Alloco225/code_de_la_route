import Vue from "vue"


const appMixin = {
  computed:{

    isLoading() {
      return (key) => this.$store.getters['ui/isLoading'](key);
    },

    isState() {
      return (key, val) => this.$store.getters['ui/uiStates'](key) == val;
    },

    state() {
      return (key) => this.$store.getters['ui/uiStates'](key);
    },

  },

  methods: {
    clearState(key) {
      this.$store.dispatch('ui/clearState', { key })
    },
    pauseAllMedia(){
      // pause all playing media
    },
    pauseMedia(elementId) {
      console.log("pauseMedia", elementId)
      // this.$refs[action].pause();
      const element = document.getElementById(elementId);
      element?.pause();
      return element;
    },
    playMedia(elementId) {
      const element = document.getElementById(elementId);
      element?.play();
      return element;
    },
    resetMedia(elementId) {
      const element = document.getElementById(elementId);
      element?.pause();
      element.currentTime = 0;
      // element?.load();
      return element;

    },
    setState(key, val = false) {
      this.$store.dispatch('ui/setState', { key, val })
    },

    shuffleArray(array) {
      let currentIndex = array.length;

      // While there remain elements to shuffle...
      while (currentIndex != 0) {
        // Pick a remaining element...
        let randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex--;

        // And swap it with the current element.
        [array[currentIndex], array[randomIndex]] = [
          array[randomIndex],
          array[currentIndex],
        ];
      }
    },
    sleep(timeInMiliseconds){
      return new Promise((resolve, reject) => setTimeout(resolve, timeInMiliseconds))
    },
    toggleLoading(key, val = false) {
      this.$store.dispatch('ui/toggleLoading', { key, val })
      // const data = { ...this.isLoading }
      // data[key] = val;
      // this.isLoading = data;
    },
  }
}


if (!Vue.__appMixin__) {
  Vue.__appMixin__ = true
  Vue.mixin(appMixin)
}
