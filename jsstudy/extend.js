function extend(){
  var target=arguments[0] || {}, i=1, length=arguments.length, options, name, src, copy, copyIsArray, clone
  if (typeof target !== 'object' && typeof target !== 'function') {
    target = {}
  }
  if(length === i){
    target = this
    --i
  }
  for(;i<length;i++){
    if ((options=arguments[i]) != null){
      for (name in options){
        src = target[name]
        copy = options[name]
        if (target === copy){
          continue
        }
        if(copy && isPlainObject(copy) || (copyIsArray = Array.isArray(copy))){
          if(copyIsArray){
            copyIsArray = false
            clone = src && Array.isArray(src) ? src : []
          }else{
            clone = src && isPlainObject(src) ? src : {}
          }
          target[name] = extend(clone, copy)
        } else if (copy !== undefined) {
          target[name] = copy
        }
        
      }
    }
  }
}

function isPlainObject(obj){
  var object = {}
  var hasOwn = ({}).hasOwnProperty
  var fnToString = hasOwn.toString
  var ObjectFunctionString = fnToString.call(Object)
  if (!obj || object.toString.call(obj) !== "[object Object]"){
    return false
  }
  var proto = Object.getPrototypeOf(obj)
  if (!proto) {
    return true
  }
  var Ctor = hasOwn.call(proto, "constructor") && proto.constructor
  return typeof Ctor === 'function' && fnToString.call(Ctor) === ObjectFunctionString
}

function type(obj){
  if (obj == null) {
    return String(obj)
  }
  var object = {}
  return typeof obj === 'object' || typeof obj === 'function' ? object.toString.call(obj) || 'object' : typeof obj
}
var o1={
  'a': [5,6],
  'b': {
    'c': 'aa',
    'd': 'dd'
  }
}
var o2={
  'a': [1,2,3,4],
  'f': {
    'c': 'ee',
    'd': 'ff'
  }
}
// extend(o1,o2)
// console.log(o1)
// console.log(o2)
function getType (o) {
  var _t
  return ((_t = typeof (o)) === 'object' ? o === null && 'null' || Object.prototype.toString.call(o).slice(8, -1) : _t).toLowerCase()
}
function extend1(destination, source){
  for (var p in source) {
   if (getType(source[p]) === 'array' || getType(source[p]) === 'object'){
     destination[p] = getType(source[p]) === 'array' ? [] : {}
     extend1(destination[p], source[p])
   } else {
     destination[p] = source[p]
   }
  }
}
