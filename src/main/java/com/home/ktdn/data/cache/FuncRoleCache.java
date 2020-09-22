package com.home.ktdn.data.cache;

import com.home.core.util.MemCached.CacheBase;

public class FuncRoleCache extends CacheBase<String, String> {
	public FuncRoleCache(){
		this.reload();
	}

	static class SingletonHelper {
		private static final FuncRoleCache INSTANCE = new FuncRoleCache();
	}

	public static FuncRoleCache getInstance() {
		return SingletonHelper.INSTANCE;
	}
	
	@Override
	public void reload(){
		
	}
}
