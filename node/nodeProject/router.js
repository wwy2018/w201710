import Router from 'koa-router'

export default () => {
  const route = new Router()
  router.get('/', 'index')
}