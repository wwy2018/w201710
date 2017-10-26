#coding=utf-8
import numpy as np 
class Perceptron(object):
  """
  eta: 学习率
  n_iter: 权重向量训练次数
  errors：用于记录神经元判断出错次数
  """
  def __init__(self,eta=0.01,n_iter=10):
    self.eta=eta
    self.n_iter=n_iter
    pass
  def fit(self, X, y):
    """
    X: 输入样本
    X: shape[n_samples,n_features]
    X: [[1,2,3],[3,4,4]]
    n_samples:2
    n_features:3
    y:对应样本分类
    y:[1,-1]
    """
    self.w_=np.zeros(1+X.shape[1])
    self.errors_=[]
    for _ in range(self.n_iter):
      errors=0
      for xi, target in zip(X,y):
        update=self.eta * (target-self.predict(xi))
        self.w_[1:]+=update*xi
        self.w_[0]+=update
        errors+=int(update != 0.0)
        self.errors_.append(errors)
        pass
      pass
  def net_input(self,X):
    return np.dot(X,self.w_[1:])+self.w_[0]
    pass
  def predict(self,X):
    return np.where(self.net_input(X)>=0.0 , 1, -1);
    pass

import pandas as pd 
# header=None 表示第一行不是说明 而是真实数据
df=pd.read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", header=None)

import matplotlib.pyplot as plt 
y=df.loc[0:100, 4].values
y=np.where(y == 'Iris-setosa', -1, 1)
X=df.iloc[0:100, [0, 2]].values
plt.scatter(X[:50, 0], X[:50, 1], color='red', marker='o', label='setosa')
plt.scatter(X[50:100, 0], X[50:100, 1], color='blue', marker='x', label='versicolor')
plt.xlabel('花瓣长度')
plt.ylabel('花径长度')
plt.legend(loc='upper left')
# plt.show()

ppn=Perceptron(eta=0.1, n_iter=10)
ppn.fit(X,y)
plt.plot(range(1, len(ppn.errors_)+1), ppn.errors_, marker='o')
plt.xlabel('Epochs')
plt.ylabel('错误分类次数')
# plt.show()

from matplotlib.colors import ListedColormap
def plot_decision_regions(X,y,classifier, resolution=0.02):
  markers=('s', 'x', 'o', 'v')
  colors=('red', 'blue', 'lightgreen', 'cyan')
  cmap=ListedColormap(colors[:len(np.unique(y))])
  x1_min, x1_max=X[:,0].min()-1, X[:,0].max()
  x2_min, x2_max=X[:,1].min()-1, X[:,1].max()
  xx1,xx2=np.meshgrid(np.arange(x1_min,x1_max,resolution),np.arange(x2_min,x2_max,resolution))
  Z=classifier.predict(np.array([xx1.ravel(), xx2.ravel()]).T)
  Z=Z.reshape(xx1.shape)
  plt.contourf(xx1,xx2,Z,alpha=0.4,cmap=cmap)
  plt.xlim(xx1.min(),xx1.max())
  plt.ylim(xx2.min(),xx2.max())
  for idx, cl in enumerate(np.unique(y)):
    print(idx)
    plt.scatter(x=X[y==cl,0],y=X[y==cl,1],alpha=0.8,c=cmap(idx),marker=markers[idx],label=cl)
  print(Z)
plot_decision_regions(X, y, ppn, resolution=0.02)
plt.xlabel('花瓣长度')
plt.ylabel('花径长度')
plt.legend(loc='upper left')
plt.show()