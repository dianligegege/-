<template>
  <div class="book">
    <Header/>
    <div class="content-box">
      <div class="content">
         <NavList/>
        <BookClass :sendclass="allclass" :sendname="b_name"/>
        <AllClass @getclass="saveclass"/><!--父组件接受子组件的值-->
        <div class="clear"></div>
      </div>
       
    </div>
    <Footer/>
  </div>
</template>

<script>
import Header from "./Header.vue";
import Footer from "./Footer.vue";
import NavList from "./NavList.vue";
import BookClass from "./BookClass.vue";
import AllClass from "./AllClass.vue";

export default {
  name: "Book",
  components: {
    Header,
    Footer,
    NavList,
    BookClass,
    AllClass
  },
  data() {
    return {
      serverdata: "123",
      allclass:"%",
      b_name:"%"
    };
  },
  methods:{
    // 接受子组件穿过来的值  测试分支
    saveclass(data) {
      this.allclass=data
      // console.log(data)
    }
  },
  created: function() {
    let _this = this;
    //接受分类导航路由过来的值
    _this.allclass=_this.$route.query.navclass;
    _this.b_name=_this.$route.query.b_name;
    // console.log(_this.$route.query.b_name);
    _this.http
      .get(_this.server + "")
      .then(function(res) {
        // console.log(res.data);
        _this.serverdata = res.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  //因为组件复用，路由无法跳转，所以用watch监听路由变化
  watch: {
    '$route' (to, from) {
      this.allclass=to.query.navclass ? to.query.navclass:'%';
      this.b_name=to.query.b_name ?to.query.b_name:'%';
    }
  }
};
</script>

<style >
.clear {
  clear: both;
}
.content-box {
  margin-top: 80px;
  padding: 10px 150px;
}
.content {
  width: 1218px;
  margin: 0 auto;
}
</style>
