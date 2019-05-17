适配器模式
=========

## 定义

```txt
将一个类的接口, 转换成客户希望的另一个接口.
适配器让原本接口不兼容的类可以合作
```

## Why

```txt
希望现有的代码能够兼容新的接口, 而不用改变原有的代码
理论上, 我们应该尽可能的去实现对象适配器
```

## How

1. 对象适配器

```txt
对象适配器通过实现target(适配对象)的接口, 并组合被适配对象,
来完成适配, 适配的过程是单向的, A适配B和B适配A, 是不等价的,
需要写两个适配的接口来实现

优势: 能匹配target的所有子类
```

```java
public interface Duck {
    void fly();
    void quack();
}

public interface Turkey {
    void fly();
    void gobble();
}

public class DuckAdapter implements Duck {
    private Turkey turkey;

    public DuckAdapter(Turkey turkey) {
        this.turkey = turkey;
    }

    @Override
    public void quack() {
        turkey.gobble();
    }

    @Override
    public void fly() {
        turkey.fly();
    }
}


```

2. 类适配器

```txt
类适配器不是用组合来匹配适配与被适配者, 而是用多重继承来实现的

优势: 可能不需要具体实现对应的功能, 应为采用的是继承的方法
```

## 扩展
* 现实世界需要一个适配器将多种类型适配成指定类型, 因此衍生出外观模式(FacadePattern)
* 双向适配器
* 装饰者模式和适配器模式的对比
