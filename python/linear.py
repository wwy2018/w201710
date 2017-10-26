import numpy as np
from sklearn import datasets
class LinearRegression():
  def __init__(self):
    self.w=None
  def fit(self,X,y):
    X=np.insert(X,0,1,axis=1)
    print(X.shape)
    X_=np.linalg.inv(X.T.dot(X))
    self.w=X_.dot(X.T).dot(y)
  def predict(self, X):
    X=np.insert(X,0,1,axis=1)
    y_pred=X.dot(self.w)
    return y_pred