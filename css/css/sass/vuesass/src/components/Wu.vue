<template>
  <div>
    <div class="div">
    </div>
  </div>
</template>
<script>
/* eslint-disable */
import $ from 'jquery'
export default {
  name: 'Wu',
  mounted () {
    for (var i = 1;i<25;i++){
      var img = document.createElement('img')
      img.classList.add('img' + i)
      if (i > 1) {
        img.classList.add('hide')
      }
      $('.div').append(img)
      if (i%2 === 0) {
        img.src = '/static/w2.png'
      } else {
        img.src = '/static/w1.png'
      }
    }
  }
}
</script>
<style lang="sass" scoped>
html,body
  width: 100%;height: 100%;
img
  display: block
  width: 100%
  max-height: 100%
  float: left
.hide
  opacity: 0
@for $i from 1 through 25
  .img#{$i}
    width: 2em * $i
</style>

