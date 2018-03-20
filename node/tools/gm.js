var gm = require('gm')
var fs = require('fs')
var img = './image/a.jpg'
console.log('gm', gm)
// resize
gm(img).resize(100, 100).write('./image/b.jpg', (err) => {
  if (!err) console.log('done!')
})
// // obtain size
// gm(img).size((err, size) => {
//   if (!err) console.log(`width: ${size.width}, height: ${size.height}`)
// })
// // 合图
// gm('./image/c.jpg')
// .composite('./image/b.jpg')
// .geometry('+100+150')
// .write('./image/d.jpg', (err) => {
//   if (!err) console.log('composite done')
// })