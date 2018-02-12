<template>
  <div class="hello">
    <mt-button type="default">default</mt-button>
    <mt-button type="primary" @click="ind">primary</mt-button>
    <mt-button type="danger" @click="dt">danger</mt-button>
    <mt-loadmore :top-method="loadTop" ref="loadmore">
        <div v-for="item in list" class="page-loadmore-listitem">{{ item }}</div>
    </mt-loadmore>
    <mt-button @click.native="popupVisible4 = true" size="large">下侧弹出 popup</mt-button>
    <mt-popup v-model="popupVisible4" position="bottom" class="mint-popup-4">
      <mt-picker :slots="dateSlots" @change="onDateChange" :visible-item-count="5" :show-toolbar="false"></mt-picker>
    </mt-popup>
    <div class="page-picker-wrapper">
      <mt-picker :slots="numberSlot" @change="onNumberChange" :visible-item-count="3"></mt-picker>
    </div>
    <p class="page-picker-desc">动态默认选项: {{ number }}</p>
    <mt-palette-button content="+">
      <div class="my-icon-button"></div>
      <!-- <div class="my-icon-button"></div>
      <div class="my-icon-button"></div> -->
    </mt-palette-button>
    <div class="page-cell">
      <mt-cell>
        <div slot="title">title</div>
        <div slot="right">right</div>
        <!-- <i slot="right" class="mint-cell-allow-up"/> -->
      </mt-cell>
    </div>
  </div>
</template>

<script>
import { Toast, Indicator } from 'mint-ui'
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      list: [],
      popupVisible4: false,
      dateSlots: [
        {
          flex: 1,
          values: ['2016-01', '2016-02', '2016-03', '2016-04', '2016-05', '2016-06'],
          className: 'slot1',
          textAlign: 'right'
        }, {
          divider: true,
          content: '-',
          className: 'slot2'
        }, {
          flex: 1,
          values: ['2016-01', '2016-02', '2016-03', '2016-04', '2016-05', '2016-06'],
          className: 'slot3',
          textAlign: 'left'
        }
      ],
      number: 0,
      numberSlot: [{
        flex: 1,
        defaultIndex: 0,
        values: [0, 1, 2, 3, 4, 5, 6],
        className: 'slot1'
      }]
    }
  },
  methods: {
    dt () {
      Toast('提示信息')
    },
    ind () {
      Indicator.open('加载中...')
      setTimeout(() => Indicator.close(), 1000)
    },
    loadTop () {
      alert('top...')
    },
    onDateChange (picker, values) {
      console.log('v', values)
    },
    onNumberChange (picker, values) {
      this.number = values[0]
    }
  },
  created () {
    for (let i = 1; i <= 20; i++) {
      this.list.push(i)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
