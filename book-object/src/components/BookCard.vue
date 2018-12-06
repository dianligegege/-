<template>
    <a class="bookcard" @click="routerto()">
        <img class="bookcard-img" :src="this.server+databooks.b_img" :alt="databooks.b_name">
        <div class="bookcard-name">{{books.b_name}}</div>
        <div class="bookcard-writer">{{ books.b_writer }} [著]</div>
        <div class="bookcard-transer">{{ books.b_transer }} [译]</div>
    </a>
    
</template>

<script>
export default {
  name: "BookCard",
  props: ["books"],
  data() {
    return {
      databooks:{
          b_img:'uploads/test/1.jpg'
      },
      hrefto:"onebook?b_id="+this.books.b_id
    };
  },
  methods:{
    routerto(){
      let _this=this;
      // router发送参数
      _this.$router.push({
        name:'OneBook',
        query:{
          b_id:_this.books.b_id
        }
      })
    }
  },
  created: function() {
    let _this = this;
    _this.databooks = _this.books;
  }
};
</script>

<style>
.bookcard {
  width: 170px;
  height: 270px;
  cursor: pointer;
  display: inline-block;
  text-align: center;
  padding-bottom: 20px;
}
.bookcard-img {
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
  max-width: 100%;
  max-height: 160px;
}
.bookcard-name {
  text-align: left;
  color: #23527c;
  white-space: normal;
  overflow: hidden;
  padding: 4px 0;
}
.bookcard-name:hover {
  color: #e71;
}
.bookcard-writer,
.bookcard-transer {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  color: #767676;
  font-size: 14px;
  padding: 2px 0;
}
</style>
