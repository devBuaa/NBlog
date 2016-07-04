package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcProduct;
import com.amc.domain.AmcWantslip;
import com.amc.domain.AmcWsdetail;


public interface WantSlipService extends BaseService {
	List getWantSlips();//得到所有的缺货单
	List<AmcWantslip> getUndoWantSlips();//得到所有未处理的缺货单
	List getWantSlipsByPage(int pageNow,int pageSize);//得到当前页的缺货单
	int getWantSlipCount();//得到所有的缺货单的总数
	void addWantSlip(AmcWantslip WantSlip,List<AmcWsdetail> wsdetails);//增加缺货单
	List<AmcWsdetail> getWantSlipDetail(Serializable WantSlipId);//根据WantSlipId获得相应订单的明细
	AmcWantslip findWantSlipById(Serializable WantSlipId);//根据id获取销售订单
	AmcWantslip checkIsExisted(Serializable soid);//检查是否重复提交一样的订单
	int getWantProductNumber(AmcProduct product);
	void finishPurchasingWantState();//到货确认时修改缺货单采购中--->完成采购
}
