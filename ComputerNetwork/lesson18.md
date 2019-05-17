ravindrababu ravula Computer Network
====================================

## lesson18

* 传输延时的转换

```txt
三种单位 m(米), bits, s(秒)
m / v(波的传播速度) = s = bits / bw(带宽)

eg:
已知10bits, bw = 4mbps, v = 2 * 10^8(m/s) 求m
m = bits / bw * v
  = 10 / (4 * 10^6) * 2 * 10^8 = 500m
```

* 令牌传输协议

```txt
这是一种应用于广播链路的协议
所以所讨论的模型是, 从一个节点出发的数据, 能被剩下的所有节点接收到
数据一定要沿着某条固定的链路发送

分delayed token和early token两种,
delayed token释放token的条件是:
当前节点发送的数据, 走了一圈后回到当前节点, 才会释放token.
early token释放token的条件是:
当前节点发送完数据后立刻释放token.

THT = Token Holding Time

关于Cycle Time和Useful Time
Cycle Time的讨论是基于Token数据包的某一位来说的, 所以Useful Time也是应用这个概念,
讨论特定的一位数据位的实际传输时间
```
