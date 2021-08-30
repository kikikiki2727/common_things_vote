<template>
  <div>
    <TheHeader />
    <TheFlash />
    <router-view />
    <TheFooter />
  </div>
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
