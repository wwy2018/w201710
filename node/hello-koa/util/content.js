const path = require('path')
const fs = require('fs')
const dir = require('./dir')
const file = require('./file')

async function content(ctx, fullStaticPath) {
  console.log('ctx', ctx)
  console.log('full', fullStaticPath)
  let reqPath = path.join(fullStaticPath, ctx.url)
  let exist = fs.existsSync(reqPath)
  let content = ''
  if (!exist) {
    content = 'not found aaa'
  } else {
    let stat = fs.statSync(reqPath)
    if (stat.isDirectory()) {
      content = dir(ctx.url, reqPath)
    } else {
      content = await file(reqPath)
    }
  }
  return content
}
module.exports = content