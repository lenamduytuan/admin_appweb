package com.home.core.data;

import java.util.ArrayList;

public class SearchCriteria implements java.io.Serializable{
	private ArrayList propertyName = new ArrayList();
	private ArrayList propertyValue = new ArrayList();
	private ArrayList operation  = new ArrayList();
	private ArrayList logicOperation  = new ArrayList();
	private ArrayList orderList = new ArrayList();
	
	public static String OP_EQ = "EQ";
	public static String OP_LIKE = "LIKE";
	public static String OP_GE = "GE";
	public static String OP_LE = "LE";
	public static String OP_GT = "GT";
	public static String OP_LT = "LT";
	public static String OP_NE = "NE";
	public static String LG_AND = "AND";
	public static String LG_OR = "OR";
	public static String LG_IS_NULL = "isNull";
	public static String LG_IS_NOT_NULL = "isNotNull";
	public static String OP_IN = "IN";
		
	public static String OP_DEFAULT = "EQ";
	public static String LG_DEFAULT = "AND";

	private Class searchClass;
	private QueryDetails queryDetail;

	public Class getSearchClass() {
		return searchClass;
	}
	
	public void setSearchClass(Class searchClass) {
		this.searchClass = searchClass;
	}
	
	public QueryDetails getQueryDetail() {
		return queryDetail;
	}
	public void setQueryDetail(QueryDetails queryDetail) {
		this.queryDetail = queryDetail;
	}
	public void addSearchItem(String name, Object value, String oper, String logicOper) throws Exception {
		if(name != null) {
			propertyName.add(name);
			propertyValue.add(value);
			operation.add(oper);
			logicOperation.add(logicOper);
		}
		else {
			throw new NullPointerException("Name is null!");
		}
	}
	public void addSearchItem(String name, Object value, String oper)  throws Exception{
		this.addSearchItem(name,value,oper,LG_DEFAULT);
	}
	public void addSearchItem(String name, Object value)  throws Exception{
		this.addSearchItem(name,value,OP_DEFAULT,LG_DEFAULT);
	}	
	public void addOrderItem(String name)
	{
		if(name!=null && !orderList.contains(name))
			orderList.add(name);		
	}
	/**
	 * @return
	 */
	public ArrayList getOperation() {
		return operation;
	}

	/**
	 * @return
	 */
	public ArrayList getPropertyName() {
		return propertyName;
	}

	/**
	 * @return
	 */
	public ArrayList getPropertyValue() {
		return propertyValue;
	}

	/**
	 * @param list
	 */
	public void setOperation(ArrayList list) {
		operation = list;
	}

	/**
	 * @param list
	 */
	public void setPropertyName(ArrayList list) {
		propertyName = list;
	}

	/**
	 * @param list
	 */
	public void setPropertyValue(ArrayList list) {
		propertyValue = list;
	}

	/**
	 * @return
	 */
	public ArrayList getLogicOperation() {
		return logicOperation;
	}

	/**
	 * @param list
	 */
	public void setLogicOperation(ArrayList list) {
		logicOperation = list;
	}

	/**
	 * @return
	 */
	public ArrayList getOrderList() {
		return orderList;
	}
}
