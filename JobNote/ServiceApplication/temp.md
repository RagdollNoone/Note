temp
====

## 消息

* 基本数据结构

```txt
SiMessage
SocketMessage
```

> AbstractView继承InterfaceMessageReceiver接口, 使其能够接收消息,
>
>  并接受ui消息 可以把所有的topmenu上的功能按钮认为是一条命令消息

> AbstractView定义了ViewManager的单例, 使其能够发送消息

> 每个View当中constructMessage负责构造当前功能模块用到的消息
> messageReceived定义了消息回到SC层面的处理业务逻辑

> 消息链的传递:UiMgr的UiMgrMessageThread线程调用UiFrame的MessageReceived
> 再通过这个函数, 调到各个继承InterfaceMessageReceiver接口的类的接收函数



## 点击事件

* 具体的Button点击操作的执行逻辑

```txt
继承了JButton后重写actionPerformed函数
匿名回调中调用具体的业务逻辑
这些逻辑都定义在对应的Panel类当中
```


## 构造逻辑

* Ui构建初始化

通过一个预定义的枚举数组来构建对应的View对象, 构造的过程中

1. 先调用具体类的构造函数
2. 调用父类AbstractView的构造函数
3. 然后再调到派生类的init, constructGUI函数
4. 最后调到对应的Panel函数

```java
private void createAndShowGUI() {
    // ...
    this.createMenuBarViews();
    // ...
}

```
