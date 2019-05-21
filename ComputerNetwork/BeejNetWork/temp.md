BeejNetwork
===========

socket本质上是文件描述符(file descriptors)

## 数据结构

* addrinfo

```c++
struct addrinfo {
	int ai_flags; // AI_PASSIVE, AI_CANONNAME 等 。
	int ai_family; // AF_INET, AF_INET6, AF_UNSPEC
	int ai_socktype; // SOCK_STREAM, SOCK_DGRAM
	int ai_protocol; // 用 0 当 作 "any"
	size_t ai_addrlen; // ai_addr 的 大 小 , 单 位 是 byte
	struct sockaddr *ai_addr; // struct sockaddr_in 或 _in6
	char *ai_canonname; // 典 型 的 hostname
	struct addrinfo *ai_next; // 链 表 丶 下 个 节 点
};

```

* sockaddr, sockaddr_in, sockaddr_in6, sockaddr_storage

```txt
sockaddr
sockaddr_in
sockaddr_in6
三者是对等的,
sockaddr和sockaddr_in可以认为是完全一致的
sockaddr_in6结构长度不一样

sockaddr_storage用来存储
sockaddr_in和sockaddr_in6
因为有些时候可能事前并不知道是
ipv4还是ipv6
```

```c++
// 2 + 14总共16字节
struct sockaddr {
	unsigned short sa_family; // address family, AF_xxx
	char sa_data[14]; // 14 bytes of protocol address
};

// 2 + 2 + 4 + 8总共16个字节
struct sockaddr_in {
	short int sin_family; // Address family, AF_INET
	unsigned short int sin_port; // Port number
	struct in_addr sin_addr; // Internet address
	unsigned char sin_zero[8]; // 与sockaddr相 同 的 大 小
};

// 2 + 2 + 4 + 16 + 4总共28个字节
struct sockaddr_in6 {
	u_int16_t sin6_family; // address family, AF_INET6
	u_int16_t sin6_port; // port number, Network Byte Order
	u_int32_t sin6_flowinfo; // IPv6 flow information
	struct in6_addr sin6_addr; // IPv6 address
	u_int32_t sin6_scope_id; // Scope ID
};
```

```c++
// 总共128个字节
struct sockaddr_storage {
	sa_family_t ss_family; // address family
	// all this is padding, implementation specific, ignore it:
	char __ss_pad1[_SS_PAD1SIZE];
	int64_t __ss_align;
	char __ss_pad2[_SS_PAD2SIZE];
};
```

** in_addr

```c++
struct in_addr {
	uint32_t s_addr; // that's a 32-bit int (4 bytes)
};

struct in6_addr {
	unsigned char s6_addr[16]; // IPv6 address
};
```

## 函数

* inet_pton

```c++
// 把字符串表述的ip地址存储到sockaddr_in或者sockaddr_in6或者
// sockaddr_storage的结构里去, 这个函数不会为上述结构分配空间
struct sockaddr_in sa; // IPv4
struct sockaddr_in6 sa6; // IPv6
inet_pton(AF_INET, "192.0.2.1", &(sa.sin_addr)); // IPv4
inet_pton(AF_INET6, "2001:db8:63b3:1::3490", &(sa6.sin6_addr)); // IPv6
```

* inet_ntop

```c++
// inet_pton的反操作
// IPv4:
char ip4[INET_ADDRSTRLEN]; // 储 存 IPv4 字 符 串 的 空 间
struct sockaddr_in sa; // pretend this is loaded with something
inet_ntop(AF_INET, &(sa.sin_addr), ip4, INET_ADDRSTRLEN);
printf("The IPv4 address is: %s\n", ip4);

// IPv6:
char ip6[INET6_ADDRSTRLEN]; // 储 存 IPv6 字 符 串 的 空 间
struct sockaddr_in6 sa6; // pretend this is loaded with something
inet_ntop(AF_INET6, &(sa6.sin6_addr), ip6, INET6_ADDRSTRLEN);
printf("The address is: %s\n", ip6);
```

* getaddrinfo

```c++
// 根据ip端口服务等信息来填充addrinfo
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

int
getaddrinfo(
	const char *node, // 例 如 : "www.example.com" 或 IP
	const char *service, // 例 如 : "http" 或 port number
	const struct addrinfo *hints,
	struct addrinfo **res);
```

* socket

```c++
// 创建socket, 和谁连, 创建关于谁的socket
#include <sys/types.h>
#include <sys/socket.h>

int
socket(
	int domain,
	int type,
	int protocol);

	int s;

// 用法
struct addrinfo hints, *res;
// 运行查询
// 假装我们已经填好"hints" struct
getaddrinfo("www.example.com", "http", &hints, &res);
s = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
```

* bind

```c++
// 将socket和端口进行关联
// bind和connect有什么区别?
// bind() associates the socket with its local address
// connect() is used to connect to a remote [server] address
#include<sys/socket.h>
#include<sys/types.h>

int bind(int sockfd, struct sockaddr *my_addr, int addrlen);

// 用法
struct addrinfo hints, *res;
int sockfd;

// 首 先 , 用 getaddrinfo() 载 入 地 址 结 构 :
memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC; // use IPv4 or hints.ai_socktype = SOCK_STREAM;
// 说明bind的时候绑定的是本机的某个端口
// 如果绑定其他ip的话, 不需要填这个选项
hints.ai_flags = AI_PASSIVE; // fill in my IP for me

getaddrinfo(NULL, "3490", &hints, &res);

// 建 立 一 个 socket:
sockfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);

// 将 socket bind 到 我 们 传 递 给 getaddrinfo的port
bind(sockfd, res->ai_addr, res->ai_addrlen);
```

* connect

```c++
#include <sys/types.h>
#include <sys/socket.h>

int connect(int sockfd, struct sockaddr *serv_addr, int addrlen);
```

* listen

```c++
// 等待进入的连接
// backlog是进入的队列(incoming queue)中所允许的连接数目 。
// 进入的连接将会在这个队列中排队等待,直到你accept()它们,
// 而这限制了排队的数量。多数的系统默认将这个数值限制为20;
// 你或许可以一开始就将它设置为5或10。

int listen(int sockfd, int backlog);
```

* accept

```c++
#include <sys/types.h>
#include <sys/socket.h>

int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);

// 用法
sockaddr_storage their_addr; // 用来接收客户端的网络信息

sin_size = sizeof(their_addr);
new_fd = accept(sockfd, (sockaddr *)&their_addr, &sin_size);
```

* send

```c++
// 发送数据
int send(int sockfd, const void *msg, int len, int flags);

// 用法1
char *msg = "Beej was here!";
int len, bytes_sent;

len = strlen(msg);
bytes_sent = send(sockfd, msg, len, 0);

// 用法2
while(1) {
    sin_size = sizeof(their_addr);
    new_fd = accept(sockfd, (sockaddr *)&their_addr, &sin_size);
    if (new_fd == -1) {
        perror("accept");
        continue;
    }

    inet_ntop(their_addr.ss_family, get_in_addr((sockaddr *)&their_addr), s, sizeof(s));
    printf("server: got connection from %s\n", s);

	// TODO: fork什么作用
    if (!fork()) {
        close(sockfd);

        if (send(new_fd, "Hello World", 13, 0) == -1) {
            perror("send");
        }

        close(new_fd);
        exit(0);
    }

    close(new_fd);
}
```


* recv

```c++
// 接收数据
int recv(int sockfd, void *buf, int len, int flags);

// 用法
#define MAXDATASIZE 100

int numbytes;
char buf[MAXDATASIZE];

if ((numbytes = recv(sockfd, buf, MAXDATASIZE - 1, 0)) == -1) {
    perror("recv");
    exit(1);
}

buf[numbytes] = '\0';
printf("client: received '%s'\n", buf);
```
