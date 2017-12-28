var xlsx = require('node-xlsx')
var fs = require('fs')
var arr = xlsx.parse(__dirname+'/rule.xlsx')
var data = arr[0]['data']
var list = []
data.map(item => {
  list.push({
    rule: item[5],
    name: item[4]
  })
})
fs.writeFile(__dirname + '/a.json', new Buffer(JSON.stringify(list)))
// console.log(list)