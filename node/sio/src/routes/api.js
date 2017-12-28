const express = require('express')
const router = express.Router()
const {getSocketId} = require('./../utils')
router.use(function timeLog(req, res, next){
  const m=new Date()
  const dateString=`${m.getFullYear()}/${m.getMonth()+1}/${m.getDate()} ${m.getHours()}:${m.getMinutes()}:${m.getSeconds()}`
  console.log('time: ', dateString)
  next()
})
router.post('/api', function(req, res){
  if (process.env.NODE_ENV === 'development') {
    console.log('---req body---')
    console.log(req.body)
    console.log('---\n')
  }
  const {tokens=[], entityType = '', data = {}} = req.body
  tokens.forEach(tokenId => {
    const socketIds = getSocketId(users, tokenId)
    socketIds.forEach(function(socketId){
      io.sockets.to(socketId).emit('receive_msg', {
        entityType,
        data
      })
    })
  })
  res.send({
    responseCode: 000,
    data: 'OK'
  })
})
module.exports = router