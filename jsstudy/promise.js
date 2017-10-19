function a () {
  return new Promise(function (resolve, reject) {
    // setTimeout(function () {
      resolve('hello')
    // }, 16)
  })
}
a().then(function (val) {
  console.log(val)
}).catch(function (err) {
  console.log(err)
})