<template>
  <div class="user_login">
    <h2 class="page_title">ログイン</h2>
    <div class="user_login_form">
      <div class="form-group">
        <label for="email">
          メールアドレス
        </label>
        <input id="email" type="email" class="form-control" v-model="user.email">
      </div>

      <div class="form-group">
        <label for="password">
          パスワード
        </label>
        <input id="password" type="password" class="form-control" v-model="user.password">
      </div>

      <div class="create_btn">
        <button class="btn btn-primary">
          ログイン
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UserLogin',
  data() {
    return {
      user: {
        email: '',
        password: '',
      }
    }
  }
}
</script>

<style scope>
  .user_login {
    margin: 0 40px;
    margin-bottom: 20px;
  }

  .page_title {
    margin: 30px 0;
  }
</style>
