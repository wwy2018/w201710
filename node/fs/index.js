var fs=require('fs')
var path=require('path')
//  同步的方法会阻塞整个进程，直到完成（停止所有连接）
// fs.renameSync(__dirname + '/t2', __dirname + '/t', (err)=>{
//   if(err) throw err
//   console.log('delete ok')
// })
// fs.stat(__dirname + '/t', (err, stats) => {
//   if (err) throw err
//   // console.log(`attribute: ${JSON.stringify(stats)}`)
// })
// 文件批量变小些
fs.readdir(__dirname + '/t', (err, files) =>{
  if (err) {throw err} else {
    let count = 0
    files.forEach((file) => {
      var filePath = path.normalize(__dirname + '/t/' + file)
      var fileName = path.basename(file)
      fs.stat(filePath, (err, stat) => {
        if (stat.isFile()) {
          console.log(filePath)
          fs.renameSync(filePath, __dirname + '/t/' + fileName.toLowerCase(), (err) => {
            if (err) throw err
          })
          count++
        }
        if (stat.isDirectory()) {
          console.log('direct')
        }
      })
    })
    
  }
})