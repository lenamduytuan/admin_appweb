package com.home.core.util.MemCached;

import java.util.Locale;
import java.util.ResourceBundle;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.home.core.task.DataSourceTask;
import com.home.core.util.ResourceUtils;
/**
 * Cache tai khoan ket noi CSDL
 * @author ducta
 */
public class ConnectionCache extends CacheBase<String, String> {
	
	public static final String JDBC_DRIVER_CLASS_NAME = "jdbc.driverClassName";
	public static final String JDBC_URL = "jdbc.url";
	public static final String JDBC_USERNAME = "jdbc.username";
	public static final String JDBC_PASSWORD = "jdbc.password";
	private static ResourceBundle rb = null;
	
	private ConnectionCache() {
		//Load tai khoan tu file config
		this.reload();
		//Khoi tao luong lay account tu bmt_pck_bmht chay 1h 1 lan
		ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
		executor.scheduleWithFixedDelay(new DataSourceTask(), 1, 1, TimeUnit.HOURS);
	}

	static class SingletonHelper {
		private static final ConnectionCache INSTANCE = new ConnectionCache();
	}

	public static ConnectionCache getInstance() {
		return SingletonHelper.INSTANCE;
	}

	@Override
	public void reload() {
		try {
			rb = ResourceUtils.getResourceBundle("database", Locale.getDefault());
			System.out.println(ResourceUtils.getString(rb, JDBC_DRIVER_CLASS_NAME));
			this.cache.put(JDBC_DRIVER_CLASS_NAME, ResourceUtils.getString(rb, JDBC_DRIVER_CLASS_NAME));
			this.cache.put(JDBC_URL, ResourceUtils.getString(rb, JDBC_URL));
			this.cache.put(JDBC_USERNAME, ResourceUtils.getString(rb, JDBC_USERNAME));
			this.cache.put(JDBC_PASSWORD, ResourceUtils.getString(rb, JDBC_PASSWORD));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	

}
