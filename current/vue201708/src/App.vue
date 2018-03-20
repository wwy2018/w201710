<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  methods: {
    alert () {
      this.$alert('title', 'alert', {
        confirmButtonText: '返回'
      })
    },
    getUserInfo () {
      this.$router.addRoutes(this.$store.state.routes)
      // this.alert()
    }
  },
  mounted () {
    this.getUserInfo()
  }
}
</script>

<style>
body,div,ul,li,span,p,input,table,tr,td,h1,h2,h3,h4,h5,h6,article,dl,dd,dt{
  margin:0;
  padding:0;
  font-family: "微软雅黑", "PingFang SC", Arial, sans-serif;
  font-weight: 300;
}
ul,li{
  list-style:none;
}
img{
  border:none;
  max-width:100%;
  display: block;
}
a{
  color: #fff;
  text-decoration:none;
}
body,html{
  width: 100%;
  min-height:100%;
  max-width:750px;
  margin:0 auto;
  background-size: 100% 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  color: #555;
  position: relative;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
