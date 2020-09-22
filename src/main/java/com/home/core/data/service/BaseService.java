package com.home.core.data.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.home.core.data.SearchCriteria;
import com.home.core.data.model.PersistentObject;

public interface BaseService<T, ID extends Serializable> {
	public void saveObject(PersistentObject entity) throws Exception;
	
	public void updateObject(PersistentObject entity) throws Exception;
	
	public void saveOrUpdateObject(PersistentObject entity) throws Exception;
	
	public void deleteObject(PersistentObject entity) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public void saveOrUpdateObjects(ArrayList entities) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public void saveObjects(ArrayList entities) throws Exception;
	
	public List<PersistentObject> findAll(PersistentObject entity);
	
	public void saveObject(T entity) throws Exception;
	
	public void updateObject(T entity) throws Exception;
	
	public void deleteObject(T entity) throws Exception;
	
	public void saveGenericObjects(ArrayList<T> entities) throws Exception;
	
	public void updateObjects(ArrayList<T> entities) throws Exception;
	
	public void deleteObjects(ArrayList<T> entities);	
	
	public T findById(ID id, boolean lock);
	
	public List<T> findAll();
	
	public List<T> findByExample(T exampleInstance, String... excludeProperty);	
	
	public int getTotalPageOffindByExample(T exampleInstance, String... excludeProperty);
	
	@SuppressWarnings("rawtypes")
	public Collection retrieveObjects(SearchCriteria cri, boolean forceCache) throws Exception;
	
	public List<T> listObjectstWithPagination(Integer offset, Integer maxResults) throws Exception;
	
	public List<Object[]> listObjectstWithPagination(String sql, Integer offset, Integer maxResults) throws Exception;
	
	public Long rowCount();

}
