# Tutorial

SSH是强验证 即客户端服务器都会验证一把

## 验证的过程

```txt
创建session
connection
验证服务器地址
验证客户端身份
执行远端命令
```

## 验证的方式

```txt
1. 公钥
client生成一把公钥和私钥 把公钥发给server
连接时 server发一个随即的message给client
这时client用私钥加密message并发送给server
server如果用公钥解密成功 则身份验证完成
2. 密码
3. challenge and response(TODO)
4. none
```

banner of SSH(TODO)
