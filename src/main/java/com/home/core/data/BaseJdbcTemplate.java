package com.home.core.data;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;

import com.home.core.data.model.PersistentObject;


public class BaseJdbcTemplate implements InitializingBean{
	private DataSource dataSource;
	private JdbcTemplate jdbcTemp;
	
	public BaseJdbcTemplate() {}
	
	public BaseJdbcTemplate(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	protected synchronized JdbcTemplate getJdbcTemplate() {
		if (jdbcTemp == null) {
			Assert.notNull(dataSource, "dataSource must not be null");
			
			jdbcTemp = new JdbcTemplate(dataSource);
		}
		return jdbcTemp;
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		getJdbcTemplate();	
	}
	
	@SuppressWarnings("unchecked")
	public PersistentObject FindById(String sql, PersistentObject entity, Object id){
		entity = this.getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<PersistentObject>((Class<PersistentObject>)entity.getClass()),id);
		
		return entity;
	}
	
	@SuppressWarnings("unchecked")
	public List<PersistentObject> FindByExample(String sql, PersistentObject entity, Object ...obj){
		List<PersistentObject> list = (List<PersistentObject>)this.getJdbcTemplate().query(sql, new BeanPropertyRowMapper<PersistentObject>((Class<PersistentObject>)entity.getClass()), obj);
		
		return list;
	}
	
	public List<PersistentObject> FindAll(String sql, PersistentObject entity){
		List<PersistentObject> list = (List<PersistentObject>)this.FindByExample(sql, entity);
		
		return list;
	}
	
	public void updateEntity(String sql, PersistentObject entity){
		this.getJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(entity));
	}
	
	public void update(String sql, Object ...obj){
		this.getJdbcTemplate().update(sql, obj);
	}

}
