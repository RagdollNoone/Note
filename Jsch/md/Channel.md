Channel extends by
ChannelForwardedTCPIP
ChannelX11
ChannelAgentForwarding
ChannelDirectTCPIP
ChannelSession

ChannelSession extends by
ChannelExec
ChannelShell
ChannelSubsystem
ChannelSftp


```java
public void connect(int connectTimeout) throws JSchException {}
public void setInputStream(InputStream in, boolean dontclose) {}
public void setOutputStream(OutputStream out, boolean dontclose) {}
public void sendSignal(String signal) throws Exception {}
public void disconnect() {}
public boolean isConnected() {}
```
