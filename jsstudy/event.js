var events = require('events')
var et = new events.EventEmitter()
var callback = function () {console.log('www')}
et.on('ww', callback)
et.emit('ww')