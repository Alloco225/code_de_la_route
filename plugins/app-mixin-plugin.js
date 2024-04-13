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
    },
    playMedia(elementId) {
      const element = document.getElementById(elementId);
      element?.play();
    },
    resetMedia(elementId) {
      const element = document.getElementById(elementId);
      element?.pause();
      element.currentTime = 0;
      // element?.load();

    },
    setState(key, val = false) {
      this.$store.dispatch('ui/setState', { key, val })
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
