package com.amc.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService {
		List find(String hql,Object[] parameters);
		void save(Object o);
		void delete(Object o);
		void update(Object o);
		int update(String hql,Object[] parameters);
		Object findById(Class clazz,Serializable id);
		List findByPage(String hql,Object[] parameters,int pageNow,int pageSize);
		int getCount(String hql,Object[] parameters);
}
