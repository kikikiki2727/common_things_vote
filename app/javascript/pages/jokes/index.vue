<template>
  <div>
    <div class="introduction">
      <p>日常生活で起きたあるあるネタをどんどん共有しましょう〜</p>
      <p>自分が面白いと思ったあるあるネタに投票しまくりましょう！</p>
    </div>
    <div class="sort_btn">
      <v-btn
        class="btn"
        @click="handleVoteSortJokes()"
      >
        投票数順
      </v-btn>
      <v-btn
        class="btn"
        @click="handleDescSortJokes()"
      >
        新しい順
      </v-btn>
      <v-btn
        class="btn"
        @click="handleAscSortJokes()"
      >
        古い順
      </v-btn>
    </div>
    <div class="joke_list">
      <template
        v-for="joke in jokes"
        class="joke_item"
      >
        <JokeItem 
          :key="joke.id" 
          :joke="joke" 
          :auth-user="authUser" 
          :votes="filterVote(joke)"
          :user="matchUser(joke)"
          @deleteConfirm="deleteConfirm(joke)"
          @handleCreateVote="handleCreateVote(joke)"
        />
      </template>
    </div>
  </div>
</template>

<script>
import JokeItem from './components/JokeItem'
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: 'JokeIndex',
  components: {
    JokeItem,
  },

  computed: {
    ...mapGetters('jokes', [ 'jokes' ]),
    ...mapGetters('users', [ 'authUser', 'users' ]),
    ...mapGetters('votes', [ 'votes' ]),

    filterVote() {
      return function(joke) {
        return this.votes.filter(vote => {
          return vote.joke_id === joke.id
        })
      }
    },

    matchUser() {
      return function(joke) {
        return this.users.find(user => {
          return user.id === joke.user_id
        })
      }
    },
  },

  created() {
    this.fetchJokes(),
    this.fetchVotes(),
    this.fetchUsers(),
    this.scrollTop()
  },

  methods: {
    ...mapMutations('flash', [ 'setMessage' ]),
    ...mapMutations('jokes', [ 'ascSortJokes', 'descSortJokes' ]),
    ...mapActions('jokes', [ 'fetchJokes', 'deleteJoke', 'updateVoteSortJokes' ]),
    ...mapActions('votes', [ 'fetchVotes', 'createVote' ]),
    ...mapActions('users', [ 'fetchUsers' ]),

    async handleDeleteJoke(joke) {
      try {
        await this.deleteJoke(joke)
        this.setMessage({ message: 'あるあるネタを削除しました', timeout: 3000 })
      } catch(error) {
        console.log(error)
        this.setMessage({ message: 'あるあるネタを削除できませんでした', timeout: 5000 });
      }
    },

    deleteConfirm(joke) {
      const boolean = confirm('削除してもよろしいですか？');
      if(boolean) this.handleDeleteJoke(joke);
    },

    async handleCreateVote(joke) {
      try {
        await this.createVote(joke)
      } catch(error) {
        console.log(error)
      }
    },

    handleAscSortJokes() {
      this.ascSortJokes()
    },

    handleDescSortJokes() {
      this.descSortJokes()
    },

    handleVoteSortJokes() {
      this.updateVoteSortJokes()
    },

    scrollTop() {
      window.scrollTo({
        top: 0
      })
    }
  },
}
</script>

<style scoped>
  .introduction {
    text-align: center;
    margin: 40px 0;
  }

  .sort_btn {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 40px;
  }

  .btn {
    margin-left: 6px;
  }

  .joke_list {
    width: 70%;
    margin: 0 auto;
  }

  .joke_item {
    padding: 20px;
    box-shadow: 0 0 8px gray;
    margin: 0 20px;
    margin-bottom: 40px;
    list-style: none;
  }

  @media screen and (max-width: 480px) {
    .introduction {
      text-align: center;
      margin: 40px 20px;
    }

    .joke_list {
      width: 90%;
      margin: 0 auto;
    }
  }
</style>
