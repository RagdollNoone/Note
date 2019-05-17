SingletonPattern
================

## 定义

```txt
确保一个类只有一个实例, 并提供一个全局访问点
```

## Why

```txt
1. 创建下列对象
线程池
数据库链接
缓存
对话框
偏好设置
注册表
日志对象
充当打印机
显卡设备的驱动程序

2. 延时创建实例对象
```

## How

```java
// 需要注意的是, 构造函数应该被声明为私有的

// way 1
public class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (null == instance) {
            return new Singleton();
        } else {
            return instance;
        }
    }
}


// way 2
public class Singleton {
    private class SingletonHolder {
        public static Singleton instance = new Singleton();
    }

    private Singleton() {}

    public static Singleton getInstance() {
        return SingletonHolder.instance;
    }
}

```

## 和全局变量的区别

```txt
全局变量必须程序一开时的时候就创建, 如果比较耗资源, 又一直没有用到, 就很不划算
运行时, 需要创建
```

## 多线程对这个模式的影响(三种需求和实现方式)

* 同步的getInstance方法(synchronized修饰)
* 急切的实例化(没有条件执行长时间的new操作)
* 双重检查枷锁(volatile)

```txt
第一次调用需要synchronized修饰, 之后就没有必要了
如果需要调用性能, 不希望添加synchronized来修饰,
但是又想快速的获得对象, 那么在静态初始化器当中做new的操作
```

## 扩展

* volatile关键字
* 类的加载器(多个类的加载器加载单例类 还是有可能出现多个单例对象的)
* 单件类为什么需要被继承, 继承时共享单例变量, 需要实现注册表让子类工作顺利
* 如果一个单例的对象的静态获取方法是synchronized修饰的, 当其他对象获取他, 并改变其内部状态时, 会不会对其他使用者产生影响
