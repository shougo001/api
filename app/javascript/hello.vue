<template>
  <div class="container">
    <section class="login">
      <div class="hero">
        <h1 class="title">ログイン画面</h1>
      </div>
      <div class="form">
        <b-field label="Login ID"
                 :type="{ 'is-danger': hasError }"
                 :message="{ '認証が間違っています': hasError }">
          <b-input value="" maxlength="30"></b-input>
        </b-field>

        <b-field label="Password"
                 :type="{ 'is-danger': hasError }"
                 :message="[
                { 'Password is too short': hasError },
                { 'Password must have at least 8 characters': hasError }
            ]">
          <b-input value="" type="password" maxlength="30" password-reveal></b-input>
        </b-field>
        <button class="button">ログイン</button>
      </div>
    </section>
    <nuxt />
  </div>
</template>

<script>
    export default {
      data() {
        return {
          hasError: false
        }
      }
    };
</script>