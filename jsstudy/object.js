var o={
  a: 7,
  get b() {
    return this.a + 1
  },
  set c (x) {
    this.a = x/2
  }
}
console.log(o.a)
console.log(o.b)
o.c = 50
console.log(o.a)

var obj = {d: 4}
Object.defineProperties(obj, {
  e: {
    get: function () {
      return this.d + 5
    }
  },
  f: {
    set: function (x) {
      this.d = x/3
    }
  }
})
console.log(obj.d)
obj.f = 90
console.log(obj.e)