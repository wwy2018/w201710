//index.js
//获取应用实例
const app = getApp()
import Model from '../../utils/model'
Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    tempImg: '',
    imgFilePath: '',
    description: '',
    imgResult: ''
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad: function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  uploadImage: function () {
    var that = this
    wx.chooseImage({
      count: 1, // 默认9
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        wx.showLoading()
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        var tempFilePaths = res.tempFilePaths
        wx.getImageInfo({
          src: tempFilePaths[0],
          success: function (__res) {
            that.setData({
              tempImg: tempFilePaths[0]
            })
            wx.hideLoading()
          }
        })
      }
    })
  },
  upload: function (e) {
    var that = this
    wx.showLoading()
    wx.uploadFile({
      url: 'http://127.0.0.1:9000/picture/tailor',
      filePath: that.data.tempImg,
      name: 'file',
      formData:{
        formid: e.detail.formId
      },
      success: (res) => {
        that.setData({
          imgFilePath: JSON.parse(res['data'])['filePath']
        })
        wx.hideLoading()
      }
    })
  },
  blur: function (e) {
    this.setData({
      description: e.detail.value
    })
  },
  confirm: function () {
    Model.addPicture({
      data: {
        openid: app.globalData.openid,
        imgUrl: this.data.imgFilePath,
        description: this.data.description
      },
      sucHandler: (res) => {
        this.setData({
          imgResult: res['data']
        })
      }
    })
  }
})
