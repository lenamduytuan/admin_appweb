package com.home.ktdn.form;

import com.home.core.vo.ValueObject;

public class LoginForm extends ValueObject{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4611391474336440971L;
	private String SessionID;
	private String FunctionIds;
	private String username;
	
	private String password;

	public String getSessionID() {
		return SessionID;
	}

	public void setSessionID(String sessionID) {
		SessionID = sessionID;
	}

	public String getFunctionIds() {
		return FunctionIds;
	}

	public void setFunctionIds(String functionIds) {
		FunctionIds = functionIds;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
