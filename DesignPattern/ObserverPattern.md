观察者模式
========

## idea

> 有些时候， 观察者之间的逻辑是有相互依赖的, 比如说ObserverN的update需要
> Observer1到ObserverM的update执行完了之后才应该被执行, 对于这种扩展,
> 可以针对notify设计成为树形遍历来满足需求
