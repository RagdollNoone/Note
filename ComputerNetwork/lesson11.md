ravindrababu ravula Computer Network
====================================

# lesson11

* flow control

```txt
sender --> receiver

receiver有一个buff池, 会出现以下的情况
receiver处于一个忙的状态
但是sender不知道, 一直以一个很快的速率向receiver发包
当缓存的包的数量大于buff池的长度后, 新到的包就会被discard

所以通信两端的传输 应该是以接收端为重点考虑的
被称之为closed-loop protocol
```

* flow control几种模型

```txt
stop and wait
sender向receiver发一个packet只有收到receiver的信号后才会发第二个
通知可以用acknowledge来表达

优点: 很容易实现
缺点: 有效带宽(效率)不高, 并且会因为一些因素下降, 接收端丢包会导致通讯中断
```