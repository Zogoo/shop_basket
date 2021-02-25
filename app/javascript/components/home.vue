<template>
  <div id="app">
    <div> Categories </div>
    <div v-for="category in categories" :key="category.id">
      {{ category.name }}
    </div>
    <div> Products </div>
    <div v-for="product in products" :key="product.id">
      <p>{{ product.name }}</p>
      <p>{{ product.price }}</p>
      <p>{{ product.dimension }}</p>
      <p>{{ product.stock }}</p>
    </div>
    Search: <input v-model="keyword"/>
    <button v-on:click="search()">Search</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      products: [],
      categories: [],
      basket: {},
      keyword: '',
    }
  },
  mounted (){
    axios.get('/home/all').then((response) => {
      this.products   = response.data.products;
      this.categories = response.data.categories;
      this.basket     = response.data.basket;
    })
  },
  methods: {
    search: function() {
      axios.post('/home/search', { keyword: this.keyword }).then((response) => {
        this.products = response.data.products;
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
input, button {
  font-size: 14pt;
  font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}
</style>
