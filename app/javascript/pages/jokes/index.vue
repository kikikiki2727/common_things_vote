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
          <P class="vote_number">5件</P>
        </div>
      </li>
    </div>
  </div>
</template>

<script>
export default {
  name: 'JokeIndex',
  data: function () {
    return {
      jokes: [
        {
          id: 1,
          sentence: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは',
        },
        {
          id: 2,
          sentence: 'こんばんは',
        }
      ]
    }
  }
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
