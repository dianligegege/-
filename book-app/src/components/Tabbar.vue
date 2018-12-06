<template>
  <div>
    <tabbar class="tabbar">
      <tabbar-item link="/">
        <img slot="icon" src="../assets/home.png" >
        <span slot="label">首页</span>
      </tabbar-item>
      <tabbar-item  link="/book">
        <img slot="icon" src="../assets/book.png">
        <span slot="label">图书</span>
      </tabbar-item>
      <tabbar-item  link="/logsign" >
        <img slot="icon" src="../assets/self.png">
        <span slot="label">个人</span>
      </tabbar-item>
    </tabbar>
  </div>
</template>

<script>
import { Tabbar, TabbarItem, Group, Cell } from 'vux'

export default {
  components: {
    Tabbar,
    TabbarItem,
    Group,
    Cell
  }
}
</script>

<style>
.tabbar {
    position: fixed !important;
}
</style>
