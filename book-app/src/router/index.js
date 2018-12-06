import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home';
import Book from '@/components/Book';
import OneBook from '@/components/OneBook';
import LogSign from '@/components/LogSign'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/book',
      name: 'Book',
      component: Book
    },
    {
      path: '/onebook',
      name: 'OneBook',
      component: OneBook
    },
    {
      path:'/logsign',
      name:'LogSign',
      component:LogSign
    }
  ]
})
