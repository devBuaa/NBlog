package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcDispatchorder;
import com.amc.domain.AmcSalesorder;
import com.amc.domain.AmcSodetail;

public interface SalesOrderService extends BaseService {
	
	List getSalesOrders();//得到所有的销售订单
	List getSalesOrdersByPage(int pageNow,int pageSize);//得到当前页的销售订单
	int getSalesOrderCount();//得到所有的销售订单的总数
	void addSalesOrder(AmcSalesorder salesorder,List<AmcSodetail> sodetailList);//增加销售订单
	List<AmcSodetail> getSalesOrderDetail(Serializable salesOrderId);//根据soid获得相应订单的明细
	AmcSalesorder findSalesOrderById(Serializable salesOrderId);//根据id获取销售订单
	AmcSalesorder checkIsExisted(AmcSalesorder salesorder);//检查是否重复提交一样的订单
}
