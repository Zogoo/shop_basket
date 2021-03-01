<template>
  <div id="app">
    <v-app>
      <router-view></router-view>
    </v-app>
  </div>
</template>

<script>

export default {
  name: 'App',
  data: () => ({
    //
  }),
};
</script>

<style>
  .flashMessages {
    text-align: center;
  }
  .flashMessages button {
    margin: 10px;
    font-size: 20px;
  }
</style>