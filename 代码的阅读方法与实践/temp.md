切片(slicing)
如果理解一段代码有困难, 把他复制到一个临时的文件当中, 删除所有不相关的部分

难以调试的代码
```txt
守护程序(daemon)
Windows服务
C++基于模板的代码
小服务程序(servlet)
多线程代码
```

分析Java代码可以通过AspectJ向程序当中插入只在特定情况下才运行的代码元来定位问题


定位感兴趣的代码
单独了解各个部分
推断代码和其余代码的关系

极限编程(extreme programming)
敏捷编程(agile programming)


测试用例的作用
重构一个系统前设计好, 当重构完成时, 用这个测试用例验证
代码的正确性

Microsoft Windows API
Win32 SDK API
.NET

帮助阅读代码的途径
编译产生的警告消息

从操作系统传到当前程序的命令行参数
```c
// argc参数个数
// argv实参数组
// argv的位置0 是程序名
int
main (int argc, char **argv) {}
```

```java
public static void main (String args[]) {}
```

strcmp
传递给这个函数的参数不是指向实际数组的指针而是NULL, 会崩溃
返回值不直观, 在相等的时候返回是0, 值的含义上和false相等

所以会有字符串相等的判断宏
```c
# define STREQ(a, b) (*(a) == *(b) && strcmp((a), (b)) == 0)
```

是否所有的程序控制路径上使用变量前都对变量进行了初始化
