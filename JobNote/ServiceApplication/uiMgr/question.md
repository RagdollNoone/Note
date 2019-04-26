question & todo
===============
- [ ] taskMgr的基本解读 和 View相关的类有什么关系
- [ ] View类除了消息的接收发送 还有没有别的功能 似乎文件很多
- [ ] 一些java基本类的概念
    - [ ] AbstractTableModel
    - [ ] Dimension
    - [ ] JDialog
    - [ ] HashMap
    - [ ] Runnable接口
    - [ ] Thread
    - [ ] synchronized关键字
    - [ ] java类的成员变量 默认的可见性是什么
    - [ ] java参数传递 引用还是值
    - [ ] IdentityHashMap
- [ ] 代码段的解读


```java
Runnable runnable = new Runnable() {
    @Override
    public void run() {
        setHorzScanPosDialog.display();
    }
};

SwingUtilities.invokeLater(runnable);
```
