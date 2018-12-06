<template>
    <div class="content-box">
        <div class="content">
            <NavList/>
            <HotBook  :books="books"/>
        </div>
        
    </div>    
</template>

<script>
import HotBook from "./HotBook.vue";
import NavList from "./NavList.vue";


export default {
  name: "Content",
  props: ["books"],
  components: {
    HotBook,
    NavList
  },
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
  }
};
</script>

<style>
.clear {
  clear: both;
}
.content-box {
  margin-top: 80px;
  padding: 10px 150px;
}

</style>


