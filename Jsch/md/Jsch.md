```java
static Hashtable config = new Hashtable();
private Vector sessionPool = new Vector();
private IdentityRepository defaultIdentityRepository = new LocalIdentityRepository(this);
private IdentityRepository identityRepository;
private ConfigRepository configRepository;
private HostKeyRepository known_hosts;
static Logger logger;
```

```java
public JSch() {
    this.identityRepository = this.defaultIdentityRepository;
    this.configRepository = null;
    this.known_hosts = null;
}
```

```java
public Session getSession(String username, String host, int port) throws JSchException {
    if (host == null) {
        throw new JSchException("host must not be null.");
    } else {
        Session s = new Session(this, username, host, port);
        return s;
    }
}
```


依赖
Session
