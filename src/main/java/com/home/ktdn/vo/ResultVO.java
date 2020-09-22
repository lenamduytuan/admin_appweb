/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.home.ktdn.vo;

import javax.xml.bind.annotation.XmlRootElement;

import com.home.core.vo.ValueObject;


/**
 *
 * @author dhavalnagar
 */
//@XmlRootElement
public class ResultVO extends ValueObject {
/**
	 * 
	 */
	private static final long serialVersionUID = -5756439810511077165L;
	//    private boolean status;
//    private String message;
    private Object data;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /*public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }*/
    
    
}
