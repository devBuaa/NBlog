package com.nblog.dao;

import java.util.List;

import com.nblog.bean.Resources;
import com.nblog.bean.User;

public interface ResourcesDao extends BaseDao {
	public List<Resources> findChildlists(Resources map);

	public List<Resources> findResources(User user);

	public void updateSortOrder(List<Resources> map);
	
	public List<Resources> findUserResources(String userNo);
}
