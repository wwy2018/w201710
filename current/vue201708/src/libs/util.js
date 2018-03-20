import axios from 'axios'
import env from '../config/env'
let util={
  path: env === 'development' ? 'http://w.oa.com/index.php' : env === 'production' ? 'http://admin.wx.eub-inc.com/index.php' : 'http://admin.wx.eub-inc.com/index.php'
}
util.ajax=axios.create({
  timeout: 30000
})
export default util
