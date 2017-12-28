import Koa from 'koa'
import Router from './router.js'
import bodyParser from 'koa-bodyparser'
import views from 'koa-views'

const app = new Koa()
const route = Router()
app.use(bodyParser)
app.use(views(path.join(__dirname, './view'), {
  extension: 'html'
}))
app.use(route.routes())
app.use(route.allowedMethods())
app.listen(4000)
console.log('server is running at 4000')