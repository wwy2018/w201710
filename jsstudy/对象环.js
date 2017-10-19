const obj = {
  foo: {
    name: 'foo',
    bar: {
      name: 'bar',
      baz: {
        name: 'baz',
        aChild: null  //待会让它指向obj.foo
      }
    }
  }
}
obj.foo.bar.baz.aChild = obj.foo
// let json = JSON.stringify(obj)
// console.log('js', json)
// 解题思路：首先很容易想到要遍历这个对象，然后判断属性值是否为一个对象，如果是，则递归遍历这个属性值，但难点是该如何判断这个属性值是否为某个父节点的引用，要怎样拿到父节点的引用呢？？？
// 其实我们可以先用一个数组cache用来保存对象类型的属性值，再用一个标记变量来标记是否有环，然后遍历时判断这个属性值类型是否为一个对象，如果是，则判断这个属性值是否在那个cache数组里，如果在，则表明有环，如果不在，则把这个属性值添加到数组里，再递归遍历这个属性值即可。
function cycleDetector(obj) {
	let hasCircle = false, //用一个变量去标记是否有环
		cache = []; //保存值为对象的属性值
	(function(obj) {
		Object.keys(obj).forEach(key => {
			const value = obj[key]
			if (typeof value == 'object' && value !== null) {
				const index = cache.indexOf(value)
				if (index !== -1) { //如果cache中存在这个value，则表示有环
					hasCircle = true
					return
				} else {
					cache.push(value)
					arguments.callee(value)
				}
			}
		})
	})(obj)
	return hasCircle
}
let has = cycleDetector(obj)
console.log('has', has)

function trycatch (obj) {
  let result = true
  try {
    JSON.stringify(obj)
  } catch (e) {
    result = false
  } finally {
    return result
  }
}
let t = trycatch(obj)
console.log('t', t)