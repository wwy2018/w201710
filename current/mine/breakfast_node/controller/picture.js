// import GM from 'gm'
// import formidable from 'formidable'
// const FormBody = require("form-body");
// const formBody = new FormBody()
// const path = require('path')
// export default class Picture {
//   static async tailor (ctx) {
//     ctx.set("Access-Control-Allow-Origin", "*")
//     ctx.set("Access-Control-Allow-Credentials", true);
//     ctx.set("Access-Control-Max-Age", 86400000);
//     ctx.set("Access-Control-Allow-Methods", "OPTIONS, GET, PUT, POST, DELETE");
//     ctx.set("Access-Control-Allow-Headers", "x-requested-with, accept, origin, content-type");
//     const result = await formBody({
//       ctx: ctx,
//       path: path.join(__dirname, "../img"),
//       dir: "/",
//       rule: function() {
//         return false;
//       }
//     });
//     console.log(result);
//   }
// }
import {User as UserModel} from '../model'
import {Picture as PictureModel} from '../model'
const Busboy = require('busboy')
const fs = require('fs')
const path = require('path')
function mkdirSync(dir) {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir)
  }
}
function getSuffixName( fileName ) {
  let nameList = fileName.split('.')
  return nameList[nameList.length - 1]
}
function uploadFun (ctx) {
  let req = ctx.req
  let busboy = new Busboy({headers: req.headers})
  let filePath = 'img'
  let mkdirResult = mkdirSync(filePath)
  return new Promise(resolve => {
    let result = {
      success: false,
      filePath: '',
      formData: {}
    }
    busboy.on('file', function(fieldname, file, filename, encoding, mimetype) {
      let fileName = Math.random().toString(16).substr(2) + '.' + getSuffixName(filename)
      let _uploadFilePath = path.join( filePath, fileName )
      let saveTo = path.join(_uploadFilePath)

      // 文件保存到指定路径
      file.pipe(fs.createWriteStream(saveTo))

      // 文件写入事件结束
      file.on('end', function() {
        result.success = true
        result.filePath = saveTo
        result.message = '文件上传成功'
        console.log('文件上传成功！')
      })
    })
    // busboy.on('field', function(fieldname, val, fieldnameTruncated, valTruncated, encoding, mimetype) {
    //   console.log('表单字段数据 [' + fieldname + ']: value: ' + inspect(val));
    //   result.formData[fieldname] = inspect(val);
    // });
  
    // 解析结束事件
    busboy.on('finish', function() {
      console.log('文件上传结束')
      resolve(result)
    })
  
    // 解析错误事件
    busboy.on('error', function(err) {
      console.log('文件上传出错')
      reject(result)
    })

    req.pipe(busboy)
  })
}
export default class Picture {
  static async tailor (ctx) {
    ctx.body = await uploadFun(ctx)
  }
  static async addPicture (ctx) {
    let param = ctx.request.body
    let openid = param['openid']
    let user = await UserModel.getOneByOpenid(openid)
    let data = {}
    data['user_id'] = user[0]['id']
    data['img_url'] = path.join('http://localhost:9000', param['imgUrl'])
    data['description'] = param['description']
    await PictureModel.add(data)
    ctx.body = data['img_url']
  }
}