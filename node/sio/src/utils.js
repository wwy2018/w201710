function addSocketId(users, info){
  const {tokenId, userId, socketId} = info
  for (let i=0;i<users.length;i++){
    const user = users[i]
    if (user.tokenId === tokenId) {
      if (user.socketIds.indexOf(socketId) === -1) {
        user.socketIds.push(socketId)
      }
      return
    }
  }
  users.push({
    userId,
    tokenId,
    socketIds: [socketId]
  })
}
function getSocketId(users, tokenId){
  let result = []
  users.forEach(user => {
    if (user.tokenId === tokenId) {
      result = user.tokenIds
    }
  })
  return result
}
function deleteSocketId(users, socketId) {
  for (let i=0;i<users.length;i++){
    const user = users[i]
    let sidIdx = user.socketIds.indexOf(socketId)
    if (sidIdx > -1) {
      user.socketIds.splice(sidIdx, 1)
      if (user.socketIds.length === 0) {
        users.splice(i, 1)
        break
      }
    }
  }
}
module.exports={
  getSocketId,
  addSocketId,
  deleteSocketId
}