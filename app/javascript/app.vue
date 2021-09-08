<template>
  <v-app>
    <TheHeader />
    <div class="brank" />
    <TheFlash />
    <router-view />
    <transition name="return_button">
      <div
        v-show="returnTopActive"
        class="return_top_button btn btn-secondary"
        @click="returnTop()"
      >
        <font-awesome-icon icon="chevron-circle-up" />
      </div>
    </transition>
    <div class="brank" />
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'
import TheFlash from './components/TheFlash.vue'

export default {
  components: { 
    TheFooter, 
    TheHeader,
    TheFlash,
  },
  data() {
    return {
      returnTopActive: false,
      scroll: 0,
    }
  },

  mounted() {
    window.addEventListener('scroll', this.scrollWindow)
  },

  methods: {
    returnTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    },

    scrollWindow() {

      this.scroll = window.scrollY
      if ( 100 <= this.scroll ) {
        this.returnTopActive = true
      } else {
        this.returnTopActive = false
      }
    },
  }
}
</script>

<style scoped>
  .brank {
    margin-top: 100px;
  }

  .return_top_button {
    position: fixed;
    right: 15px;
    bottom: 65px;
  }

  .return_button-enter-active, .return_button-leave-active {
    transition: opacity .5s;
  }

  .return_button-enter, .return_button-leave-to {
    opacity: 0;
  }
</style>
