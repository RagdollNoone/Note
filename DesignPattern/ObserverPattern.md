观察者模式
========

## 定义

```txt
描述对象间一对多的概念, 当一的部分改变时, 多的部分都会收到通知
并自动更新
```

## Why

```java
public class WeatherData {
    // 变量声明

    public void measurementsChanged() {
        float temperature = getTemperature();
        float humidity = getHumidity();
        float pressure = getPressure();

        // display是用来显示数据变化的具体对象
        // 这样设计会导致每次添加删除具体的对象就要修改这里的代码
        // update的参数被绑定了, 如果要扩展, 将会变得相当困难
        display1.update(temperature, humidity, pressure);
        display2.update(temperature, humidity, pressure);
        display3.update(temperature, humidity, pressure);
    }

    // 其他方法
}
```

## How

```txt
主题拥有状态对象, 比如之前给出的温度, 湿度, 气压,
也就是说是真正拥有数据的对象

存储观察者对象的一个list, 并提供加入/离开list的public
函数, 当状态发生改变时, 告诉每个观察者

观察者依赖主题告诉他们, 他们所关心的状态何时发生了改变
然后实现自己对于状态变化的业务逻辑

观察者应该存储subject对象的引用, 应为自己需要决定何时
加入/退出观察者的list

对于数据更新的模式可以选择主题推送给观察者, 也可以由观察者
自己主动去拉数据, 如果主动去拉的话, 主题应该实现每个状态的
get方法, 拉的优势在于, update的扩展性变强了, 应为参数不
再绑定了, 观察者收到状态更新的消息, 然后根据自身的业务逻辑
决定去要什么数据

对于数据状态, 可以有设计hasChange的boolean字段, 应为这样
可以让数据的更新变的可控(依赖对应的set方法), 而不是状态一改
变就推送
```

## notice

```txt
不要依赖观察者被通知的次序, 这是具体实现决定的
```

## 设计原则

```txt
专注于代码的松耦合, 应对可能发生的变化
```



## 扩展
* 出版者一般称为"主题", subject; 订阅者称为"观察者", Observer;


## idea

```txt
有些时候， 观察者之间的逻辑是有相互依赖的, 比如说ObserverN的update需要
Observer1到ObserverM的update执行完了之后才应该被执行, 对于这种扩展,
可以针对notify设计成为树形遍历来满足需求
```
