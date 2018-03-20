//app.js
const Model = require('./utils/model.js')
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)
    var that = this
    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
        Model.login(
          {
            data: {
              code: res['code']
            },
            sucHandler: (_res) => {
              console.log('_res', _res)
              wx.getUserInfo({
                success: __res => {
                  console.log('__res', __res)
                  Model.saveUserInfo({
                    data: {
                      info: __res['userInfo'],
                      openid: _res['data']['openid'],
                      iv: __res['iv'],
                      encryptedData: __res['encryptedData']
                    },
                    sucHandler: ___res => {
                      that.globalData.openid = _res['data']['openid']
                      console.log('that.globalData.openid', that.globalData.openid)
                      getCurrentPages()[0].onLoad()
                    }
                  })
                }
              })
            }
          }
        )
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo
              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
    userInfo: null,
    openid: null
  }
})