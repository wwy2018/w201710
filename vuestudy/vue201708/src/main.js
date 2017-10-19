// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueLazyload from 'vue-lazyload'

/* eslint-disable */
Vue.use(VueLazyload)

Vue.config.productionTip = false
// directive
function getTarget (node = document.body) {
  if (node === true) {
    return document.body
  }
  return node instanceof window.Node ? node : document.querySelector(node)
}
const homes = new Map()
Vue.directive('transfer', {
  inserted (el, {value}, vnode) {
    const {parentNode} = el
    const home = document.createComment('')
    let hasMovedOut = false
    if (value !== false) {
      parentNode.replaceChild(home, el)
      getTarget(value).appendChild(el)
      hasMovedOut = true
    }
    if (!homes.has(el)) homes.set(el, {parentNode, home, hasMovedOut})
  },
  componentUpdated (el, {value}) {
    const {parentNode, home, hasMovedOut} = homes.get(el)
    if (!hasMovedOut && value) {
      parentNode.replaceChild(home, el)
      getTarget(value).appendChild(el)
      hoems.set(el, Object.assign({}, home.get(el), {hasMovedOut: true}))
    } else if (hasMovedOut && value === false) {
      parentNode.replaceChild(el, home)
      homes.set(el, Object.assign({}, homes.get(el), {hasMovedOut: false}))
    } else if (value) {
      getTarget(value).appendChild(el)
    }
  },
  unbind (el, binding) {
    homes.delete(el)
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
