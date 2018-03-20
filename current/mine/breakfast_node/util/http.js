import Urllib from 'urllib'
export default class {
  static async get (url) {
    return new Promise((resolve, reject) => {
      Urllib.request(url, function (err, data, res) {
        if (err) throw err
        resolve(data.toString())
      })
    })
  }
  static async post (url, data) {
    return new Promise((resolve, reject) => {
      Urllib.request(url, {
        method: 'POST',
        data: JSON.stringify(data)
      }, function (err, data, res) {
        resolve(data.toString())
      })
    })
  }
}