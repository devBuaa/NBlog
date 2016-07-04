package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.amc.service.BaseService;
import com.amc.util.StringUtils;


@Transactional
public abstract class BaseServiceImp implements BaseService {

	private SessionFactory sessionFactory;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List find(String hql, Object[] parameters) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setCacheable(true);
		if(!StringUtils.isNull(parameters)){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		return query.list();
	}

	public void save(Object o) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(o);
	}

	public void delete(Object o) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(o);
	}

	public void update(Object o) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(o);
	}

	public Object findById(Class clazz, Serializable id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().load(clazz, id);
	}
	public int update(String hql, Object[] parameters) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		if(!StringUtils.isNull(parameters)){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		return query.executeUpdate();
	}
	public List findByPage(String hql, Object[] parameters, int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setCacheable(true);
		if(!StringUtils.isNull(parameters)){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		query.setFirstResult((pageNow-1)*pageSize).setMaxResults(pageSize);
		return query.list();
	}
	public int getCount(String hql, Object[] parameters) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("select count(*)"+hql);
		query.setCacheable(true);
		if(!StringUtils.isNull(parameters)){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		Object object=query.uniqueResult();
		return Integer.parseInt(object.toString());
	}
}
