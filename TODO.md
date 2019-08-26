## how to use
https://medium.com/


## 编程博客
https://eli.thegreenplace.net/
https://eklitzke.org/
https://www.fluentcpp.com/
https://preshing.com/

## 性能调优
https://www.agner.org/optimize/


## 计算机网络问题收藏
- Why is sin_addr inside the structure in_addr?
    https://stackoverflow.com/questions/13979150/why-is-sin-addr-inside-the-structure-in-addr/13979177
- Reasoning behind C sockets sockaddr and sockaddr_storage
    https://stackoverflow.com/questions/16010622/reasoning-behind-c-sockets-sockaddr-and-sockaddr-storage
- socket connect() vs bind()
    https://stackoverflow.com/questions/27014955/socket-connect-vs-bind
- Difference between “return 0” and “exit (0)”
    https://stackoverflow.com/questions/17383015/difference-between-return-0-and-exit-0
- What is “standard input”?
    https://stackoverflow.com/questions/19540425/what-is-standard-input
- Select function in socket programming
    https://stackoverflow.com/questions/4171270/select-function-in-socket-programming
- What is uint32_t
    https://stackoverflow.com/questions/48833976/what-is-uint32-t
- 数字签名是什么
    http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html
- Cmake
    https://stackoverflow.com/questions/20944784/why-is-conversion-from-string-constant-to-char-valid-in-c-but-invalid-in-c
-  阅读资源
    https://stackoverflow.com/questions/1711/what-is-the-single-most-influential-book-every-programmer-should-read


## Need To Read
- 鸟哥的linux私房菜
	http://cn.linux.vbird.org/

- 数据库设计那些事
	https://www.imooc.com/learn/117

- operating system
	http://pages.cs.wisc.edu/~bart/537/lecturenotes/titlepage.html
	http://pages.cs.wisc.edu/~remzi/OSTEP/

	https://pdos.csail.mit.edu/6.828/2012/xv6.html
	https://pdos.csail.mit.edu/6.828/2014/schedule.html
	https://pdos.csail.mit.edu/6.828/2014/xv6/book-rev8.pdf
- 状态机
    https://gamedevelopment.tutsplus.com/tutorials/finite-state-machines-theory-and-implementation--gamedev-11867

```txt
    // 状态机
    dst等于自身的transition实现
    dst等于null的transition实现

    queued transition把一系列transition当作一个transition执行完成
    注意回调的执行方式为
    t1 --> after1 --> before2 --> t2 --> after2

    如果下层出现了恐慌, 代码控制权应该返回给StateMachine, 不能断线

    EventData是否需要能被继承 来实现多变的业务逻辑
```

- 跨平台SDK
    https://www.zhihu.com/question/36019568

- book
    The Practice of programming

## UML
- Need Read
    https://www.quora.com/What-is-the-best-way-to-learn-UML

- 读图
    https://www.cnblogs.com/shindo/p/5579191.html

## XMind

## 自动化测试

## C++百万并发网络通信引擎
    https://pan.baidu.com/s/1D-Xyn1Ppm3nlGhTVR7DRmg
    drsi

    ## 代码思考

    ```c++
    // 这段代码输出了f()这句话, 说明A在实例化之前函数已经分配到了地址
    // 那么为什么把f()作为回调传递的时候， f要显式的声明为静态呢
    // 常规的f始终找不到一种合适的写法
    // main.c
    #include <iostream>
    using namespace std;

    class A {
    public:
        void f() {
            cout << "f()" << endl;
        }
    }

    int main() {
        A *a = (A *)NULL;
        a->f();
    }

    ```

```txt
Selenium、Jasmine、Cucumber
Travis-CI来跑我们的测试

Code Climate是一个与github集成的工具, 我们不仅仅可以看到测试覆盖率, 还有代码质量.

Jshint定义了一组编码约定, 这比ECMA定义的语言更为严格.
这些编码约定汲取了多年来的丰富编码经验, 并以一条年代久远的编程原则 作为宗旨: 能做并不意味着应该做.
```

## 自动化测试

```txt
我们并不建议所有的读者都直接看最新的代码，正确的姿势应该是：

clone某个项目的代码到本地
查看这个项目的release列表
找到一个看得懂的release版本，如1.0或者更早的版本
读懂上一个版本的代码
向后阅读大版本的源码
读最新的源码
```

## awesome

```txt
寻找 awesome-xxx：探索可能性

练习新的框架，我总习惯于，编写一系列相关的 DEMO 项目，然后使用 awesome-xxx 探索可能性。

Awesome-xxx 系列，是 GitHub 上最容易赚 star 的类型。但凡是有一定知识度的领域、语言、框架等，都有自己的 awesome-xxx 系列的项目，
如 awesome-python, awesome-iot, awesome-react 等等。在这样的项目里，都以一定的知识体系整理出来的，从索引和查阅上相应的方便。
如果你想进入一个新的领域，会尝试新的东西就搜索 awesome xxx 吧。
```

## 模仿轮子

```txt
模仿轮子的轮子

大学时，我在练习写嵌入式操作系统，uC/OS-II 对于初学者的我来说，太复杂了——有太多无关的代码。便在网上找寻相关的实现，也便是找到了一些，在那的基础上一点点完善操作系统。

学习一个成熟的框架，直接阅读现有源码的成本太高，毕竟也不经济。最好的方式，就是去造轮子。从模仿轮子之上，再去造轮子，是最省力气的方式。
再配合 《造轮子与从Github生成轮子》 一文，怕是能写一系列的框架。而造一个相似轮子的想法，往往很多人都有。尤其是一个成熟的框架，往往有很多仿制品。

于是，当你想了解一个框架，造个轮子，不妨试试搜索 xxx-like 或者 xxx-like framework，
中文便是 仿 react 框架 或者 类 react。
如我们在 Google 上搜索 react-like 就会搜索到 inferno。
不过，按 GitHub 的尿性，要搜索到这样的框架，并不是一件容易的事。这时 Google 往往比 GitHub 搜索好用。

所以建议：平时上班休息时，搜索相关的轮子，回家就可以造轮子了。
```

## 学习资源

```txt
学习资源

GitHub 上拥有大量的学习资源，从各类的文章到笔记，还有各式各样的电子书。如：

只需要搜索：类型 + 笔记，如 操作系统 笔记 就能找到一些操作系统相关的笔记。
只需要搜索：书名 就能找到一些和这本书相关的资源，如 重构 改善既有代码的设计。
```

## 数据

```txt
数据及数据制作工具

当我们需要数据的时候，就会考虑写爬虫。
于是 GitHub 上充满了各各样的式爬虫，除此还有得同学把爬虫数据都放在上面了。
某次，当我在玩 ElasticSearch 搜索引擎的时候，突然需要一些真实的数据用来测试。便得找爬虫，就在 GitHub 上，找到了大众点评的一些爬虫。

这个关键词，就是：scrapy dianping.com，得来不费功夫。

除此，在 AI 相当流行的今天也是如此，也可以搜索到其它同学训练好的模型。
```

## State Machine

```txt
日志系统
选择从错误的状态跳转, 报错
并且要有ignore行为, 即不报错, 自动忽略

状态机要有随机跳转状态的功能, 并且内置变量决定是否开启这项功能
某个trasition可以出现环, 或者说这个trasition可以有两组不同的src和dst
对于某个完全相同的trasition, 只执行查找到的第一个, 之后的全部忽略不执行

支持符号*的展开功能

实现trasition的src和dst是同一个state的情况
实现特殊的trasition, 它的dst是NULL, 实际运行时只触发trasition的回调和state切换的回调

```

## Temp

```txt
状态机和状态图
内存代理
临界区锁
多线程
精准计时器
16位ip
32位eip
64位rip
http://beej.us/guide/bgnet/examples/ 网络的例子
okular pdf mac
微服务 microservice
事务 transaction
活动 activity
SSH Jar包源码项目 ganymed
```
