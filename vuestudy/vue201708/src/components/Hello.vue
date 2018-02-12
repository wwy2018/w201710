<template>
  <!-- <div class="hello" v-infi-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="10"> -->
  <div>
    <!-- <ul v-show="false">
      <li v-for="img in list">
        <img v-lazy="imgSrc + img">
      </li>
    </ul>
    <div v-dom-portal v-show="t">
      <div class="t">1111</div>
    </div>
    <button @click="show">show</button>
    <button @click="hide">click</button>
    <div id="scene">
      <div data-depth="0.2">My first Layer!</div>
      <div data-depth="0.6">My second Layer!</div>
    </div>
    <textarea name="" id="" cols="30" rows="10">textarea</textarea>
    <a class="ripple">aaaa</a>
    <long-touch @onTouch="touch">
      <div slot="slot">aaaaaaaaaa</div>
    </long-touch>
    <div class="infinite-loading-container">
      <loading spinner="BUBBLES"/>
    </div>
    <button @click="tran">trans</button>
    <transition name="fade">
      <div v-if="trans">tttttttttt</div>
    </transition> -->
    <security-code v-model="code"></security-code>
    <el-table
      :data="tableData6"
      border
      style="width: 100%">
      <el-table-column
        prop="id"
        label="ID"
        width="180">
      </el-table-column>
      <el-table-column
        prop="name"
        label="姓名">
      </el-table-column>
      <el-table-column
        prop="amount1"
        sortable
        label="数值 1">
      </el-table-column>
      <el-table-column
        prop="amount2"
        sortable
        label="数值 2">
      </el-table-column>
      <el-table-column
        prop="amount3"
        sortable
        label="数值 3">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
/* eslint-disable */
import Parallax from 'parallax-js'
import {LongTouch, Loading} from 'wwy2017'
import SecurityCode from './S.vue'
export default {
  name: 'hello',
  data () {
    return {
      tableData6: [{
          id: '12987122',
          name: '王小虎',
          amount1: '234',
          amount2: '3.2',
          amount3: 10
        }, {
          id: '12987123',
          name: '王小虎',
          amount1: '165',
          amount2: '4.43',
          amount3: 12
        }, {
          id: '12987124',
          name: '王小虎',
          amount1: '324',
          amount2: '1.9',
          amount3: 9
        }, {
          id: '12987125',
          name: '王小虎',
          amount1: '621',
          amount2: '2.2',
          amount3: 17
        }, {
          id: '12987126',
          name: '王小虎',
          amount1: '539',
          amount2: '4.1',
          amount3: 15
        }],
      imgSrc: '../../static/imgs/',
      list: [
        '1.png',
        '2.png',
        '3.png',
        '4.png',
        '5.png'
      ],
      t: false,
      busy: false,
      spinner: 'default',
      trans: false,
      code: ''
    }
  },
  components: {
    LongTouch,
    Loading,
    SecurityCode
  },
  methods: {
    tran () {
      this.trans = !this.trans
    },
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
    },
    loadMore () {
      this.busy=true
      console.log('aaa')
      this.busy=false
    }
  },
  created () {
    // this.test()
  },
  mounted () {
    // this.para()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">
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

@deep: ~'>>>';

.infinite-loading-container {
  clear: both;
  text-align: center;
  @{deep} *[class^=loading-] {
    @size: 28px;
    display: inline-block;
    margin: 15px 0;
    width: @size;
    height: @size;
    font-size: @size;
    line-height: @size;
    border-radius: 50%;
  }
}
.fade-enter-active, .fade-leave-active{
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to{
  opacity: 0;
}
</style>
