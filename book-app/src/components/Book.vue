<template>
  <div>
    <x-header style="background-color='#3b5998'">图书页</x-header>
    <search   v-model="value" position="absolute" auto-scroll-to-top top="46px"  @on-submit="onSubmit" ref="search"></search>
    <div class="bookclass-box">
      <divider>图书分类</divider>
      <checker v-model="demo.demo1" default-item-class="demo1-item" selected-item-class="demo1-item-selected">
        <checker-item v-for="item in bookclass" :key="item" :value="item">{{item}}</checker-item>
      </checker>
      <divider>分类查看</divider>
      <button-tab v-model="demo.demo2">
        <button-tab-item>最新</button-tab-item>
        <button-tab-item>最热</button-tab-item>
        <button-tab-item>推荐</button-tab-item>
      </button-tab>
    </div>
    <div class="book-book">
      <BookCard v-for="item in books" :books='item' :key='item.b_id' />
    </div>
  </div>
</template>

<script>
import BookCard from "./BookCard.vue";

export default {
  components: {
    BookCard
  },
  name: "Book",
  data() {
    return {
      //分类  分类查看  搜索内容
      demo: {
        demo1: "%",
        demo2: 0,
        demo3: "%"
      },
      books: "",
      bookclass: [
        "计算机",
        "科普",
        "设计",
        "经营",
        "心理学",
        "电工电子",
        "高等数学",
        "文艺",
        "体育"
      ],
      // results:'',
      value: ''
    };
  },
  methods: {
    onSubmit() {
      this.demo.demo3=this.value
    },
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
  },
  watch: {
    demo: {
      handler(val, oldval) {
        let bookclass = "";
        if (val.demo2 == 0) {
          bookclass = "news";
        } else if (val.demo2 == 1) {
          bookclass = "hot";
        } else {
          bookclass = "good";
        }
        let _this = this;
        _this.http
          .get(_this.server + "books", {
            params: {
              // datasort会根据点击不同的导航来改变
              sort: bookclass,
              class: val.demo1,
              b_name: val.demo3
            }
          })
          .then(function(res) {
            // console.log(res);
            _this.books = res.data;
          })
          .catch(function(error) {
            console.log(error);
          });
      },
      deep: true
    }
  }
};
</script>

<style>
.bookclass-box {
  text-align: center;
}
.demo1-item {
  border: 1px solid #ececec;
  padding: 5px 5px;
  border-radius: 5%;
  margin: 5px 5px;
}
.demo1-item-selected {
  border: 1px solid green;
}
.demo2-item {
  border: 1px solid #ececec;
  padding: 3px 20px;
  border-radius: 5%;
  margin: 0 5px;
}
.demo2-item-selected {
  border: 1px solid green;
}

.book-book {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding-bottom: 50px;
  margin-top: 10px;
}
</style>


