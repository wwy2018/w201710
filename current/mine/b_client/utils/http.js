const GET = (url, params = {}) => {
  wx.showLoading()
  wx.request({
    url: url,
    method: 'GET',
    data: params.data,
    header: params.header || {
      'content-type': 'application/json'
    },
    success: (res) => {
      wx.hideLoading()
      params.sucHandler(res)
    },
    fail: params.failHandler || function () {
      wx.hideLoading()
      console.log('网络错误')
    }
  })
}
const POST = (url, params = {}) => {
  wx.showLoading()
  wx.request({
    url: url,
    method: 'POST',
    data: params.data,
    header: params.header || {
      'content-type': 'application/json'
      // 'content-type': 'application/x-www-form-urlencoded'
    },
    success: (res) => {
      wx.hideLoading()
      params.sucHandler(res)
    },
    fail: params.failHandler || function () {
      wx.hideLoading()
      console.log('网络错误')
    }
  })
}
module.exports = {
  GET: GET,
  POST: POST
}