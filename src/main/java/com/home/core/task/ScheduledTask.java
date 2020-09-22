package com.home.core.task;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.home.core.exception.BaseException;

public abstract class ScheduledTask implements Runnable{
	final Logger log = Logger.getLogger(getClass());
	String sql;
	String bctc_domain;
	String bctc_schema;
	String action;
	int countException;
	private static int countLoop = 0;
		
	public boolean isWriteLog(Exception ex){
		if(ex==null) return false;
		if(ex.getMessage().indexOf("Could not open Hibernate Session for transaction")>-1 || 
		   ex.getMessage().indexOf("transaction timeout expired")>-1 ||
		   ex.getMessage().indexOf("connection")>-1){
			countLoop=countLoop + 1;
			log.info("count Exception connect DB or MQ: "+countLoop);
		}
		else if (BaseException.getStackTrace(ex).indexOf("MQException")>-1
				&& ex.getMessage().indexOf("2003")>-1 ) return false;
		else return true;
		if(countLoop <=1 ) return true;
		if(countLoop==100) System.exit(0);
		return false;
	}
	
	public int getCountException() {
		return countException;
	}

	public void setCountException(int countException) {
		this.countException = countException;
	}

	protected void dotask(){
		System.out.println(sql);
	}
	
	public void run(){
		this.dotask();
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
	public void sleep(long s){
		try {
	        TimeUnit.MILLISECONDS.sleep(s * 1000);
	    } catch (InterruptedException e) {
	        e.printStackTrace();
	    }
	}

	public Logger getLog() {
		return log;
	}

	public String getBctc_domain() {
		return bctc_domain;
	}

	public void setBctc_domain(String bctc_domain) {
		this.bctc_domain = bctc_domain;
	}

	public String getBctc_schema() {
		return bctc_schema;
	}

	public void setBctc_schema(String bctc_schema) {
		this.bctc_schema = bctc_schema;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
}
