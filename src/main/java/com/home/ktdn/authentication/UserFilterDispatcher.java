package com.home.ktdn.authentication;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.*; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.home.core.util.IOUtils;
import com.home.ktdn.setting.Config;
import com.home.ktdn.setting.Constants;
import com.home.ktdn.vo.ErrorVO;
import com.home.ktdn.vo.ExceptionVO;

public class UserFilterDispatcher implements Filter{
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { 
		this.filterConfig = filterConfig; 
		try { 
			System.out.print("application initializing successfully"); 
		} 
		catch (Exception e) { 
			throw new ServletException(e);
		}
	} 
	
	@Override
	public void destroy() {
		this.filterConfig = null;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			request.setCharacterEncoding("utf-8");
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			Config.startUp(req);
			
			boolean checkRight = true;
			String uri = req.getRequestURI();
			System.out.println("UserFilterDispatcher: [" + req.getRemoteHost() + "]:" + uri);

			String servletpath = req.getServletPath();
			String action = "";
			if(servletpath!=null && !"".equals(servletpath) && servletpath.split("/").length>0){
				int len = servletpath.split("/").length;
				action = servletpath.split("/")[len - 1];
			}
						
			//========= Authentication =========//					
			/*if(!action.equals("login") && !action.equals("index") && !action.equals("home")
					&& !servletpath.contains("menu")
					&& !servletpath.contains("resources")
					&& !servletpath.contains("swagger") 
					&& !servletpath.contains("webjars")
					&& !servletpath.contains("configuration") 
					&& !servletpath.contains("v2") 
					&& !servletpath.contains("images")){
//				String token = req.getHeader(Constants.TOKEN);	
				String userId = ""; //Config.getOmmTest();
				
				if("0".equals(userId)){
					//JedisManager jedis = new JedisManager();
					//userId = jedis.get(token, "user_id");
				}
				if(userId!=null && !"".equals(userId)){

				}
				else{	
					filterConfig.getServletContext().getRequestDispatcher("/error").forward(req, res);;
					checkRight = false;
				}
			}*/
			if(checkRight)
				chain.doFilter(request, response);
			
			return;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
