import Vue from 'vue'
import eventBus from './EventBus.vue'
import Bb8 from './Bb8.vue'

new Vue({
  el: '#app',

  components: {
    Bb8
  },

  methods: {
    submit: function (event) {
      eventBus.$emit('bb8-form-submitted');
    }
  }
})
