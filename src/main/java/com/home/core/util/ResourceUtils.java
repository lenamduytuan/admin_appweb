package com.home.core.util;
import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * @author nhnam
 *
 * Duoc dung de lay ra cac resource o trong file java
 */
public class ResourceUtils {
	private static final ResourceBundle RB = ResourceBundle.getBundle("properties.config");
	
	public static ResourceBundle getResourceBundle(String propertiesConfig){
		return ResourceBundle.getBundle(propertiesConfig);
	}
	
	public static ResourceBundle getResourceBundle(String propertiesConfig, Locale locale) throws Exception{
		ResourceBundle rb = null;
		try {
			String homeDir = System.getenv("PROP_DIR");
			File file = new File(homeDir + "/properties");  
			URL[] urls = {file.toURI().toURL()};  
			ClassLoader loader = new URLClassLoader(urls);  
			rb = ResourceBundle.getBundle(propertiesConfig, Locale.getDefault(), loader);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return rb;
	}
	
	public static String getString(String key){
    	String result=null;
        try{
           result = RB.getString(key);
        }catch (MissingResourceException e){
            return null;
        }
        return result; 
    }
	
	public static String getString(ResourceBundle rb, String key){
    	String result=null;
        try{
           result = rb.getString(key);
        }catch (MissingResourceException e){
            return null;
        }
        return result; 
    }
}
