<template>
  <div class="user_register">
    <h2 class="page_title">ユーザー登録</h2>
    <div class="user_register_form">
      <div class="form-group">
        <label for="name">
          名前
        </label>
        <input id="name" type="text" class="form-control" v-model="user.name">
      </div>

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

      <div class="form-group">
        <label for="password_confirmation">
          パスワード（確認）
        </label>
        <input id="password_confirmation" type="password" class="form-control" v-model="user.password_confirmation">
      </div>
      <div class="create_btn">
        <button class="btn btn-primary" @click="userRegister()">
          登録
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  name: "UserRegister",
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      }
    }
  },

  methods: {
    ...mapMutations('flash', [ 'setMessage' ]),

    userRegister() {
      this.$axios.post('/users', { user: this.user })
        .then(res => {
          this.$router.push({ name: 'UserLogin' })
          this.setMessage({ message: 'ユーザー登録しました', timeout: 3000 })
        }).catch(err => {
          this.setMessage({ message: 'ユーザー登録できませんでした', timeout: 3000 })
        })
    }
  }
}
</script>

<style scope>
  .user_register {
    margin: 0 40px;
    margin-bottom: 20px;
  }

  .page_title {
    margin: 30px 0;
  }
</style>
