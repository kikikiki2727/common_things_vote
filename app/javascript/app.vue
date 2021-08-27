<template>
  <div>
    <TheHeader></TheHeader>
    <div>
      <p>{{ message }}</p>
    </div>
    <TheFooter></TheFooter>
  </div>
</template>

<script>
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'
export default {
  components: { 
    TheFooter, 
    TheHeader 
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
