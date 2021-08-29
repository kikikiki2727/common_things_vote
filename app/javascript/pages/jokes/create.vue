<template>
  <div class="joke_create">
    <h2 class="page_title">あるあるネタ投稿</h2>
    <div class="joke_create_form">
      <div class="form-group">
        <label for="sentence">
          あるあるネタ
        </label>
        <textarea id="sentence" class="form-control" rows="10" v-model="joke.sentence"></textarea>
      </div>
      <div class="create_btn">
        <button class="btn btn-primary">
          投稿
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "JokeCreate",
  data() {
    return {
      joke: {
        sentence: '',
      }
    }
  },
}
</script>

<style scope>
  .joke_create {
    margin: 0 40px;
  }

  .page_title {
    margin: 30px 0;
  }
</style>
