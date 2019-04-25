安装原码程序时，都要执行三步：
./configure
make
make install


这些都是典型的使用GNU的AUTOCONF和AUTOMAKE产生的程序的安装步骤。
./configure是用来检测你的安装平台的目标特征的。比如它会检测你是不是有CC或GCC，并不是需要CC或GCC，它是个shell脚本
make是用来编译的，它从Makefile中读取指令，然后编译。
make install是用来安装的，它也从Makefile中读取指令，安装到指定的位置。
