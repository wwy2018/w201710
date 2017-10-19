const isGeneratorFunction = require('is-generator-function');
function* g(x){
  var a = yield x+2
  return a
}
function k () {
  return 2
}
function* t () {
  //
}
var gf = g(1)
var f = gf.next()
var i = isGeneratorFunction(t)
// console.log(i)