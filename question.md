## 代码思考

```c++
// 这段代码输出了f()这句话, 说明A在实例化之前函数已经分配到了地址
// 那么为什么把f()作为回调传递的时候， f要显式的声明为静态呢
// 常规的f始终找不到一种合适的写法
// main.c
#include <iostream>
using namespace std;

class A {
public:
    void f() {
        cout << "f()" << endl;
    }
}

int main() {
    A *a = (A *)NULL;
    a->f();
}

```
