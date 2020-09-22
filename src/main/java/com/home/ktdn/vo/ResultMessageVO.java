package com.home.ktdn.vo;

import com.home.core.vo.ValueObject;

public class ResultMessageVO extends ValueObject{
	/**
	 * 
	 */
	private static final long serialVersionUID = 334794780764958176L;

	private boolean status;
	
	private String message;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
