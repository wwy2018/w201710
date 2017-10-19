<template>
  <div class="inside">
    <group :title="title" class="zindex-10">
      <cell :title="projectName"></cell>
      <!-- 不传title时 要给primary设置一个不等于空的默认值 这样primary和title就不相等 不会影响child slot样式 -->
      <cell primary="none">
        <div slot="child">
          <div class="font-4vw color-66 lh-8vw">客户名称（卡类型）</div>
          <div class="font-4vw color-66 lh-8vw">起止时间 2017-08-17至2017-08-27</div>
          <div class="font-4vw lh-6vw">描述</div>
        </div>
      </cell>
    </group>
    <!-- group没有title时 margintop会默认为gutter的值 此时为gutter赋值0则没有margintop -->
    <group title="负责人">
      <popup-picker placeholder="点击选择" v-model="pickerVal" :data="data" :columns="2" :show-name="true" @on-change="pickerChange(pickerVal)">
        <!-- <span slot="title" class="color-99 font-14px">负责人</span> -->
      </popup-picker>
      <cell :title="item.title" :value="item.value" v-for="(item, index) in cells" key="index"></cell> 
    </group>
    <group title="完成情况">
      <cell title="查看完成情况" is-link></cell>
    </group>
    <div class="plr-15 mt-vux mb-vux">
      <flexbox>
        <flexbox-item>
          <x-button type="default" text="归为已办" @click.native="finish"></x-button>
        </flexbox-item>
        <flexbox-item>
          <x-button type="primary" text="提交工作记录" @click.native="submit"></x-button>
        </flexbox-item>
      </flexbox>
    </div>
  </div>
</template>

<script>
import { Cell, Group, XButton, Flexbox, FlexboxItem, PopupPicker } from 'vux'
export default {
  data () {
    return {
      // vux通过v-html渲染title 所以可以将title设置为dom块
      title: '<div class="flex-between"><p>基本信息</p><p>黄海龙发布于2017-08-10 17:25</p></div>',
      projectName: '项目名称(卡号)',
      cells: []
    }
  },
  components: {
    Cell,
    Group,
    XButton,
    Flexbox,
    FlexboxItem,
    PopupPicker
  },
  methods: {
    pickerChange (value) {
      value = this.value2name(value, this.data)
      value = value.split(' ')
      var obj = {}
      obj.title = value[0]
      obj.value = value[1]
      this.cells.push(obj)
    },
    finish () {
      console.log('finish')
    },
    submit () {
      console.log('submit')
    },
    value2name (value, list, delimiter) {
      if (value && !list.length) {
        return ''
      }
      if (!delimiter) {
        delimiter = ' '
      }
      let rs = this.map(value, (one, index) => {
        if (list.length && Object.prototype.toString.call(list[0]) === '[object Array]') {
          return this.find(list[index], item => {
            return item.value === one
          })
        } else {
          return this.find(list, item => {
            return item.value === one
          })
        }
      })
      rs = rs.filter(one => {
        return typeof one !== 'undefined'
      })
      return this.map(rs, one => {
        return one.name
      }).join(delimiter).replace('--', '')
    },
    map (xs, f) {
      var hasOwn = Object.prototype.hasOwnProperty
      if (xs.map) return xs.map(f)
      var res = []
      for (var i = 0; i < xs.length; i++) {
        var x = xs[i]
        if (hasOwn.call(xs, i)) res.push(f(x, i, xs))
      }
      return res
    },
    find (array, predicate, context) {
      if (typeof Array.prototype.find === 'function') {
        return array.find(predicate, context)
      }
      context = context || this
      var length = array.length
      var i
      if (typeof predicate !== 'function') {
        throw new TypeError(predicate + ' is not a function')
      }
      for (i = 0; i < length; i++) {
        if (predicate.call(context, array[i], i, array)) {
          return array[i]
        }
      }
    }
  },
  created () {
    this.$store.dispatch('title', '卡项详情')
  }
}
</script>

<style scoped>
</style>
