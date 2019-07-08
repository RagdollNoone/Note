transition
==========

## State

```txt
实现两个函数指针的Vector, 分别记录进入/退出当前状态的回调列表
本身有Enter/Exit两个函数
被Transition的changeState调用

Enter/Exit函数内部通过命令模式封装调用
最终调用的是machine的callback函数
回调函数会接受到一个event_data的参数
```

## Transition

```txt

```
