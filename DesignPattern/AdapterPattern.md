适配器模式
=========

## 对象适配器
> 对象适配器通过实现target的接口, 并组合被适配对象, 来完成适配
> 优势: 能匹配target的所有子类

## 类适配器
> 类适配器不是用组合来匹配适配与被适配者, 而是用多重继承来实现的
> 优势: 可能不需要具体实现对应的功能, 应为采用的是继承的方法

## 最少知识原则(Law of Demeter)
> 这是针对方法调用的原则, 应该这样调用方法
> 对象本身的方法可以被调用
> 对象方法中的参数对象的方法可以被调用
> 方法内创建实例化的对象的方法可以被调用
> 对象的组建的方法可以被调用
> 优点: 减少维护成本
> 缺点: 增长开发周期, 降低运行效率, 难以被理解
> 所有设计原则都应该在有帮助的时候才遵守!

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

## 外观模式
> 外观模式其实就是由最少知识原则的思想衍生出来的

## 扩展
* 现实世界需要一个适配器将多种类型适配成指定类型, 因此衍生出外观模式(FacadePattern)
* 双向适配器
* 装饰者模式和适配器模式的对比
