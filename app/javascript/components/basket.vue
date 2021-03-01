<template>
  <div id="app">
  </div>
</template>
<script>
import axios from 'axios';
import BasketManager from '../common/BasketManager';

export default {
  data: function() {
    return {
      basket: []
    }
  },
  mounted(){
    axios.get('/home/all').then((response) => {
      this.basket     = BasketManager.read() || response.data.basket;
    })
  }
}
</script>

<style scoped>
</style>