<template>
  <header>
    <span>{{ message }}</span>
    <router-link to="/login">login</router-link>
    <router-link to="/mutters">mutters</router-link>
  </header>
</template>

<script>
  export default {
    data() {
      return {
        message: "Header",
      };
    },
  };
</script>
