<template>
  <div>
    <div class="container">
      <section class="login">
        <div class="hero">
          <h1 class="title">ログイン画面</h1>
        </div>
        <div class="form">
          <b-field label="Email"
                  :type="{ 'is-danger': hasError }"
                  :message="{ '認証が間違っています': hasError }">
            <b-input v-model="email" maxlength="30"></b-input>
          </b-field>

          <b-field label="Password"
                  :type="{ 'is-danger': hasError }"
                  :message="[
                  { 'Password is too short': hasError },
                  { 'Password must have at least 8 characters': hasError }
              ]">
            <b-input v-model="password" type="password" maxlength="30" password-reveal></b-input>
          </b-field>
          <button @click="Login" class="button">ログイン</button>
        </div>
      </section>
    </div>
    <router-link to="/mutters">mutters</router-link>
  </div>
</template>

<script>
import axios from "axios";
import router from '../routers/route'
import { csrfToken } from '@rails/ujs';
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('[name=csrf-token]').content
export default {
  data() {
    return {
      hasError: false,
      errors: '',
      email: '',
      password: ''
    }
  },
  methods: {
    Login() {
      let config = {};
      let submitParams = new FormData();
      submitParams.append("login[email]", this.email || '');
      submitParams.append("login[password]", this.password || '');
      axios.post('/login', submitParams, config)
      .then(res => {
        console.log('success')
        router.push('/mutters')
      })
      .catch(error => {
        console.log('error')
        this.hasError = true
      });
      this.email = "";
      this.password = "";
    }
  }
}
</script>