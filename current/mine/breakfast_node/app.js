import Koa from 'koa'
import KoaRouter from 'koa-router'
import BodyParser from 'koa-bodyparser'
var cors = require('koa2-cors')
const app = new Koa()
app.use(cors())
app.use(BodyParser())
const router = new KoaRouter()
import {User, Auth, Picture} from './controller'
router.post('/auth/getsessionkey', Auth.getSessionKey)
router.post('/user/saveuserinfo', User.saveUserInfo)
router.post('/picture/tailor', Picture.tailor)
router.post('/picture/addpicture', Picture.addPicture)
app.use(router.routes()).use(router.allowedMethods()).listen(9000)

// const logger = require('koa-logger')
// const serve = require('koa-static')
// const koaBody = require('koa-body')
// const Koa = require('koa')
// const fs = require('fs')
// const app = new Koa()
// const os = require('os')
// const path = require('path')
// app.use(logger())
// app.use(koaBody({multipart: true}))
// app.use(serve(path.join(__dirname, '/public')))
// app.use(async function (ctx, next) {
//   ctx.set("Access-Control-Allow-Origin", "*")
//   ctx.set("Access-Control-Allow-Credentials", true);
//   ctx.set("Access-Control-Max-Age", 86400000);
//   ctx.set("Access-Control-Allow-Methods", "OPTIONS, GET, PUT, POST, DELETE");
//   ctx.set("Access-Control-Allow-Headers", "x-requested-with, accept, origin, content-type");
//   console.log('ctx', ctx)
//   // if ('POST' != ctx.method) return await next()
//   const file = ctx.request.body.files.file
//   const reader = fs.createReadStream(file.path)
//   const stream = fs.createWriteStream(path.join(os.tmpdir(), Math.random().toString))
//   reader.pipe(stream)
//   console.log('uploading %s => %s', file.name, stream.path)
// })
// app.listen(9000)
// console.log('listening on port 9000')