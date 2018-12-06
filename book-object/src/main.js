// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import Axios from 'axios'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.config.productionTip = false;
Vue.use(ElementUI);
Vue.prototype.http = Axios;
Vue.prototype.http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.prototype.server = 'http://zhangli:81/';
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  render:h =>h(App),
  components: { App },
  template: '<App/>'
})
