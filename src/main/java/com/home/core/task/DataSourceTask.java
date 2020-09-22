package com.home.core.task;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;

import com.home.core.util.MemCached.ConnectionCache;
import com.home.core.data.JdbcUtils;
import com.home.core.util.ResourceUtils;

public class DataSourceTask implements Runnable {
	private static Properties properties;
	private static String configFile = "database.properties";
	private static String JDBC_USERNAME_DEFAULT = "bctc_owner";

	@Override
	public void run() {
		properties = new Properties();
		String PROP_DIR = System.getenv("PROP_DIR");
		String fileName = PROP_DIR + File.separator + "properties" + File.separator + configFile;
		String jdbcUsername = null;
		String jdbcPassword = null;
		ResourceBundle rbDatabase = null;
		try {
			rbDatabase = ResourceUtils.getResourceBundle("database", Locale.getDefault());
			jdbcUsername = ResourceUtils.getString(rbDatabase, "jdbc.username");
			if(!JDBC_USERNAME_DEFAULT.equals(jdbcUsername)){
				String result = JdbcUtils.getOwnerAccountBCTC();
				if (result != null && !result.trim().isEmpty()) {
					String[] account = result.split("=");
					jdbcUsername = account[0];
					jdbcPassword = account[1];
					FileInputStream fileInputStream = new FileInputStream(fileName);
					properties.load(fileInputStream);
					String configUsername = properties.getProperty(ConnectionCache.JDBC_USERNAME);
					String configPassword = properties.getProperty(ConnectionCache.JDBC_PASSWORD);
					if (!jdbcUsername.equals(configUsername)) {
						properties.put(ConnectionCache.JDBC_USERNAME, jdbcUsername);
						ConnectionCache.getInstance().putCache(ConnectionCache.JDBC_USERNAME, jdbcUsername);
					}
					if (!jdbcPassword.equals(configPassword)) {
						properties.put(ConnectionCache.JDBC_PASSWORD, jdbcPassword);
						ConnectionCache.getInstance().putCache(ConnectionCache.JDBC_PASSWORD, jdbcPassword);
					}
					writeProperties(properties, fileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void writeProperties(Properties properties,String file) {
		FileWriter writer;
		try {
			writer = new FileWriter(new File(file));
			properties.store(writer, "");
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
