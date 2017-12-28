// 函数提升了
sayHi()
function sayHi(){
  console.log('sayhi')
}

// 函数没有提升
// sayHello()
var sayHello=function(){
  console.log('say hello')
}

// 这种方式很危险 不应该使用
if (true){
  console.log('trr')
  function sayIf(){
    console.log('true')
  }
  sayIf()
}else{
  function sayIf(){
    console.log('false')
  }
  sayIf()
}
// 要使用这种方式
var sayIfOk
if (true){
  sayIfOk=function(){
    console.log('if ok')
  }
}else{
  sayIfOk=function(){
    console.log('if not ok')
  }
}
sayIfOk()