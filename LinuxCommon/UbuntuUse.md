UbuntuUse
=========

## 检查代理(apt-get无法使用问题)

```txt
env | grep -i proxy

编辑
sudo gedit /etc/environment
去掉
http_proxy="http://127.0.0.1:38625/"
https_proxy="https://127.0.0.1:38625/"
socks_proxy="socks://127.0.0.1:36681/"

sudo gedit /etc/apt/apt.conf
用#注释掉proxy所在的行
```

## Unix下的ps或top命令可以用来检查内存泄露

## 删除软件

```txt
1. 查找软件名(或者说自己理解的软件名是不是能作为删除的参数)
dpkg --list | grep programName

2. 删除软件及所有配置
sudo apt-get --purge remove programName

3. ubuntu自动删除不再有依赖关系的包
sudo apt-get autoremove
```
