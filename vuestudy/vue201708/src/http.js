import Util from './libs/util'
import Base from './base'
import Cookies from 'js-cookie'
export default class Http {
  static get (path, data={}) {
    var url=(path.indexOf('http://') > -1 || path.indexOf('https://') > -1) ? path : ((Util.path ? Util.path : '') + path)
    var pathArr = url.split('?')
  }
}