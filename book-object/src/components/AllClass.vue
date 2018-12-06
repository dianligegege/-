<template>
    <div class="allclass">
        <ul class="allclass-ul">
            <li @click="classchange('%')">所有分类</li>
            <li class="allclass-li" v-for="item in bookclass" :key="item">
                <div @click="classchange(item)">{{item}}</div>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
  name: "AllClass",
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
      classchange:function(item){
        //子组件向父组件传值
          this.$emit('getclass',item)
      }
  }
};
</script>

<style>

.allclass {
    width: 250px;
    padding: 0 20px;
    float: right;
    margin: 60px 0;
}
.allclass-ul {
    list-style-type: none;
}
.allclass-ul li:nth-of-type(1) {
    background: #4f6aa2;
    color: #fff;
    font-size: 16px;
    border-top: 1px solid #a5a5a5;
    cursor: pointer;
}
.allclass-ul li:nth-of-type(1):hover {
    background-color: #0e41a7;
    color: rgb(255, 255, 255);
}
.allclass-ul li {
    border: 1px solid #a5a5a5;
    border-top: none;
    padding: 10px 0;
    padding-left: 20px;
}
.allclass-li:hover{
    background-color: #dfe6f3;
    cursor: pointer;
}
    

</style>


