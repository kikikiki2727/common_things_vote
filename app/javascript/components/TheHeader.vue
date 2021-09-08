<template>
  <header>
    <div>
      <v-app-bar app>
        <v-toolbar-title>
          <router-link
            :to="{ name: 'JokeIndex' }"
            class="title"
          >
            あるあるネタ投票
          </router-link>
        </v-toolbar-title>
        <v-spacer />
        <template v-if="windowWidth >= 600">
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

            <li class="nav-item">
              <a
                class="nav-link" 
                href="https://twitter.com/share?url=https://aruaruneta.work&hashtags=あるあるネタ"
                title="Twitter" 
                target="_blank" 
                rel="noopener noreferrer"
              >
                <v-icon>mdi-twitter</v-icon>
              </a>
            </li>
          </ul>
        </template>

        <template v-else>
          <v-app-bar-nav-icon @click="dropdown = true" />
        </template>
      </v-app-bar>

      <v-navigation-drawer
        v-model="dropdown"
        fixed
        temporary
        right
      >
        <v-list
          nav
          dense
        >
          <v-list-item-group>
            <router-link
              :to="{ name: 'JokeCreate' }"
              class="nav-link"
            >
              <v-list-item>
                <v-list-item-title>
                  <v-icon>mdi-file-document-edit</v-icon>
                  投稿
                </v-list-item-title>
              </v-list-item>
            </router-link>
            

            <template v-if="!authUser">
              <router-link
                :to="{ name: 'UserRegister' }"
                class="nav-link"
              >
                <v-list-item>
                  <v-list-item-title>
                    <v-icon>mdi-account-plus</v-icon>
                    ユーザー登録
                  </v-list-item-title>
                </v-list-item>
              </router-link>

              <router-link
                :to="{ name: 'UserLogin' }"
                class="nav-link"
              >
                <v-list-item>
                  <v-list-item-title>
                    <v-icon>mdi-login</v-icon>
                    ログイン
                  </v-list-item-title>
                </v-list-item>
              </router-link>
            </template>

            <template v-else>
              <router-link
                to="#"
                class="nav-link"
                @click.native="logout()"
              >
                <v-list-item>
                  <v-list-item-title>
                    <v-icon>mdi-logout</v-icon>
                    ログアウト
                  </v-list-item-title>
                </v-list-item>
              </router-link>
            </template>

            <a
              class="nav-link" 
              href="https://twitter.com/share?url=https://aruaruneta.work&hashtags=あるあるネタ"
              title="Twitter" 
              target="_blank"
              rel="noopener noreferrer"
            >
              <v-list-item>
                <v-list-item-title>
                  <v-icon>mdi-twitter</v-icon>
                  Twitterで共有
                </v-list-item-title>
              </v-list-item>
            </a>

            <a
              class="nav-link"
              @click="dropdown = false"
            >
              <v-list-item>
                <v-list-item-title>
                  閉じる
                </v-list-item-title>
              </v-list-item>
            </a>
          </v-list-item-group>
        </v-list>
      </v-navigation-drawer>
    </div>
  </header>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: "TheHeader",
  data() {
    return {
      dropdown: false,
      windowWidth: window.innerWidth,
    }
  },

  computed: {
    ...mapGetters('users', [ 'authUser' ])
  },

  mounted() {
    window.addEventListener('resize', this.resizeWidth)
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
    },

    resizeWidth() {
      this.windowWidth = window.innerWidth
    }
  }
}
</script>

<style lang="scss" scoped>
  .title {
    color: black;
    text-decoration: none;

    &:hover {
      color: gray;
    }
  }

  .navbar {
    background-color: rgba(192,192,192,0.3);
  }

  .navbar-nav {
    flex-direction: row;
  }

  .nav-item {
    padding-left: 10px;
  }

  .nav-link {
    color: black;

    &:hover {
      color: gray;
    }
  }
</style>
