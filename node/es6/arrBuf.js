var buf = new ArrayBuffer(32)
var dataView = new DataView(buf)
dataView.getUint16(8)
console.log(dataView.getUint16(8))