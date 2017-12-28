var BT=function(){
  var Node=function(key){
    this.key=key
    this.left=null
    this.right=null
  }
  var root = null
  var insertNode=function(node, newNode){
    if (newNode.key < node.key) {
      if (node.left == null) {
        node.left = newNode
      } else {
        insertNode(node.left, newNode)
      }
    }else{
      if (node.right == null) {
        node.right = newNode
      }else{
        insertNode(node.right, newNode)
      }
    }
  }
  this.insert=function(key){
    var newNode=new Node(key)
    if (root == null) {
      root = newNode
    } else {
      insertNode(root, newNode)
    }
  }
  var inOrderTraverseNode=function(node, callback){
    if (node != null) {
      inOrderTraverseNode(node.left,callback)
      callback(node.key)
      inOrderTraverseNode(node.right,callback)
    }
  }
  this.inOrderTraverse=function(root, callback){
    inOrderTraverseNode(root, callback)
  }
  
}
var arr=[8,6,4,0,3,2,1]
var bt=new BT()
arr.forEach((key)=>{
  bt.insert(key)
})
