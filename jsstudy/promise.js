function a (log) {
  return new Promise(function (resolve, reject) {
    // setTimeout(function () {
      resolve(log)
    // }, 16)
  })
}
a('hello').then(function (val) {
  console.log(val)
}).catch(function (err) {
  console.log(err)
})
async function b (log) {
  let res = await a(log)
  console.log(res)
}
b('world')
var p1 = Promise.resolve(3)
var p2 = 44
var p3 = new Promise(resolve => {
  setTimeout(resolve, 100, 'f000')
})
Promise.all([p1, p2, p3]).then(val => {
  console.log('v: ', val)
})