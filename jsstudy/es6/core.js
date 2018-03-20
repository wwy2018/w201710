// this is a block
{
  let a = 1
}
// console.log('a', a)
var x = 3
function func (rand) {
  if (rand) {
    var x = Math.random()
    return x
  }
  return x
}
let b = func(false)
console.log('b', b)
// let _x = 2
// function func (rand) {
//   if (rand) {
//     let _x = Math.random()
//     return _x
//   }
//   return _x
// }
// let c = func(false)
// console.log('c', c)
function args (...args) {
  for (const a of args) {
    console.log(a)
  }
}