package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcProduct;

public interface ProductService extends BaseService {
	List<AmcProduct> getAllProducts();//得到所有的产品
	AmcProduct loadProductById(Serializable id);//通过产品编号获得产品
	List getProductByPage(int pageNow, int pageSize);
	int getProductCount();
	void deleteProductById(String id);
	boolean checkIdIsExisted(Serializable id);
}


