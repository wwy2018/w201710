import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import Wu from '@/components/Wu'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Hello',
      component: Hello
    },
    {
      path: '/wuyifan',
      name: 'Wu',
      component: Wu
    }
  ]
})
