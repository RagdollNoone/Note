```java
public void connect() throws JSchException {}
public Channel openChannel(String type) throws JSchException {}
public Buffer read(Buffer buf) throws Exception {}
public void write(Packet packet) throws Exception

public void setProxy(Proxy proxy) {}
public void setUserInfo(UserInfo userinfo) {}
public void setInputStream(InputStream in) {}
public void setOutputStream(OutputStream out) {}
public void setX11Host(String host) {}
public void setSocketFactory(SocketFactory sfactory) {}
```

依赖
Channel
Buffer
Proxy
UserInfo
InputStream
OutputStream
SocketFactory
