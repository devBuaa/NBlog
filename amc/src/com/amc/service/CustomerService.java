package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcCustomer;

public interface CustomerService extends BaseService {
	
	AmcCustomer findCustomerById(Serializable cid);//根据id获取顾客
	List getCustomers();//得到所有的顾客
	List getCustomersByPage(int pageNow,int pageSize);//得到当前页的顾客
	int getCustomersCount();//得到所有的顾客的总数
	void addCustomer(AmcCustomer customer);//增加新顾客
	void deleteById(Serializable cid);

}
