import {User as UserModel} from '../model'
export default class User {
  static async saveUserInfo (ctx, next) {
    let param = ctx.request.body
    let info = param['info']
    let data = {}
    data['openid'] = param['openid']
    data['nick_name'] = info['nickName']
    data['avatar'] = info['avatarUrl']
    data['gender'] = info['gender']
    data['province'] = info['province']
    data['city'] = info['city']
    data['country'] = info['country']
    data['encrypted_data'] = param['encryptedData']
    data['iv'] = param['iv']
    let has = await UserModel.getOneByOpenid(param['openid'])
    if (has.length) {
      ctx.body = await UserModel.updateUserByOpenid(ctx.request.body.openid)
    } else {
      ctx.body = await UserModel.add(data)
    }
  }
  static async getOneByOpenid (ctx) {
    ctx.body = await UserModel.getOneByOpenid(ctx.request.body.openid)
  }
}