<template>
  <v-footer class="footer">
    <div class="footer_btn">
      <router-link
        :to="{ name: 'TermsOfService' }"
        class="terms_link"
      >
        利用規約
      </router-link>
      <router-link
        :to="{ name: 'PrivacyPolicy' }"
        class="policy_link"
      >
        プライバシーポリシー
      </router-link>
    </div>
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
  .footer_btn {
    margin: 0 auto;
  }

  .terms_link {
    color: black;

    &:hover {
      color: gray;
    }
  }

  .policy_link {
    color: black;

    &:hover {
      color: gray;
    }
  }
</style>
