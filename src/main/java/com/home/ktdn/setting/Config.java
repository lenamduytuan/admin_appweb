package com.home.ktdn.setting;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;

import com.home.core.util.ResourceUtils;
import com.home.core.util.SpringUtils;

public class Config {	
	static ResourceBundle rb_Config;
	static ApplicationContext springContext;
	static Map<String, Object> appContext;
	static Map<Integer, Object> httpResponseMessage;
	static String uploadFileDir;	
	static String downloadFileDir;	
	static String grsFaceRectangleWidth;
	
	static String amazonStaplerStorage;
	static String amazonStaplerS3Region;
	static String amazonStaplerS3Bucket;
	static String amazonAwsAccessKeyId;
	static String amazonAwsSecretAccessKey;
	static String amazonLinkDownload;
	
	static String memcachedServers;
	
	static String ommTest;
	
	static String apiContext;
	
	public static void startUp(HttpServletRequest request){
		try{
			if(rb_Config == null)
				rb_Config = ResourceUtils.getResourceBundle("properties.config");
			
			if(springContext ==null)
				springContext = SpringUtils.getSpringContext(request);
			
			if(appContext == null){
				appContext = new HashMap<String, Object>();
			}
			
			if(httpResponseMessage == null)
				setHttpResponseMessage();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	public static ApplicationContext getSpringContext() {
		return springContext;
	}

	public static Map<String, Object> getAppContext() {
		return appContext;
	}

	public static String getUploadFileDir() {
		if(uploadFileDir == null)
			uploadFileDir = ResourceUtils.getString(rb_Config, Constants.FILE_UPLOAD_DIR);
		return uploadFileDir;
	}

	public static String getDownloadFileDir() {
		if(downloadFileDir == null)
			downloadFileDir = ResourceUtils.getString(rb_Config, Constants.FILE_DOWNLOAD_DIR);
		return downloadFileDir;
	}

	public static String getGrsFaceRectangleWidth() {
		if(grsFaceRectangleWidth == null)
			grsFaceRectangleWidth = ResourceUtils.getString(rb_Config, Constants.GRS_FACE_RECTANGLE_WIDTH);
		return grsFaceRectangleWidth;
	}

	public static String getMemcachedServers() {
		if(memcachedServers == null)
			memcachedServers = ResourceUtils.getString(rb_Config, Constants.MEMCACHED_SERVERS);
		return memcachedServers;
	}

	public static String getHttpResponseMessage(Integer key) {
		return (String)httpResponseMessage.get(key);
	}

	public static void setHttpResponseMessage() {
		httpResponseMessage = new HashMap<Integer, Object>();
		httpResponseMessage.put(Constants.HTTP_ACCEPTED, "OK");
		httpResponseMessage.put(Constants.HTTP_UNAUTHORIZED, "{\"error\": {\"code\": \"authorization_missing\",\"description\": \"parameter missing\"}}");
	}

	public static String getAmazonStaplerStorage() {
		if(amazonStaplerStorage == null)
			amazonStaplerStorage = ResourceUtils.getString(rb_Config, Constants.STAPLER_STORAGE);
		return amazonStaplerStorage;
	}

	public static String getAmazonStaplerS3Region() {
		if(amazonStaplerS3Region == null)
			amazonStaplerS3Region = ResourceUtils.getString(rb_Config, Constants.STAPLER_S3_REGION);
		return amazonStaplerS3Region;
	}

	public static String getAmazonStaplerS3Bucket() {
		if(amazonStaplerS3Bucket == null)
			amazonStaplerS3Bucket = ResourceUtils.getString(rb_Config, Constants.STAPLER_S3_BUCKET);
		return amazonStaplerS3Bucket;
	}

	public static String getAmazonAwsAccessKeyId() {
		if(amazonAwsAccessKeyId == null)
			amazonAwsAccessKeyId = ResourceUtils.getString(rb_Config, Constants.AWS_ACCESS_KEY_ID);
		return amazonAwsAccessKeyId;
	}

	public static String getAmazonAwsSecretAccessKey() {
		if(amazonAwsSecretAccessKey == null)
			amazonAwsSecretAccessKey = ResourceUtils.getString(rb_Config, Constants.AWS_SECRET_ACCESS_KEY);
		return amazonAwsSecretAccessKey;
	}

	public static String getAmazonLinkDownload() {
		if(amazonLinkDownload == null)
			amazonLinkDownload = ResourceUtils.getString(rb_Config, Constants.AMAZON_LINK_DOWNLOAD);
		return amazonLinkDownload;
	}

	public static String getOmmTest() {
		if(ommTest == null)
			ommTest = ResourceUtils.getString(rb_Config, Constants.OMM_TEST);
		return ommTest;
	}

	public static String getApiContext() {
		if(apiContext == null)
			apiContext = ResourceUtils.getString(rb_Config, Constants.API_CONTEXT);
		return apiContext;
	}

}
