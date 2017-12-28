var fn_index = async (ctx, next) => {
  ctx.response.body = `<form action="/signin" method="post">
    <p>Name: <input name="name" value="koa"></p>
    <p>Password: <input name="password" type="password"></p>
    <p><input type="submit" value="Submit"></p>
  </form>`
}
var fn_signin = async (ctx, next) => {
  var name = ctx.request.body.name || '', password = ctx.request.body.password || ''
  if (name === 'a' && password === '1') {
    ctx.response.body = 'welcome'
  } else {
    ctx.response.body = 'pls login'
  }
}
module.exports = {
  'GET /': fn_index,
  'POST /signin': fn_signin
}