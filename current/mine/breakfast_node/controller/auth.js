

import Http from '../util/http'
const app_id = 'wx3022dcc24392f936'
const app_secret = '177938e8ebb95ac99ea56cd08da74d68'
export default class Auth {
  static async getSessionKey (ctx, next) {
    ctx.body = await Http.get(`https://api.weixin.qq.com/sns/jscode2session?appid=${app_id}&secret=${app_secret}&js_code=${ctx.request.body.code}&grant_type=authorization_code`)
  }
}