## 自动化测试

```txt
Selenium、Jasmine、Cucumber
Travis-CI来跑我们的测试

Code Climate是一个与github集成的工具, 我们不仅仅可以看到测试覆盖率, 还有代码质量.

Jshint定义了一组编码约定, 这比ECMA定义的语言更为严格.
这些编码约定汲取了多年来的丰富编码经验, 并以一条年代久远的编程原则 作为宗旨: 能做并不意味着应该做.
```

## 代码阅读

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

## 网页请求步骤

```txt
大量并发浏览器请求 ---> web服务器集群(nginx) --->
应用服务器集群(tomcat) ---> 文件/数据库/缓存/消息队列服务器集群
```

## 后端知识点

```txt
java基础
设计模式
jvm原理
spring原理及源码
linux
mysql事务隔离与锁机制
mongodb
http/tcp
多线程分布式架构
弹性计算架构
微服务架构
java性能优化
以及相关的项目管理等等。
```

## 前端服务器nginx

```txt
前端服务器负责控制 页面引用,跳转,路由
前端页面异步调用后端的接口
后端/应用服务器使用tomcat(把tomcat想象成一个数据提供者)
加快整体响应速度(这里需要使用一些前端工程化的框架比如nodejs，react，router，react，redux，webpack)

减少后端服务器的并发/负载压力
除了接口以外的其他所有 http请求全部转移到前端 nginx上
接口的请求调用 tomcat 参考nginx反向代理tomcat 且除了第一次页面请求外 浏览器会大量调用本地缓存
```

## Spring的IoC

```txt
低级容器:
只负载加载 Bean 获取 Bean
加载配置文件(从 XML，数据库，Applet)并解析成 BeanDefinition 到低级容器中

高级容器:
支持不同的信息源头 可以访问文件资源 支持应用事件(Observer 模式)。
低级容器加载成功后 高级容器启动高级功能 例如接口回调 监听器 自动实例化单例 发布事件等等功能。

一个IoC启动过程是什么样子的
说白了 就是ClassPathXmlApplicationContext这个类
在启动时都做了啥。
```

## java的单例模式

```txt
需要做到懒加载 线程安全 节省内存
```

* example1
```java
// 这种方式 线程安全 但是一启动就会加载这个类并分配内存
// 如果这个类没有用到 内存就浪费了
public class Singleton {
    private final static Singleton instance = new Singleton();

    private Singleton() {}

    public Singleton getInstance() { return instance; }
}
```

* example2
```java
// 线程安全 节省内存 但是很啰嗦
public class Singleton {
    private volatile static Singleton instance;

    private Singleton() {}

    public Singleton getInstance() {
        if (null == instance) {
            synchronized (Singleton.class) {
                if (null == instance) {
                    instance = new Singleton();
                }
            }
        }

        return instance;
    }
}
```

* example3
```java
// 比较完美的一种写法
// 静态内部类不会在一开始被装载 所有没有内存消耗问题
// JVM在装载静态内部类是线程安全的 只有在使用内部类才会去装载 所以线程是安全的
public class Singleton {

    // 私有类一定要是static的吗
    private static class SingletonHolder {
        private final static Singleton instance = new Singleton();
    }

    private Singleton() {}

    public synchronized Singleton getInstance() { return SingletonHolder.instance; }
}
```

## 并发过程中的原子性/可见性/有序性

- 原子性
```java
i = 2; // 原子操作 读取
i = j; // 非原子操作 读j 写到i
i++; // 非原子 读i 加1 写回主存
i = i + 1; // 同上
```

- 有序性
```java
double pi = 3.14; // A
double r = 1; // B
double s = pi * r * r; // C

// 实际的执行顺序可能是A B C
// 也可能是B A C
```


- 可见性

```txt
修饰符volatile
作用
1. 保证不同线程之间的内存可见性
2. 禁止指令排序

内存可见性
线程有自己的工作内存 通过加载保存操作 才会写入主存或从主存读取
而如果变量用volatile来修饰 那么在读的时候 由于可见性会发现工作
内存当中的缓存值失效 进而去主存读取最新的值

volatile用来保证可见性 有序性
实际代码的用法 修饰状态量
```

- example

```java
int a = 0;
boolean flag = false;

public void write() {
    a = 2; // A
    flag = true; // B
}

public void mutiply() {
    if (flag) {
        int ret = a * a; // C
    }
}
// 两个线程 分别运行write和mutiply
// 当write执行完成之后 变量没有写入主存之前 执行了mutiply
// flag依然为false 不会得到预期结果 a的值也可能是0而不是2
// 所以flag应该被volatile修饰
```

## 进程

```txt
程序执行一次的过程
进程的创建到销毁 代表着一个程序的运行周期
```

## 线程

```txt
线程共享进程的堆和方法区
有自己的本地方法栈

守护线程
非守护线程

守护线程为所有非守护线程提供服务

创建线程的三种方法
extends Thread
implement Runnable
implement Callable
```

## 线程池

```txt
1. newFixedThreadPool 创建固定大小数量线程池，数量通过传入的参数决定。

2. newSingleThreadExecutor 创建一个线程容量的线程池，所有的线程依次执行，相当于创建固定数量为 1 的线程池。

3. newCachedThreadPool 创建可缓存的线程池，没有最大线程限制（实际上是 Integer.MAX_VALUE）。如果用空闲线程
等待时间超过一分钟，就关闭该线程。

4. newScheduledThreadPool 创建计划 (延迟) 任务线程池, 线程池中的线程可以让其在特定的延迟时间之后执行，也可以以固定的时间重复执行（周期性执行）。相当于以前的 Timer 类的使用。

5. newSingleThreadScheduledExecutor 创建单线程池延迟任务，创建一个线程容量的计划任务。
```

## 网站目标

```txt
1. 学习 HTML 基本语法。
2. 学习 CSS 如何选中 HTML 元素并应用一些基本样式。
3. 学会用 Firefox + Firebug 或 Chrome 查看你觉得很炫的网页结构，并动态修改。
4. 在一台 Linux 机器上配置 LEMP - Ubuntu/Nginx/PHP/MySQL 这个环境。
5. 学习 PHP，让后台 PHP 和前台 HTML 进行数据交互，对服务器相应浏览器请求形成初步认识。实现一个表单提交和反显的功能。
6. 把 PHP 连接本地或者远程数据库 MySQL（MySQL 和 SQL 现学现用够了）。
```

## 网站实践项目

```txt
做一个非常简单的 Blog 系统，或是 BBS 系统，需要支持如下功能：
1. 用户登录和注册（不需密码找回）。
2. 用户发贴（不需要支持富文本，只需要支持纯文本）。
3. 用户评论（不需要支持富文本，只需要支持纯文本）。

你需要从前端一直做到后端，也就是说，从 HTML/CSS/JavaScript，到后面的 PHP（Python/Node.js），再到数据库。
这其中需要你查阅很多的知识。这里有几个技术点你需要关注一下。

- 用户登录时的密码不应该保存为明文，应该用 MD5+Salt 来保存（关于这个是什么，希望你能自行 Google）。
- 用户登录后，对于用户自己的贴子可以有“重新编辑”或 “删除”的功能，但是无权编辑或删除其它用户的贴子。
- 数据库的设计，你需要三张表：用户表、文章表和评论表，它们之间是怎么关联的，你需要学习一下。

研究一下下面这几个事。
1. 图片验证码。上传图片。
2. 阻止用户在发文章或评论时输入带 HTML 或 JavaScript 的内容。
3. 防范 SQL 注入。
```

## java默认继承Object

```txt
编译器处理
在编译源代码时，当一个类没有显式标明继承的父类时，编译器会为其指定一个默认的父类（一般为 Object），而交给虚拟机处理这个类时，由于这个类已经有一个默认的父类了，因此， VM仍然会按照常规的方法像处理其他类一样来处理这个类。对于这种情况，从编译后的二进制角度来看，所有的类都会有一个父类（后面可以以此依据来验证）。

JVM处理
编译器仍然按照实际代码进行编译，并不会做额外的处理，即如果一个类没有显式地继承于其他类时，编译后的代码仍然没有父类。然后由虚拟机运行二进制代码时，当遇到没有父类的类时，就会自动将这个类看成是 Object类的子类（一般这类语言的默认父类都是 Object）。
```

## wait和sleep

```txt
1. 两者最主要的区别在于：sleep 方法没有释放锁，而 wait 方法释放了锁 。
2. 两者都可以暂停线程的执行。
3. Wait 通常被用于线程间交互/通信，sleep 通常被用于暂停执行。
4. wait() 方法被调用后，线程不会自动苏醒，需要别的线程调用同一个对象上的 notify() 或者 notifyAllsleep() 方法执行完成后，线程会自动苏醒。
```
