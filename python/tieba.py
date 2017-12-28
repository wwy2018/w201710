# -*- coding: utf-8 -*-
# feimengjuan
import re
import urllib
import urllib2

#抓取网页图片


#根据给定的网址来获取网页详细信息，得到的html就是网页的源代码
def getHtml(url):
    page = urllib.urlopen(url)
    html = page.read()
    return html

def getImg(html):
    #利用正则表达式把源代码中的图片地址过滤出来
    reg = r'src="(.+?\.jpg)" pic_ext'
    imgre = re.compile(reg)
    imglist = imgre.findall(html) #表示在整个网页中过滤出所有图片的地址，放在imglist中
    x = 0
    for imgurl in imglist:
        urllib.urlretrieve(imgurl,'%s.jpg' %x) #打开imglist中保存的图片网址，并下载图片保存在本地
        x = x + 1

html = getHtml("http://tieba.baidu.com/p/2460150866")#获取该网址网页详细信息，得到的html就是网页的源代码
getImg(html)#从网页源代码中分析并下载保存图片