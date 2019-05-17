UiMgr
====

* 定义了一个UiMgrMessageThread类型的线程 专门处理消息队列
* publish是把消息压入消息队列当中去
* viewManager是全局单例, 被UiFrame继承

* sendMessage是把具体类的sendMessage发送到viewManager的send接口

最后调到UiMgr的send接口, 走TaskMgr把消息压入队列

* TaskMgr的messageQueue和UiMgr的messageQueue是两个独立的队列

ui接收的消息队列是UiMgr当中的消息队列

消息发送是压入TaskMgr的消息队列



- [ ] 两边消息队列是怎么同步的, UiMgr的消息队列是怎么压入的
