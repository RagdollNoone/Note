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
main (int argc, char **argv[]) {}
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


所有输出, 特别是程序的标准输出重定向到文件时, 会应为各种原因失败
```txt
1. 存储输出的设备没有剩余空间
2. 设备上分配给用户的空间用尽
3. 进程对文件的写入超出进程或系统文件大小的最大限制
4. 输出设备上可能发生硬件错误
5. 文件描述符或与标准输出关联的流或许不能写入
```

阅读策略
```txt
根据函数名猜
阅读函数开始部分的注释
分析如何使用该函数
阅读代码
查阅外部文档
```

比较运算符(==, !=)比赋值运算符(=)更紧密
所以代码应该这样写
```c
int
main(int argc, char *argv[]) {
    int c; // 用整型匹配可能的异常值
    while((c = getopt(argc, argv, "t:")) != -1) {
        // do something here
    }
}

```

可以迭代的使用?:运算符, 使得代码更短, 而且容易阅读
```c
int x = (a - b) > 0 ? c : (d - e) > 0 ? f : g;
```

取余(这种方法应该知道, 但不去使用)
```c
// 这两句话是一个意思
// 当且仅当b = (2 ^ n) -1
int a = 15;
int b = 8 - 1;
int c = a & b; // c的值是7
bool value = c == (a % (b + 1)); // value的值是true
```

指针被用来
```txt
构造链式数据结构
引用动态分配的数据结构
实现引用调用
访问和迭代数据元素
传递数组参数
引用函数
作为其他值的别名
代表字符串
直接访问系统内存
```

分配内存
```c
// 易懂的版本
static struct diskentry *
finddisk(const char *name){
    struct diskentry *d;

    // do something here

    d = emalloc(sizeof(*d));
    d -> d_name = estrdup(name);
    d -> d_name[len] = '\0';

    // do something here

    return d;
}
```

```c
// 宏版本
// .h文件中声明
#define new(type) (type *) calloc ( sizeof(type), 1 )

//.c文件当中这样使用
struct diskentry *node;
node = new(struct diskentry);
```

引用形式传递参数, 调用者一方通过取址运算符(&)传递参数
避免参数传递时大量的拷贝开销(针对结构体), 对参数的修改
结果也能返回主程序

当前函数的返回值仅仅表示执行的状态

如果用于输出的参数(返回主程序), 可以在参数后面以/* OUT */注释标明
```c
int
gid_name(char *name, gid_t *gid) {
    // do something here
    *gid = ptr->gid = gr->gr_gid;
	return(0);
}
```

还有一种变形是
```c
// 用const修饰引用类型的参数, 说明参数不会改变
// 参数以引用的方式传递仅仅是因为减少开销
static char *ccval(const struct cchar *, int);
```

指针访问数组元素

```c
stackp = de_stack; // 初始化栈

// do something here

*stackp++ = finchar; // 将finchar压入栈中

// do somthing here

do {
    if (count-- = 0) {
        return(num);
    }

    // 从栈中弹出到*bp当中
    *bp++ = *--stackp；

} while(stackp > de_stack) // 检查栈是否为空
```

数组传递

c只能传递传递数组第一个元素的地址
同样的, 返回的策略也是一致的, 所以返回的数组对象不能是
函数内部临时分配的, 因为一旦函数退出, 对象将可能被重写
导致运算结果出错, 解决这个问题的方法是声明这个临时的数组
变量用static修饰

```c
char *inet_ntoa(ad)
  struct in_addr ad;
{
  unsigned long int s_ad;
  int a, b, c, d;
  static char addr[20];

  s_ad = ad.s_addr;
  d = s_ad % 256;
  s_ad /= 256;
  c = s_ad % 256;
  s_ad /= 256;
  b = s_ad % 256;
  a = s_ad / 256;

  // a, b, c, d写入addr数组当中
  sprintf(addr, "%d.%d.%d.%d", a, b, c, d);

  return addr;
}
```

但是这个方案也不是完全安全的, 全局变量和static变量大多数情况下
是不可重入的, 而且这种方案需要缓存结果的内存空间, 不然的话就会
出现奇怪的输出

比如下面这段代码的输出就是
10.90.65.42 To 10.90.65.42

```c++
#include <iostream>

char *inet_ntoa(int a, int b, int c, int d) {
    static char addr[16];
    sprintf(addr, "%d.%d.%d.%d", a, b, c, d);
    return addr;
}

void print() {
    printf("%s To %s", inet_ntoa(10, 90, 65, 42), inet_ntoa(192, 168, 0, 1));
}

int main() {
    print();
    return 0;
}
```

把代码这样改就可以解决这个问题
```c++
char *inet_ntoa(int a, int b, int c, int d) {
#define NUM_BUFS 4
    static int bufno; // bufno初始化的值为0
    static struct {
        char addr[16];
    } bufs[NUM_BUFS];

    sprintf(bufs[(bufno + 1) % NUM_BUFS].addr, "%d.%d.%d.%d", a, b, c, d);
    char *s = bufs[(bufno + 1) % NUM_BUFS].addr;
    bufno = (bufno + 1) % NUM_BUFS;

    return s;
#undef NUM_BUFS
}
```

函数指针
c语言不允许把函数作为参数传递给另外的方法, 但是允许传递指针
很多库函数接受函数指针作为参数
可以设定代码体内的控制, 比如一个打开的文件用什么那种close函数关闭


How
```txt
先要声明函数指针， 虽然没有强制要求, 但是一般函数指针名和实
际调用的函数名之间要么相同, 要么有联系

如果函数指针本身也需要外部传入参数, 那么
在另一个方法调用的时候, 只写方法名称, 并不会在此刻指定函数指针的参数
而是实际运行到另一个方法内部的时候才做这件事情
```

```c++
// 关注getfile的调用

// 声明函数指针
static void	 xtrmapskip __P((char *, long));
static void	 xtrskip __P((char *, long));

// 在主线函数中调用getfile
// xtrmap, xtrmapskip指的是实际的函数名
getfile(xtrmap, xtrmapskip);

// getfile的具体实现
void
getfile(fill, skip)
	void	(*fill) __P((char *, long));
	void	(*skip) __P((char *, long));
{
    // 传递参数给函数指针的时刻, 省略了其他部分的代码
    (*fill)((char *)buf, (long)(size > TP_BSIZE ? fssize : (curblk - 1) * TP_BSIZE + size));
    (*skip)(clearedbuf, (long)(size > TP_BSIZE ? TP_BSIZE : size));
}


static void
xtrmap(buf, size)
	char	*buf;
	long	size;
{

	memmove(map, buf, size);
	map += size;
}

static void
xtrmapskip(buf, size)
	char *buf;
	long size;
{

	panic("hole in map\n");
	map += size;
}
```

用作别名

从效率上来说, 拷贝一个较大的结构体的代价是不能和拷贝一个4字节的地址相比拟的
所以我们有些时候会定义一个结构体指针来接受结构体对象
```c++
static struct termios cbreakt, rawt, *curt;

// do somthing here

curt = useraw ? &raw : &cbreakt;
```

引用静态初始化函数
```c++
char *s;

// do something here
s = *(opt->bval) ? "True" : "False";
```

全局语境中实现变量引用语义(TODO: 不太懂, 没有看出来好处在那里)

指针和字符串
注意区分字符指针和字符数组, 应为传参后两者类型相同了, 但是底层执行的操作不同

```c++
size_t FunctionPointer::strlen(const char *str) {
    const char *s;

//    int myNull = 0;

    // 不能用s比较, 关心的问题是NULL和\0有什么区别
    // 因为字符串常量末尾插入的是\0
//    printf("s == NULL: %s\n", str == NULL);
//    printf("s == 0: %s\n", str == 0);
//    printf("s == myNull: %s", str == myNull); // 编译错误

    // 下面这句话表达的是不停的向后移动字符串的首地址
    for (s = str; *s; ++s) {
//        printf("just for break\n");
    }

    return (s - str);
}

void FunctionPointer::howToUseStrlen() {
    char array[10] = "";
    cout << "char array length is: " << FunctionPointer::strlen(array) << endl;
    array[0] = 'L';
    for (int i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        cout << array[i];
    }
    cout << endl;

    char *s = "Hello World";
    char s_array[12] = "Hello World";
    cout << "s length is: " << FunctionPointer::strlen(s) << endl;
//    s = &s_array[0];
    s[0] = 'L'; // 越权处理字符串常量, 这东西写保护, 程序异常退出, 打开上面这句注释就可以修改了
    cout << "Use cout print s: " << s << endl;
    printf("Use printf print s: %s\n", s);
}
```
