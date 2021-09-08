<template>
  <v-footer class="footer">
    <router-link
      :to="{ name: 'TermsOfService' }"
      class="terms_btn"
    >
      利用規約
    </router-link>
  </v-footer>
</template>

<script>
export default {
  name: "TheFooter"
}
</script>

<style lang="scss" scoped>
  .footer {
    padding: 20px 0;
  }
  .terms_btn {
    color: black;

    &:hover {
      color: gray;
    }
  }
</style>
