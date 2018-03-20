import DB from '../util/db'
class Picture extends DB {
  constructor () {
    super('picture')
  }
  async add (data) {
    return new Promise(resolve => {
      this.insert(data, (err, res) => {
        resolve(res)
      })
    })
  }
  async getOneById (id) {
    return new Promise(resolve => {
      this.where({id: id}).select('*', (err, res) => {
        resolve(res)
      })
    })
  }
}
export default new Picture()