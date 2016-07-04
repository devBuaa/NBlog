package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcProduct;
import com.amc.service.ProductService;

public class ProductServiceImp extends BaseServiceImp implements ProductService {

	public List<AmcProduct> getAllProducts() {
		// TODO Auto-generated method stub
		return find("from AmcProduct", null);
	}

	public AmcProduct loadProductById(Serializable id) {
		// TODO Auto-generated method stub
		return (AmcProduct) findById(AmcProduct.class, id);
	}

	public List getProductByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcProduct", null, pageNow, pageSize);
	}

	public int getProductCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcProduct", null);
	}

	public void deleteProductById(String id) {
		// TODO Auto-generated method stub
		update("delete from AmcProduct where pid=?", new Object[]{Integer.parseInt(id)});
	}

	public boolean checkIdIsExisted(Serializable id) {
		// TODO Auto-generated method stub
		List list=find("from AmcProduct where pid=?", new Object[]{id});
		if(list.size()==1){
			return true;
		}else{
			return false;
		}
	}

	

}
