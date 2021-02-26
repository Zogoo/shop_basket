<template>
  <div id="app" class="align-center">
  <div class="product-list">
    <h2 class="sans_font">Product list</h2>
    <div class="">
      Search: <input v-model="keyword"/>
      <button v-on:click="search()">Search</button>
    </div>
    <div class="icon-list">
      <div class="icon" v-for="category in categories" :key="category.id" v-on:click="search_by_category(category.name)">
        <div :class="'category-icons icon-' + [category.name.toLowerCase()]"/>
        <span>{{ category.name }}</span>
      </div>
    </div>
    <div class="product-width list list-spacer">
      <div v-for="product in products" :key="product.id" class="list-item">
        <div class="internal-spacer">
          <img v-bind:src="product.product_image[0].image.url"
            alt="" class="product-width" data-image-width="1900"
            data-image-height="2532">
          <h5 class="sans_font">{{ product.name }}</h5>
          <h3 class="sans_font">$ {{ product.price }}</h3>
        </div>
      </div>
    </div>
  </div>
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
    },
    search_by_category: function(category_name) {
      axios.post('/home/search', { category: category_name }).then((response) => {
        this.products = response.data.products;
      })
    }
  }
}
</script>

<style scoped>
.sans_font {
  font-family: 'Source Sans Pro', sans-serif !important;
}
.align-center {
  text-align: center;
}
.product-list {
  position: relative;
  width: 1140px;
  margin: 0 auto;
}
@media (min-width: 1200px) {
  .product-list {
    width: 1140px;
  }
}
@media (min-width: 992px) and (max-width: 1199px) {
  .product-list {
    width: 940px;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .product-list {
    width: 720px;
  }
}
@media (min-width: 576px) and (max-width: 767px) {
  .product-list {
    width: 540px;
  }
}
@media (max-width: 575px) {
  .product-list {
    width: 340px;
  }
}
.product-list .product-list {
  width: 100%;
}

.product-width {
  width: 100% !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}
@media (min-width: 1200px) {
  .product-width-xl {
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
@media (min-width: 992px) and (max-width: 1199px) {
  .product-width-lg {
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .product-width-md {
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
@media (min-width: 576px) and (max-width: 767px) {
  .product-width-sm {
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
@media (max-width: 575px) {
  .product-width-xs {
    width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
/* List creator */
.list {
  display: grid;
  grid-template-columns: repeat(3, 33.33333333%);
}
.list-item {
  display: flex;
  position: relative;
}
.u-tabs:not([class*="u-align-"]),
.list-item:not([class*="u-align-"]),
.u-container-style:not([class*="u-align-"]) {
  text-align: left;
}
/* Spacer */
.list-spacer {
  min-height: 375px;
  grid-template-columns: repeat(4, calc(25% - 8px));
  height: auto;
  grid-gap: 10px;
  margin: 30px auto 60px 0;
}
/* Internal space */
.internal-spacer {
  padding: 10px;
}

/* Icons */
.icon-list .icon {
  float: left;
}
.category-icons {
  cursor: pointer;
  zoom:0.5;
}
.icon-cosmetics {
  background: url('/assets/shop-icons-white.png') no-repeat;
  background-position: -2107px -616px;
  width: 251px;
	height: 250px;
}
.icon-baby {
	background: url('/assets/shop-icons-white.png') no-repeat -616px -616px;
	width: 251px;
	height: 250px;
}
.icon-food {
	background: url('/assets/shop-icons-white.png') no-repeat -914px -1516px;
	width: 251px;
	height: 251px;
}
.icon-drink {
	background: url('/assets/shop-icons-white.png') no-repeat -1808px -916px;
	width: 251px;
	height: 250px;
}
.icon-accessories {
	background: url('/assets/shop-icons-white.png') no-repeat -2703px -616px;
	width: 251px;
	height: 250px;
}
</style>
