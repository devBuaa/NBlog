package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcPodetail;
import com.amc.domain.AmcProduct;
import com.amc.domain.AmcPurchaseorder;
import com.amc.domain.AmcShortstock;

public interface PurchaseOrderService extends BaseService {
	List<AmcPurchaseorder> getPurchaseorders();
	int getPurchaseCounts();
	List<AmcPurchaseorder> getPurchaseordersByPage(int pageNow,int pageSize);
	List<AmcPodetail> getPodetails(AmcPurchaseorder purchaseorder);
	AmcPurchaseorder findPurchaseorderById(Serializable id);
	AmcPurchaseorder checkIsExisted(AmcPurchaseorder order);
	void addPurchaseOrder(AmcPurchaseorder order,List<AmcPodetail> podetails);
	List<AmcPurchaseorder> getUndonePurchaseorders();//未完成的采购订单视为有效   每天得到相应库存
	int purchasingProductAmount(AmcProduct product);
	List<AmcShortstock> getAllShortstocks();//从每日缺货表中获得所有缺货数据
}
