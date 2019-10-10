网络是怎样连接的
==============

# 第一章

```txt
概要

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

* 有那些不同类的URL

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

* HTTP请求

```txt
请求包含两个部分
1. 对什么
2. 进行怎样的操作

对什么指的就是URI(统一资源标识符)
URI可以是html文件也可以是cgi文件php文件甚至可以是http:开头的URL

进行怎样的操作有
get 获取文件内容或者返回cgi程序的输出
post    从客户端发送数据
head    只返回消息头
option
put 替换URI上的文件, 如果文件不存在则创建该文件
delete  删除指定文件
trace
connect

最主要的方法就是get和post
```

* 怎么生成HTTP请求消息

```txt
1. 设定方法 在html源码中会指定方法名称get或set
2. 填写URI 从URL当中提取路径
3. 填写消息头
4. 填写消息体 数据在这里填充
```

## 向DNS查询Web服务器IP

* 向DNS服务器查询步骤

```txt
1. 调用DNS服务器的客户端部分(也叫解析器, 是一段socket程序)
如果上层的程序是一段C代码, 那么这个过程就是调用gethostbyname函数
2. 解析器委托给操作系统的协议栈来发送消息, 消息通过网卡发送到远端
3. Windows自动获得DNS服务器是什么概念, DNS服务器会由网络运营商主动提供的,
这一般会写在和家庭端口直连的第一级路由器上
```

* DNS消息信息组成

```txt
域名
class(多余字段)
记录类型(mx表示邮件, A表示IP)
ip地址(值得注意的是邮件地址还配有优先级 数值越是小 更优先)
```

* 具体根据域名查询IP的过程

```txt
假设查询www.lab.glasscom.com这个域名的IP

1. 先查询本机配置的指定的DNS服务器
2. 如果上述DNS服务器没有指定域名的信息, 转发域名到根DNS服务器, 委托它代为查询
3. 如果根服务器也没有相应的信息, 再逐级递归查询, 先查com, 之后glasscom...

实际的情况是com和glasscom可能共享一台实体的DNS服务器, 所以查询次数不会那么多
并且com所在的DNS服务器可能会被缓存
不存在的域名也会被缓存

另一个需要注意的是缓存的信息有可能过时, 所以超过有效期后应该被删除
```

## 委托协议栈发送数据

* 收发数据的过程

```txt
服务器创建socket
客户端连接
通过管道收发数据
断开管道删除socket
```

* 连接的过程

```txt
调用connect函数

需要知道
socket的文件描述符
ip
端口

注意本地的应用程序和socket通信时运用的是文件描述符
而两端的socket通信时需要用端口
设计是可以理解的 本地的文件描述符应该是私有的

服务端的端口号根据程序功能 采用默认约定的端口号码
客户端的端口号是随机分配连接时告诉服务端
所以接下来的读写操作只要传客户端的端口信息即可

可以认为端口号和文件描述符是做着同样的事情 只是面向的对象不同
```

# 第二章

```txt
概要

创建socket
连接服务器
收发数据
断开并删除socket
IP与以太网包收发操作
UDP收发数据操作
```

## 层次间的分工及名词解释

``` txt
TCP: Transmission Control Protocol
UDP: User Datagram Protocol
IP: Internet Protocol

ARP: Address Resolution Protocol
ICMP: Internet Control Message Protocol

0. socket可以认为是描述通信连接的状态的内存空间
1. socket中的解析器: 负责查询DNS(gethostbyname)
2. 协议栈: 就是TCP/UDP IP的总称 属于操作系统层 ICMP和ARP又是IP的子集
3. 一般应用程序发送数据采用TCP DNS查询等收发较短数据时采用UDP
4. ICMP用于告知传送过程中产生的错误及各种控制消息
5. ARP用于根据IP地址查找MAC地址
```

## socket信息

```txt
使用windows命令:
netstat -ano

协议类型
本地IP
远端IP
状态
PID(进程号)

IP0.0.0.0表示还没有建立连接 IP地址不确定
状态
LISTENING表示等待对方连接
ESTABLISHED表示连接完成 正在进行数据通信
多个IP地址意味着有多个网卡
```

## 创建socket

```txt
开辟出一块内存空间存放通信的信息和状态 返回一个文件描述符(int)
```

## connect

```txt
连接的实质是交换通信两端的控制信息 并把这些信息存储到socket当中
以及做好收发数据的准备这一系列的操作

在客户端这边需要把应用程序知道的目标IP告诉给底层的协议栈
服务器这边需要客户端告知自身的IP和端口信息

注意执行读写操作时 需要分配一块内存空间作为缓冲区 这也是连接的时候分配的
(这个缓冲区的大小 是否会益出)
```
