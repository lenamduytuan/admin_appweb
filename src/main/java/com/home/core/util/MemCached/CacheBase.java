package com.home.core.util.MemCached;

import java.util.HashMap;

import org.apache.log4j.Logger;



public abstract class CacheBase<K,V> {
	
	protected final HashMap<K,V> cache= new HashMap<K,V>();
	protected final static Logger logger = Logger.getLogger(CacheBase.class);
	
	public abstract void reload();
	
	public void clear() {
		cache.clear();
	}
	
	public V getCache(K key) {
		return cache.get(key);
	}

	public void putCache(K key, V value) {
		cache.put(key, value);
	}
	
	public HashMap<K,V> getCache(){
		return cache;
	}
}
