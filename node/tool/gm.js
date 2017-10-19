import gm from 'gm'
import fs from 'fs'
import path from 'path'
import images from 'images'
import request from 'request'

const in_path = './im/'
const out_path = './om/'
const bg = in_path + 'bg.png'

// gm('./im/bg0.png')
// .resize(100, 100)
// .toBuffer('PNG',function (err, buffer) {
//   if (err) throw err;
//   console.log('done!');
// })

// gm('./im/1.gif[20]')
// .write('./om/1.png', (err) => {
//   if (err) throw err;
//   console.log('done!');
// })

// gm('./im/bg.png')
// .stroke("#ffffff")
// .drawCircle(10, 10, 20, 10)
// .font("", 12)
// .drawText(30, 20, "aaa")
// .write('./om/2.png', (err) => {
//   if (err) throw err;
//   console.log('done!');
// })

// gm(200, 400, "#ddff99f3")
// .drawText(10, 50, "from scratch")
// .write("./om/1.png", function (err) {
//   if (err) throw err;
//     console.log('done!');
// });

var url = 'http://img002.21cnimg.com/photos/album/20150702/m600/2D79154370E073A2BA3CD4D07868861D.jpeg'
// gm(request(url))
// .write('./om/1.png', (err) => {
//   if (err) throw err;
//   console.log('done!');
// })

gm(request(url))
.montage('./im/mk1.png')
.geometry('+100+150')
.write('./om/1.png', function(err) {
  if (err) throw err;
  console.log("Written montage image.");
});