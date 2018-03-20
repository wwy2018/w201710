export default {
  serialize: function (json) {
    var arr=[]
    for (var k in json) {
      json[k]=json[k] ? ((typeof json[k] === 'object' && json[k].constructor === Array) ? json[k].join(',') : json[k]) : ''
      var str=k + '=' + json[k]
      arr.push(str)
    }
    return arr.join('&')
  },
  deserialize: function (str) {
    var arr=str.split('&')
    var data={}
    for (var i=0;i<arr.length;i++) {
      var _arr=arr[i].split('=')
      data[_arr[0]]=_arr[1].indexOf(',') >= 0 ? _arr[1].split(',') : _arr[1]
    }
    return data
  },
  extends: function (obj1, obj2, flag) {
    var k
    if (flag === true) {
      for (k in obj2) {
        obj1[k]=obj2[k]
      }
    } else {
      for (k in obj1) {
        if (obj2[k]) {
          obj1[k] = obj2[k]
        }
      }
    }
    return obj1
  },
  uuid: function (len=8) {
    var chars='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('')
    var uuid=[]
    var i
    if (len) {
      for (i=0;i<len;i++) {
        uuid[i]=chars[0 | Math.random()*chars.length]
      }
    } else {
      var r
      uuid[8]=uuid[13]=uuid[18]=uuid[23]='-'
      uuid[14]='4'
      for (i=0;i<36;i++) {
        if (!uuid[i]) {
          r = 0 | Math.random() * 16
          uuid[i] = chars[(i === 19) ? (r & 0x3) | 0x8 : r]
        }
      }
    }
    return uuid.join('')
  },
  getDate (str) {
    var now=new Date(str)
    return now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate()
  },
  getTime (str) {
    var now = new Date(str)
    return now.getHours() + ':' + now.getMinutes()
  },
  getNextDate (str, num) {
    var dd = new Date()
    dd.setDate(dd.getDate()+num)
    var y=dd.getFullYear()
    var m=dd.getMonth()+1
    var d=dd.getDate()
    return y+'-'+m+'-'+d
  }
}