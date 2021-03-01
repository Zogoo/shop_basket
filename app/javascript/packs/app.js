/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import App from '../App.vue'
import router from "../common/routes";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import Vuex from "vuex";

document.addEventListener('DOMContentLoaded', () => {
  Vue.use(Vuex);
  Vue.use(Vuetify);
  const vuetify = new Vuetify();

  Vue.config.productionTip = process.env.NODE_ENV == "production";

  // router.beforeEach(Vue.prototype.$auth.authRedirectGuard());
  // TODO: move this part to different package
  Vue.prototype.$auth = {
    accessTokenField: "access-token",
    setAccessToken(token) {
      localStorage.setItem(this.accessTokenField, token);
    },
    clearAccessToken() {
      localStorage.setItem(this.accessTokenField, null);
    },
    getAccessToken() {
      let storedToken = localStorage.getItem(this.accessTokenField);

      if (storedToken != null) {
        this.parseJwt(storedToken);
        return storedToken;
      } else {
        return null;
      }
    },
    checkAuthenticated() {
      try {
        this.parseJwt(localStorage.getItem(this.accessTokenField));
        return true;
      } catch (error) {
        return false;
      }
    },
    parseJwt(token) {
      let base64Url = token.split(".")[1];
      let base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
      let jsonPayload = decodeURIComponent(
        atob(base64)
          .split("")
          .map(function(c) {
            return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
          })
          .join("")
      );

      return JSON.parse(jsonPayload);
    },
  };

  router.beforeEach((to, from, next) => {
    // redirect to signin page if not logged in and trying to access a restricted page
    const authRequired = to.matched.some((record) => record.meta.authRequired);
    const loggedIn = Vue.prototype.$auth.checkAuthenticated();

    if (authRequired && !loggedIn) {
      return next("/users/sign_in");
    }

    next();
  });

  const app = new Vue({
    router,
    vuetify,
    render: (h) => h(App),
  }).$mount();
  document.body.appendChild(app.$el);

  console.log(app);
})

