const express = require('express')
const app = express()
const http = require('http').Server(app)
const io = require('socket.io')(http)

const port = 4001
const apiRoute = require('/src/routes/api')
const {addSocketId, getSocketId, deleteSocketId} = require('./src/utils')

app.get('/', function(req, res){
  res.sendFile(__dirname + '/public/index.html')
})
app.post('/api', apiRoute)
io.on('connection', function(socket){
  socket.on('disconnect', function(){
    console.log('user disconnected: ', socket.id)
    deleteSocketId(users, socket.id)
    if (process.env.NODE_ENV === 'development') {
      displayUserInfo()
    }
  })
  socket.on('user_login', function(info){
    const {tokenId, userId, socketId} = info
    addSocketId(users, {tokenId, socketId, userId})
    if (process.env.NODE_ENV === 'development') {
      displayUserInfo()
    }
  })
})

http.listen(port, function(){
  console.log(`listening on port: ${port}`)
})