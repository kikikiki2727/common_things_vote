<template>
  <v-app>
    <TheHeader />
    <div class="brank" />
    <TheFlash />
    <router-view />
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
}
</script>

<style scoped>
  .brank {
    margin-top: 100px;
  }
</style>
