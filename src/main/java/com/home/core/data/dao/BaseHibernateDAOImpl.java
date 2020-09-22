package com.home.core.data.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.lang.reflect.ParameterizedType;

import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.home.core.data.QueryDetails;
import com.home.core.data.SearchCriteria;
import com.home.core.data.model.PersistentObject;

@Repository
public class BaseHibernateDAOImpl<T, ID extends Serializable> extends HibernateDaoSupport implements BaseHibernateDAO<T, ID> {
	private Class<T> persistentClass;
	
	@SuppressWarnings("unchecked")
	public BaseHibernateDAOImpl() {
		/*ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
	    Type type = genericSuperclass.getActualTypeArguments()[0];
	    if (type instanceof Class) {
	    	this.persistentClass = (Class<T>) type;
	    }else if (type instanceof ParameterizedType) {
	    	this.persistentClass = (Class<T>) ((ParameterizedType)type).getRawType();
	    }*/
		
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	public Class<T> getPersistentClass() {
//		this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        return persistentClass;
    }
	
	public Session getCurrentSession(){
		Session session = this.getSessionFactory().getCurrentSession();
		
		return session;
	}
	
    @SuppressWarnings("unchecked")
    public void saveObject(T entity)  throws Exception{
    	//getHibernateTemplate().save(entity);
    	getCurrentSession().save(entity);
     }
    
    @SuppressWarnings("unchecked")
    public void updateObject(T entity) throws Exception{
		//getHibernateTemplate().update(entity);
		getCurrentSession().update(entity);
	}

    public void deleteObject(T entity)  throws Exception{
//    	getHibernateTemplate().delete(entity);
    	getCurrentSession().delete(entity);
    }
    
    public void saveGenericObjects(ArrayList<T> entities)  throws Exception{
		Iterator<T> iter = entities.iterator();
		while(iter.hasNext()){
			T entity = iter.next();
			this.saveObject(entity);
		}
	}
	
	public void updateObjects(ArrayList<T> entities) throws Exception{
		Iterator<T> iter = entities.iterator();
		while(iter.hasNext()){
			T entity = iter.next();
			this.updateObject(entity);
		}
	}
	
	public void deleteObjects(ArrayList<T> entities){
		getHibernateTemplate().deleteAll(entities);
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
    public T findById(ID id, boolean lock) {
        T entity;
        if (lock)
            entity = (T) getHibernateTemplate().load(getPersistentClass(), id, LockMode.PESSIMISTIC_WRITE);
//        	entity = (T) getCurrentSession().load(getPersistentClass(), id, LockMode.UPGRADE);
        else
//            entity = (T) getHibernateTemplate().load(getPersistentClass(), id);
        	entity = (T) getCurrentSession().load(getPersistentClass(), id);

        return entity;
    }
	
	@SuppressWarnings("unchecked")
    public List<T> findAll() {
		List<T> list = findByCriteria();
        return list;
    }
	
    @SuppressWarnings("unchecked")
    public List<T> findByExample(T exampleInstance, String... excludeProperty) {
        List<T> result = null;
    	Criteria crit = getCurrentSession().createCriteria(getPersistentClass());
        Example example =  Example.create(exampleInstance);
        for (String exclude : excludeProperty) {
            example.excludeProperty(exclude);
        }
        crit.add(example);
        result = crit.list();
        return result;
    }
    
    @SuppressWarnings("unchecked")
    protected List<T> findByCriteria(Criterion... criterion) {
    	DetachedCriteria criteria = DetachedCriteria.forClass(getPersistentClass());
        for (Criterion c : criterion) {
        	criteria.add(c);
        }
        return (List<T>) getHibernateTemplate().findByCriteria(criteria);
    }
    
    @SuppressWarnings("unchecked")
    public int getTotalPageOffindByExample(T exampleInstance, String... excludeProperty) {
    	Criteria crit = getCurrentSession().createCriteria(getPersistentClass());
    	Example example =  Example.create(exampleInstance);
    	for (String exclude : excludeProperty) {
    		example.excludeProperty(exclude);
    	}
    	crit.add(example);
    	return crit.list().size();
    }
    
	public void saveObject(PersistentObject entity) throws Exception{
//		getHibernateTemplate().save(entity);	
		getCurrentSession().save(entity);
	}
	
	public void updateObject(PersistentObject entity) throws Exception{
//		getHibernateTemplate().update(entity);		
		getCurrentSession().update(entity);
	}
	
	public void saveOrUpdateObject(PersistentObject entity) throws Exception{
//		getHibernateTemplate().saveOrUpdate(entity);
		getCurrentSession().saveOrUpdate(entity);
	}
	
	public void deleteObject(PersistentObject entity) throws Exception{
//		getHibernateTemplate().delete(entity);	
		getCurrentSession().delete(entity);
	}
	
	@SuppressWarnings("rawtypes")
	public void saveOrUpdateObjects(ArrayList entities) throws Exception{
		if(entities!=null && entities.size()>0){
			Iterator iter = entities.iterator();
			while(iter.hasNext()){
				PersistentObject entity = (PersistentObject)iter.next();
				this.saveOrUpdateObject(entity);
			}
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void saveObjects(ArrayList entities) throws Exception{
		if(entities!=null && entities.size()>0){
			Iterator iter = entities.iterator();
			while(iter.hasNext()){
				PersistentObject entity = (PersistentObject)iter.next();
				this.saveObject(entity);
			}
		}
	}
	
	public List<PersistentObject> findAll(PersistentObject entity){
		return getHibernateTemplate().findByExample(entity);		
	}
	
	@SuppressWarnings("rawtypes")
	public Collection retrieveObjects(SearchCriteria cri, boolean forceCache) throws Exception {

		if ((cri == null) || (cri.getSearchClass() == null)) {
			throw new NullPointerException("input value is null");
		}
		ArrayList pName = cri.getPropertyName();
		ArrayList pValue = cri.getPropertyValue();
		ArrayList operation = cri.getOperation();
		ArrayList logOperation = cri.getLogicOperation();
		Collection retval = new ArrayList();

		try {			
			Criteria criteria = getCurrentSession().createCriteria(cri.getSearchClass());
			int size = pName.size();
			Criterion criterion = null;

			for (int i = 0; i < size; i++) {
				String name = (String) pName.get(i);
				Object value = pValue.get(i);
				String oper = (String) operation.get(i);
				String logOper = (String) logOperation.get(i);
				Criterion criTmp = this.createCiterion(name, value, oper);
				if (criterion == null) {
					criterion = criTmp;
				} else {
					if (logOper.equals(SearchCriteria.LG_AND)) {
						criterion = Restrictions.and(criterion, criTmp);
					} else if (logOper.equals(SearchCriteria.LG_OR)) {
						criterion = Restrictions.or(criterion, criTmp);
					}
				}
			}
			if (criterion != null) {
				criteria.add(criterion);
			}
			//Them phan order
			if (cri.getOrderList() != null && cri.getOrderList().size() > 0) {
				for (int k = 0; k < cri.getOrderList().size(); k++) {
					criteria.addOrder(Order.asc((String) cri.getOrderList().get(k)));
				}
			}
			//			if(!ignoreEndDate)
			//				criteria.add(Expression.isNull("ngayHetHl"));

			QueryDetails queryDetails = cri.getQueryDetail();
			if (queryDetails != null) {
				criteria.setFirstResult(queryDetails.getFirstResult().intValue());
				criteria.setMaxResults(queryDetails.getMaxResults().intValue());
				//criteria.setMaxResults(51);
			}
			if (forceCache)
				criteria.setCacheable(true);
			retval = criteria.list();
		} catch (Exception e) {
//			e.printStackTrace();
			throw new Exception(e);
		} 
		
		return retval;
	}	
	
	private Criterion createCiterion(String name, Object value, String oper) {
		Criterion retval = null;
		if (SearchCriteria.OP_EQ.equals(oper)) {
			retval = Restrictions.eq(name, value);
		} else if (SearchCriteria.OP_GE.equals(oper)) {
			retval = Restrictions.ge(name, value);
		} else if (SearchCriteria.OP_GT.equals(oper)) {
			retval = Restrictions.eq(name, value);
		} else if (SearchCriteria.OP_LE.equals(oper)) {
			retval = Restrictions.le(name, value);
		} else if (SearchCriteria.OP_LIKE.equals(oper)) {
			retval = Restrictions.ilike(name, value);
		} else if (SearchCriteria.OP_LT.equals(oper)) {
			retval = Restrictions.lt(name, value);
		} else if (SearchCriteria.OP_NE.equals(oper)) {
			retval = Restrictions.ne(name, value);
		} else if (SearchCriteria.LG_IS_NULL.equals(oper)) {
			retval = Restrictions.isNull(name);

		} else if (SearchCriteria.LG_IS_NOT_NULL.equals(oper)) {
			retval = Restrictions.isNotNull(name);
		} else if (SearchCriteria.OP_IN.equals(oper)) {
			retval = Restrictions.in(name, (Collection) value);
		}
		return retval;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> listObjectstWithPagination(Integer offset, Integer maxResults) throws Exception{
		List<T> objectList = (List<T>)this.getCurrentSession()
				.createCriteria(getPersistentClass())
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10).list();

		return objectList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listObjectstWithPagination(String sql, Integer offset, Integer maxResults) throws Exception{
		List<Object[]> objectList = (List<Object[]>)this.getCurrentSession()
				.createSQLQuery(sql)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10).list();

		return objectList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Long rowCount(){
		return (Long)this.getCurrentSession()
				.createCriteria(getPersistentClass())
				.setProjection(Projections.rowCount())
				.uniqueResult();
	}
}
