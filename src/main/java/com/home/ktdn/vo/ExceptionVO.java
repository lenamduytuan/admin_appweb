package com.home.ktdn.vo;

import com.home.core.vo.ValueObject;

public class ExceptionVO extends ValueObject{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1577912609541826336L;

	String code;
	
	String description;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
