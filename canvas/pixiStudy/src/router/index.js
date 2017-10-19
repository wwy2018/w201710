import Vue from 'vue'
import Router from 'vue-router'
import Pixi from '@/components/Pixi'
import Three from '@/components/Three'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'pixi',
      component: Pixi
    },
    {
      path: '/three',
      name: 'three',
      component: Three
    }
  ]
})
