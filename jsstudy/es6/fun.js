// foreach
let arr1=[1,4,8]
function print(v){
  console.log(v)
}
arr1.forEach(print)
// map 创建新数组
let arr2=['a','c','e']
function capital(v){
  return v.toUpperCase()
}
let ca=arr2.map(capital)
console.log(ca)
// filter 创建新数组
let arr3=[20, 34, 55]
function fil(v){
  return v<40
}
let f=arr3.filter(fil)
console.log(f)
// find 找到通过所提供测试的第一个元素 返回true或false
let people=[
  {name:'jack',age: 10},
  {name:'jackii',age: 20},
  {name:'jacy',age: 30}
]
function teen(person){
  return person.age>9 && person.age<40
}
let first=people.find(teen)
console.log(first)
// reduce 第一个参数是一个函数 该函数的参数为一个累加器以及数组中的每个元素（从左到右） 并最终输出单个值 累加器的初始值由reduce函数的第二个参数提供
let arr4=[4,7,9,8]
function sum(acc,value){
  return acc+value
}
function product(acc,value){
  return acc*value
}
let sumarr=arr4.reduce(sum,0)
let proarr=arr4.reduce(product,1)
console.log(sumarr)
console.log(proarr)
// 解构
function decon([f,s]){
  console.log(f,s)
}
function decon1([, , t, f]) {
  console.log(t, f)
}
arr5 = [1, 2, 3, 4]
decon(arr5)
decon1(arr5)
function deconobj({f,s,c}){
  console.log(f)
}
let obj={
  f: 'd'
}
deconobj(obj)
// class 函数声明和类声明一个重要区别在于类声明不会提升
class pc{}
let p = new pc()
// 当调用静态或原型方法时 没有值为‘this’的对象 所以this在被调用的函数内部为undefined 不会发生自动装箱
class Animal{
  speak(){
    console.log(this)
    return this
  }
  static eat(){
    console.log(this)
  }
  constructor(name){
    this.name=name
  }
}
let ani=new Animal()
ani.speak()
let s=ani.speak
s()
let e=Animal.eat
e()
// extends
class Dog extends Animal{
  ss(){
    console.log(this.name)
  }
}
Dog.eat()
let d = new Dog('dd')
d.ss()
// species 覆盖默认的构造函数
class MyArray extends Array{
  static get[Symbol.species](){
    return Array
  }
}
let a=new MyArray(1,2,3)
let mapped=a.map(x=>x*x)
console.log(mapped instanceof MyArray)
console.log(mapped instanceof Array)
// 使用super调用超类
class Cat{
  constructor(name){
    this.name=name
  }
  speak(){
    console.log(this.name+' cat')
  }
}
class Lion extends Cat{
  speak(){
    super.speak()
    console.log(this.name+' lion')
  }
}
let l=new Lion('lily')
l.speak()
// mix-ins  多重继承