package com.amc.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.amc.domain.AmcPayable;
import com.amc.domain.AmcPayabledetail;
import com.amc.domain.AmcPurchaseaccount;
import com.amc.domain.AmcReceivable;

public interface PayableService extends BaseService {
	List<AmcPayable> getPayables();
	List<AmcPayable> getPayablesByPage(int pageNow,int pageSize);
	List<AmcPayable> getPayablesUndoByPage(int pageNow,int pageSize);//得到未收到货款的应付账款
	List<AmcPurchaseaccount> getAccountByPage(int pageNow,int pageSize);//得到收到货款的应付账款
	int getPayableCount();
	int getPayableUndoCount();
	int getAccountCount();
	AmcPayable findPayableById(Serializable rid);
	void addPayable(AmcPayable payable,List<AmcPayabledetail> payabledetails);
	void transPayableToAccount(AmcPayable payable);//应付账款记录在业务账内
	List<AmcPayabledetail> getPayabledetails(AmcPayable payable); 
	AmcPurchaseaccount getPurchaseaccountByAccountId(Serializable accountId);
	List<AmcPayabledetail> getPayabledetailsByAccount(AmcPurchaseaccount account); 
	List<AmcPayable> getWeekAmcPayables(Date date);
	List<AmcPayable> getPeriodAmcPayables(Date cdate, Date edate);
}
