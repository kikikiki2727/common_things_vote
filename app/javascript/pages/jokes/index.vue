<template>
  <div>
    <div class="introduction">
      <p>日常生活で起きたあるあるネタをどんどん共有しましょう〜</p>
      <p>自分が面白いと思ったあるあるネタに投票しまくりましょう！</p>
    </div>
    <div class="joke_list">
      <li v-for="joke in jokes" :key="joke.id" class="joke_item">
        <div class="joke_sentence">
          {{ joke.sentence }}
        </div>
        <div class="vote_contents">
          <div class="btn btn-primary">
            投票
          </div>
          <p class="vote_number">5件</p>
          <div class="btn btn-danger" @click="deleteConfirm(joke)">
            削除
          </div>
        </div>
      </li>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'JokeIndex',
  data: function () {
    return {
    }
  },
  computed: {
    ...mapGetters('jokes', [ 'jokes' ]),
  },

  created() {
    this.fetchJokes();
  },

  methods: {
    ...mapActions('jokes', [ 'fetchJokes', 'deleteJoke' ]),

    async handleDeleteJoke(joke) {
      try {
        await this.deleteJoke(joke)
      } catch(error) {
        console.log(error)
      }
    },

    deleteConfirm(joke) {
      const boolean = confirm('削除してもよろしいですか？');
      if(boolean) this.handleDeleteJoke(joke);
    }
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

  .joke_sentence {
    margin-bottom: 20px;
    white-space: pre-line; /* 改行や空白を表示 */
  }

  .vote_contents {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .vote_number {
    margin: auto 5px;
  }
</style>
