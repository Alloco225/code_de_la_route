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
    pause(elementId) {
      console.log("pause", elementId)
      // this.$refs[action].pause();
      const element = document.getElementById(elementId);
      element?.pause();
    },
    play(elementId) {
      const element = document.getElementById(elementId);
      element?.play();
    },
    reset(elementId) {
      const element = document.getElementById(elementId);
      element?.pause();
      element.currentTime = 0;
      // element?.load();

    },
    setState(key, val = false) {
      this.$store.dispatch('ui/setState', { key, val })
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
