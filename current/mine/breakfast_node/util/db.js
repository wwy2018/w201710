import Mysql from 'mysql'
export default class {
  constructor (table) {
    this.config = {
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'breakfast'
    }
    this.table = table
    this.param = ''
  }
  query (sql, callback) {
    var connection = Mysql.createConnection(this.config)
    connection.connect()
    connection.query(sql, function (err, rows, fields) {
      if (err) throw err
      callback(err, rows)
    })
    connection.end()
    this.param = ''
  }
  insert (param, callback) {
    if (param) {
     var key = Object.keys(param).join(',')
     var value = []
     for (let k in param) {
       value.push(Mysql.escape(param[k]))
     }
     value = value.join(',')
     var sql = `insert into ${this.table} (${key}) values (${value})`
     this.query(sql, callback)
    }
  }
  where (param) {
    if (param) {
      this.param += ' where 1 = 1'
      for (var k in param) {
        this.param += ` and ${k} = ${Mysql.escape(param[k])}`
      }
    }
    return this
  }
  select (field, callback) {
    if (field) {
      //
    } else {
      filed = '*'
    }
    var sql = 'select ' + field + ' from ' + this.table + this.param
    this.query(sql, callback)
  }
  update (param, callback) {
    if (param) {
      var kv = []
      for (var k in param) {
        kv.push(k + '=' + Mysql.escape(param[k]))
      }
    }
    var sql = `update ${this.table} set ${kv.join(',')} ${this.param}`
    console.log('update sql', sql)
    this.query(sql, callback)
  }
}