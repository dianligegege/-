import Vue from 'vue'
import FastClick from 'fastclick'
import router from './router/'
import App from './App'
import Axios from 'axios'
import { Drawer,XButton,Search,XHeader,Tabbar, TabbarItem,Flexbox, FlexboxItem, Divider,Checker, CheckerItem, ButtonTab, ButtonTabItem,Group, Cell } from 'vux'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.component('drawer', Drawer);
Vue.component('x-header', XHeader);
Vue.component('tabbar', Tabbar);
Vue.component('tabbar-item', TabbarItem);
Vue.component('flexbox', Flexbox)
Vue.component('flexbox-item', FlexboxItem)
Vue.component('checker', Checker)
Vue.component('checker-item', CheckerItem)
Vue.component('divider', Divider)
Vue.component('group', Group)
Vue.component('cell', Cell)
Vue.component('button-tab', ButtonTab)
Vue.component('button-tab-item', ButtonTabItem)
Vue.component('search', Search)
Vue.component('x-button', XButton)



Vue.use(ElementUI);
Vue.prototype.http = Axios;
Vue.prototype.http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.prototype.server = 'http://zhangli:81/';


FastClick.attach(document.body)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  router,
  render: h => h(App)
}).$mount('#app-box')
