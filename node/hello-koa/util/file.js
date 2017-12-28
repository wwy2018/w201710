const fs=require('fs')
function file(filePath){
  let content = fs.readFileSync(filePath, 'binary')
  console.log('content', content)
  return content
}
module.exports = file