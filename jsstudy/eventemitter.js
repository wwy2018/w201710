// 实现一个EventEmitter类，这个类包含以下方法：
// on（监听事件，该事件可以被触发多次）
// once（也是监听事件，但只能被触发一次）
// fire（触发指定的事件）
// off（移除指定事件的某个回调方法或者所有回调方法）
// class EventEmitter {
//   /**请补充你的代码***/
// }
// const event = new EventEmitter()
// const drank = (person) => {
//   console.log(person + '喝水')
// }
// event.on('drank', drank)
// event.on('eat', (person) => {
//   console.log(person + '吃东西')
// })
// event.once('buy', (person) => {
//   console.log(person + '买东西')
// })
// event.fire('drank', '我')   // 我喝水  
// event.fire('drank', '我')   // 我喝水  
// event.fire('eat', '其它人')   // 其它人吃东西
// event.fire('eat', '其它人')   // 其它人吃东西
// event.fire('buy', '其它人')  //其它人买东西
// event.fire('buy', '其它人')  //这里不会再次触发buy事件，因为once只能触发一次
// event.off('eat')  //移除eat事件
// event.fire('eat', '其它人')  //这里不会触发eat事件，因为已经移除了

class EventEmitter {
  constructor () {
    this.queue = {}
    this.onceQueue = {}
  }
  on (event, fn) {
    if (!this.queue[event]) this.queue[event] = []
    this.queue[event].push(fn)
  }
  once (event, fn) {
    if (!this.onceQueue[event]) {
      this.onceQueue[event] = {
        fns: [],
        hasFired: false
      }
    }
    this.onceQueue[event].fns.push(fn)
  }
  fire () {
    const event = [].shift.call(arguments), fns = this.queue[event], onceFns = this.onceQueue[event]
    if (fns && fns.length !=0) {
      let i = 0, fn
      while (fn = fns[i++]) {
        fn.apply(this, arguments)
      }
    }
    if (onceFns && !onceFns.hasFired) {
      let i = 0, fn
      while (fn = onceFns.fns[i++]) {
        fn.apply(this, arguments)
      }
      this.onceQueue[event].hasFired = true
    }
  }
  off (event, fn = null) {
    const fns = this.queue[event]
    if (!fns || fns.length == 0) return
    if (fn) {
      this.queue[event] = fns.filter(item => {
        return item !== fn
      })
    } else {
      this.queue[event] = []
    }
  }
}