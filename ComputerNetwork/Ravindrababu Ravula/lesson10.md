ravindrababu ravula Computer Network
====================================

## lesson10

* transmission delay

```txt
主机发包到链路上的时间差

怎么计算transmission delay
带宽bandwidth是B bits per second
数据包packet长度是L bits

transmission delay = L / B
```

* example

```txt
L = 1000bits B = 1Kbps
delay =  1000 / 1000 = 1s

L = 1kb B = 1Kbps
delay = 1024 / 1000 = 1.024s

需要关心的是数据用K表示 意味着是2^10
而带宽用K表示 意味着是10^3

数据
K	1024
M	1024 * 1024
G	1024 * 1024 * 1024

带宽
K	1000
M	1000 * 1000
G	1000 * 1000 * 1000
```

* propagation delay

```txt
链路上第一个字节到最后一个字节到达目标机子上的时间差

距离distance
速度velocity

delay = distance / velocity

optical fibers 光纤
光的速度是3 * 10^8
但是数据在光纤当中的传输速度是光速的0.7倍

1 millisecond = 10^(-3) second 毫秒
1 microsecond = 10^(-6) second 微秒
```

* delay(发送延时)

```txt
delay = transmission delay + propagation delay
```

* queuing delay(接收方)

```txt
某一个数据包从进入队列到被目标主机处理的时间差

没有公式能计算这个时间差
```

* processing delay(接收方)

```txt
目标主机从缓存池读入数据到内存(被CPU处理)的时间差

没有公式能计算这个时间差
```
