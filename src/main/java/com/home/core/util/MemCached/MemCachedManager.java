package com.home.core.util.MemCached;

import java.util.Date;

import com.home.ktdn.setting.Config;
import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;


public class MemCachedManager {
	private static MemCachedClient memcachedClient;
	private static MemCachedManager memCachedManager = new MemCachedManager();
	
	static {  
//        String[] servers = { "192.168.100.110:11211", "192.168.100.110:11311", "192.168.100.110:11411" };  
        String memcached_servers = Config.getMemcachedServers();
		int len = memcached_servers.split(",").length;
		String[] servers = new String[len];
		for(int i=0; i<len; i++){
			servers[i] = memcached_servers.split(",")[i];
		}
		
        Integer[] weights = { 3, 2, 1 };  
 
        SockIOPool sockIOPool = SockIOPool.getInstance();  
  
        sockIOPool.setServers(servers);  
        sockIOPool.setWeights(weights);  
        sockIOPool.setFailover(true);  
        sockIOPool.setInitConn(10);  
        sockIOPool.setMinConn(10);  
        sockIOPool.setMaxConn(100);  
        sockIOPool.setMaintSleep(30);  
        sockIOPool.setNagle(false);  
        sockIOPool.setSocketTO(3000);  
        sockIOPool.setAliveCheck(true);  
        sockIOPool.setMaxIdle(1000 * 30 * 30);  
        sockIOPool.setSocketConnectTO(0);  
        sockIOPool.setMaintSleep(30);  
  
        sockIOPool.initialize();  
        if (memcachedClient == null) {  
            memcachedClient = new MemCachedClient();  
        }  
    }  
	
	public static MemCachedManager getInstance() {  
        return memCachedManager;  
    }  
  
    private MemCachedManager() {  
    }  
  
    public boolean add(String key, Object value) {  
        return memcachedClient.add(key, value);  
    }  
    
    public boolean add(String key, Object value, Date expire) {  
        return memcachedClient.add(key, value, expire);  
    }  
  
    public Object get(String key) {  
        return memcachedClient.get(key);  
    }  
  
    public boolean replace(String key, Object value) {  
        return memcachedClient.replace(key, value);  
    }  
  
    public boolean replace(String key, Object value, Date expiry) {  
        return memcachedClient.replace(key, value, expiry);  
    }
    
    public boolean set(String key, Object value) {  
        return memcachedClient.set(key, value);  
    }  
  
    public boolean set(String key, Object value, Date expiry) {  
        return memcachedClient.set(key, value, expiry);  
    }
    
    public static void main(String[] args) {  
        /*UserVO user = new UserVO();  
        user.setUsername("lucy");  
        user.setPassword("abc123456");  
        MemCachedManager memCachedManager = MemCachedManager.getInstance();
//        MemCachedManager.add("user", user, new Date(1000 * 60));
        memCachedManager.set("user", user);
        user = (UserVO) (memCachedManager.get("user"));  
        System.err.println("Username：" + user.getUsername() + "-Password：" + user.getPassword());*/  
    }  
}
