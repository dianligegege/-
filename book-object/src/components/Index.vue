<template>
  <div class="index">
   <Header />
   <Content :books="serverdata"/>
   <Footer/>
  </div>
</template>

<script>
import Header from './Header.vue';
import Footer from './Footer.vue';
import Content from './Content.vue';


export default {
  name: 'Index',
  components:{
      Header,
      Footer,
      Content
  },
  data () {
    return {
      serverdata: '123',
      name:''
    }
  },
  
  created:function () {
    let _this = this;
    _this.http.get(_this.server + '')
    .then(function(res){
      // console.log(res.data);
      _this.serverdata = res.data;
    })
    .catch(function(error){
      console.log(error)
    });
  },
  
}
</script>

<style >

</style>
