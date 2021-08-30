<template>
  <div class="user_register">
    <h2 class="page_title">ユーザー登録</h2>
    <div class="user_register_form">
      <validation-observer v-slot="{ handleSubmit }">
        <div class="form-group">
          <validation-provider v-slot="{ errors }" name="名前" rules="required">
            <label for="name">
              名前
            </label>
            <input id="name" type="text" class="form-control" v-model="user.name">
            <p class="text-danger">
              {{ errors[0] }}
            </p>
          </validation-provider>
        </div>

        <div class="form-group">
          <validation-provider v-slot="{ errors }" name="メールアドレス" rules="required|email">
            <label for="email">
              メールアドレス
            </label>
            <input id="email" type="email" class="form-control" v-model="user.email">
            <p class="text-danger">
              {{ errors[0] }}
            </p>
          </validation-provider>
        </div>

        <div class="form-group">
          <validation-provider v-slot="{ errors }" name="パスワード" rules="required|min:4" vid="password">
            <label for="password">
              パスワード
            </label>
            <input id="password" type="password" class="form-control" v-model="user.password">
            <p class="text-danger">
              {{ errors[0] }}
            </p>
          </validation-provider>
        </div>

        <div class="form-group">
          <validation-provider v-slot="{ errors }" name="パスワード（確認）" rules="required|min:4|confirmed:password">
            <label for="password_confirmation">
              パスワード（確認）
            </label>
            <input id="password_confirmation" type="password" class="form-control" v-model="user.password_confirmation">
            <p class="text-danger">
              {{ errors[0] }}
            </p>
          </validation-provider>
        </div>

        <div class="create_btn">
          <button class="btn btn-primary" @click="handleSubmit(userRegister())">
            登録
          </button>
        </div>
      </validation-observer>
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
          if(err.response.data.email[0] === "has already been taken") {
            this.setMessage({ message: 'そのメールアドレスはすでに登録されています', timeout: 6000 })
          }
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
