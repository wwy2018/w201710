const Koa = require('koa')
const path = require('path')
const content = require('./util/content')
const mimes = require('./util/mimes')

const app = new Koa()
const staticPath = './static'

function parseMime (url) {
  let extName = path.extname(url)
  extName = extName ? extName.slice(1) : 'unknown'
  return mimes[extName]
}

app.use(async (ctx) => {
  let fullStaticPath = path.join(__dirname, staticPath)
  let _content = await content(ctx, fullStaticPath)
  let _mime = parseMime(ctx.url)
  if (_mime) {
    ctx.type = _mime
  }
  if (_mime && _mime.indexOf('image/') >= 0) {
    ctx.res.writeHead(200)
    ctx.res.write(_content, 'binary')
    ctx.res.end()
  } else {
    ctx.body = _content
  }
})

// const bodyParser = require('koa-bodyparser')
// const controller = require('./controller')

// app.use(bodyParser())
// app.use(controller())
app.listen(3000)
console.log('running 3000')