<template>
  <div
    v-if="message"
    class="message"
  >
    {{ message }}
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'TheFlash',
  computed: {
    ...mapGetters('flash', [ 'message' ]),
  },
}
</script>

<style scope>
  .message {
    text-align: center;
    width: 60%;
    margin: 0 auto;
    padding: 20px;
    background-color: aquamarine;
    border-radius: 20px;
  }
</style>
