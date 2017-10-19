const Vue = require('vue')
const app=new Vue({
  template: `<div>hello</div>`
})
const renderer=require('vue-server-renderer')
renderer.renderToString(app,(err,html)=>{
  if(err) throw err
  console.log(html)
})