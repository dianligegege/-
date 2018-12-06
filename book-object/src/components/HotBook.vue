<template>
    <div>
       <div class="hotbook">
           <div class="hotbook-title">最热图书</div>
           <div class="hotbook-book">
              <BookCard v-for="item in books" :books='item' :key='item.b_id'/>
           </div>
       </div>
    </div>    
    
</template>
<script>
import BookCard from "./BookCard.vue";

export default {
  name: "HotBook",
  props: ["books"],
  components: {
    BookCard
  },
  data() {
    return {};
  },
  methods: {}
};
</script>

<style>
.hotbook {
  padding: 20px 20px;
}
.hotbook-title {
  border-bottom: 1px solid rgba(0, 0, 0, 0.5);
  padding-top: 10px;
  padding-bottom: 12px;
  font-size: 24px;
  font-weight: 600;
}
.hotbook-book {
  width: 842px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 30px 0;
}
</style>
