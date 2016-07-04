package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcCustomer;
import com.amc.service.CustomerService;

public class CustomerServiceImp extends BaseServiceImp implements
		CustomerService {

	public AmcCustomer findCustomerById(Serializable cid) {
		// TODO Auto-generated method stub
		return (AmcCustomer) findById(AmcCustomer.class, cid);
	}

	public List getCustomers() {
		// TODO Auto-generated method stub
		return find("from AmcCustomer", null);
	}

	public List getCustomersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcCustomer", null, pageNow, pageSize);
	}

	public int getCustomersCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcCustomer", null);
	}

	public void addCustomer(AmcCustomer customer) {
		// TODO Auto-generated method stub
		save(customer);
	}

	public void deleteById(Serializable cid) {
		// TODO Auto-generated method stub
		update("delete from AmcCustomer where cid=?", new Object[]{cid});
	}

}
