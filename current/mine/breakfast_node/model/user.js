import DB from '../util/db'
class User extends DB {
  constructor () {
    super('user')
  }
  async add (data) {
    return new Promise((resolve, reject) => {
      this.insert(data, (err, res) => {
        resolve(res)
      })
    })
  }
  async getOneByOpenid (openid) {
    return new Promise((resolve, reject) => {
      this.where({openid: openid}).select('*', (err, res) => {
        resolve(res)
      })
    })
  }
  async updateUserByOpenid (openid) {
    return new Promise((resolve, reject) => {
      this.where({openid: openid}).update({openid: openid}, (err, res) => {
        resolve(res)
      })
    })
  }
}
export default new User()