import Vue from "vue"

// Make sure to pick a unique name for the flag
// so it won't conflict with any other mixin.


const appMixin = {
  data(){
    return {
      // isLoading: {},
    }
  },
  created(){
    // console.log("create app mixin");
  },
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
