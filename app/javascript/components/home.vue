<template>
  <div id="app" class="align-center">
    <v-sheet
      class="pa-12"
      color="grey lighten-3"
    >
      <div class="product-list">
        <div class="head-text sans_font line-spacer">Product list</div>
        <div class="search-bar line-spacer">
          <v-text-field
            v-model="keyword"
            label="What are you working on?"
            solo
            @keydown.enter="search()"
          />
        </div>
        <div class="icon-list">
          <v-card-text>
            <v-chip-group
              v-model="selection"
              active-class="green ligther-10 white--text"
              column
            >
              <v-chip
              text-color="white"
              class="ma-2 icon-spacer"
              v-for="category in categories" 
              :key="category.name"
              v-on:click="search_by_category(category.name)"
              >
                <v-icon left large >mdi-{{category.icon_name.toLowerCase()}}</v-icon>
                {{ category.name }}
              </v-chip>
            </v-chip-group>
          </v-card-text>
        </div>
        <div class="product-width list list-spacer">
          <div v-for="product in products" :key="product.id" class="list-item">
          <div class="internal-spacer">
              <v-card
                :loading="loading"
                class="mx-auto"
                max-width="374"
              >
                <template slot="progress">
                  <v-progress-linear
                    color="deep-purple"
                    height="10"
                    indeterminate
                  ></v-progress-linear>
                </template>
                <v-img
                  height="250"
                  class="product-img"
                  :src="product.product_image[0].image.url"
                  :lazy-src="product.product_image[0].image.url"
                  @click="show_detail = !show_detail"
                >
                  <template v-slot:placeholder>
                    <v-row
                      class="fill-height ma-0"
                      align="center"
                      justify="center"
                    >
                      <v-progress-circular
                        indeterminate
                        color="grey lighten-5"
                      ></v-progress-circular>
                    </v-row>
                  </template>
                </v-img>
                <v-card-title>{{ product.name }}</v-card-title>
                <v-card-text>
                  <v-row
                    align="center"
                    class="mx-0"
                  >
                    <v-rating
                      :value="4.5"
                      color="amber"
                      dense
                      half-increments
                      readonly
                      size="14"
                    ></v-rating>
                    <div class="grey--text ml-4">
                      4.5 (413)
                    </div>
                  </v-row>
                  <div class="my-4 subtitle-1">
                    $ • {{product.price}}
                  </div>
                  <div class="description">{{product.description}}</div>
                </v-card-text>
            
                <v-divider class="mx-4"></v-divider>
                <v-card-title>Other information</v-card-title>
                <v-card-text>
                  <div>Too: {{product.stock}}</div>
                  <div>Hemjee: {{product.dimensions}} gr</div>
                  <div>Hurgelt torol: {{product.delivery_type}}</div>
                  <div>Hurgelt: {{product.delivery_period}} odor</div>
                </v-card-text>
            
                <v-card-actions>
                  <v-btn
                    text
                    @click="add_into_basket(product)"
                  >
                    <v-icon large color="blue-grey lighen-5">mdi-basket-plus</v-icon>
                  </v-btn>
                  <v-btn
                    text
                    @click="remove_from_basket(product)"
                  >
                    <v-icon large color="blue-grey lighen-5">mdi-basket-remove</v-icon>
                  </v-btn>
                </v-card-actions>
              </v-card>
            </div>
          </div>
        </div>
      </div>
    </v-sheet>
    <div class="float-in-right-corner">
      <router-link to="/basket">
        <div class="shopping-cart"></div>
      </router-link>
      <div class="cart-text">
        COUNT: {{ basket_count }}
      </div>
      <div class="cart-text">
        TOTAL: {{ basket_total }}
      </div>
    </div>
    <v-overlay
      :z-index="0"
      :value="show_detail"
    >
      <v-btn
        color="success"
        class="mt-12"
        @click="show_detail = false"
      >
        BACK TO LIST
      </v-btn>
    </v-overlay>
  </div>
</template>

<script>
import axios from '../common/axios.js';
import BasketManager from '../common/BasketManager.js';
import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'

export default {
  data: function () {
    return {
      loading: false,
      selection: '',
      show_detail: false,
      basket_sum: 0,
      products: [],
      categories: [],
      basket: [],
      keyword: '',
    }
  },
  mounted (){
    axios.get('/api/v1/products/all').then((response) => {
      this.products   = response.data.products;
      this.categories = response.data.categories;
      this.basket     = BasketManager.read() || response.data.basket;
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
      axios.post('/api/v1/products/search', { keyword: this.keyword }).then((response) => {
        this.products = response.data.products;
      })
    },
    search_by_category: function(category_name) {
      axios.post('/api/v1/products/search', { category: category_name }).then((response) => {
        this.products = response.data.products;
      })
    },
    add_into_basket: function(product) {
      this.basket.push(product);
      BasketManager.add(this.basket);
    },
    remove_from_basket: function(product) {
      let basket_obj = this.basket.find((p) => p.id == product.id);
      let basket_index = this.basket.indexOf(basket_obj);
      this.basket.splice(basket_index, 1);
      BasketManager.add(this.basket);
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
.product-img {
  cursor: pointer;
  margin: 5px;
}
.description {
  height: 100px;
  padding: 10px;
  overflow: hidden;
  text-overflow: ellipsis;
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
  cursor: pointer;
}
/* Category list */
.icon-list {
  display: inline-flex;
}
.icon-list .icon-spacer {
  padding-right: 100px;
}
.category-icons {
  cursor: pointer;
  zoom: 0.2;
}
/* Shopping basket */
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
