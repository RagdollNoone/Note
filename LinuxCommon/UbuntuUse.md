检查代理(apt-get无法使用问题)
env | grep -i proxy

编辑
sudo gedit /etc/environment
去掉
http_proxy="http://127.0.0.1:38625/"
https_proxy="https://127.0.0.1:38625/"
socks_proxy="socks://127.0.0.1:36681/"

sudo gedit /etc/apt/apt.conf
用#注释掉proxy所在的行


Unix下的ps或top命令可以用来检查内存泄露
