<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
      <router-link
        :to="{ name: 'JokeIndex' }"
        class="navbar-brand"
      >
        あるあるネタ投票
      </router-link>
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link
            :to="{ name: 'JokeCreate' }"
            class="nav-link"
          >
            投稿
          </router-link>
        </li>

        <template v-if="!authUser">
          <li class="nav-item">
            <router-link
              :to="{ name: 'UserRegister' }"
              class="nav-link"
            >
              ユーザー登録
            </router-link>
          </li>
          <li class="nav-item">
            <router-link
              :to="{ name: 'UserLogin' }"
              class="nav-link"
            >
              ログイン
            </router-link>
          </li>
        </template>

        <template v-else>
          <li class="nav-item">
            <router-link
              to="#"
              class="nav-link"
              @click.native="logout()"
            >
              ログアウト
            </router-link>
          </li>
        </template>
      </ul>
    </nav>
  </header>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: "TheHeader",
  computed: {
    ...mapGetters('users', [ 'authUser' ])
  },

  methods: {
    ...mapActions('users', [ 'logoutUser' ]),
    ...mapMutations('flash', [ 'setMessage' ]),

    async logout() {
      try {
        await this.logoutUser()
        this.$router.push({ name: 'JokeIndex' })
        this.setMessage({ message: 'ログアウトしました', timeout: 3000 })
      } catch(error) {
        console.log(error);
        this.setMessage({ message: 'ログアウトできませんでした', timeout: 3000 });
      }
    }
  }
}
</script>

<style scoped>
  .navbar {
    background-color: rgba(192,192,192,0.3);
  }
  .navbar-nav {
    flex-direction: row;
  }
  .nav-item {
    padding-left: 5px;
  }
</style>