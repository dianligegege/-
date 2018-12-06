<template>
  <div>
    <x-header style="background-color='#3b5998'">首页</x-header>
    <!-- 图书展示 -->
    <div class="hotbook">
      <div class="hotbook-title">最热图书</div>
      <div class="hotbook-book">
        <BookCard v-for="item in books" :books='item' :key='item.b_id' />
      </div>
    </div>

  </div>
</template>

<script>
import { Group, Cell } from "vux";
import BookCard from "./BookCard.vue";

export default {
  components: {
    Group,
    Cell,
    BookCard
  },
  data() {
    return {
      msg: "Hello World!",
      books:""
    };
  },
  created: function() {
    let _this = this;
    _this.http
      .get(_this.server + "")
      .then(function(res) {
        // console.log(res.data);
        _this.books = res.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }
};
</script>

<style>
.vux-demo {
  text-align: center;
}
.logo {
  width: 100px;
  height: 100px;
}
.hotbook {
  padding: 20px 10px;
}
.hotbook-title {
  border-bottom: 1px solid rgba(0, 0, 0, 0.5);
  padding-bottom: 12px;
  font-size: 24px;
  font-weight: 600;
}
.hotbook-book {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 30px 0;
}
</style>
