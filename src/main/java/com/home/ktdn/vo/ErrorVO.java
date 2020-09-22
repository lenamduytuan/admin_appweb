package com.home.ktdn.vo;

import com.home.core.vo.ValueObject;

public class ErrorVO extends ValueObject{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8061539243264650022L;
	private Object error;

	public Object getError() {
		return error;
	}

	public void setError(Object error) {
		this.error = error;
	}
}
