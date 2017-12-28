<template>
  <div class="hello">
    <div class="button"></div>
  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
<style lang="sass" scoped>
.button
  display: inline-block
  background: #4285f4
  color: #fff
  text-transform: uppercase
  padding: 20px 30px
  border-radius: 5px
  box-shadow: 0px 17px 10px -10px rgba(0,0,0,0.4)
  cursor: pointer
  transition: all ease-in-out 300ms
  &:hover
    box-shadow: 0px 37px 20px -20px rgba(0,0,0,0.2)
    transform: translate(0px, -10px)
</style>

