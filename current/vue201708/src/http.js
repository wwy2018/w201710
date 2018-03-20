// import Util from './libs/util'
// import Base from './base'
// import Cookies from 'js-cookie'
import Axios from 'axios'
Axios.interceptors.request.use(config => {
  config.headers.authorization = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpcCI6IjEyNy4wLjAuMSIsImlkIjoxLCJ1c2VyX25hbWUiOiJhZG1pbiIsInVzZXJfdHlwZSI6MSwidXNlcl9lbWFpbCI6IiIsImNyZWF0ZV90aW1lIjoiMjAxOC0wMy0wOVQwNToyODoyMS4wMDBaIiwibG9naW5faXAiOiIiLCJ1cGRhdGVfdGltZSI6IjIwMTgtMDMtMDlUMDY6MzM6MDguMDAwWiIsInVzZXJfcGljIjoiIiwidXNlcl9leHRlbmQiOm51bGwsImlhdCI6MTUyMDU3NzI0MCwiZXhwIjoxNTIwNTg0NDQwfQ.BfOGrrs2W-NhK4PaOMo6a5eZtHBhYvXHAl1Sk8M7vgc'
  return config
})
export default class Http {
  static post (path, data = {}) {
    return new Promise(resolve => {
      data['ip'] = '127.0.0.1'
      Axios.post(path, data).then(res => {
        resolve(res)
      })
    })
  }
}
