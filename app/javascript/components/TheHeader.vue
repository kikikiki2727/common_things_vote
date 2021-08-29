<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
      <router-link :to="{ name: 'JokeIndex' }" class="navbar-brand">あるあるネタ投票</router-link>
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link :to="{ name: 'JokeCreate' }" class="nav-link">投稿</router-link>
        </li>
        <li class="nav-item">
          <router-link :to="{ name: 'UserRegister' }" class="nav-link">ユーザー登録</router-link>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ログイン</a>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script>
export default {
  name: "TheHeader"
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