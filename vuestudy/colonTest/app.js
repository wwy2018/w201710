require("babel-register");

var http = require('http')
var url = require('url')
var path = require('path')
var fs = require('fs')
// http.createServer(function(req,res){
//   res.writeHead(200,{'Content-Type': 'text/html'})
//   res.end(fs.readFileSync('index.html'))
// }).listen('3000')
// http.createServer(function(req,res){
//   var pathname=__dirname+url.parse(req.url).pathname
//   if(path.extname(pathname)==''){
//     pathname+='/'
//   }
//   if(pathname.charAt(pathname.length - 1) == '/'){
//     pathname+='index.html'
//   }
//   fs.exists(pathname, function(exists){
//     if(exists){
//       switch(path.extname(pathname)){
//         case '.html':
//           res.writeHead(200, {'Content-Type': 'text/html'})
//           break
//         case '.js':
//           res.writeHead(200, {'Content-Type': 'text/javascript'})
//           break
//         case '.css':
//           res.writeHead(200, {'Content-Type': 'text/css'})
//           break
//         case '.gif':
//           res.writeHead(200, {'Content-Type': 'image/gif'})
//           break
//         case '.jpg':
//           res.writeHead(200, {'Content-Type': 'image/jpeg'})
//           break
//         case '.png':
//           res.writeHead(200, {'Content-Type': 'image/png'})
//           break
//         default:
//           res.writeHead(200, {'Content-Type': 'application/octet-stream'})
//       }
//       fs.readFile(pathname, function(err, data){
//         res.end(data)
//       })
//     } else {
//       res.writeHead(404, {'Content-Type': 'text/html'})
//       res.end('<h1>not found</h1>')
//     }
//   })
// }).listen(3000, '127.0.0.1')
console.log('running')
// require("./index.js");
const Koa = require('koa')
const router = require('koa-router')()
const bodyParser = require('koa-bodyparser')
const app = new Koa()
app.use(bodyParser())
app.use(async (ctx, next) => {
  await next()
  ctx.response.type = 'text/html'
  ctx.response.body = ''
})