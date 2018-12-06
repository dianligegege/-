<template>
  <div class="header-box">
    <div class="header">
      <router-link to='/' class="logo">
        <span>非读BOOK</span>
      </router-link>
      <router-link :to="{name:'Book',query:{navclass:'%'}}" class="title">
        图书
      </router-link>
      <router-link to='/' class="title">
        文章
      </router-link>

      <div class="demo-input-suffix search">
        <el-input placeholder="非 读 不 可" clearable v-model="search">
        </el-input>
      </div>
      <el-button @click="gosearch" type="primary" icon="el-icon-search">搜索</el-button>

      <div class="header-right">
        <div v-if="name==null">
          <router-link to='/logsign?activename=signup'>
            <el-button type="primary" plain>注册</el-button>
          </router-link>
          <router-link to='/logsign?activename=login'>
            <el-button type="primary" plain>登录</el-button>
          </router-link>
        </div>
        <div v-else class="welcome">
          欢迎回来 {{name}}
        </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      search: "",
      name:''
    };
  },
  methods: {
    gosearch: function() {
      let _this = this;
      // console.log(_this.search)
      _this.$router.push({ name: "Book", query: { b_name: _this.search } });
    }
  },
  created: function() {
    //获取session的用户名，确认登录
    this.name=window.sessionStorage.getItem("username");
  }
};
</script>

<style scoped>
.header-box {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 999;
  height: 60px;
  background: #3b5998;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.25);
  border-bottom: 0.5px solid #344e86;
}
.header {
  padding: 0 150px;
  color: rgb(17, 17, 17);
  font-size: 14px;
  margin: 0 auto;
  height: 60px;
  line-height: 60px;
}
.header a {
  color: white;
}
.logo {
  font-size: 20px;
  font-weight: 600;
  display: inline-block;
  background-image: url(../assets/logo.jpg);
  height: 60px;
  background-size: 50px 50px;
  background-repeat: no-repeat;
  margin-right: 30px;
}
.logo > span {
  margin-left: 70px;
}
.title {
  display: inline-block;
  height: 100%;
  padding: 0 20px;
  font-size: 20px;
  font-weight: 500;
  margin-right: 10px;
}
.title:hover {
  background-color: #344e86;
}
.search {
  display: inline-block;
}
.header-right {
  float: right;
}
.header-right a {
  margin: 0 20px;
}
.welcome {
   font-size: 20px;
  font-weight: 500;
  color: white;
}
</style>

