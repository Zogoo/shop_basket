import Vue from "vue";
import VueRouter from "vue-router";

import Home from "../components/Home";
import Basket from "../components/Basket";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Home },
    { path: "/home", component: Home },
    { path: "/basket", component: Basket },
  ],
});
