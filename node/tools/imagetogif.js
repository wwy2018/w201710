let fs = require('fs')
var gm = require('gm').subClass({imageMagick: true})
// gm().in("img/00.jpg","img/01.jpg","img/02.jpg","img/03.jpg","img/04.jpg","img/05.jpg","img/06.jpg","img/07.jpg","img/08.jpg","img/09.jpg","img/10.jpg","img/11.jpg").write('a.gif', function (err) {
//   if (err) throw err
//   console.log('created')
// })
function str (str) {
  str+=''
  if (str.length == 1){
    str = '0'+str
  } 
  // else if (str.length==2) {
  //   str = '0' + str
  // }
  return str
}

let dirpath = 'img'
async function readDir (path) {
  return new Promise(resolve => {
    fs.readdir(path, (err, files) => {
      if (err) throw err
      resolve(files)
    })
  })
}
async function renameFile (oldName, newName) {
  return new Promise(resolve => {
    fs.rename(oldName, newName, function (err) {
      if (err) throw err
      resolve(console.log('suc'))
    })
  })
}
async function rename (path) {
  let files = await readDir(path)
  files.map(async (file, index) => {
    let oldName = path + '/' + file
    let newName = path + '/' + index + file.slice(-4)
    await renameFile(oldName, newName)
  })
}
rename(dirpath)