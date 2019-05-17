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

直接内存访问
低级代码会直接通过指针访问硬件设备, 下面是一段例子

```c++
static int vid_xpos=0, vid_ypos=0;

static void
vid_wrchar(char c)
{
	volatile unsigned short *video;

	video = (unsigned short *)(0xe08b8000) + vid_ypos * 80 + vid_xpos;
	*video = (*video & 0xff00) | 0x0f00 | (unsigned short)c;
}
```

结构被用来
```txt
将作为一个整体使用的数据集合到一起
函数返回多个数据元素
构造链式数据结构
映射数据在硬件设备, 网络链接和存储介质上的组织方式
实现抽象数据类型
面向对象的方式编程
```
函数返回多个数据元素
两种方法实现
1. 多个类型组合成一个结构, 返回结构(返回有开销, 越是大越是频繁, 越是不划算)
2. 通过引用参数返回分支函数的结果

映射数据表达方式

Intel EtherExpress网卡的一个命令块
```c++
// volatile限定符表明底层的内存字段要被程序之外的实体引用
// 在这里指的就是网卡
// 从而禁止编译器对这些字段优化(比如移除多余的引用)
struct fxp_cb_nop {
	void *fill[2];
	volatile u_int16_t cb_status;
	volatile u_int16_t cb_command;
	volatile u_int32_t link_addr;
};
```

某些情况下程序中会声明位字段(bit field), 用来指定一段精确的范围
保存给设备上的特定值

```c++
struct fxp_cb_config {
	void *fill[2];
	volatile u_int16_t	cb_status;
	volatile u_int16_t	cb_command;
	volatile u_int32_t	link_addr;
	volatile u_int8_t	byte_count:6,
				:2;
	volatile u_int8_t	rx_fifo_limit:4,
				tx_fifo_limit:3,
				:1;
	volatile u_int8_t	adaptive_ifs;
	volatile u_int8_t	:8;
	volatile u_int8_t	rx_dma_bytecount:7,
				:1;
	volatile u_int8_t	tx_dma_bytecount:7,
				dma_bce:1;
	volatile u_int8_t	late_scb:1,
				:1,
				tno_int:1,
				ci_int:1,
				:3,
				save_bf:1;
	volatile u_int8_t	disc_short_rx:1,
				underrun_retry:2,
				:5;
	volatile u_int8_t	mediatype:1,
				:7;
	volatile u_int8_t	:8;
	volatile u_int8_t	:3,
				nsai:1,
				preamble_length:2,
				loopback:2;
	volatile u_int8_t	linear_priority:3,
				:5;
	volatile u_int8_t	linear_pri_mode:1,
				:3,
				interfrm_spacing:4;
	volatile u_int8_t	:8;
	volatile u_int8_t	:8;
	volatile u_int8_t	promiscuous:1,
				bcast_disable:1,
				:5,
				crscdt:1;
	volatile u_int8_t	:8;
	volatile u_int8_t	:8;
	volatile u_int8_t	stripping:1,
				padding:1,
				rcv_crc_xfer:1,
				:5;
	volatile u_int8_t	:6,
				force_fdx:1,
				fdx_pin_en:1;
	volatile u_int8_t	:6,
				multi_ia:1,
				:1;
	volatile u_int8_t	:3,
				mc_all:1,
				:4;
};
```

用于tcp包的定义
```c++
typedef u_int32_t tcp_seq;
/*
 * TCP header.
 * Per RFC 793, September, 1981.
 */
struct tcphdr {
	u_int16_t th_sport;		/* source port */
	u_int16_t th_dport;		/* destination port */
	tcp_seq	  th_seq;		/* sequence number */
	tcp_seq	  th_ack;		/* acknowledgement number */
#if BYTE_ORDER == LITTLE_ENDIAN
	u_int8_t  th_x2:4,		/* (unused) */
		  th_off:4;		/* data offset */
#endif
#if BYTE_ORDER == BIG_ENDIAN
	u_int8_t  th_off:4,		/* data offset */
		  th_x2:4;		/* (unused) */
#endif
	u_int8_t  th_flags;
#define	TH_FIN	  0x01
#define	TH_SYN	  0x02
#define	TH_RST	  0x04
#define	TH_PUSH	  0x08
#define	TH_ACK	  0x10
#define	TH_URG	  0x20
	u_int16_t th_win;			/* window */
	u_int16_t th_sum;			/* checksum */
	u_int16_t th_urp;			/* urgent pointer */
};
```

结构还应用于映射数据在外设介质上(比如磁盘和磁带)的存储方式
如DOS磁盘分区的磁盘特性由所谓的BIOS参数块来决定(BIOS parameter
block), 结构如下所示
```c++
/*
 * BIOS Parameter Block (BPB) for DOS 3.3
 * 33应该指的就是版本号
 * 结构内的字段次序依赖所处的架构和编译器
 * 元素的表达依赖于架构和操作系统(操作系统可能会强制处理器采用某种字节次序)
 * 即使简单数据类型, 如整形, 字节的存储方式也会不同
 * 所以结构映射外部数据, 天生不可移植
 */
struct bpb33 {
	u_int16_t	bpbBytesPerSec;	/* bytes per sector */
	u_int8_t	bpbSecPerClust;	/* sectors per cluster */
	u_int16_t	bpbResSectors;	/* number of reserved sectors */
	u_int8_t	bpbFATs;	/* number of FATs */
	u_int16_t	bpbRootDirEnts;	/* number of root directory entries */
	u_int16_t	bpbSectors;	/* total number of sectors */
	u_int8_t	bpbMedia;	/* media descriptor */
	u_int16_t	bpbFATsecs;	/* number of sectors per FAT */
	u_int16_t	bpbSecPerTrack;	/* sectors per track */
	u_int16_t	bpbHeads;	/* number of heads */
	u_int16_t	bpbHiddenSecs;	/* number of hidden sectors */
};
```

面向对象编程

用c语言描述一个类
```c++
// 函数指针其实可以理解为成员函数
// 而这个成员函数, 如果有需要的话, 可以是多态的, 在实际创建的时候指明
// 具体是那个函数
struct	domain {
	int	dom_family;		/* AF_xxx */
	char	*dom_name;
	void	(*dom_init)		/* initialize domain data structures */
			__P((void));
	int	(*dom_externalize)	/* externalize access rights */
			__P((struct mbuf *));
	void	(*dom_dispose)		/* dispose of internalized rights */
			__P((struct mbuf *));
	struct	protosw *dom_protosw, *dom_protoswNPROTOSW;
	struct	domain *dom_next;
	int	(*dom_rtattach)		/* initialize routing table */
			__P((void **, int));
	int	dom_rtoffset;		/* an arg to rtattach, in bits */
	int	dom_maxrtkey;		/* for routing layer */
};

// 实际的调用
// domain在调用过程中表现的像基类, 而dom_rtattach似乎是多态的
for (dom = domains; dom; dom = dom->dom_next)
	if (dom->dom_family == i && dom->dom_rtattach) {
		dom->dom_rtattach((void **)&nep->ne_rtable[i],
			dom->dom_rtoffset);
		break;
	}
```

不同对象共享方法, 暂时的理解是为了继承来自基类的非抽象方法

```c++
struct file {
	LIST_ENTRY(file) f_list;/* list of active files */
	short	f_flag;		/* see fcntl.h */
#define	DTYPE_VNODE	1	/* file */
#define	DTYPE_SOCKET	2	/* communications endpoint */
	short	f_type;		/* descriptor type */
	short	f_count;	/* reference count */
	short	f_msgcount;	/* references from message queue */
	struct	ucred *f_cred;	/* credentials associated with descriptor */
	struct	fileops {
		int	(*fo_read)	__P((struct file *fp, struct uio *uio,
					    struct ucred *cred));
		int	(*fo_write)	__P((struct file *fp, struct uio *uio,
					    struct ucred *cred));
		int	(*fo_ioctl)	__P((struct file *fp, u_long com,
					    caddr_t data, struct proc *p));
		int	(*fo_poll)	__P((struct file *fp, int events,
					    struct proc *p));
		int	(*fo_close)	__P((struct file *fp, struct proc *p));
	} *f_ops;
	off_t	f_offset;
	caddr_t	f_data;		/* vnode or socket */
};
```


共用体/联合体

```txt
有效的利用存储空间
实现多态
使用不同的内部表达式对数据进行访问
```

```c++
// 其实往往是需要多态加有效利用存储空间
// 否则没有非要选union的必要
/*
 * Body of an rpc request call.
 */
struct call_body {
	u_int32_t cb_rpcvers;	/* must be equal to two */
	u_int32_t cb_prog;
	u_int32_t cb_vers;
	u_int32_t cb_proc;
	struct opaque_auth cb_cred;
	struct opaque_auth cb_verf; /* protocol specific - provided by client */
};

/*
 * The rpc message
 * 要么是call, 要么是reply
 */
struct rpc_msg {
	u_int32_t		rm_xid;
	enum msg_type		rm_direction;
	union {
		struct call_body RM_cmb;
		struct reply_body RM_rmb;
	} ru;
#define	rm_call		ru.RM_cmb
#define	rm_reply	ru.RM_rmb
};
#define	acpted_rply	ru.RM_rmb.ru.RP_ar
#define	rjcted_rply	ru.RM_rmb.ru.RP_dr


// 实际调用
// rpc_callmsg.c
// 可以看到当类型是CALL的时候, rm_call的结构对象应该是call_body
// 应为有字段cb_rpcvers
if (cmsg->rm_direction != CALL) {
	return (FALSE);
}
IXDR_PUT_LONG(buf, cmsg->rm_call.cb_rpcvers);
```
访问不同的内部表达(不是很明白)
暂时的理解是union包上一个struct和一个访问变量
但是为什么一定要这么做不是很懂

```c++
double
frexp(value, eptr)
	double value;
	int *eptr;
{
	union {
                double v;
                struct {
                        u_int  u_sign :  1;
			u_int   u_exp : 11;
			u_int u_mant1 : 20;
			u_int u_mant2 : 32;
                } s;
        } u;

	if (value) {
		u.v = value;
		*eptr = u.s.u_exp - 1022;
		u.s.u_exp = 1022;
		return(u.v);
	} else {
		*eptr = 0;
		return((double)0);
	}
}
```

动态分配内存


```c++
typedef struct {
	char *user;
	char *group;
	char *flags;
	char data[1];
} NAMES;
```

每次malloc都需要检查内存空间是否达到上线, 所以会对malloc做一层封装
常起名xmalloc

```c++
/*
 * malloc with result test
 */
void *
xmalloc(size)
	u_int size;
{
	void *p;

	if ((p = malloc(size)) == NULL)
		err(FATAL, "%s", strerror(errno));
	return (p);
}
```

初学者对指针的常见误解是: 所有指针必须初始化为由malloc分配的内存快
这种代码风格没错, 但是难以阅读和维护
TODO： 怎么才算好的写法？

垃圾回收机制
对于不同变量共享一块内存块, 就会难以跟踪他们的生存周期,
所以每个内存块会关联一个引用计数, 每次创建该内存块的新引用时
都会递增计数, 每销毁一个引用, 计数会递减, 当计数为0是说明内
存块可以释放, 下面代码是一个带有引用的设计

```c++
typedef struct _SelectRec {
    Atom selection; 			/* constant */
    Display *dpy; 			/* constant */
    Widget widget;
    Time time;
    unsigned long serial;
    XtConvertSelectionProc convert;
    XtLoseSelectionProc loses;
    XtSelectionDoneProc notify;
    XtCancelConvertSelectionProc owner_cancel;
    XtPointer owner_closure;
    PropList prop_list;
    Request req;			/* state for local non-incr xfer */
    int ref_count;			/* of active transfers */
    unsigned int incremental:1;
    unsigned int free_when_done:1;
    unsigned int was_disowned:1;
} SelectRec;
```

保守垃圾回收器
扫描进程所有的内存, 寻找与现有分配内存块相匹配的地址.
将扫描中没有遇到的所有内寻块都释放掉

malloc和alloca
malloc在heap上分配
alloca在stack上分配(非标准函数, 标准啥意思?)
优点：
stack上分配的内存在函数返回时自动被回收,
减少了偶然的内存泄漏
缺点：
记录在这个内存块中的计算结果永远不能返回给调用者
不可移植的


typedef
这个关键字声明促进抽象, 促进代码可读性
有些typedef会有些难以理解

```c++
// typedef可以看作是static或extern
// 可以理解为一个char型数组的别名
// 这里的line就是一个char型的数组
typedef char ut_line_t[UT_LINESIZE];
static ut_line_t line[MAXUSERS];
```

可以使得代码有移植性
因为即使是基本的数据类型在不同的架构下的内存表达也是不同的
所以需要下面的语句来屏蔽这些差异

```c++
#ifdef AVR_32
typedef unsigned int  uint_32
#else
typedef unsigned long uint_32
#endif
```

为什么代码要写成这样的形式

```c++
// 好处就是, 很容易使用正则表达式语句来检索出函数的声明和定义的位置
// grep -rn "^\<functionName\>" --include \*.c
void
functionName() {

}
```

数据结构

```txt
向量
矩阵
栈
队列
链表
树
图
```

二叉树遵循:
如果节点值大于给定父节点的值, 那么这个节点应该被放在父节点的右方
反之应该被放在左方

图和树不同的点在于, 图中的节点不一定通过边连接起来, 即使连接起来
因为有环的存在, 也会使得遍历难以实现, 所以我们关注

```txt
节点如何存储
边如何表达
边如何存储
图的属性有那些
图真正表示的是什么样的结构
```


工具idutils

查找关键字Select在那些头文件当中出现过
grep -lr "Select" --include \*.h
