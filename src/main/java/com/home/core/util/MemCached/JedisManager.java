package com.home.core.util.MemCached;

import redis.clients.jedis.Jedis;

public class JedisManager {
	private static Jedis jedis;
	
	static{
		jedis = new Jedis("localhost",6379);
	}
	
	public String get(String key, String param){
//		String val = "a:5:{s:5:\"token\";s:32:\"13e1bc5a817c174bc1ef00de6e1b3568\";s:7:\"user_id\";i:39;s:16:\"token_expiration\";i:604800;s:13:\"refresh_token\";s:32:\"4aa653b053e102b4139386b2093daaea\";s:24:\"refresh_token_expiration\";i:2419200;}";
		String val = jedis.get(key);
		if(val!=null && !"".equals(val)){
			if(param!=null && !"".equals(param)){
				String[] arr = val.split(";");
		        if(param == "token"){
		        	val = arr[1].split(":")[2];
		        }else if(param == "user_id"){
		        	val = arr[3].split(":")[1];
		        }        
		        System.out.println("Param value:" + val);
			}
		}				
		
		return val;
	}
	
	public static void main(String args[]) throws Exception{

	}
}
