<template>
  <div class="not_found">
    <div class="error_contents">
      <p>お探しのページが見つかりませんでした。</p>
      <p>一時的にアクセスができない状況にあるか、</p>
      <p>移動もしくは削除された可能性があります。</p>
      <p>URlにお間違えがないか再度ご確認ください。</p>
    </div>
    <div class="error_btn">
      <router-link
        :to="{ name: 'JokeIndex' }"
        class="return_btn"
      >
        <v-btn>
          トップページに戻る
        </v-btn>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NotFound',
}
</script>

<style scoped>
  .not_found {
    text-align: center;
  }
  .return_btn {
    text-decoration: none;
  }
</style>
