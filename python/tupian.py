# -*- coding: utf-8 -*-
import re
import urllib
import urllib2
import os

def getHtml(url):
  page=urllib.urlopen(url)
  html=page.read()
  return html

def makeDir(path):
  path=path.strip()
  isExists=os.path.exists(path)
  if not isExists:
    print 'not exist'
    os.makedirs(path)
    return True
  else:
    print 'success'
    return False
def saveImg(imglist):
  number=1
  for imageUrl in imglist:
    splitPath=imageUrl.split('/')
    if len(splitPath) > 2:
      tail=splitPath[2]
      name=splitPath[1]
    else:
      name = splitPath[0]
      tail =splitPath[1]
    
    makeDir(name)
    fileName=name + '/'+tail
    imageUrl = 'https://community.xiaojukeji.com/market/naoneiyinxiangguan/'+imageUrl
    try:
      u=urllib2.urlopen(imageUrl)
      data=u.read()
      f=open(fileName, 'wb+')
      f.write(data)
      print 'save'
      f.close()
    except urllib2.URLError as e:
      print e.reason
    number +=1
def getImg(html):
  reg=r'src-data="(.*?\.png)'
  imgre=re.compile(reg)
  imglist=re.findall(imgre,html)
  return imglist
  # print(imglist)
  # x=0
  # for imgurl in imglist:
  #   imgurl = 'https://community.xiaojukeji.com/market/naoneiyinxiangguan/'+imgurl
  #   urllib.urlretrieve(imgurl,'%s.png' % x)
  #   x+=1
if __name__=='__main__':
  html=getHtml('https://community.xiaojukeji.com/market/naoneiyinxiangguan/img/num.png')
  path = 'img'
  makeDir(path)
  list=getImg(html)
  saveImg(list)

