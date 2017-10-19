<template>
  <div class="hello">
    
    <ul v-show="false">
      <li v-for="img in list">
        <img v-lazy="imgSrc + img">
      </li>
    </ul>
    <div v-transfer v-show="t">
      <div class="t">1111</div>
    </div>
    <button @click="show">show</button>
    <button @click="hide">click</button>
    <!-- parallax -->
    <div id="scene">
      <div data-depth="0.2">My first Layer!</div>
      <div data-depth="0.6">My second Layer!</div>
    </div>
    <textarea name="" id="" cols="30" rows="10">textarea</textarea>
    <a class="ripple">aaaa</a>
    <long-touch @onTouch="touch">
      <div slot="slot">aaaaaaaaaa</div>
    </long-touch>
  </div>
</template>

<script>
/* eslint-disable */
import Parallax from 'parallax-js'
import w from 'wwy2017'
var longTouch = w.longTouch
console.log(longTouch)
export default {
  name: 'hello',
  data () {
    return {
      imgSrc: '../../static/imgs/',
      list: [
        '1.png',
        '2.png',
        '3.png',
        '4.png',
        '5.png'
      ],
      t: false
    }
  },
  components: {
    longTouch
  },
  methods: {
    touch () {
      console.log('ttt')
    },
    show () {
      this.t = true
    },
    hide () {
      this.t = false
    },
    test () {
      const [a,b] = [1,2]
      console.log(a)
    },
    para () {
      var scene = document.getElementById('scene')
      var parallaxInstance = new Parallax(scene)
    }
  },
  created () {
    this.test()
  },
  mounted () {
    this.para()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import '~wwy2017/src/css/ripple.css';
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
