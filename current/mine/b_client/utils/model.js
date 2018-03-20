const Http = require('./http.js')
const api_url = 'http://127.0.0.1:9000'
const login = (param = {}) => {
  return Http.POST(api_url + '/auth/getsessionkey', param)
}
const saveUserInfo = (param = {}) => {
  return Http.POST(api_url + '/user/saveuserinfo', param)
}
const updateUserByOpenid = (param = {}) => {
  return Http.POST(api_url + '/user/updateuserbyopenid', param)
}
const addPicture = (param = {}) => {
  return Http.POST(api_url + '/picture/addpicture', param)
}
module.exports = {
  login: login,
  saveUserInfo: saveUserInfo,
  updateUserByOpenid: updateUserByOpenid,
  addPicture: addPicture
}