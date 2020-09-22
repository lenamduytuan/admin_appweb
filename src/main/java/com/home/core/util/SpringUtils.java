package com.home.core.util;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringUtils {
	static ApplicationContext  appContextGlobal = null;
	
	@SuppressWarnings("rawtypes")
	static public ApplicationContext getSpringContext(HttpServletRequest request){
		ServletContext sc = request.getSession().getServletContext();
		ApplicationContext appContext = WebApplicationContextUtils.getWebApplicationContext(sc,"org.springframework.web.servlet.FrameworkServlet.CONTEXT.appServlet");
		if(appContext == null){
			for (Enumeration each = sc.getAttributeNames(); each.hasMoreElements(); ) {
		        String name = (String) each.nextElement();
		        if (sc.getAttribute(name) instanceof ApplicationContext) {
		        	appContext = (ApplicationContext) sc.getAttribute(name);
		            break;
		        }
			}
		}
		return appContext;
	}
	
	static public ApplicationContext  getSpringContext() throws Exception{
		if(appContextGlobal == null)
			appContextGlobal = //new AnnotationConfigApplicationContext(SpringAnnotationConfig.class);
				new ClassPathXmlApplicationContext("../spring/appServlet/servlet-context.xml");
		
		return appContextGlobal;
	}

}
