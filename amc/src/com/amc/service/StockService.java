package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcStockorder;

public interface StockService extends BaseService {
	void updateStock(AmcStockorder stockorder);//提交完销售订单后 填写备货单
	void addStock(AmcStockorder stockorder);//提交完销售订单后 填写备货单
	List<AmcStockorder> getStockorders();//得到所有备货单
	List<AmcStockorder> getStockordersByPage(int pageNow,int pageSize);//得到当前页的备货单
	int getStockorderCount();//得到所有的备货单的总数
	AmcStockorder findStockorderById(Serializable stockId);//根据id获取备货单
	AmcStockorder findStockorderBySoId(Serializable soid);
	
}
