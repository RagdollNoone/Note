外观模式
=======

## 定义

```txt
提供一个统一的接口, 用来访问子系统中的一群接口
外观定义了一个高层接口, 让子系统更容易使用
```

## how

```txt
这个实现很容易, 从定义中就可以理解到, 其实就是对
一对子系统的接口再用一个接口包装一下

举个例子
一个家庭影院播放电影
播放电影就是一个高级接口, 他可能需要
放下幕布
打开机顶盒
打开音响
最后选中电影播放

外观模式其实就是由最少知识原则的思想衍生出来的
```


## 最少知识原则(Law of Demeter)

```txt
这是针对方法调用的原则, 应该这样调用方法
对象本身的方法可以被调用
对象方法中的参数对象的方法可以被调用
方法内创建实例化的对象的方法可以被调用
对象的组建的方法可以被调用

优点: 减少维护成本
缺点: 增长开发周期, 降低运行效率, 难以被理解

所有设计原则都应该在有帮助的时候才遵守!
```

```java
// 从气象站获取温度
// 错误的示范
public float getTemp() {
    // 先取得温度计, 然后从温度计获取温度
    Thermometer thermometer = station.getThermometer();
    return thermometer.getTemperature();
}

// 正确的示范
public float getTemp() {
    // 温度计对外不可见, 外部只能直接访问温度的概念
    // 这样只需要依赖气象站, 而不用额外依赖温度计了
    return station.getTemperature();
}
```

```java
// 一个正确的汽车发动示范
public class Car {
    Engine engine;

    public Car() {
        this.engine = new Engine();
    }

    public void start(Key key) {
        Doors doors = new Doors();
        boolean authorized = key.turns(); // 参数对象的方法可以被调用
        if(authorized) {
            engine.start(); // 组件的方法可以被调用
            updateDashboardDisplay(); // 当前对象的成员方法可以被调用
            doors.lock(); // 当前方法内部创建的对象的方法可以被调用
        }

    }

    public void updateDashboardDisplay() {
        // 更新显示
    }
}
```

## 区别于适配模式

```txt
有时我们需要让一个适配器包装多个被适配的对象
外观模式因此衍生出来(注意是包装而不是封装)
外观的意图是简化接口, 而适配的意图是将原有的接口
转化为新的接口
```
