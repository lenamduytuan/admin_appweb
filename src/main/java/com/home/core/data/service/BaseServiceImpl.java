package com.home.core.data.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.home.core.data.SearchCriteria;
import com.home.core.data.dao.BaseHibernateDAO;
import com.home.core.data.model.PersistentObject;

@Service
public class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T, ID>{
	private BaseHibernateDAO<T, ID> baseHibernateDAO;

	public BaseServiceImpl() {
    }
	 
	public BaseServiceImpl(BaseHibernateDAO<T, ID> genericDao) {
        this.baseHibernateDAO=genericDao;
    }

	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveObject(PersistentObject entity) throws Exception{
		baseHibernateDAO.saveObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void updateObject(PersistentObject entity) throws Exception{
		baseHibernateDAO.updateObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveOrUpdateObject(PersistentObject entity) throws Exception{
		baseHibernateDAO.saveOrUpdateObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void deleteObject(PersistentObject entity) throws Exception{
		baseHibernateDAO.deleteObject(entity);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveOrUpdateObjects(ArrayList entities) throws Exception{
		baseHibernateDAO.saveOrUpdateObjects(entities);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveObjects(ArrayList entities) throws Exception{
		baseHibernateDAO.saveObjects(entities);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public List<PersistentObject> findAll(PersistentObject entity){
		return baseHibernateDAO.findAll(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveObject(T entity) throws Exception{
		baseHibernateDAO.saveObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void updateObject(T entity) throws Exception{
		baseHibernateDAO.updateObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void deleteObject(T entity) throws Exception{
		baseHibernateDAO.deleteObject(entity);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void saveGenericObjects(ArrayList<T> entities) throws Exception{
		baseHibernateDAO.saveGenericObjects(entities);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void updateObjects(ArrayList<T> entities) throws Exception{
		baseHibernateDAO.updateObjects(entities);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void deleteObjects(ArrayList<T> entities){
		baseHibernateDAO.deleteObjects(entities);
	}
	
	@Override
	@Transactional
	public T findById(ID id, boolean lock){
		T entity = baseHibernateDAO.findById(id, lock);
		return entity;
	}
	
	@Override
	@Transactional
	public List<T> findAll(){
		return baseHibernateDAO.findAll();
	}
	
	@Override
	@Transactional
	public List<T> findByExample(T exampleInstance, String... excludeProperty){
		return baseHibernateDAO.findByExample(exampleInstance, excludeProperty);
	}
	
	@Override
	@Transactional
	public int getTotalPageOffindByExample(T exampleInstance, String... excludeProperty){
		return baseHibernateDAO.getTotalPageOffindByExample(exampleInstance, excludeProperty);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public Collection retrieveObjects(SearchCriteria cri, boolean forceCache) throws Exception{
		return baseHibernateDAO.retrieveObjects(cri, forceCache);
	}
	
	@Override
	@Transactional
	public List<T> listObjectstWithPagination(Integer offset, Integer maxResults) throws Exception{
		return baseHibernateDAO.listObjectstWithPagination(offset, maxResults);
	}
	
	@Override
	@Transactional
	public List<Object[]> listObjectstWithPagination(String sql, Integer offset, Integer maxResults) throws Exception{
		return baseHibernateDAO.listObjectstWithPagination(sql, offset, maxResults);
	}
	
	@Override
	@Transactional
	public Long rowCount(){
		return baseHibernateDAO.rowCount();
	}

}
