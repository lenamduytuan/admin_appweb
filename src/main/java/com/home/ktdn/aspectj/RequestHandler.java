package com.home.ktdn.aspectj;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.home.ktdn.setting.Config;

@Aspect
@Component
public class RequestHandler {
	@Pointcut("within(@org.springframework.stereotype.Controller *)")
	public void controller() {
	}

	@Pointcut("execution(* *.*(..))")
	protected void allMethod() {
	}
	
	@Before("controller() && allMethod() && args(..,request)")
	public void requestBefore(JoinPoint joinPoint, HttpServletRequest request) {		
		System.out.println("//===> Request Before <===//");		
		request.getSession().setAttribute("apiContext", Config.getApiContext());		
	}
	
	/*@Around("controller() && allMethod() && args(..,request)")
	public Object requestAround(ProceedingJoinPoint pjp, HttpServletRequest request) throws Throwable {
		System.out.println("//===> Request Around <===//");
		String uri = request.getRequestURI();
		System.out.println("UserFilterDispatcher: [" + request.getRemoteHost() + "]:" + uri);
		String servletpath = request.getServletPath();
		String action = "";
		if(servletpath!=null && !"".equals(servletpath) && servletpath.split("/").length>0){
			int len = servletpath.split("/").length;
			action = servletpath.split("/")[len - 1];
		}
		boolean checkRight = true;
		
		if(!action.equals("login") && !action.equals("index") && !action.equals("home")
				&& !servletpath.contains("menu")
				&& !servletpath.contains("resources")
				&& !servletpath.contains("swagger") 
				&& !servletpath.contains("webjars")
				&& !servletpath.contains("configuration") 
				&& !servletpath.contains("v2") 
				&& !servletpath.contains("images")){
			checkRight = false;
		}
		
		if(checkRight) {
	        return pjp.proceed();
	    }else{
	        return "error";
	    }
	}*/

}
