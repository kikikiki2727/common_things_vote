<template>
  <div class="joke_create">
    <h2 class="page_title">
      あるあるネタ投稿
    </h2>
    <div class="joke_create_form">
      <validation-observer v-slot="{ handleSubmit } ">
        <div class="form-group">
          <validation-provider
            v-slot="{ errors }"
            rules="required"
            name="投稿"
          >
            <label for="sentence">
              投稿
            </label>
            <textarea
              id="sentence"
              v-model="joke.sentence"
              class="form-control"
              rows="10"
            />
            <p class="text-danger">
              {{ errors[0] }}
            </p>
          </validation-provider>
        </div>
        <v-btn
          @click="handleSubmit(handleCreateJoke())"
        >
          投稿
        </v-btn>
      </validation-observer>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: "JokeCreate",
  data() {
    return {
      joke: {
        sentence: '',
      }
    }
  },

  computed: {
    ...mapGetters('users', [ 'authUser' ])
  },

  methods: {
    ...mapActions('jokes', [ 'createJoke' ]),
    ...mapMutations('flash', [ 'setMessage' ]),

    async handleCreateJoke() {
      try {
        await this.createJoke(this.joke);
        this.$router.push({ name: 'JokeIndex' });
        this.setMessage({ message: 'あるあるネタを投稿しました', timeout: 3000 })
      } catch(error) {
        console.log(error);
        this.setMessage({ message: 'あるあるネタを投稿できませんでした', timeout: 3000 });
      }
    }
  },
}
</script>

<style scope>
  .joke_create {
    margin: 0 40px;
    margin-bottom: 20px;
  }

  .page_title {
    margin: 30px 0;
  }
</style>
