<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
      <a class="navbar-brand" href="#">あるあるネタ投票</a>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">投票</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ユーザー登録</a>
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