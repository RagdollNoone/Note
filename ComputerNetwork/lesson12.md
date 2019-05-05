ravindrababu ravula Computer Network
====================================

## lesson12

* channel/wire/link

```txt
1. channel的种类
full duplex 双向传输无碰撞
half duplex 单向传输

2. channel的容量计算
capacity = BW * Tp (容量 = 带宽 * 传输延时)
需要注意的是full duplex的容量是2倍

3. 容量的分类
如果容量非常大 称之为thick channel
反之 称之为thin channel (stop and wait的传输协议适合这种channel)

4. capacity, Tp, BW, 传输效率间的关系
传输效率 = 1 / (1 + 2a)
a = Tp / Tt = Tp * B / L(data) = capacity / L
```

* more about stop and wait protocol

```txt
为了提高传输效率, 把单次传输一个packet的方式改为单次输出一个window的数据
可以把window等同认为senderbuff

所以可以这样说, senderbuff有2个作用
I.提高传输效率
II.提高可靠性, 因为需要支持重发机制
```

* exercise

```txt
see picture
```
