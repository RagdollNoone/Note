网络是怎样连接的
==============

```txt
URL转成HTTP请求
向DNS查询Web服务器IP
DNS递归查找IP
委托操作系统发消息
```

## URL转成HTTP请求

* 什么是URL

```txt
URL： Uniform Resource Locator
统一资源定位符
```

* 那那些不同类的URL

```txt
HTTP例子

http://user:password@www.glasscom.com:80/dir/file1.htm
user    表示用户名(可省略)
password    表示密码(可省略)
www.glasscom.com    表示Web服务器域名
80  表示端口号(可省略)
/dir/file1.htm  表示文件的路径名
```


```txt
FTP例子

ftp://user:password@ftp.glasscom.com:21/dir/file1.htm
user    表示用户名
password    表示密码
ftp.glasscom.com    表示ftp服务器域名
21  表示端口号
/dir/file1.htm  表示文件的路径名
```

```txt
读取本地文件的例子

file://localhost/c:/path/file1.zip
localhost   表示计算机名(可省略)
c:/path/file1.zip   表示文件名
```

```txt
发送电子邮件的例子

mailto:tone@glasscom.com
tone@glasscom.com   表示邮件地址
```

```txt
新闻组的例子

news:comp.protocols.tcp-ip
comp.protocols.tcp-ip   新闻组名
```

* 怎么解析URL

```txt
根据不同URL的例子, 可以知道标准的URL该被怎样解析
但是实际情况是会有很多的省略, 所以主要讨论有省略时
怎么解析URL
```

```txt
1.省略文件名
http://www.lab.glasscom.com/dir/
访问指定目录下的index.html或者default.htm

2.省略目录名和文件名
http://www.lab.glasscom.com
访问根目录下的index.html或者default.htm

3.有二义性的URL
http://www.lab.glasscom.com/whatisthis
有whatisthis的目录时, 当目录解析
有whatisthis的文件时, 当文件解析
不存在一个目录下有同名的文件和文件夹的情况
```
