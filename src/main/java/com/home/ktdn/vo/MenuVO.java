package com.home.ktdn.vo;

import java.util.List;

import com.home.core.vo.ValueObject;

public class MenuVO  extends ValueObject {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3398396550691686428L;
	private Integer id;
	private String text;
	
	private List<MenuVO> children;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<MenuVO> getChildren() {
		return children;
	}

	public void setChildren(List<MenuVO> children) {
		this.children = children;
	}
}
