package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcSupplier;

public interface SupplierService extends BaseService {
	AmcSupplier findSupplierById(Serializable sid);//根据id获取
	List getSuppliers();//得到所有的
	List getSuppliersByPage(int pageNow,int pageSize);//得到当前页
	int getSuppliersCount();//得到所有的总数
	void addSupplier(AmcSupplier supplier);//增加新
	void deleteSupplierById(Serializable sid);

}
