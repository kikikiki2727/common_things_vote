<template>
  <div>
    <div class="introduction">
      <p>日常生活で起きたあるあるネタをどんどん共有しましょう〜</p>
      <p>自分が面白いと思ったあるあるネタに投票しまくりましょう！</p>
    </div>
    <div class="joke_list">
      <template v-for="joke in jokes" class="joke_item">
        <JokeItem 
          :joke="joke" 
          :authUser="authUser" 
          :votes="filterVote(joke)" 
          :key="joke.id" 
          @deleteConfirm="deleteConfirm(joke)"
          @handleCreateVote="handleCreateVote(joke)" />
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
    ...mapGetters('users', [ 'authUser' ]),
    ...mapGetters('votes', [ 'votes' ]),

    filterVote() {
      return function(value) {
        return this.votes.filter(vote => {
          return vote.joke_id === value.id
        })
      }
    },
  },

  created() {
    this.fetchJokes();
    this.fetchVotes();
  },

  methods: {
    ...mapMutations('flash', [ 'setMessage' ]),
    ...mapActions('jokes', [ 'fetchJokes', 'deleteJoke' ]),
    ...mapActions('votes', [ 'fetchVotes', 'createVote' ]),

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
  },
}
</script>

<style scoped>
  .introduction {
    text-align: center;
    margin: 40px 0;
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
</style>
