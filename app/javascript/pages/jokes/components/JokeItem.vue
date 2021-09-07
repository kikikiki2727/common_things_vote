<template>
  <div class="joke_item">
    <div class="joke_sentence">
      {{ joke.sentence }}
    </div>
    <div class="vote_contents">
      <p class="vote_number">
        {{ votes.length }}票
      </p>
      <v-btn
        color="success"
        @click="handleCreateVote"
      >
        投票
      </v-btn>
      <template v-if="isAuthUserJoke(joke)">
        <v-btn
          color="error"
          class="delete_btn"
          @click="handleDeleteConfirm"
        >
          削除
        </v-btn>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  name: 'JokeItem',
  props: {
    joke: {
      type: Object,
      required: true,
    },
    authUser: {
      type: Object,
      required: true,
    },
    votes: {
      type: Array,
      required: true,
    }
  },

  methods: {
    isAuthUserJoke(joke) {
      if (this.authUser){
        return joke.user_id === this.authUser.id
      } else return false
    },
    handleDeleteConfirm() {
      this.$emit('deleteConfirm', this.joke)
    },
    handleCreateVote() {
      this.$emit('handleCreateVote', this.joke)
    },
  }
}
</script>

<style scope>
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
      margin-top: 15px;
    }
  </style>

  <style scope>
    .delete_btn {
      margin-left: 5px;
    }
  </style>
