<template>
  <div @click="ud">{{foo}}</div>
</template>
<script>
export default {
  props: ['foo'],
  methods: {
    ud: function () {
      this.$emit('update:foo', 'hell')
    }
  }
}
</script>
