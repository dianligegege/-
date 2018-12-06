<template>
    <div>
        <p class="onebook-title">写出你的评论</p>
        <el-input class="talk-textarea" type="textarea" :autosize="{ minRows: 4, maxRows: 6}" placeholder="在这里写评论" v-model="textarea3">
        </el-input>
        <el-button type="primary" @click="talkup">提交评论</el-button>

        <p class="onebook-title">历史评论</p>
        <div class="talk-talks">
            <div class="talk-card" v-for="item in talks" :key="item.t_id">
                <p>
                    {{item.u_name}}&nbsp;&nbsp;
                    {{item.t_time.split('.')[0].replace('T','&nbsp;&nbsp;')}}
                </p>
                <p>
                    {{item.t_text}}
                </p>
            </div>
        </div>

    </div>
</template>

<script>
import Qs from "qs";

export default {
  name: "Talk",
  props: ["user", "b_id", "talks"],
  data() {
    return {
      textarea3: "",
    //   datatalks: ""
    };
  },
//   created: function() {
//     console.log(this.talks);
//     this.datatalks = this.talks;
//   },
  methods: {
    talkup: function() {
      let _this = this;
      _this.http
        .post(
          _this.server + "talkup",
          Qs.stringify({
            talktext: _this.textarea3,
            user: _this.user,
            b_id: _this.b_id
          })
        )
        .then(function(res) {
          _this.talks = res.data.talks;
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
.talk-textarea {
  margin: 20px 0;
}
.talk-talks {
  padding: 5px;
  margin: 16px 0;
}
.talk-card {
  padding: 10px 5px;
  /* border-bottom: 0.5px solid #272626 */
}
.talk-card p {
  padding: 10px 0;
}
.talk-card p:nth-child(2) {
  background-color: #d8d3d3;
  padding-left: 10px;
  border-radius: 5px;
}
</style>


