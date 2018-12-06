<template>
    <div class="bookclass-box">
        <el-tabs v-model="datasort" @tab-click="handleClick">
            <el-tab-pane label="最新" name="news">
                <div class="bookclass-book">
                    <BookCard v-for="item in books" :books='item' :key='item.b_id'/>
                </div>
            </el-tab-pane>
            <el-tab-pane label="热门" name="hot">
                <div class="bookclass-book">
                    <BookCard v-for="item in books" :books='item' :key='item.b_id'/>
                </div>
            </el-tab-pane>
            <el-tab-pane label="推荐" name="good">
                <div class="bookclass-book">
                    <BookCard v-for="item in books" :books='item' :key='item.b_id'/>
                </div>
            </el-tab-pane>
        </el-tabs>
    </div>    
    
</template>
<script>
import BookCard from "./BookCard.vue";

export default {
  name: "BookClass",
  props:["sendclass","sendname"],
  components: {
    BookCard
  },
  data() {
    return {
      books: "",
      datasort: "news",
    };
  },
  created: function() {
    let _this = this;
    _this.http
      .get(_this.server + "books",{
        params:{
          sort:"news",
          class:_this.sendclass,
          name:_this.sendname
        }
      })
      .then(function(res) {
        _this.books = res.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {

    // 点击热门最新推荐
    handleClick(tab, event) {
      let _this = this;
      _this.datasort=tab.name;
      _this.http
        .get(_this.server + "books",{
          params:{
            sort:tab.name,
            class:_this.sendclass,
            b_name:_this.sendname
          }
        })
        .then(function(res) {
          _this.books = res.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  },
  watch:{
    // 点击分类通过监听函数来发起请求
    sendclass:function(val){
      let _this = this;
      _this.http
        .get(_this.server + "books",{
          params:{
            // datasort会根据点击不同的导航来改变
            sort:_this.datasort,
            class:val,
            b_name:_this.sendname
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
    sendname:function(val){
      let _this = this;
      _this.http
        .get(_this.server + "books",{
          params:{
            // datasort会根据点击不同的导航来改变
            sort:_this.datasort,
            class:_this.sendclass,
            b_name:val
          }
        })
        .then(function(res) {
          // console.log(res);
          _this.books = res.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style>
.bookclass-box {
  width: 842px;
  padding: 10px 25px;
  float: left;
}
.bookclass-book {
  width: 842px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 20px 0;
}
</style>
