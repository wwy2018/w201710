let isd: boolean = false
console.log('is', isd)
enum Color {Red, Green, Blue}
let c: Color = Color.Green
console.log('c', c)

function printLabel(labelObj: {label: string}) {
  console.log(labelObj.label)
}
let myobj = {size: 10, label: 'this is label'}
printLabel(myobj)