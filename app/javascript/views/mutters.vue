<template>
  <div>
    <div class="columns">
      <div class="column">
        <b-field label="message" v-bind:type="fieldclass">
          <b-input placeholder="input for message" v-model="message" size="is-large"></b-input>
          <b-input placeholder="input for name" v-model="name" size="is-large"></b-input>
        </b-field>
        <p v-if="!!errors['message']" class="error" style="color: red;">{{ errors['message'][0]}}</p><br>
        <p v-if="!!errors['name']" class="error" style="color: red;">{{ errors['name'][0]}}</p>
        <b-button type="is-info" v-on:click="clickButton1"
                size="is-medium" icon-left="message-processing-outline">つぶやく！</b-button>
        </div>
      <div class="column">
        <b-button type="is-primary" v-on:click="clickButton2"
                  size="is-medium" icon-left="reload">再表示</b-button>
        <b-notification  @click.native="deleteButton(item)" aria-close-label="CloseNotification" v-for="(item, key) in lists" :key="key">
          {{ item.message }} / {{ item.name }} ({{ item.created_at }})
        </b-notification>
      </div>
    </div>
    <router-link to="/helloworlds" class="link">helloworlds</router-link>
  </div>
</template>

<script>
import axios from "axios";
import { csrfToken } from '@rails/ujs';
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('[name=csrf-token]').content

export default {
  data() {
    return {
      inputtext: "",
      fieldclass: "is-info",
      message: "",
      name: "",
      classname: "yellow",
      lists: "",
      errors: '',
    }
  },
  mounted() {
    axios.get('/mutters.json')
    .then(response => {
      this.lists = response.data;
    });
  },
  methods: {
    clickButton1(event) {
      let config = {};
      let submitParams = new FormData();
      submitParams.append("mutter[message]", this.message || '');
      submitParams.append("mutter[name]", this.name || '');
      axios.post('/mutters.json', submitParams, config)
      .then(response => {
        this.lists = response.data;
        this.$buefy.notification.open({
          message: `${this.message}/${this.name}をつぶやきました。`,
          type: 'is-success'
        });
      })
      .catch(error => {
        if (error.response.status == 422){
          this.errors = error.response.data
        }
      });
      this.message = '';
      this.name = '';
      this.errors = '';
    },
    clickButton2(event) {
    axios.get('/mutters.json')
    .then(response => {
      this.lists = response.data;
    });
    },
    deleteButton(item) {
      console.log(item)
      const params = {
        id: item.id,
        type: "delete",
      }
      axios.delete(`/mutters/${item.id}.json`, {data: params})
      this.$buefy.notification.open({
        message: `${item.message}/${item.name}を削除しました。`,
        type: 'is-danger'
      })
    },
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.link {
  cursor: pointer;
}
</style>