package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcDispatchorder;
import com.amc.domain.AmcDodetail;
import com.amc.domain.AmcStockorder;

import com.amc.domain.AmcSodetail;

public interface DispatchService extends BaseService {
	void addDispatch(AmcDispatchorder dispatchorder,List<AmcDodetail> dList);//填写发货单
	List getDispatchOrdersList(); //得到所有的发货单
	List getDispatchOrdersByPage(int pageNow,int pageSize);//得到当前页的发货单
	int getDispatchOrderCount();//得到所有的销售订单的总数
	List<AmcDodetail> getDodetails(Serializable salesOrderId);//根据soid获得相应订单（发货单）的明细
	AmcDispatchorder findDipatchOrderById(Serializable did);//根据dispatchid获得相应的发货单
	Object checkIsExisted(Serializable soid);//检查是否提交了一样的发货单
	
}
