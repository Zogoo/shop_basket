<template>
  <div id="app" class="align-center">
    <div class="product-list">
      <div class="head-text sans_font line-spacer">Product list</div>
      <div class="search-bar line-spacer">
        <input v-on:keyup.enter="search()" v-model="keyword"/>
        <button v-on:click="search()"><i class="fa fa-search" aria-hidden="true"></i>Search</button>
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
            <div class="description grid-line">
              <div class="sans_font first-row">{{ product.name }}</div>
              <div class="sans_font second-row">$ {{ product.price }}</div>
              <div class="basket-icon merged-row" v-on:click="add_into_basket(product)"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="float-in-right-corner">
      <div class="shopping-cart"></div>
      <div class="cart-text">
        COUNT: {{ basket_count }}
      </div>
      <div class="cart-text">
        TOTAL: {{ basket_total }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'

export default {
  data: function () {
    return {
      basket_sum: 0,
      products: [],
      categories: [],
      basket: [],
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
  computed: {
    basket_total: function() {
      return this.basket.reduce((sum, {price}) => sum + price, 0);
    },
    basket_count: function() {
      return this.basket.length;
    }
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
    },
    add_into_basket: function(product) {
      this.basket.push(product);
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
.head-text {
  font-size: 1cm;
}
.line-spacer {
  padding-bottom: 30px;
}
/* General UI size */
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
/* Search bar */
.search-bar input{
  font-size: 1.2em;
  width: 40vw;
  border-radius: 5px;
  border-width: 1px;
}
.search-bar i {
  color:blue;
}
.search-bar button {
  border-radius: 5px;
  border-width: 1px;
  box-shadow: #555555;
  height: 2em;
  background-color: rgb(175, 205, 245);
}
/* Product list */
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
/* Production description */
.grid-line {
  display: grid;
  grid-template-rows: 30px 30px;
  grid-template-columns: 140px 1fr;
}
.grid-line .first-row {
  grid-row: 1/2;
  grid-column: 1/2;
}
.grid-line .second-row {
  padding-top: 5px;
  grid-row: 2/2;
  grid-column: 1/2;
}
.grid-line .merged-row {
  grid-row: 1/2;
  grid-column: 2/2;
}
.basket-icon {
  background: url('/assets/shop-icons-white.png') no-repeat -616px -316px;
	width: 251px;
	height: 250px;
  zoom: 0.2;
}
/* Category list */
.icon-list {
  display: inline-flex;
}
.icon-list .icon {
  padding-right: 100px;
}
.category-icons {
  cursor: pointer;
  zoom: 0.2;
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
/* Shopping basket */
.shopping-cart {
  background: url('/assets/shop-icons-white.png') no-repeat -2703px -16px;
	width: 251px;
	height: 250px;
  zoom: 0.45;
  cursor: pointer;
}
.float-in-right-corner {
  position: fixed;
  top: 80vh;
  left: 90vw;
}
.cart-text {
  vertical-align: text-bottom;
  font-size: 1em;
  font-weight: 100;
}
</style>
