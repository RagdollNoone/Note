模板方法
=======

## 定义

```txt
在一个方法中定义一个算法的框架, 而将一些步骤延时到自雷当中.
模板方法可以在不改变算法结构的请况下, 重新定义算法中的某些步骤
```

## Why

```txt
封装具有共性的算法, 比如说泡茶和泡咖啡, 两者都需要
1. 烧开水
2. 泡
3. 倒入杯子
4. 加调料
```

## How

```txt
abstract修饰对应的抽象类
final关键字修饰主体算法函数, 表示不希望被子类覆盖, 细节延时到子类的具体实现
```

```java
abstract class AbstractClass {
    final void templateMethod() {
        primitiveOperation1();
        primitiveOperation2();
        if (hook()) {
            concreteOperation1();
        };
        concreteOperation2();
    }

    abstract void primitiveOperation1();
    abstract void primitiveOperation2();

    void concreteOperation1() {
        // 这里是实现
    }

    void concreteOperation2() {
        // 这里是实现
    }

    boolean hook() { return true; }
}
```

## hook

默认不做的方法, 我们称这种方法为"hook", 子类可以视情况决定是否覆盖
1. 钩子可以让子类实现算法中可选的部分
2. 钩子可以让子类对模板算法当中某些将要发生或刚刚发生的事情做出反应

## 好莱坞原则

```txt
高层组建对于底层组建的态度是, 别调用我们, 我们会调用你
这个原则防止依赖腐败, 使得代码设计难以理解
其实底层组建也可以调用高层组建,但是, 底层组建和高层组建之间不能产生环状依赖
```

## 扩展


```txt
1. 现实中模板方法的例子

```txt
InputStream中的read方法是由子类实现的, 而这个方法又会被
read(byte b[], int off, int len)调用
```

2. JFrame的paint方法是一个钩子
```
