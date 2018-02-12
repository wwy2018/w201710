function pro(){
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(console.log(new Date().getSeconds()))
    }, 1000)
  })
}
async function fot () {
  for (let i=0;i<5;i++){
    await pro()
    console.log('i', i)
  }
}
fot()