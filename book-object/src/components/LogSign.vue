<template>
    <div class="logsign-box">
        <Header />
        <div class="logsign">
            <el-tabs type="border-card" v-model="activename" @tab-click="handleClick">
                <!-- 登录 -->
                <el-tab-pane label="登录" name="login">
                    <el-form ref="form" :model="form" label-width="80px">
                        <el-form-item label="用户名">
                            <el-input v-model="form2.name"></el-input>
                        </el-form-item>

                        <el-form-item label="密码">
                            <el-input v-model="form2.password"></el-input>
                        </el-form-item>

                        <el-form-item>
                            <el-button type="primary" @click="login">立即登录</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>
                <!-- 注册 -->
                <el-tab-pane label="注册" name="signup">
                    <el-form ref="form" :model="form" label-width="80px">
                        <el-form-item label="用户名">
                            <el-input v-model="form.name"></el-input>
                        </el-form-item>
                        <el-form-item label="手机号">
                            <el-input v-model="form.tel"></el-input>
                        </el-form-item>
                        <el-form-item label="密码">
                            <el-input v-model="form.password"></el-input>
                        </el-form-item>
                        <el-form-item label="性别">
                            <el-radio-group v-model="form.sex">
                                <el-radio label="男"></el-radio>
                                <el-radio label="女"></el-radio>
                            </el-radio-group>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="signup">立即注册</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>

            </el-tabs>
        </div>
    </div>
</template>

<script>
import Header from "./Header.vue";
import Qs from "qs";

export default {
  name: "LogSign",
  components: {
    Header
  },
  data() {
    return {
      activename: "login",
      form: {
        name: "",
        tel: "",
        password: "",
        sex: ""
      },
      form2: {
        name: "",
        password: ""
      }
    };
  },
  methods: {
    handleClick(tab, event) {},
    // 注册
    signup() {
      if (
        this.form.name == "" ||
        this.form.tel == "" ||
        this.password == "" ||
        this.form.sex == ""
      ) {
        alert("请确认全部填完！");
      } else {
        let _this = this;
        _this.http
          .post(
            _this.server + "logsign/signup",
            Qs.stringify({
              name: _this.form.name,
              tel: _this.form.tel,
              password: _this.form.password,
              sex: _this.form.sex
            })
          )
          .then(function(res) {
            if (res.data.r == "ok") {
              _this.activename = "login";
            } else if (res.data.r == "error") {
              alert("账户名或密码错误！请重试！");
            }
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    },
    //登录
    login() {
      if (this.form2.name == "" || this.form2.password == "") {
        alert("请确认全部填完！");
      } else {
        let _this = this;
        _this.http
          .post(
            _this.server + "logsign/login",
            Qs.stringify({
              name: _this.form2.name,
              password: _this.form2.password
            })
          )
          .then(function(res) {
            console.log(res);
            if (res.data.r == "ok") {
                console.log(res)
                window.sessionStorage["username"] = res.data.username;
              _this.$router.push({
                name: "Index",
                // query: { name: _this.form2.name }
              });
            } else if (res.data.r == "u_not") {
              alert("账户名不存在！请注册");
            } else if (res.data.r == "p_err") {
              alert("密码错误");
            }
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    }
  },
  created: function() {
    this.activename = this.$route.query.activename;
    console.log(this.$route.query.activename);
  },
  watch: {
    $route(to, from) {
      this.activename = to.query.activename;
      console.log(to.query.activename);
    }
  }
};
</script>

<style>
.logsign {
  margin: 100px auto;
  width: 800px;
  border: 1px solid black;
}
</style>


