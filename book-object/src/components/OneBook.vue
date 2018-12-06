<template>
    <div class="onebook-box">
        <Header/>
        <div class="content-box">
            <div class="onebook-content">
                <div class="content-top">
                    <div class="content-top-left">
                        <img :src="this.server+severdata.b_img">
                        <el-row>
                            <el-button class="ctl-btn" @click="changescore" type="primary">{{severdata.b_score}}&nbsp;{{score}}</el-button>
                            <el-button class="ctl-btn" @click="collection" type="primary" icon="el-icon-star-off" >{{col}}</el-button>
                        </el-row>
                    </div>
                    <div class="content-top-right">
                        <p class="p1">非读不可系列丛书</p>
                        <p class="p2">{{severdata.b_name}}</p>
                        <p class="p3">
                            {{severdata.b_writer}} 
                            <span>(作者)</span>
                            &nbsp;&nbsp;     
                             {{severdata.b_transer}} 
                            <span>(译者)</span>
                        </p>
                        <div class="p4">
                            <span>{{severdata.b_class}}</span>
                            <span class="p4-class" v-for="item in b_tag" :key="item">{{item}}</span>
                        </div>
                        <div class="p5" :style="{height:height}">{{severdata.b_info}}</div>
                        <el-button class="p6" type="primary" :icon="elicon" @click="changeheight">{{heightchange}}</el-button>
                    </div>
                    <div class="clear"></div>
                    
                </div>
                <div class="content-middle">
                    <p class="onebook-title">本书特色</p>
                    <div>{{severdata.b_point}}</div>
                </div>
                <div class="content-bottom">
                    <Talk :user="user" :b_id='b_id' :talks='talks'/>
                </div>
            </div>
        </div>
        <Footer/>

    </div>
</template>

<script>
import Header from "./Header.vue";
import Footer from "./Footer.vue";
import Talk from "./Talk.vue";

export default {
  name: "OneBook",
  components: {
    Header,
    Footer,
    Talk
  },
  data() {
    return {
      severdata: "123",
      b_id: "",
      b_tag: "",
      height: "106px",
      heightchange: "全部展开",
      elicon: "el-icon-arrow-down",
      user:{
          u_name:'',
          u_id:''
      },
      talks:'',
      col:'收藏',
      colstatus:0,
      score:'推荐',
      scorestatus:0
    };
  },
  methods: {
    changeheight: function() {
      let _this = this;
      if (_this.height == "106px") {
        _this.height = "auto";
        _this.heightchange = "全部收起";
        _this.elicon = "el-icon-arrow-up";
      } else {
        _this.height = "106px";
        _this.heightchange = "全部展开";
        _this.elicon = "el-icon-arrow-down";
      }
    },
    // 收藏
    collection:function(){
      let _this=this;
        _this.http
        .get(_this.server+'col',{
          params:{
            b_id:_this.b_id,
            c_status:_this.colstatus
          }
        })
        .then(function(res){
          _this.col=res.data.col,
          _this.colstatus=res.data.c_status
        })
        .catch(function(error){
          console.log(error)
        })
    },
    // 推荐
    changescore:function(){
      console.log(123)
      let _this=this;
        _this.http
        .get(_this.server+'score',{
          params:{
            b_id:_this.b_id,
            s_status:_this.scorestatus
          }
        })
        .then(function(res){
          _this.score=res.data.score,
          _this.scorestatus=res.data.s_status;
          let s = _this.severdata.b_score;
          let r = res.data.s_status;
          s=r>0 ? s++ : s--;
        })
        .catch(function(error){
          console.log(error)
        })
    }
  },

  computed: {
    tag: {
      get: function() {
        return this.b_tag;
      },
      set: function(val) {
        this.b_tag = val.split("&");
      }
    }
  },
  created: function() {
    //  route接受参数
    this.b_id = this.$route.query.b_id;
    let _this = this;
    _this.http
      .get(_this.server + "onebook?b_id=" + _this.b_id)
      .then(function(res) {
        //   console.log(res)
        _this.severdata = res.data.books[0];
        _this.tag = res.data.books[0].b_tag;
        _this.user.u_id=res.data.aid;
        _this.user.u_name=res.data.username;
        _this.talks=res.data.talks;
        _this.col=res.data.collection.col;
        _this.colstatus=res.data.collection.colstatus;

        // console.log(res.data)
      })
      .catch(function(error) {
        console.log(error);
      });
  }
};
</script>

<style >
.content-box {
  margin-top: 80px;
}
.onebook-content {
  margin: 0 auto;
  padding: 20px;
  width: 1000px;
  /* background-color: #cccccc; */
}
.content-top-left {
  width: 240px;
  text-align: center;
  float: left;
}
.content-top-left img {
  width: 100%;
  margin-bottom: 14px;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}
.ctl-btn {
  padding: 12px 16px !important;
}
.content-top-right {
  float: left;
  padding: 0 80px;
}
.p2 {
  font-size: 24px;
  font-weight: 600;
  padding: 10px 0 5px;
}
.p3 {
  color: #9c9c9c;
  padding: 5px 0;
}
.p4 {
  padding: 10px 0;
  padding-bottom: 0px;
  width: 550px;
}
.p4 span:first-child {
  display: inline-block;
  padding: 4px 8px;
  background-color: #5bc0de;
  border-radius: 10%;
  color: white;
}
.p4-class {
  font-size: 14px;
  line-height: 22px;
  margin: 0 10px;
  display: inline-block;
  padding: 2px 8px;
  padding-right: 16px;
  border-bottom-right-radius: 14px;
  border-top-right-radius: 14px;
  background-color: #e0eaf1;
  color: #3e6d8e;
  box-shadow: 2px 2px 5px #3e6d8e;
  margin-bottom: 10px;
}
.p5 {
  width: 500px;
  color: #767676;
  margin: 12px 0;
  font-size: 14px;
  font-weight: 400;
  overflow: hidden;
  line-height: 22px;
}
.p6 {
  padding: 8px 14px;
}
.content-middle {
  padding-top: 40px;
  padding-left: 20px;
  width: 700px;
}
.onebook-title {
  font-size: 22px;
  font-weight: 600;
  border-bottom: 1px solid black;
  padding: 20px 0;
  width: 790px;
}
.content-middle > div {
  padding: 10px 0;
  font: 400 14px/1.8 Helvetica, Arial, "PingFang SC", "Microsoft Yahei",
    "微软雅黑", "Hiragino Sans GB", "Microsoft Sans Serif",
    "WenQuanYi Micro Hei", "sans-serif";
}
.content-bottom {
    padding: 20px 20px;
    width: 700px;
}
</style>


