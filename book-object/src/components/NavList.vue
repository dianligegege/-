<template>
            <ul class="content-class">
                <li  v-for="item in bookclass" :key="item">
                    <div @click="navclick(item)" class="contclass-a" >{{item}}</div>
                </li>
                <div class="clear"></div>
            </ul>   
</template>

<script>
export default {
  name: "NavList",
  data() {
    return {
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
      ]
    };
  },
  methods: {
    navclick: function(item) {
      //路由传值
      this.$router.push({ name: 'Book', query:{ navclass: item}});

    }
  }
};
</script>

<style>
.clear {
  clear: both;
}
.content-class {
  list-style-type: none;
}
.content-class > li {
  float: left;
  padding: 0 15px;
  padding-left: 23px;
  position: relative;
  margin: 5px 0;
}
.contclass-a {
  display: inline-block;
  padding: 5px 12px;
  padding-left: 22px;
  background-color: cornflowerblue;
  font-size: 18px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.5);
  color: white;
  cursor: pointer;
}
.contclass-a:before {
  content: "";
  width: 0;
  height: 0;
  border: 13px solid transparent;
  border-top: 16px solid transparent;
  border-bottom: 17px solid transparent;
  border-left-color: white;
  position: absolute;
  top: 0;
  left: 16px;
}
.contclass-a:after {
  content: "";
  height: 32px;
  width: 26px;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 16px;
  border-top-left-radius: 5px;
  background-color: cornflowerblue;
  position: absolute;
  top: -2px;
  right: -8px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.3);
}
</style>




