package com.home.ktdn.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.core.util.JsonUtils;
import com.home.ktdn.data.cache.FuncRoleCache;
import com.home.ktdn.setting.Constants;
import com.home.ktdn.vo.ErrorVO;
import com.home.ktdn.vo.ExceptionVO;
import com.home.ktdn.vo.MenuVO;
import com.home.ktdn.vo.ResultMessageVO;
import com.home.ktdn.vo.ResultVO;

@Controller
public class CommonController {
	protected FuncRoleCache funcRoleCache;
	
	ResultVO resultVO = new ResultVO();
	ResultMessageVO resultMessageVO = new ResultMessageVO();
	ExceptionVO exceptionVO = new ExceptionVO();
	ErrorVO errorVO = new ErrorVO();
	String jsonInString = "";

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index(HttpServletRequest request){
		request.getSession().removeAttribute(Constants.SESSION_ID);	
		
		return "login";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/console", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> wellcomePost(@RequestBody LinkedHashMap map, HttpServletRequest request){
		System.out.println("SessionID: "+ map.get("SessionID"));
		
		String funcIds = (String)map.get("FunctionIds");
		String token = (String)map.get("SessionID");
		
		request.getSession().setAttribute("SessionID", token);	
		funcRoleCache = FuncRoleCache.getInstance();
		funcRoleCache.putCache(token, funcIds);
		
		jsonInString = this.getResultMessage(true, "Đăng nhập thành công!");
		
		return ResponseEntity.ok(jsonInString);
	}
	
	@RequestMapping(value="/console", method=RequestMethod.GET)
	public String wellcomeGet(HttpServletRequest request){
		String SessionId = request.getParameter(Constants.SESSION_ID);
		System.out.println("SessionId: "+ SessionId);
		if(SessionId!=null && !"".equals(SessionId)){
			request.getSession().setAttribute(Constants.SESSION_ID, SessionId);	
		}
		
		return "MainLayout";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home(HttpServletRequest request){
		
		return "index";
	}
	
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String error(HttpServletRequest request){
		
		return "error";
	}
	
	protected void removeTreeNode(List<MenuVO> list, Integer id){
		for (MenuVO vo : list) {
			if(vo.getId() == id){
				System.out.println(vo.getText());
				list.remove(vo);
				break;
			}else{
				if(vo.getChildren()!=null){
					removeTreeNode(vo.getChildren(), id);
				}
			}
		}
	}
	
	protected String getResultMessage(boolean status, String message){
		resultMessageVO.setStatus(status);
		resultMessageVO.setMessage(message);
		
		resultVO.setData(resultMessageVO);
		jsonInString = JsonUtils.convertObjectToJsonString(resultVO);
		
		return jsonInString;
	}

	protected String getErrorMessage(String code, String description){
		exceptionVO.setCode(code);
		exceptionVO.setDescription(description);
		
		errorVO.setError(exceptionVO);
		jsonInString = JsonUtils.convertObjectToJsonString(errorVO);
		
		return jsonInString;
	}

}
