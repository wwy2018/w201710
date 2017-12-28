const store = {
  state: {
    routes: [
      {
        path: '/',
        name: 'Hello',
        component: (resolve) => require(['./components/Hello.vue'], resolve)
      },
      {
        path: '/test',
        name: 'Test',
        component: (resolve) => require(['./components/Test.vue'], resolve)
      }
    ]
  }
}
export default store
