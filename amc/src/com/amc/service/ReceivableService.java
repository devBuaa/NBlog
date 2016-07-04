package com.amc.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.amc.domain.AmcReceivable;
import com.amc.domain.AmcReceivabledetail;
import com.amc.domain.AmcSaleaccount;

public interface ReceivableService extends BaseService {
	List<AmcReceivable> getAReceivables();
	List<AmcReceivable> getReceivablesByPage(int pageNow,int pageSize);
	List<AmcReceivable> getReceivablesUndoByPage(int pageNow,int pageSize);//得到未收到货款的应收账款
	List<AmcSaleaccount> getReceivablesdoneByPage(int pageNow,int pageSize);//得到收到货款的销售业务账
	int getReceivableCount();
	int getReceivableUndoCount();//得到未收到货款的应收账款的总数
	int getAccountCount();
	AmcReceivable findReceivableById(Serializable rid);
	void addReceivable(AmcReceivable receivable,List<AmcReceivabledetail> receivabledetails);
	void transReceivableToAccount(AmcReceivable receivable);//收回应收款记录在销售业务账内
	List<AmcReceivabledetail> getReceivabledetails(AmcReceivable receivable); 
	AmcSaleaccount getSaleaccountByAccountId(Serializable accountId);
	List<AmcReceivabledetail> getReceivabledetailsByAccount(AmcSaleaccount saleaccount); 
	List<AmcReceivable> getWeekAmcReceivables(Date date);
	List<AmcReceivable> getPeriodAmcReceivables(Date cDate,Date eDate);
}
