package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcSupplier;
import com.amc.service.SupplierService;

public class SupplierServiceImp extends BaseServiceImp implements
		SupplierService {

	public AmcSupplier findSupplierById(Serializable sid) {
		// TODO Auto-generated method stub
		return (AmcSupplier) findById(AmcSupplier.class, sid);
	}

	public List getSuppliers() {
		// TODO Auto-generated method stub
		return find("from AmcSupplier", null);
	}

	public List getSuppliersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcSupplier", null, pageNow, pageSize);
	}

	public int getSuppliersCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcSupplier", null);
	}

	public void addSupplier(AmcSupplier supplier) {
		// TODO Auto-generated method stub
		save(supplier);
	}

	public void deleteSupplierById(Serializable sid) {
		// TODO Auto-generated method stub
		update("delete from AmcSupplier where sid=?", new Object[]{sid});
	}

}
